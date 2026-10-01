--[[----------------------------------------------------------------------------
    PanzaUI - Combat
    Personal Resource Display: text style, centered text, percentage-only
    health/power text (always shown, like Player/Target, regardless of the
    Edit Mode "Show Bar Text" setting); alternate power bar text (stagger,
    ebon might, mana in forms...) always shown too.
    Cooldown Manager: action bar style for the icons of every viewer, outlined
    text, dynamic layout for tracked buffs (centered) and tracked bars
    (bottom-up).
    Damage Meter: action bar style for the class/spec and spell icons,
    outlined text on the bars.
------------------------------------------------------------------------------]]
local _, ns = ...

-- Module key kept from the old "Personal Resource Display" module, so saved
-- settings stay.
local CB = ns:RegisterModule("PersonalResource", {
    title = "Combat",
    defaults = {
        fontStyle     = true,
        centerText    = true,
        percentText   = true,
        altText       = true,
        cdmIconStyle  = true,
        cdmFontStyle  = true,
        cdmDynamic    = true,
        dmIconStyle   = true,
        dmFontStyle   = true,
    },
    options = {
        { header = "Personal Resource Display" },
        { key = "fontStyle",    label = "Outline + Slug text",  tooltip = "Apply outline and slug rendering to the bar text. Requires Reload UI." },
        { key = "centerText",   label = "Center text",          tooltip = "Center the text on the bars. Requires Reload UI." },
        { key = "percentText",  label = "Percentage-only text", tooltip = "Always show health and power as a plain percentage (no % symbol), with one decimal below 100, like the Player and Target frames. Hidden at 0. Requires Reload UI." },
        { key = "altText",      label = "Always show alternate bar text", tooltip = "Always show the value on the alternate power bar (e.g. Monk Stagger, Evoker Ebon Might, mana in shapeshift forms), not only on mouseover. Class resources shown as icons (chi, shards...) have no text. Requires Reload UI." },
        { header = "Cooldown Manager" },
        { key = "cdmIconStyle", label = "Action bar style",     tooltip = "Give the Cooldown Manager icons (Essential, Utility, tracked buffs and buff bars) the same rounded frame as action buttons. Requires Reload UI." },
        { key = "cdmFontStyle", label = "Outline + Slug text",  tooltip = "Apply outline and slug rendering to the Cooldown Manager texts: tracked bar names and durations, stacks, charges and cooldown numbers. Requires Reload UI." },
        { key = "cdmDynamic",   label = "Dynamic buff layout",  tooltip = "Keep tracked buffs and tracked bars packed with no gaps: buff icons grow from the center, buff bars grow from the bottom up. Requires Reload UI." },
        { header = "Damage Meter" },
        { key = "dmIconStyle",  label = "Action bar style",     tooltip = "Give the Damage Meter icons (class/spec and spells) the same rounded frame as action buttons. Requires Reload UI." },
        { key = "dmFontStyle",  label = "Outline + Slug text",  tooltip = "Apply outline and slug rendering to the names and values on the Damage Meter bars. Requires Reload UI." },
    },
})

--------------------------------------------------------------------------------
-- Personal Resource Display
--------------------------------------------------------------------------------
local function SetupPRD(db)
    local frame = PersonalResourceDisplayFrame
    if not frame then return end

    local container = frame.HealthBarsContainer
    local health    = container and (container.healthBar or container.HealthBar)
    local power     = frame.PowerBar
    local bars      = { health, power, frame.AlternatePowerBar }

    for i = 1, 3 do
        local bar = bars[i]
        if bar then
            if db.fontStyle then ns.StyleBarText(bar) end
            if db.centerText and bar.TextString then
                bar.TextString:ClearAllPoints()
                bar.TextString:SetPoint("CENTER")
                bar.TextString:SetJustifyH("CENTER")
            end
        end
    end

    -- Alternate power (stagger, ebon might, ...) keeps Blizzard's own value.
    if db.percentText then
        ns.PercentText(health, false, "player")
        ns.PercentText(power,  true,  "player")
    end
end

-- Alternate power bar text always shown. Blizzard shows it only on mouseover
-- (or with the Edit Mode "Show Bar Text" setting) and clears it otherwise:
-- right after its update, a hidden text is filled with the bar value and
-- shown. Secret values go straight to the text (C formatting), readable ones
-- get Blizzard's number format. The class mixin is applied to the bar later
-- (SetupAlternatePowerBar), so the hook is (re)checked after it.
local altHooked = {}

local function ShowAltText(bar)
    local text = bar.TextString
    if not text or text:IsShown() then return end -- Blizzard already shows it
    local value = bar:GetValue()
    if ns.IsSecret(value) then
        text:SetFormattedText("%.0f", value)
    else
        text:SetText(BreakUpLargeNumbers(floor(value + 0.5)))
    end
    text:Show()
end

