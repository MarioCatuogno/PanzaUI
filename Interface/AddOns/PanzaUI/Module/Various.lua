--[[----------------------------------------------------------------------------
    PanzaUI - Various
    Other addons' styling and quality of life features.
------------------------------------------------------------------------------]]
local _, ns = ...

-- Saved variables key of the old Miscellaneous module.
local Misc = ns:RegisterModule("Miscellaneous", {
    title = "Various",
    defaults = {
        platynatorStyle = true,
        fastLoot        = true,
        cursorRing      = 0, -- off
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
        { key = "cursorRing", label = "Cursor ring",
          tooltip = "Show a ring around the mouse cursor.",
          bullets = { "In your class color, outlined" },
          dropdown = {
              { 0, "Off", "Never shown." },
              { 1, "Always", "Always shown." },
              { 2, "In combat", "Shown only in combat." },
              { 3, "In combat (group)", "Shown only in combat while in a party or raid." },
          } },
    },
})

--------------------------------------------------------------------------------
-- Platynator aura icons: styled while Platynator builds each button, before
-- secret aura data locks it (found through a post-hook of CreateFrame).
--------------------------------------------------------------------------------
local AURA_KINDS = { "buffs", "debuffs", "crowdControl" }
local styledAuras = {}

-- Styles a button once its icon, cooldown and border exist.
local function StyleAuraFrame(frame)
    if styledAuras[frame] or not (frame.Icon and frame.Cooldown and frame.Border) then return end
    if not ns.StyleIcon(frame.Icon, frame, true) then return end
    styledAuras[frame] = true
    ns.RoundSwipe(frame.Cooldown)
    frame.Border:SetAlpha(0)
end

-- The button being built is the last one of its container.
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

-- Forbidden parents can't be indexed: the check runs protected.
local function OnCreateFrame(frameType, name, parent, template)
    if frameType ~= "Frame" or name ~= nil or template ~= nil or type(parent) ~= "table" then return end
    pcall(CheckAuraButton, parent)
end

-- Buttons made before the hook (e.g. after a reload).
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
-- Platynator cast icon: border and mask follow the marker kind.
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
-- Displays: found among the nameplate children, once each.
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
-- Fast auto-loot: every slot looted at once (repeats skipped).
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
-- Cursor ring: class colored ring following the cursor (OnUpdate only
-- while shown).
--------------------------------------------------------------------------------
local RING = { OFF = 0, ALWAYS = 1, COMBAT = 2, GROUP = 3 }
local RING_TEXTURE = [[Interface\AddOns\PanzaUI\Media\Icons\PanzaUI_ring.tga]]
local RING_SIZE = 48
local ring, ringCombat

local function RingVisible(mode)
    if mode == RING.ALWAYS then return true end
    if mode == RING.COMBAT then return ringCombat end
    if mode == RING.GROUP then return ringCombat and IsInGroup() end
    return false
end

local function UpdateRing()
    if ring then ring:SetShown(RingVisible(Misc.db.cursorRing)) end
end

-- Moved only when the cursor moved.
local lastX, lastY
local function FollowCursor(self)
    local x, y = GetCursorPosition()
    if x == lastX and y == lastY then return end
    lastX, lastY = x, y
    local scale = self:GetEffectiveScale()
    self:ClearAllPoints()
    self:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x / scale, y / scale)
end

local ringEvents = CreateFrame("Frame")
ringEvents:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_REGEN_DISABLED" then
        ringCombat = true
    elseif event == "PLAYER_REGEN_ENABLED" then
        ringCombat = false
    end
    UpdateRing()
end)

local function SetCursorRing(mode)
    if mode == RING.OFF then
        ringEvents:UnregisterAllEvents()
        if ring then ring:Hide() end
        return
    end
    if not ring then
        ring = CreateFrame("Frame", nil, UIParent)
        ring:SetFrameStrata("TOOLTIP")
        ring:SetSize(RING_SIZE, RING_SIZE)
        ring:EnableMouse(false)
        local tex = ring:CreateTexture(nil, "OVERLAY")
        tex:SetAllPoints()
        tex:SetTexture(RING_TEXTURE)
        local color = RAID_CLASS_COLORS[select(2, UnitClass("player"))] or HIGHLIGHT_FONT_COLOR
        tex:SetVertexColor(color.r, color.g, color.b)
        ring:SetScript("OnUpdate", FollowCursor)
        ring:Hide()
    end
    ringEvents:RegisterEvent("PLAYER_REGEN_DISABLED")
    ringEvents:RegisterEvent("PLAYER_REGEN_ENABLED")
    ringEvents:RegisterEvent("GROUP_ROSTER_UPDATE")
    ringCombat = InCombatLockdown()
    UpdateRing()
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
-- Other addons are already loaded when modules are enabled.
function Misc:OnEnable()
    if self.db.platynatorStyle and C_AddOns.IsAddOnLoaded("Platynator") then SetupPlatynator() end
    SetFastLoot(self.db.fastLoot)
    SetCursorRing(self.db.cursorRing)
end

-- Live options.
function Misc:OnOptionChanged(key, value)
    if key == "fastLoot" then
        SetFastLoot(value)
    elseif key == "cursorRing" then
        SetCursorRing(value)
    end
end
