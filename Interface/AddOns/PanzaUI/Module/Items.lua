--[[----------------------------------------------------------------------------
    PanzaUI - Bags & Items
    Items: refined style and icon zoom for bag items; item level on equipment
    in the bags, the Character panel and the Inspect panel.
    Merchant: auto-repair and auto-sell junk.
------------------------------------------------------------------------------]]
local _, ns = ...

local Items = ns:RegisterModule("Items", {
    title = "Bags & Items",
    defaults = {
        style        = true,
        iconZoom     = 5,
        itemLevel    = true,
        autoRepair   = true,
        autoSellJunk = true,
    },
    options = {
        { header = "Items" },
        { key = "style", label = "Refined style", reload = true,
          tooltip = "Polish the look of bag items.",
          bullets = { "Outlined text" } },
        { key = "iconZoom", label = "Icon zoom",
          tooltip = "Crop the edges of bag item icons. 0 = off.",
          slider = { min = 0, max = 15, step = 1, suffix = "%" } },
        { key = "itemLevel", label = "Item level",
          tooltip = "Show the item level on equipment.",
          bullets = { "Bags", "Character and Inspect panels", "Colored by item quality" } },
        { header = "Merchant" },
        { key = "autoRepair", label = "Auto-repair",
          tooltip = "Repair all your gear when you open a merchant that can repair.",
          bullets = { "Uses your own gold", "Shows the cost in chat" } },
        { key = "autoSellJunk", label = "Auto-sell junk",
          tooltip = "Sell all junk items when you open a merchant.",
          bullets = { "Poor quality (grey) items only", "Same as Blizzard's \"Sell All Junk\" button" } },
    },
})

-- Old saved values: the Bags module, the Character panel item level and the
-- merchant options (Miscellaneous, then Quality of Life).
function Items:Migrate(db, saved)
    local bags, misc, qol = saved.Bags, saved.Miscellaneous, saved.QualityOfLife
    ns.MergeOptions(db, "style", bags, "fontStyle")
    ns.MergeOptions(db, "iconZoom", bags, "iconZoom")
    ns.MergeOptions(db, "itemLevel", bags, "showItemLevel")
    ns.MergeOptions(db, "itemLevel", misc, "charItemLevel")
    ns.MergeOptions(db, "autoRepair", qol, "autoRepair", "merchant")
    ns.MergeOptions(db, "autoSellJunk", qol, "autoSellJunk", "merchant")
    ns.MergeOptions(db, "autoRepair", misc, "autoRepair")
    ns.MergeOptions(db, "autoSellJunk", misc, "autoSellJunk")
end

--------------------------------------------------------------------------------
-- Item level of a bag slot (weapons, armor, profession gear only).
-- One reused ItemLocation and no info tables: no garbage per update.
--------------------------------------------------------------------------------
local EQUIPMENT = {
    [Enum.ItemClass.Weapon]     = true,
    [Enum.ItemClass.Armor]      = true,
    [Enum.ItemClass.Profession] = true,
}
local SKIP_SLOTS = { [""] = true, INVTYPE_NON_EQUIP_IGNORE = true, INVTYPE_BODY = true, INVTYPE_TABARD = true }
local bagLocation = ItemLocation:CreateEmpty()

local function BagItemLevel(bag, slot)
    local itemID = C_Container.GetContainerItemID(bag, slot)
    if not itemID then return end
    local _, _, _, equipLoc, _, classID = C_Item.GetItemInfoInstant(itemID)
    if not EQUIPMENT[classID] or SKIP_SLOTS[equipLoc] then return end

    bagLocation:SetBagAndSlot(bag, slot)
    return ns.LocationItemLevel(bagLocation)
end

--------------------------------------------------------------------------------
-- Bag buttons. Our own data lives in local tables (no fields written on
-- Blizzard buttons: taint-safe). Item level text: shared helper (core.lua).
--------------------------------------------------------------------------------
local styled = {} -- button -> true
local containers = {}

local function UpdateBagButton(button)
    local db = Items.db
    ns.ZoomIcon(button.icon or button.Icon, db.iconZoom)

    if db.style and not styled[button] then
        styled[button] = true
        ns.StyleFont(button.Count)
    end

    local ilvl, color
    if db.itemLevel then ilvl, color = BagItemLevel(button:GetBagID(), button:GetID()) end
    ns.ItemLevelText(button, ilvl, color, db.style)
