--[[----------------------------------------------------------------------------
    PanzaUI - Bags & Items
    Items: icon zoom for bag items (and the shared text style); item level on
    equipment in the bags, the banks (character, warband, guild), the
    Character panel and the Inspect panel.
    Merchant: auto-repair and auto-sell junk.
------------------------------------------------------------------------------]]
local _, ns = ...

local Items = ns:RegisterModule("Items", {
    title = "Bags & Items",
    defaults = {
        iconZoom     = 5,
        itemLevel    = true,
        autoRepair   = true,
        autoSellJunk = true,
    },
    options = {
        { header = "Items" },
        { key = "iconZoom", label = "Icon zoom",
          tooltip = "Crop the edges of bag item icons. 0 = off.",
          slider = { min = 0, max = 15, step = 1, suffix = "%" } },
        { key = "itemLevel", label = "Item level",
          tooltip = "Show the item level on equipment.",
          bullets = { "Bags", "Character, warband and guild banks", "Character and Inspect panels", "Colored by item quality" } },
        { header = "Merchant" },
        { key = "autoRepair", label = "Auto-repair",
          tooltip = "Repair all your gear when you open a merchant that can repair.",
          bullets = { "Uses your own gold", "Shows the cost in chat" } },
        { key = "autoSellJunk", label = "Auto-sell junk",
          tooltip = "Sell all junk items when you open a merchant.",
          bullets = { "Poor quality (grey) items only", "Same as Blizzard's \"Sell All Junk\" button" } },
    },
})

-- Converts the saved values of older versions.
function Items:Migrate(db, saved)
    local bags, misc, qol = saved.Bags, saved.Miscellaneous, saved.QualityOfLife
    ns.MergeOptions(db, "iconZoom", bags, "iconZoom")
    ns.MergeOptions(db, "itemLevel", bags, "showItemLevel")
    ns.MergeOptions(db, "itemLevel", misc, "charItemLevel")
    ns.MergeOptions(db, "autoRepair", qol, "autoRepair", "merchant")
    ns.MergeOptions(db, "autoSellJunk", qol, "autoSellJunk", "merchant")
    ns.MergeOptions(db, "autoRepair", misc, "autoRepair")
    ns.MergeOptions(db, "autoSellJunk", misc, "autoSellJunk")
end

--------------------------------------------------------------------------------
-- Item level of a bag slot (equipment only), read without garbage.
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
-- Bag buttons: icon zoom, text style and item level, after each Blizzard
-- update. Data lives in local tables (no fields on Blizzard buttons).
--------------------------------------------------------------------------------
local styled = {} -- button -> true
local containers = {}

local function UpdateBagButton(button)
    local db = Items.db
    ns.ZoomIcon(button.icon or button.Icon, db.iconZoom)

    if ns.textStyle and not styled[button] then
        styled[button] = true
        ns.StyleFont(button.Count)
    end

    local ilvl, color
    if db.itemLevel then ilvl, color = BagItemLevel(button:GetBagID(), button:GetID()) end
    ns.ItemLevelText(button, ilvl, color)
end

local function UpdateContainer(frame)
    if not frame:IsShown() then return end
    for _, button in frame:EnumerateValidItems() do UpdateBagButton(button) end
end

local function SetupBags()
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
-- Character and Inspect panels: item level on equipped items, after each
-- Blizzard slot update (shirt and tabard excluded).
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
    ns.ItemLevelText(button, ilvl, color)
end

-- Item level and quality color from an item link (equipmentOnly: weapons,
-- armor and profession gear, like the bags).
local function LinkItemLevel(link, equipmentOnly)
    if not link or ns.IsSecret(link) then return end
    if equipmentOnly then
        local _, _, _, equipLoc, _, classID = C_Item.GetItemInfoInstant(link)
        if not EQUIPMENT[classID] or SKIP_SLOTS[equipLoc] then return end
    end
    local ilvl = C_Item.GetDetailedItemLevelInfo(link)
    if not ilvl or ilvl <= 1 then return end
    local quality = C_Item.GetItemQualityByID(link)
    return ilvl, quality and ITEM_QUALITY_COLORS[quality]
