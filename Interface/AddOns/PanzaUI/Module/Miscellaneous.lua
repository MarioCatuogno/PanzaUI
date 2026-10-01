--[[----------------------------------------------------------------------------
    PanzaUI - Miscellaneous
    Other Addons: refined style for Platynator nameplates (rounded borders on
    aura and cast icons).
------------------------------------------------------------------------------]]
local _, ns = ...

local Misc = ns:RegisterModule("Miscellaneous", {
    title = "Miscellaneous",
    defaults = {
        platynatorStyle = true,
    },
    options = {
        { header = "Other Addons" },
        { key = "platynatorStyle", label = "Platynator: Refined style", reload = true,
          tooltip = "Polish the look of Platynator nameplates.",
          bullets = { "Rounded aura icon borders", "Rounded cast icon border", "Only when Platynator is installed" } },
    },
})

--------------------------------------------------------------------------------
-- Platynator aura icons. Each nameplate display has an AurasManager with
-- three aura containers (buffs, debuffs, crowd control); their icon frames
-- are created on demand and appended to container.frames (a reused frame
-- can be appended again). New entries are checked shortly after a nameplate
-- is added or an aura changes: one deferred scan per frame, from the last
-- position seen; each frame is styled once (no garbage, a few table reads).
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
    for _, widget in ipairs(display.widgets or {}) do
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

local events = CreateFrame("Frame")
events:SetScript("OnEvent", function(_, event, unit)
    if event == "NAME_PLATE_UNIT_ADDED" then
        if not unit or ns.IsSecret(unit) then return end
        pendingUnits[unit] = true
        ns.Defer(UpdatePending)
    elseif next(containers) then -- UNIT_AURA
        ns.Defer(ScanContainers)
    end
end)

local function SetupPlatynator()
    events:RegisterEvent("NAME_PLATE_UNIT_ADDED")
    events:RegisterEvent("UNIT_AURA")
    -- Nameplates already shown (e.g. after a reload).
    for _, plate in ipairs(C_NamePlate.GetNamePlates()) do
        if not plate:IsForbidden() then RegisterDisplays(plate:GetChildren()) end
    end
    ScanContainers()
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
-- Other addons load before PLAYER_LOGIN (when modules are enabled): if they
-- are not loaded by now, they are not installed or are disabled.
function Misc:OnEnable()
    if self.db.platynatorStyle and C_AddOns.IsAddOnLoaded("Platynator") then SetupPlatynator() end
end
