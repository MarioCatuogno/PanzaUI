--[[----------------------------------------------------------------------------
    PanzaUI - Combat
    Personal Resource Display: text style, centered text, percentage-only
    health/power text (always shown, like Player/Target, regardless of the
    Edit Mode "Show Bar Text" setting).
    Cooldown Manager: action bar style for the icons of every viewer, dynamic
    layout for tracked buffs (centered) and tracked bars (bottom-up).
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
        cdmIconStyle  = true,
        cdmDynamic    = true,
        dmIconStyle   = true,
        dmFontStyle   = true,
    },
    options = {
        { header = "Personal Resource Display" },
        { key = "fontStyle",    label = "Outline + Slug text",  tooltip = "Apply outline and slug rendering to the bar text. Requires Reload UI." },
        { key = "centerText",   label = "Center text",          tooltip = "Center the text on the bars. Requires Reload UI." },
        { key = "percentText",  label = "Percentage-only text", tooltip = "Always show health and power as a plain percentage (no % symbol), like the Player and Target frames. Requires Reload UI." },
        { header = "Cooldown Manager" },
        { key = "cdmIconStyle", label = "Action bar style",     tooltip = "Give the Cooldown Manager icons (Essential, Utility, tracked buffs and buff bars) the same rounded frame as action buttons. Requires Reload UI." },
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

    -- Alternate power (stagger, ebon might, ...) keeps Blizzard's own text.
    if db.percentText then
        ns.PercentText(health, false, "player")
        ns.PercentText(power,  true,  "player")
    end
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

local function StyleViewer(viewer)
    if viewer.GetItemFrames then
        for _, item in ipairs(viewer:GetItemFrames()) do StyleItem(item) end
    end
end

local function SetupCooldownManager()
    for _, name in ipairs(VIEWERS) do
        local viewer = _G[name]
        if viewer then
            StyleViewer(viewer)
            ns.Hook(viewer, "OnAcquireItemFrame", function(_, item) StyleItem(item) end)
            ns.Hook(viewer, "RefreshLayout", StyleViewer)
        end
    end
end

--------------------------------------------------------------------------------
-- Dynamic layout for tracked buffs and bars. Blizzard gives every item a fixed
-- slot and only hides the inactive ones; the shown items are re-anchored with
-- no gaps: icons centered on the viewer, bars stacked from its bottom.
-- Zero garbage: items are cached once when acquired (GetItemFrames builds a
-- new table on every call), show/hide only flags the viewer, and one hidden
-- driver frame does the work on the next frame, then sleeps again.
-- Widget calls only (SetPoint), no Blizzard fields written.
--------------------------------------------------------------------------------
local DYNAMIC = { BuffIconCooldownViewer = "CENTER", BuffBarCooldownViewer = "BOTTOM" }
local anchors, items, known, dirty, shown = {}, {}, {}, {}, {} -- anchors: viewer -> point
local driver = CreateFrame("Frame")
driver:Hide()

local function ByLayoutIndex(a, b) return (a.layoutIndex or 0) < (b.layoutIndex or 0) end

-- Midnight: in combat the geometry of these items can be secret (it can't be
-- compared or used in math), so sizes come from the last readable value.
local IsSecret, itemSize = ns.IsSecret, {}
local function Readable(value, fallback)
    if value == nil or IsSecret(value) then return fallback end
    return value
end

local function Reflow(viewer, anchor)
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
    local first = shown[1]
    local size -- no and/or here: a secret value can't be tested for truthiness
    if vertical then size = first:GetHeight() else size = first:GetWidth() end
    size = Readable(size, itemSize[viewer] or 40)
    itemSize[viewer] = size
    local scale = Readable(first:GetScale(), 1)
    local pad  = Readable((vertical and viewer.childYPadding or viewer.childXPadding), 0) / scale
    local step = size + pad
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

driver:SetScript("OnUpdate", function(self)
    self:Hide()
    for viewer, anchor in pairs(anchors) do
        if dirty[viewer] then
            dirty[viewer] = nil
            Reflow(viewer, anchor)
        end
    end
end)

local function SetupDynamicLayout()
    for name, anchor in pairs(DYNAMIC) do
        local viewer = _G[name]
        if viewer then
            anchors[viewer], items[viewer] = anchor, {}
            local function Queue() dirty[viewer] = true; driver:Show() end
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
            local function Repack() Reflow(viewer, anchor) end
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
-- Damage Meter icons. Entries come from the scroll boxes of each session
-- window and of its source (spell breakdown) window: every scroll box gets
-- one initialized-frame callback (existing entries included), windows made
-- later are caught by hooking SetupSessionWindow. Each entry is styled once:
-- icon frame (follows Blizzard's "show bar icons" setting) and/or outlined
-- text (re-applied when Blizzard changes the bar style or text scale).
-- Widget calls only, no Blizzard fields written.
--------------------------------------------------------------------------------
local styledEntries, hookedBoxes = {}, {}

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

local function StyleEntry(entry)
    if not entry or styledEntries[entry] then return end
    styledEntries[entry] = true
    if CB.db.dmIconStyle then StyleEntryIcon(entry) end
    if CB.db.dmFontStyle then StyleEntryText(entry) end
end

local function OnEntryInitialized(_, entry) StyleEntry(entry) end

local function HookScrollBox(box)
    if not box or hookedBoxes[box] then return end
    hookedBoxes[box] = true
    -- Acquired runs before Blizzard fills the entry (before any secret text).
    ScrollUtil.AddAcquiredFrameCallback(box, OnEntryInitialized, CB, true)
    ScrollUtil.AddInitializedFrameCallback(box, OnEntryInitialized, CB, true)
end

local function HookSource(window)
    local source = window.GetSourceWindow and window:GetSourceWindow()
    if source and source.GetScrollBox then HookScrollBox(source:GetScrollBox()) end
end

local function HookWindow(window)
    if not window or hookedBoxes[window] then return end
    hookedBoxes[window] = true
    if window.GetScrollBox then HookScrollBox(window:GetScrollBox()) end
    HookSource(window)
    ns.Hook(window, "ShowSourceWindow", HookSource) -- in case it is made on demand
end

local function SetupDamageMeter()
    if not ScrollUtil then return end
    for i = 1, 10 do HookWindow(_G["DamageMeterSessionWindow" .. i]) end
    ns.Hook(DamageMeter, "SetupSessionWindow", function(_, index)
        HookWindow(_G["DamageMeterSessionWindow" .. tostring(index)])
    end)
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function CB:OnEnable()
    local db = self.db
    if db.fontStyle or db.centerText or db.percentText then
        if PersonalResourceDisplayFrame then
            SetupPRD(db)
        else
            EventUtil.ContinueOnAddOnLoaded("Blizzard_PersonalResourceDisplay", function() SetupPRD(db) end)
        end
    end
    if db.cdmIconStyle then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_CooldownViewer", SetupCooldownManager)
    end
    if db.cdmDynamic then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_CooldownViewer", SetupDynamicLayout)
    end
    if db.dmIconStyle or db.dmFontStyle then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_DamageMeter", SetupDamageMeter)
    end
end