end

-- Runs after Blizzard's UpdateItems (bags opened, items changed).
local function UpdateContainer(frame)
    if not frame:IsShown() then return end
    for _, button in frame:EnumerateValidItems() do UpdateBagButton(button) end
end

local function SetupBags()
    -- Combined bags + individual bag frames (nil entries skipped).
    local count = NUM_CONTAINER_FRAMES or 13
    local frames = { ContainerFrameCombinedBags }
    for i = 1, count do frames[i + 1] = _G["ContainerFrame" .. i] end
    for i = 1, count + 1 do
        if frames[i] then containers[#containers + 1] = frames[i] end
    end
    for _, frame in ipairs(containers) do
        ns.Hook(frame, "UpdateItems", UpdateContainer)
    end
end

--------------------------------------------------------------------------------
-- Character and Inspect panels (same look as in the bags). Post-hooks of
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
    if Items.db.itemLevel and not NO_ILVL[slot] then
        charLocation:SetEquipmentSlot(slot)
        ilvl, color = ns.LocationItemLevel(charLocation)
    end
    ns.ItemLevelText(button, ilvl, color, true)
end

local function UpdateInspectSlot(button)
    local slot = button:GetID()
    local unit = InspectFrame and InspectFrame.unit
    local ilvl, color
    if Items.db.itemLevel and unit and not NO_ILVL[slot] then
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

local function UpdateCharSlots()
    for _, name in ipairs(CHAR_SLOTS) do
        local button = _G["Character" .. name .. "Slot"]
        if button then UpdateCharSlot(button) end
        button = _G["Inspect" .. name .. "Slot"]
        if button then UpdateInspectSlot(button) end
    end
end

local function SetupPanels()
    -- Hooked always (cheap), so the option can be turned on and off live.
    ns.Hook("PaperDollItemSlotButton_Update", UpdateCharSlot)
    -- The Inspect panel is load-on-demand.
    EventUtil.ContinueOnAddOnLoaded("Blizzard_InspectUI", function()
        ns.Hook("InspectPaperDollItemSlotButton_Update", UpdateInspectSlot)
    end)
end

--------------------------------------------------------------------------------
-- Merchant: when a merchant opens, junk is sold with Blizzard's own "Sell All
-- Junk", then gear is repaired with personal gold (the gold you have when the
-- merchant opens; the junk gold arrives a moment later). MERCHANT_SHOW is
-- registered only while at least one of the two options is on.
--------------------------------------------------------------------------------
local merchantEvents = CreateFrame("Frame")

local function SellJunk()
    if not (C_MerchantFrame and C_MerchantFrame.SellAllJunkItems) then return end
    local count = C_MerchantFrame.GetNumJunkItems and C_MerchantFrame.GetNumJunkItems() or 0
    if count <= 0 then return end
    C_MerchantFrame.SellAllJunkItems()
    ns.Print(("sold %d junk item%s."):format(count, count == 1 and "" or "s"))
end

local function Repair()
    if not CanMerchantRepair() then return end
    local cost, canRepair = GetRepairAllCost()
    if not canRepair or cost <= 0 then return end
    if GetMoney() < cost then
        ns.Print("not enough gold to repair (" .. GetCoinTextureString(cost) .. ").")
        return
    end
    RepairAllItems(false)
    ns.Print("repaired for " .. GetCoinTextureString(cost) .. ".")
end

merchantEvents:SetScript("OnEvent", function()
    if Items.db.autoSellJunk then SellJunk() end
    if Items.db.autoRepair then Repair() end
end)

local function UpdateMerchantEvents()
    if Items.db.autoRepair or Items.db.autoSellJunk then
        merchantEvents:RegisterEvent("MERCHANT_SHOW")
    else
        merchantEvents:UnregisterAllEvents()
    end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function Items:OnEnable()
    SetupBags()
    SetupPanels()
    if self.db.itemLevel then UpdateCharSlots() end
    UpdateMerchantEvents()
end

-- Live: icon zoom, item level, merchant options.
function Items:OnOptionChanged(key)
    if key == "autoRepair" or key == "autoSellJunk" then
        UpdateMerchantEvents()
    else
        for _, frame in ipairs(containers) do UpdateContainer(frame) end
        UpdateCharSlots()
    end
end
