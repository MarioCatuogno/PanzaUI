--[[----------------------------------------------------------------------------
    PanzaUI - Bags
    Text style, item level on equipment icons, icon zoom.
------------------------------------------------------------------------------]]
local _, ns = ...

local Bags = ns:RegisterModule("Bags", {
    title = "Bags",
    defaults = {
        fontStyle     = true,
        iconZoom      = 5,
        showItemLevel = true,
    },
    options = {
        { header = "Style" },
        { key = "fontStyle",     label = "Outline + Slug text", tooltip = "Apply outline and slug rendering to item counts and item levels. Requires Reload UI." },
        { key = "iconZoom",      label = "Icon zoom",           tooltip = "Crop the edges of bag item icons (percent per side) to hide the built-in border of older icons. 0 = off.",
          slider = { min = 0, max = 15, step = 1, suffix = "%" } },
        { header = "Features" },
        { key = "showItemLevel", label = "Show item level",     tooltip = "Show the item level at the top of equipment icons, colored by item quality." },
    },
})

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
local location = ItemLocation:CreateEmpty()

local function GetItemLevel(bag, slot)
    local itemID = C_Container.GetContainerItemID(bag, slot)
    if not itemID then return end
    local _, _, _, equipLoc, _, classID = C_Item.GetItemInfoInstant(itemID)
    if not EQUIPMENT[classID] or SKIP_SLOTS[equipLoc] then return end

    location:SetBagAndSlot(bag, slot)
    if not C_Item.DoesItemExist(location) then return end
    local ilvl = C_Item.GetCurrentItemLevel(location)
    if not ilvl or ilvl <= 1 then return end
    return ilvl, ITEM_QUALITY_COLORS[C_Item.GetItemQuality(location)]
end

--------------------------------------------------------------------------------
-- Item buttons. Our own data lives in local tables (no fields written on
-- Blizzard buttons: taint-safe).
--------------------------------------------------------------------------------
local ilvlTexts = {} -- button -> FontString
local styled    = {} -- button -> true

local function GetItemLevelText(button)
    local text = ilvlTexts[button]
    if not text then
        text = button:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
        text:SetPoint("TOP", 0, -2)
        if Bags.db.fontStyle then ns.StyleFont(text) end
        ilvlTexts[button] = text
    end
    return text
end

local function UpdateButton(button)
    local db = Bags.db
    ns.ZoomIcon(button.icon or button.Icon, db.iconZoom)

    if db.fontStyle and not styled[button] then
        styled[button] = true
        ns.StyleFont(button.Count)
    end

    local ilvl, color
    if db.showItemLevel then ilvl, color = GetItemLevel(button:GetBagID(), button:GetID()) end
    if ilvl then
        local text = GetItemLevelText(button)
        text:SetText(ilvl)
        if color then text:SetTextColor(color.r, color.g, color.b) else text:SetTextColor(1, 1, 1) end
        text:Show()
    elseif ilvlTexts[button] then
        ilvlTexts[button]:Hide()
    end
end

-- Runs after Blizzard's UpdateItems (bags opened, items changed).
local function UpdateContainer(frame)
    if not frame:IsShown() then return end
    for _, button in frame:EnumerateValidItems() do UpdateButton(button) end
end

local containers = {}

local function UpdateAll()
    for _, frame in ipairs(containers) do UpdateContainer(frame) end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function Bags:OnEnable()
    -- Combined bags + individual bag frames (nil entries skipped).
    local frames = { ContainerFrameCombinedBags }
    for i = 1, NUM_CONTAINER_FRAMES or 13 do frames[i + 1] = _G["ContainerFrame" .. i] end
    for i = 1, (NUM_CONTAINER_FRAMES or 13) + 1 do
        if frames[i] then containers[#containers + 1] = frames[i] end
    end
    for _, frame in ipairs(containers) do
        ns.Hook(frame, "UpdateItems", UpdateContainer)
    end
end

-- Zoom and item level apply live to the open bags.
function Bags:OnOptionChanged()
    UpdateAll()
end
