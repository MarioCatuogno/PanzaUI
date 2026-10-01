--[[----------------------------------------------------------------------------
    PanzaUI - Miscellaneous
    Buffs/Debuffs: action bar style, text style, icon zoom.
    Quality of Life: auto-repair, item level in the Character and Inspect panels.
    Various: visibility of the Micro Menu, Bag Bar and XP/Reputation bars.
------------------------------------------------------------------------------]]
local _, ns = ...
local VIS = ns.VIS

-- Various: visibility entries (same modes as the action bars).
-- frames = global names (nil ones skipped); buttons come from their children.
local VISIBILITY = {
    { key = "microMenu",   label = "Micro Menu",                frames = { "MicroMenuContainer" } },
    { key = "bagBar",      label = "Bag Bar",                   frames = { "BagsBar" } },
    { key = "statusBars",  label = "Experience/Reputation bar", frames = { "MainStatusTrackingBarContainer", "SecondaryStatusTrackingBarContainer" } },
}

local Misc = ns:RegisterModule("Miscellaneous", {
    title = "Miscellaneous",
    defaults = {
        auraIconStyle = true,
        auraFontStyle = true,
        auraIconZoom  = 5,
        autoRepair    = true,
        charItemLevel = true,
        microMenu     = VIS.DEFAULT,
        bagBar        = VIS.DEFAULT,
        statusBars    = VIS.DEFAULT,
    },
    options = {
        { header = "Buffs/Debuffs" },
        { key = "auraIconStyle", label = "Action bar style",     tooltip = "Give buff and debuff icons the same rounded frame as action buttons. Requires Reload UI." },
        { key = "auraFontStyle", label = "Outline + Slug text",  tooltip = "Apply outline and slug rendering to buff and debuff stacks and duration. Requires Reload UI." },
        { key = "auraIconZoom",  label = "Icon zoom",            tooltip = "Crop the edges of buff and debuff icons (percent per side) to hide the built-in border of older icons. 0 = off.",
          slider = { min = 0, max = 15, step = 1, suffix = "%" } },
        { header = "Quality of Life" },
        { key = "autoRepair",    label = "Auto-repair",          tooltip = "Repair all items with your own gold when opening a merchant that can repair." },
        { key = "charItemLevel", label = "Character item level", tooltip = "Show the item level at the top of the equipped items in the Character panel and in the Inspect panel of other players, colored by item quality." },
        { header = "Various" },
        { key = "microMenu",     label = "Micro Menu",           dropdown = ns.VISIBILITY_OPTIONS, tooltip = "When the micro menu (character, spellbook, talents, ...) is shown. Keybindings still work." },
        { key = "bagBar",        label = "Bag Bar",              dropdown = ns.VISIBILITY_OPTIONS, tooltip = "When the backpack and bag slot buttons are shown. Keybindings still work." },
        { key = "statusBars",    label = "Experience/Reputation bar", dropdown = ns.VISIBILITY_OPTIONS, tooltip = "When the experience, reputation and honor tracking bars are shown." },
    },
})

-- Old versions had "hide" toggles for the Micro Menu and Bag Bar.
function Misc:Migrate(db)
    if type(db.hideMicroMenu) == "boolean" then db.microMenu = db.hideMicroMenu and VIS.HIDDEN or VIS.DEFAULT end
    if type(db.hideBagBar)    == "boolean" then db.bagBar    = db.hideBagBar    and VIS.HIDDEN or VIS.DEFAULT end
end

--------------------------------------------------------------------------------
-- Buffs/Debuffs. Blizzard creates all aura buttons once at load
-- (BuffFrame/DebuffFrame.auraFrames), so they are styled once: no hooks.
-- Only widget calls on the buttons, no Blizzard fields are written (taint-safe).
--------------------------------------------------------------------------------
local function ForEachAuraButton(func)
    for _, container in ipairs({ BuffFrame, DebuffFrame }) do
        for _, button in ipairs(container.auraFrames or {}) do
            -- Skip private-aura anchors (isAuraAnchor): their Icon is a Frame, not a texture.
            local icon = button.Icon
            if not button.isAuraAnchor and icon and icon.AddMaskTexture then func(button, icon) end
        end
    end
end

local function ZoomAuras()
    local percent = Misc.db.auraIconZoom
    ForEachAuraButton(function(_, icon) ns.ZoomIcon(icon, percent) end)
end

local function SetupAuras(db)
    ForEachAuraButton(function(button, icon)
        if db.auraIconStyle then ns.StyleIcon(icon, button) end
        if db.auraFontStyle then
            ns.StyleFont(button.Count)
            ns.StyleFont(button.Duration)
        end
    end)
    ZoomAuras()
end