local function HookAltBar(frame)
    local bar = frame.AlternatePowerBar
    if not bar or altHooked[bar] == bar.UpdateTextString then return end
    ns.Hook(bar, "UpdateTextString", ShowAltText)
    altHooked[bar] = bar.UpdateTextString -- the hooked function
    if bar:IsShown() then ShowAltText(bar) end
end

local function SetupAltText()
    local frame = PersonalResourceDisplayFrame
    if not frame then return end
    HookAltBar(frame)
    ns.Hook(frame, "SetupAlternatePowerBar", HookAltBar)
end

--------------------------------------------------------------------------------
-- Cooldown Manager icons. Items come from a pool per viewer: styled once when
-- acquired (and the ones already there). Blizzard's own square icon overlay
-- is hidden so only the action bar frame shows. Widget calls only.
--------------------------------------------------------------------------------
local VIEWERS = { "EssentialCooldownViewer", "UtilityCooldownViewer", "BuffIconCooldownViewer", "BuffBarCooldownViewer" }
local styledItems = {}

local function StyleItem(item)
    if not item or styledItems[item] then return end
    -- Icon viewers: item.Icon is the texture. Bar viewer: item.Icon is a frame.
    local holder, icon = item, item.Icon
    if icon and not icon.AddMaskTexture then holder, icon = icon, icon.Icon end
    if not (icon and icon.AddMaskTexture) then return end
    styledItems[item] = true

    for _, region in ipairs({ holder:GetRegions() }) do
        local atlas = region.GetAtlas and region:GetAtlas()
        if atlas and atlas:find("IconOverlay", 1, true) then region:SetAlpha(0) end
    end
    ns.StyleIcon(icon, holder)
end

-- Texts (bar name/duration, stacks, charges, cooldown numbers): every font
-- string of the item and of its children (two levels: bar, icon, cooldown),
-- found by type rather than by name. Styled once per item. Varargs, no tables.
local styledTexts = {}
local StyleFonts

local function StyleRegions(...)
    for i = 1, select("#", ...) do
        local region = select(i, ...)
        if region:GetObjectType() == "FontString" then ns.StyleFont(region) end
    end
end

local function StyleChildren(depth, ...)
    for i = 1, select("#", ...) do StyleFonts(select(i, ...), depth) end
end

function StyleFonts(frame, depth)
    StyleRegions(frame:GetRegions())
    if depth < 2 then StyleChildren(depth + 1, frame:GetChildren()) end
end

local function StyleItemText(item)
    if not item or styledTexts[item] then return end
    styledTexts[item] = true
    StyleFonts(item, 0)
end

-- Runs func on every item of every viewer: the ones already there, newly
-- acquired ones and after each layout refresh (func skips items already done).
local function ForEachCooldownItem(func)
    local function All(viewer)
        if viewer.GetItemFrames then
            for _, item in ipairs(viewer:GetItemFrames()) do func(item) end
        end
    end
    for _, name in ipairs(VIEWERS) do
        local viewer = _G[name]
        if viewer then
            All(viewer)
            ns.Hook(viewer, "OnAcquireItemFrame", function(_, item) func(item) end)
            ns.Hook(viewer, "RefreshLayout", All)
        end
    end
end

--------------------------------------------------------------------------------
-- Dynamic layout for tracked buffs and bars. Blizzard gives every item a fixed
-- slot and only hides the inactive ones; the shown items are re-anchored with
-- no gaps: icons centered on the viewer, bars stacked from its bottom.
-- Zero garbage: items are cached once when acquired (GetItemFrames builds a
-- new table on every call), show/hide only asks for one reflow on the next
-- frame (ns.Defer). Item size and scale are measured after Blizzard's layout
-- (settings change) and reused for every show/hide.
-- Widget calls only (SetPoint), no Blizzard fields written.
--------------------------------------------------------------------------------
local DYNAMIC = { BuffIconCooldownViewer = "CENTER", BuffBarCooldownViewer = "BOTTOM" }
local items, known, shown = {}, {}, {}
local itemSize, itemScale = {}, {} -- viewer -> last readable size / scale

local function ByLayoutIndex(a, b) return (a.layoutIndex or 0) < (b.layoutIndex or 0) end

-- Midnight: in combat the geometry of these items can be secret (it can't be
-- compared or used in math), so the last readable value is kept.
local IsSecret = ns.IsSecret
local function Readable(value, fallback)
    if value == nil or IsSecret(value) then return fallback end
    return value
end

