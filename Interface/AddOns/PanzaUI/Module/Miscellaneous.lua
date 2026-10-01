--[[----------------------------------------------------------------------------
    PanzaUI - Miscellaneous
    Other Addons: refined style for Platynator nameplates (rounded borders on
    aura and cast icons).
    Quality of Life: fast auto-loot.
------------------------------------------------------------------------------]]
local _, ns = ...

local Misc = ns:RegisterModule("Miscellaneous", {
    title = "Miscellaneous",
    defaults = {
        platynatorStyle = true,
        fastLoot        = true,
    },
    options = {
        { header = "Other Addons" },
        { key = "platynatorStyle", label = "Platynator: Refined style", reload = true,
          tooltip = "Polish the look of Platynator nameplates.",
          bullets = { "Rounded aura icon borders", "Rounded cast icon border", "Only when Platynator is installed" } },
        { header = "Quality of Life" },
        { key = "fastLoot", label = "Fast auto-loot",
          tooltip = "Loot everything at once, as soon as the loot is ready.",
          bullets = { "Only when auto-loot is on (game setting or its modifier key)", "No waiting for the loot window" } },
    },
})

--------------------------------------------------------------------------------
-- Platynator aura icons. Each nameplate display has an AurasManager with
-- three aura containers (buffs, debuffs, crowd control); their icon frames
-- are created on demand and appended to container.frames (a reused frame
-- can be appended again). New entries are checked right after a nameplate is
-- added and then a few times per second while nameplates are shown, from the
-- last position seen; each frame is styled once (no garbage, a few table
-- reads). No UNIT_AURA: it fires for every unit around, and each call hands
-- the handler a new table of aura data (memory counted as PanzaUI's).
-- The buttons have secret aspects (their scripts can't be hooked): the icon
-- border follows the icon's own SetSize. Forbidden buttons are skipped.
--------------------------------------------------------------------------------
local AURA_KINDS = { "buffs", "debuffs", "crowdControl" }
local containers = {}  -- aura container -> number of frames already handled
local styledAuras = {} -- aura frame -> true (each one is styled only once)

-- A button that can't be styled now is left as is and tried again the next
-- time Platynator lists it (buttons are reused).
local function StyleAuraFrame(frame)
    if not frame or styledAuras[frame] or frame:IsForbidden() then return end
    if not ns.StyleIcon(frame.Icon, frame, true) then return end
    styledAuras[frame] = true
    if frame.Border then frame.Border:SetAlpha(0) end -- Platynator's square 1px border
    ns.RoundSwipe(frame.Cooldown)                     -- no dark square corners
end

-- The count is updated before styling, so a failing frame is never retried.
local function ScanContainers()
    for container, handled in pairs(containers) do
        local frames = container.frames
        local count = #frames
        if count > handled then
            containers[container] = count
            for i = handled + 1, count do StyleAuraFrame(frames[i]) end
        end
    end
end

--------------------------------------------------------------------------------
-- Platynator cast icon. Markers come from a shared pool and can be reused
-- for another kind (quest, elite, raid...) after a design change, so the
-- border is shown and the icon masked only while the marker is a cast icon,
-- checked after each Init (hooked once per marker).
--------------------------------------------------------------------------------
local markerBorder, markerMask, markerMasked = {}, {}, {}

local function UpdateMarker(marker)
    local isCast = marker.details and marker.details.kind == "castIcon"
    local icon = marker.marker
    if isCast and not markerBorder[marker] then
        markerBorder[marker], markerMask[marker] = ns.StyleIcon(icon, marker)
        markerMasked[marker] = true
    elseif markerBorder[marker] then
        markerBorder[marker]:SetShown(isCast)
        if isCast ~= markerMasked[marker] then
            if isCast then icon:AddMaskTexture(markerMask[marker]) else icon:RemoveMaskTexture(markerMask[marker]) end
            markerMasked[marker] = isCast
        end
    end
    if isCast and marker.background then marker.background:SetAlpha(0) end -- square backdrop
end

local hookedMarkers = {}

local function HookMarkers(display)
    local widgets = display.widgets
    if not widgets then return end
    for _, widget in ipairs(widgets) do
        if widget.marker and widget.Init and not hookedMarkers[widget] then
            hookedMarkers[widget] = true
            hooksecurefunc(widget, "Init", UpdateMarker)
            UpdateMarker(widget)
        end
    end
end

--------------------------------------------------------------------------------
-- Displays: Platynator parents its display frame to the nameplate when a
-- unit is added. Nameplates added in the same frame are handled together on
-- the next one (after Platynator's own handler), with varargs (no tables).
--------------------------------------------------------------------------------
local pendingUnits = {}
local shownPlates  = {} -- nameplate unit -> true while shown

local function RegisterDisplays(...)
    for i = 1, select("#", ...) do
        local display = select(i, ...)
        local manager = not display:IsForbidden() and display.AurasManager
        if manager then
            for _, kind in ipairs(AURA_KINDS) do
                local container = manager[kind]
                if container and container.frames and not containers[container] then containers[container] = 0 end
            end
            HookMarkers(display)
        end
    end
end

local function UpdatePending()
    for unit in pairs(pendingUnits) do
        pendingUnits[unit] = nil
        local plate = C_NamePlate.GetNamePlateForUnit(unit)
        if plate and not plate:IsForbidden() then RegisterDisplays(plate:GetChildren()) end
    end
    ScanContainers()
end

-- Periodic scan: a ticker (4 calls per second, not one per frame), running
-- only while at least one nameplate is shown.
local SCAN_INTERVAL = 0.25 -- seconds
local scanner
local function UpdateScanner()
    local active = next(shownPlates) ~= nil
    if active and not scanner then
        scanner = C_Timer.NewTicker(SCAN_INTERVAL, ScanContainers)
    elseif not active and scanner then
        scanner:Cancel()
        scanner = nil
    end
end

local events = CreateFrame("Frame")
events:SetScript("OnEvent", function(_, event, unit)
    if not unit or ns.IsSecret(unit) then return end
    if event == "NAME_PLATE_UNIT_ADDED" then
        shownPlates[unit] = true
        pendingUnits[unit] = true
        ns.Defer(UpdatePending)
    else -- NAME_PLATE_UNIT_REMOVED
        shownPlates[unit] = nil
    end
    UpdateScanner()
end)

local function SetupPlatynator()
    events:RegisterEvent("NAME_PLATE_UNIT_ADDED")
    events:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
    -- Nameplates already shown (e.g. after a reload).
    for _, plate in ipairs(C_NamePlate.GetNamePlates()) do
        if not plate:IsForbidden() then
            local unit = plate.namePlateUnitToken
            if unit and not ns.IsSecret(unit) then shownPlates[unit] = true end
            RegisterDisplays(plate:GetChildren())
        end
    end
    ScanContainers()
    UpdateScanner()
end

--------------------------------------------------------------------------------
-- Fast auto-loot. Blizzard's auto-loot takes the items one by one, with a
-- short delay each; here every slot is looted at once when LOOT_READY fires,
-- if auto-loot applies (the game setting, inverted by its modifier key).
-- LOOT_READY can fire twice for the same loot: a short lock skips repeats.
-- Bind-on-pickup confirmations and full bags are left to Blizzard. The
-- event is registered only while the option is on.
--------------------------------------------------------------------------------
local LOOT_LOCK = 0.3 -- seconds
local lastLoot = 0
local lootEvents = CreateFrame("Frame")

lootEvents:SetScript("OnEvent", function()
    local now = GetTime()
    if now - lastLoot < LOOT_LOCK then return end
    if C_CVar.GetCVarBool("autoLootDefault") == IsModifiedClick("AUTOLOOTTOGGLE") then return end
    lastLoot = now
    for slot = GetNumLootItems(), 1, -1 do LootSlot(slot) end
end)

local function SetFastLoot(on)
    if on then
        lootEvents:RegisterEvent("LOOT_READY")
    else
        lootEvents:UnregisterAllEvents()
    end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
-- Other addons load before PLAYER_LOGIN (when modules are enabled): if they
-- are not loaded by now, they are not installed or are disabled.
function Misc:OnEnable()
    if self.db.platynatorStyle and C_AddOns.IsAddOnLoaded("Platynator") then SetupPlatynator() end
    SetFastLoot(self.db.fastLoot)
end

-- Live: fast auto-loot.
function Misc:OnOptionChanged(key, value)
    if key == "fastLoot" then SetFastLoot(value) end
end