--------------------------------------------------------------------------------
-- Quality of Life: auto-repair (personal gold). The event is registered only
-- while the option is on.
--------------------------------------------------------------------------------
local repairEvents = CreateFrame("Frame")
repairEvents:SetScript("OnEvent", function()
    if not CanMerchantRepair() then return end
    local cost, canRepair = GetRepairAllCost()
    if not canRepair or cost <= 0 then return end
    if GetMoney() < cost then
        ns.Print("not enough gold to repair (" .. GetCoinTextureString(cost) .. ").")
        return
    end
    RepairAllItems(false)
    ns.Print("repaired for " .. GetCoinTextureString(cost) .. ".")
end)

local function SetAutoRepair(on)
    if on then repairEvents:RegisterEvent("MERCHANT_SHOW") else repairEvents:UnregisterAllEvents() end
end

--------------------------------------------------------------------------------
-- Quality of Life: item level in the Character panel and in the Inspect panel
-- (same look as in the bags, shared helper in core.lua). Post-hooks of
-- Blizzard's slot updates. Own items: one reused ItemLocation. Inspected
-- player: the item link of the slot (no ItemLocation for other units).
-- Shirt and tabard have no meaningful item level.
--------------------------------------------------------------------------------
local CHAR_SLOTS = {
    "Head", "Neck", "Shoulder", "Back", "Chest", "Wrist", "Hands", "Waist", "Legs", "Feet",
    "Finger0", "Finger1", "Trinket0", "Trinket1", "MainHand", "SecondaryHand",
}
local NO_ILVL = { [INVSLOT_BODY or 4] = true, [INVSLOT_TABARD or 19] = true }
local charLocation = ItemLocation:CreateEmpty()

local function UpdateCharSlot(button)
    local slot = button:GetID()
    local ilvl, color
    if Misc.db.charItemLevel and not NO_ILVL[slot] then
        charLocation:SetEquipmentSlot(slot)
        ilvl, color = ns.LocationItemLevel(charLocation)
    end
    ns.ItemLevelText(button, ilvl, color, true)
end

local function UpdateInspectSlot(button)
    local slot = button:GetID()
    local unit = InspectFrame and InspectFrame.unit
    local ilvl, color
    if Misc.db.charItemLevel and unit and not NO_ILVL[slot] then
        local link = GetInventoryItemLink(unit, slot)
        if link and not ns.IsSecret(link) then
            ilvl = C_Item.GetDetailedItemLevelInfo(link)
            if ilvl and ilvl <= 1 then ilvl = nil end
            local quality = ilvl and C_Item.GetItemQualityByID(link)
            color = quality and ITEM_QUALITY_COLORS[quality]
        end
    end
    ns.ItemLevelText(button, ilvl, color, true)
end

-- Every slot at once (option toggled live).
local function UpdateCharSlots()
    for _, name in ipairs(CHAR_SLOTS) do
        local button = _G["Character" .. name .. "Slot"]
        if button then UpdateCharSlot(button) end
        button = _G["Inspect" .. name .. "Slot"]
        if button then UpdateInspectSlot(button) end
    end
end

--------------------------------------------------------------------------------
-- Various: shared visibility engine (core.lua). Alpha only, so Edit Mode
-- positions and anything anchored to these frames (e.g. the queue eye) stay.
--------------------------------------------------------------------------------
local function ChildButtons(frame, list)
    for _, child in ipairs({ frame:GetChildren() }) do
        if child:IsMouseEnabled() then list[#list + 1] = child end
        ChildButtons(child, list)
    end
    return list
end

local function SetupVisibility()
    for _, v in ipairs(VISIBILITY) do
        local frames, buttons = {}, {}
        for _, name in ipairs(v.frames) do
            local frame = _G[name]
            if frame then
                frames[#frames + 1] = frame
                ChildButtons(frame, buttons)
            end
        end
        ns.RegisterVisibility({ frames = frames, buttons = buttons, getMode = function() return Misc.db[v.key] end })
    end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function Misc:OnEnable()
    local db = self.db
    EventUtil.ContinueOnAddOnLoaded("Blizzard_BuffFrame", function() SetupAuras(db) end)
    SetAutoRepair(db.autoRepair)
    -- Hooked always (cheap), so the option can be turned on and off live.
    ns.Hook("PaperDollItemSlotButton_Update", UpdateCharSlot)
    -- The Inspect panel is load-on-demand.
    EventUtil.ContinueOnAddOnLoaded("Blizzard_InspectUI", function()
        ns.Hook("InspectPaperDollItemSlotButton_Update", UpdateInspectSlot)
    end)
    if db.charItemLevel then UpdateCharSlots() end
    SetupVisibility()
end

function Misc:OnOptionChanged(key, value)
    if key == "auraIconZoom" then
        ZoomAuras()
    elseif key == "autoRepair" then
        SetAutoRepair(value)
    elseif key == "charItemLevel" then
        UpdateCharSlots()
    else
        ns.RefreshVisibility()
    end
end
