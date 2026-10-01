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
-- Platynator aura icons: each nameplate display has three aura containers
-- whose icon frames are created on demand. New frames are styled once, by a
-- scan that runs when a nameplate appears and a few times per second while
-- nameplates are shown (no UNIT_AURA: its payload would be counted as
-- PanzaUI memory). Frames that can't be styled yet are retried for a while.
--------------------------------------------------------------------------------
local AURA_KINDS = { "buffs", "debuffs", "crowdControl" }
local containers = {}  -- container -> frames already handled
local styledAuras = {}
local retryAuras  = {} -- frame -> failed attempts
local MAX_RETRIES = 20

local function StyleAuraFrame(frame)
    if not frame or styledAuras[frame] then return end
    if frame:IsForbidden() or not ns.StyleIcon(frame.Icon, frame, true) then
        local tries = (retryAuras[frame] or 0) + 1
        retryAuras[frame] = tries <= MAX_RETRIES and tries or nil
        return
    end
    retryAuras[frame] = nil
    styledAuras[frame] = true
    if frame.Border then frame.Border:SetAlpha(0) end
    ns.RoundSwipe(frame.Cooldown)
end

local function ScanContainers()
    for container, handled in pairs(containers) do
        local frames = container.frames
        local count = #frames
        if count > handled then
            containers[container] = count
            for i = handled + 1, count do StyleAuraFrame(frames[i]) end
        end
    end
    for frame in pairs(retryAuras) do
        if frame:IsForbidden() or frame:IsVisible() then StyleAuraFrame(frame) end
    end
end

--------------------------------------------------------------------------------
-- Platynator cast icon: markers are pooled and reused for other kinds, so
-- the border and mask follow the marker kind after each Init.
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
    if isCast and marker.background then marker.background:SetAlpha(0) end
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
-- Displays: found among the nameplate children, after Platynator's own
-- handler (deferred) and by the periodic scan (only while nameplates are
-- shown).
--------------------------------------------------------------------------------
local pendingUnits = {}
local shownPlates  = {}

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

local SCAN_INTERVAL = 0.25 -- seconds
local function PeriodicScan()
    for unit in pairs(shownPlates) do
        local plate = C_NamePlate.GetNamePlateForUnit(unit)
        if plate and not plate:IsForbidden() then RegisterDisplays(plate:GetChildren()) end
    end
    ScanContainers()
end

local scanner
local function UpdateScanner()
    local active = next(shownPlates) ~= nil
    if active and not scanner then
        scanner = C_Timer.NewTicker(SCAN_INTERVAL, PeriodicScan)
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
-- Fast auto-loot: every slot looted at once when the loot is ready and
-- auto-loot applies (game setting and its modifier key). A short lock skips
-- repeated events; confirmations are left to Blizzard.
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
-- Other addons are already loaded when modules are enabled.
function Misc:OnEnable()
    if self.db.platynatorStyle and C_AddOns.IsAddOnLoaded("Platynator") then SetupPlatynator() end
    SetFastLoot(self.db.fastLoot)
end

-- Live options.
function Misc:OnOptionChanged(key, value)
    if key == "fastLoot" then SetFastLoot(value) end
end
