--[[----------------------------------------------------------------------------
    PanzaUI - Various
    Other Addons: refined style for Platynator nameplates (rounded borders on
    aura and cast icons).
    Quality of Life: fast auto-loot.
------------------------------------------------------------------------------]]
local _, ns = ...

-- Saved variables key of the old Miscellaneous module.
local Misc = ns:RegisterModule("Miscellaneous", {
    title = "Various",
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
-- Platynator aura icons: styled while Platynator builds each button (found
-- through a post-hook of CreateFrame, filtered on the child frames it
-- makes), because once a button shows secret aura data it refuses new
-- textures. Only the newest button of an aura container is touched, each
-- step once. Blizzard also creates frames with forbidden parents, which
-- can't even be indexed: the check runs protected.
--------------------------------------------------------------------------------
local AURA_KINDS = { "buffs", "debuffs", "crowdControl" }
local auraIcon, auraSwipe, auraBorder = {}, {}, {}

local function StyleAuraFrame(frame)
    if not auraIcon[frame] and frame.Icon then
        auraIcon[frame] = ns.StyleIcon(frame.Icon, frame, true) and true
    end
    if not auraSwipe[frame] and frame.Cooldown then
        auraSwipe[frame] = true
        ns.RoundSwipe(frame.Cooldown)
    end
    if not auraBorder[frame] and frame.Border then
        auraBorder[frame] = true
        frame.Border:SetAlpha(0)
    end
end

-- The button being initialized is the last entry of its container's list.
local function IsNewAuraButton(button, container)
    if not container or container:IsForbidden() then return false end
    local list = container.frames
    return type(list) == "table" and list[#list] == button
end

local function CheckAuraButton(button)
    if button:IsForbidden() or not button.Icon then return end
    local container = button:GetParent()
    if IsNewAuraButton(button, container) or (container and IsNewAuraButton(button, container:GetParent())) then
        StyleAuraFrame(button)
    end
end

-- Platynator makes a Cooldown (CooldownFrameTemplate) and plain Frames.
local function OnCreateFrame(frameType, name, parent, template)
    if type(parent) ~= "table" then return end
    if frameType == "Cooldown" then
        if template ~= "CooldownFrameTemplate" then return end
    elseif frameType ~= "Frame" or name ~= nil or template ~= nil then
        return
    end
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
