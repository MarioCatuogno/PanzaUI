--[[----------------------------------------------------------------------------
    PanzaUI - Various
    Other Addons: refined style for Platynator nameplates (rounded borders on
    aura and cast icons).
    Quality of Life: fast auto-loot and a crosshair on the player.
------------------------------------------------------------------------------]]
local _, ns = ...

-- Saved variables key of the old Miscellaneous module.
local Misc = ns:RegisterModule("Miscellaneous", {
    title = "Various",
    defaults = {
        platynatorStyle = true,
        fastLoot        = true,
        crosshair       = 0, -- off
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
        { key = "crosshair", label = "Crosshair",
          tooltip = "Show a cross in the center of the screen, on your character.",
          bullets = { "In your class color, outlined" },
          dropdown = {
              { 0, "Off", "Never shown." },
              { 1, "Always", "Always shown." },
              { 2, "In combat", "Shown only in combat." },
              { 3, "In combat (group)", "Shown only in combat while in a party or raid." },
              { 4, "Skyriding only", "Shown only while Skyriding." },
          } },
    },
})

--------------------------------------------------------------------------------
-- Platynator aura icons: styled while Platynator builds each button (found
-- through a post-hook of CreateFrame, filtered on the child frames it
-- makes), because once a button shows secret aura data it refuses new
-- textures. Only the newest button of an aura container is touched, once
-- its icon, cooldown and border exist. Blizzard also creates frames with
-- forbidden parents, which can't even be indexed: the check runs protected.
--------------------------------------------------------------------------------
local AURA_KINDS = { "buffs", "debuffs", "crowdControl" }
local styledAuras = {}

-- Runs once Platynator has made the icon, cooldown and border.
local function StyleAuraFrame(frame)
    if styledAuras[frame] or not (frame.Icon and frame.Cooldown and frame.Border) then return end
    if not ns.StyleIcon(frame.Icon, frame, true) then return end
    styledAuras[frame] = true
    ns.RoundSwipe(frame.Cooldown)
    frame.Border:SetAlpha(0)
end

-- The button being initialized is the last entry of its container's list.
local function IsNewAuraButton(button, container)
    if not container or container:IsForbidden() then return false end
    local list = container.frames
    return type(list) == "table" and list[#list] == button
end

local function CheckAuraButton(button)
    if button:IsForbidden() or not button.Border or styledAuras[button] then return end
    local container = button:GetParent()
    if IsNewAuraButton(button, container) or (container and IsNewAuraButton(button, container:GetParent())) then
        StyleAuraFrame(button)
    end
end

-- The border is followed by a plain Frame (the dispel frame).
local function OnCreateFrame(frameType, name, parent, template)
    if frameType ~= "Frame" or name ~= nil or template ~= nil or type(parent) ~= "table" then return end
    pcall(CheckAuraButton, parent)
end

-- Buttons made before the hook (e.g. after a reload): styled once, when
-- their nameplate display is found.
local function StyleExistingAuras(manager)
    for _, kind in ipairs(AURA_KINDS) do
        local list = manager[kind] and manager[kind].frames
        if type(list) == "table" then
            for _, frame in ipairs(list) do
                if not frame:IsForbidden() then StyleAuraFrame(frame) end
            end
        end
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
-- Displays: found among the nameplate children after Platynator's own
-- handler (deferred), once per display.
--------------------------------------------------------------------------------
local pendingUnits, knownDisplays = {}, {}

local function RegisterDisplays(...)
    for i = 1, select("#", ...) do
        local display = select(i, ...)
        if not knownDisplays[display] and not display:IsForbidden() and display.AurasManager then
            knownDisplays[display] = true
            StyleExistingAuras(display.AurasManager)
        end
        if knownDisplays[display] then HookMarkers(display) end
    end
end

local function UpdatePending()
    for unit in pairs(pendingUnits) do
        pendingUnits[unit] = nil
        local plate = C_NamePlate.GetNamePlateForUnit(unit)
        if plate and not plate:IsForbidden() then RegisterDisplays(plate:GetChildren()) end
    end
end

local events = CreateFrame("Frame")
events:SetScript("OnEvent", function(_, _, unit)
    if not unit or ns.IsSecret(unit) then return end
    pendingUnits[unit] = true
    ns.Defer(UpdatePending)
end)

local function SetupPlatynator()
    hooksecurefunc("CreateFrame", OnCreateFrame)
    events:RegisterEvent("NAME_PLATE_UNIT_ADDED")
    for _, plate in ipairs(C_NamePlate.GetNamePlates()) do
        if not plate:IsForbidden() then RegisterDisplays(plate:GetChildren()) end
    end
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
-- Crosshair: a "+" in the class color with the shared outline, in the
-- center of the screen. Shown by mode (always, combat, combat in a group,
-- Skyriding); events are registered only while a mode is chosen. Not a
-- protected frame: it can be shown and hidden in combat.
--------------------------------------------------------------------------------
local CROSS = { OFF = 0, ALWAYS = 1, COMBAT = 2, GROUP = 3, SKYRIDING = 4 }
local CROSS_EVENTS = {
    "PLAYER_REGEN_DISABLED", "PLAYER_REGEN_ENABLED", "GROUP_ROSTER_UPDATE",
    "PLAYER_ENTERING_WORLD", "PLAYER_MOUNT_DISPLAY_CHANGED",
}
local cross, inCombat

local function CrossVisible(mode)
    if mode == CROSS.ALWAYS then return true end
    if mode == CROSS.COMBAT then return inCombat end
    if mode == CROSS.GROUP then return inCombat and IsInGroup() end
    if mode == CROSS.SKYRIDING then return ns.IsSkyriding() end
    return false
end

local crossEvents = CreateFrame("Frame")

local function UpdateCross()
    if cross then cross:SetShown(CrossVisible(Misc.db.crosshair)) end
end

crossEvents:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_REGEN_DISABLED" then
        inCombat = true
    elseif event == "PLAYER_REGEN_ENABLED" then
        inCombat = false
    end
    UpdateCross()
end)

local function SetCrosshair(mode)
    if mode == CROSS.OFF then
        crossEvents:UnregisterAllEvents()
        if cross then cross:Hide() end
        return
    end
    if not cross then
        cross = UIParent:CreateFontString(nil, "OVERLAY")
        local font = GameFontNormalHuge:GetFont()
        cross:SetFont(font, 32, ns.FONT_FLAGS)
        cross:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
        cross:SetText("+")
        local color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
        if color then cross:SetTextColor(color.r, color.g, color.b) end
    end
    for _, event in ipairs(CROSS_EVENTS) do crossEvents:RegisterEvent(event) end
    pcall(crossEvents.RegisterEvent, crossEvents, "PLAYER_CAN_GLIDE_CHANGED")
    inCombat = InCombatLockdown()
    UpdateCross()
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
-- Other addons are already loaded when modules are enabled.
function Misc:OnEnable()
    if self.db.platynatorStyle and C_AddOns.IsAddOnLoaded("Platynator") then SetupPlatynator() end
    SetFastLoot(self.db.fastLoot)
    SetCrosshair(self.db.crosshair)
end

-- Live options.
function Misc:OnOptionChanged(key, value)
    if key == "fastLoot" then
        SetFastLoot(value)
    elseif key == "crosshair" then
        SetCrosshair(value)
    end
end