end

local function UpdateInspectSlot(button)
    local slot = button:GetID()
    local unit = InspectFrame and InspectFrame.unit
    local ilvl, color
    if Items.db.itemLevel and unit and not NO_ILVL[slot] then
        ilvl, color = LinkItemLevel(GetInventoryItemLink(unit, slot))
    end
    ns.ItemLevelText(button, ilvl, color)
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
    ns.Hook("PaperDollItemSlotButton_Update", UpdateCharSlot)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_InspectUI", function()
        ns.Hook("InspectPaperDollItemSlotButton_Update", UpdateInspectSlot)
    end)
end

--------------------------------------------------------------------------------
-- Banks: item level on equipment, after each Blizzard update.
-- Character and warband bank: one panel with pooled buttons (bank tab and
-- slot of each button). Guild bank (load-on-demand): 7 columns of 14
-- buttons, read through the item links of the current tab.
--------------------------------------------------------------------------------
local hookedBank = {}

local function UpdateBankButton(button)
    local ilvl, color
    if Items.db.itemLevel and button.GetBankTabID and button.GetContainerSlotID then
        ilvl, color = BagItemLevel(button:GetBankTabID(), button:GetContainerSlotID())
    end
    ns.ItemLevelText(button, ilvl, color)
end

local function UpdateBankPanel()
    local panel = BankPanel
    local active = panel and panel:IsShown() and panel.itemButtonPool and panel.itemButtonPool.activeObjects
    if not active then return end
    for button in pairs(active) do
        if not hookedBank[button] and button.Refresh then
            hookedBank[button] = true
            hooksecurefunc(button, "Refresh", UpdateBankButton)
        end
        UpdateBankButton(button)
    end
end

local GUILD_COLUMNS = NUM_GUILDBANK_COLUMNS or 7
local GUILD_SLOTS   = NUM_SLOTS_PER_GUILDBANK_GROUP or 14

local function UpdateGuildBank()
    local frame = GuildBankFrame
    if not (frame and frame:IsShown() and frame.Columns) then return end
    local show = Items.db.itemLevel and (frame.mode == nil or frame.mode == "bank")
    local tab = GetCurrentGuildBankTab()
    for c = 1, GUILD_COLUMNS do
        local buttons = frame.Columns[c] and frame.Columns[c].Buttons
        if buttons then
            for i = 1, GUILD_SLOTS do
                local button = buttons[i]
                if button then
                    local ilvl, color
                    if show then ilvl, color = LinkItemLevel(GetGuildBankItemLink(tab, (c - 1) * GUILD_SLOTS + i), true) end
                    ns.ItemLevelText(button, ilvl, color)
                end
            end
        end
    end
end

local function SetupBanks()
    if BankPanel then
        ns.Hook(BankPanel, "GenerateItemSlotsForSelectedTab", UpdateBankPanel)
        ns.Hook(BankPanel, "RefreshAllItemsForSelectedTab", UpdateBankPanel)
    end
    EventUtil.ContinueOnAddOnLoaded("Blizzard_GuildBankUI", function()
        ns.Hook(GuildBankFrame, "Update", UpdateGuildBank)
    end)
end

--------------------------------------------------------------------------------
-- Merchant: junk sold with Blizzard's "Sell All Junk", then gear repaired
-- with personal gold. The event is registered only while an option is on.
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
    SetupBanks()
    if self.db.itemLevel then UpdateCharSlots() end
    UpdateMerchantEvents()
end

-- Live options.
function Items:OnOptionChanged(key)
    if key == "autoRepair" or key == "autoSellJunk" then
        UpdateMerchantEvents()
    else
        for _, frame in ipairs(containers) do UpdateContainer(frame) end
        UpdateCharSlots()
        UpdateBankPanel()
        UpdateGuildBank()
    end
end