local function Reflow(viewer, anchor, measure)
    local n = 0
    for _, item in ipairs(items[viewer]) do
        if item:IsShown() then n = n + 1; shown[n] = item end
    end
    for i = #shown, n + 1, -1 do shown[i] = nil end
    if n == 0 then return end
    if n > 1 then table.sort(shown, ByLayoutIndex) end

    local vertical = anchor == "BOTTOM" or viewer.isHorizontal == false
    -- Offsets are in the item's own scale (Icon Size), Blizzard's padding is
    -- in the viewer's: convert it, so spacing matches Blizzard's exactly.
    -- Only readable values are cached: while unknown, it is read again.
    if measure or not itemSize[viewer] then
        local first, size = shown[1], nil -- no and/or: a secret can't be tested
        if vertical then size = first:GetHeight() else size = first:GetWidth() end
        itemSize[viewer]  = Readable(size, itemSize[viewer])
        itemScale[viewer] = Readable(first:GetScale(), itemScale[viewer])
    end
    local scale = itemScale[viewer] or 1
    local pad  = Readable((vertical and viewer.childYPadding or viewer.childXPadding), 0) / scale
    local step = (itemSize[viewer] or 40) + pad
    local start = anchor == "BOTTOM" and 0 or -(n - 1) * step / 2

    for i = 1, n do
        local offset = start + (i - 1) * step
        local item = shown[i]
        item:ClearAllPoints()
        if vertical then
            item:SetPoint(anchor, viewer, anchor, 0, offset)
        else
            item:SetPoint(anchor, viewer, anchor, offset, 0)
        end
    end
end

local function SetupDynamicLayout()
    for name, anchor in pairs(DYNAMIC) do
        local viewer = _G[name]
        if viewer then
            items[viewer] = {}
            local function Run() Reflow(viewer, anchor) end
            local function Queue() ns.Defer(Run) end
            local function AddItem(item)
                if not item or known[item] then return end
                known[item] = true
                local list = items[viewer]
                list[#list + 1] = item
                item:HookScript("OnShow", Queue)
                item:HookScript("OnHide", Queue)
            end
            -- Items already there, hidden ones included (one-time scan).
            local container = viewer.GetItemContainerFrame and viewer:GetItemContainerFrame()
            if container then
                for _, child in ipairs({ container:GetChildren() }) do
                    if child.SetHideWhenInactive then AddItem(child) end
                end
            end
            ns.Hook(viewer, "OnAcquireItemFrame", function(_, item) AddItem(item); Queue() end)
            -- Blizzard's grid layout just put every item back in its fixed
            -- slot (the viewer is its own layout container): re-pack at once,
            -- whatever triggered it (RefreshLayout, Edit Mode, settings).
            local function Repack() Reflow(viewer, anchor, true) end
            if viewer.Layout then
                ns.Hook(viewer, "Layout", Repack)
            else
                ns.Hook(viewer, "RefreshLayout", Repack)
            end
            Queue()
        end
    end
end

--------------------------------------------------------------------------------
-- Damage Meter: each entry (session and spell breakdown windows, from the
-- shared registry in core.lua) is styled once: icon frame (follows
-- Blizzard's "show bar icons" setting) and/or outlined text.
-- Widget calls only, no Blizzard fields written.
--------------------------------------------------------------------------------
local function StyleEntryIcon(entry)
    local holder = entry.Icon
    local icon = holder and holder.Icon
    if not (icon and icon.AddMaskTexture) then return end

    local border = ns.StyleIcon(icon, holder)
    local function SyncBorder() border:SetShown(icon:IsShown()) end
    SyncBorder()
    ns.Hook(entry, "SetShowBarIcons", SyncBorder)
    ns.Hook(entry, "SetupSharedStyleIconVisibility", SyncBorder)
end

-- Entry texts are secret in combat (their font can't be read back), so they
-- get an outlined copy of their template font (NumberFontNormal) directly.
-- Text scale is a separate property and stays Blizzard's.
local function StyleEntryText(entry)
    local bar = entry.StatusBar
    local font = ns.OutlinedFont(NumberFontNormal)
    if not (bar and font) then return end
    if bar.Name  then bar.Name:SetFontObject(font)  end
    if bar.Value then bar.Value:SetFontObject(font) end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function CB:OnEnable()
    local db = self.db
    if db.fontStyle or db.centerText or db.percentText or db.altText then
        if PersonalResourceDisplayFrame then
            SetupPRD(db)
            if db.altText then SetupAltText() end
        else
            EventUtil.ContinueOnAddOnLoaded("Blizzard_PersonalResourceDisplay", function()
                SetupPRD(db)
                if db.altText then SetupAltText() end
            end)
        end
    end
    if db.cdmIconStyle then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_CooldownViewer", function() ForEachCooldownItem(StyleItem) end)
    end
    if db.cdmFontStyle then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_CooldownViewer", function() ForEachCooldownItem(StyleItemText) end)
    end
    if db.cdmDynamic then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_CooldownViewer", SetupDynamicLayout)
    end
    if db.dmIconStyle then ns.OnDamageMeterEntry(StyleEntryIcon) end
    if db.dmFontStyle then ns.OnDamageMeterEntry(StyleEntryText) end
end
