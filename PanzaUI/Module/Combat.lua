--[[----------------------------------------------------------------------------
    PanzaUI - Combat
    Buffs & Debuffs, cast bars, Cooldown Manager, Damage Meter and Personal
    Resource Display.
------------------------------------------------------------------------------]]
local _, ns = ...
local IsSecret = ns.IsSecret

-- Saved variables key of the old Personal Resource Display module.
local CB = ns:RegisterModule("PersonalResource", {
    title = "Combat",
    defaults = {
        auraStyle    = true,
        auraIconZoom = 5,
        castStyle    = true,
        cdmStyle     = true,
        cdmDynamic   = true,
        dmStyle      = true,
        prdStyle     = true,
    },
    options = {
        { header = "Buffs & Debuffs" },
        { key = "auraStyle", label = "Refined style", reload = true,
          tooltip = "Polish the look of the buff and debuff icons." },
        { key = "auraIconZoom", label = "Icon zoom",
          tooltip = "Crop the edges of the buff and debuff icons.",
          slider = { min = 0, max = 15, step = 1, suffix = "%" } },
        { header = "Cast Bar" },
        { key = "castStyle", label = "Refined style", reload = true,
          tooltip = "Polish the look of the cast bars.",
          bullets = { "Cast time on the bar" } },
        { header = "Cooldown Manager" },
        { key = "cdmStyle", label = "Refined style", reload = true,
          tooltip = "Polish the look of the Cooldown Manager." },
        { key = "cdmDynamic", label = "Dynamic layout", reload = true,
          tooltip = "Keep tracked buffs and bars together, with no gaps." },
        { header = "Damage Meter" },
        { key = "dmStyle", label = "Refined style", reload = true,
          tooltip = "Polish the look of the Damage Meter." },
        { header = "Personal Resource Display" },
        { key = "prdStyle", label = "Refined style", reload = true,
          tooltip = "Polish the look of the Personal Resource Display.",
          bullets = { "Health and power as a percentage", "Hidden while casting" } },
    },
})

-- Converts the saved values of older versions.
function CB:Migrate(db, saved)
    ns.MergeOptions(db, "auraStyle", saved.Auras, "style")
    ns.MergeOptions(db, "auraIconZoom", saved.Auras, "iconZoom")
    ns.MergeOptions(db, "auraStyle", saved.Miscellaneous, "auraIconStyle", "auraFontStyle")
    ns.MergeOptions(db, "auraIconZoom", saved.Miscellaneous, "auraIconZoom")
    ns.MergeOptions(db, "prdStyle", db, "fontStyle", "centerText", "percentText", "altText")
    ns.MergeOptions(db, "cdmStyle", db, "cdmIconStyle", "cdmFontStyle")
    ns.MergeOptions(db, "dmStyle", db, "dmIconStyle", "dmFontStyle")
end

--------------------------------------------------------------------------------
-- Buffs & Debuffs: aura buttons are created once at load and styled once.
--------------------------------------------------------------------------------
local AURA_CONTAINERS = { "BuffFrame", "DebuffFrame" }

local function ForEachAuraButton(func)
    for _, name in ipairs(AURA_CONTAINERS) do
        local buttons = _G[name] and _G[name].auraFrames
        if buttons then
            for _, button in ipairs(buttons) do
                -- Private-aura anchors have no icon texture.
                local icon = button.Icon
                if not button.isAuraAnchor and icon and icon.AddMaskTexture then func(button, icon) end
            end
        end
    end
end

local function ZoomAuraIcon(_, icon)
    ns.ZoomIcon(icon, CB.db.auraIconZoom)
end

local function StyleAuraButton(button, icon)
    ns.StyleIcon(icon, button)
end

-- Loss of control alert (eg. "Rooted"): its icon and cooldown swipe.
local function StyleLossOfControl()
    local frame = LossOfControlFrame
    if not (frame and frame.Icon) then return end
    ns.StyleIcon(frame.Icon, frame)
    ns.RoundSwipe(frame.Cooldown)
end

local function StyleAuraText(button)
    ns.StyleFont(button.Count)
    ns.StyleFont(button.Duration)
end

--------------------------------------------------------------------------------
-- Cast bars: no fade out, the bar hides as soon as the cast ends.
--------------------------------------------------------------------------------
local FADE_ANIMS = { "FadeOutAnim", "HoldFadeOutAnim" }

local function InstantAnims(...)
    for i = 1, select("#", ...) do
        local anim = select(i, ...)
        anim:SetStartDelay(0)
        anim:SetDuration(0)
    end
end

-- Elapsed cast time in the center of the bar (10 updates per second).
local CAST_TICK = 0.1

local function SetupCastTimer(bar)
    local text = bar:CreateFontString(nil, "OVERLAY")
    text:SetFontObject(ns.textStyle and ns.OutlinedFont(GameFontHighlightSmall) or GameFontHighlightSmall)
    text:SetPoint("CENTER")

    local driver, tick = CreateFrame("Frame", nil, bar), 0
    driver:SetScript("OnUpdate", function(_, elapsed)
        tick = tick + elapsed
        if tick < CAST_TICK then return end
        tick = 0
        local value = bar:GetValue()
        if bar.channeling and not IsSecret(value) then
            local _, max = bar:GetMinMaxValues()
            if not IsSecret(max) then value = max - value end
        end
        text:SetFormattedText("%.1f", value)
    end)
end

-- Text style for the spell name.
local function StyleCastText(bar)
    ns.StyleFont(bar.Text)
end

local function SetupCastBar(bar)
    for _, key in ipairs(FADE_ANIMS) do
        local group = bar[key]
        if group and group.GetAnimations then InstantAnims(group:GetAnimations()) end
    end
    SetupCastTimer(bar)
end

--------------------------------------------------------------------------------
-- Personal Resource Display
--------------------------------------------------------------------------------
local function PRDBars()
    local frame = PersonalResourceDisplayFrame
    local container = frame.HealthBarsContainer
    return container and (container.healthBar or container.HealthBar), frame.PowerBar, frame.AlternatePowerBar
end

-- Text style, before the percentage text.
local function StylePRDText()
    local health, power, alt = PRDBars()
    ns.StyleBarText(health)
    ns.StyleBarText(power)
    ns.StyleBarText(alt)
end

local function CenterText(bar)
    local text = bar and bar.TextString
    if not text then return end
    text:ClearAllPoints()
    text:SetPoint("CENTER")
    text:SetJustifyH("CENTER")
end

local function SetupPRD()
    local health, power, alt = PRDBars()
    CenterText(health)
    CenterText(power)
    CenterText(alt)

    -- Alternate power keeps Blizzard's own value.
    ns.PercentText(health, false, "player")
    ns.PercentText(power,  true,  "player")
end

-- Alternate power value always shown, in Blizzard's number format.
local altHooked = {}

local function ShowAltText(bar)
    local text = bar.TextString
    if not text or text:IsShown() then return end
    local value = bar:GetValue()
    if IsSecret(value) then
        text:SetFormattedText("%.0f", value)
    else
        local n, sep = floor(value + 0.5), LARGE_NUMBER_SEPERATOR or ","
        if n < 1000 then
            text:SetFormattedText("%d", n)
        elseif n < 1000000 then
            text:SetFormattedText("%d%s%03d", floor(n / 1000), sep, n % 1000)
        else
            text:SetFormattedText("%d%s%03d%s%03d", floor(n / 1000000), sep, floor(n / 1000) % 1000, sep, n % 1000)
        end
    end
    text:Show()
end

local function HookAltBar(frame)
    local bar = frame.AlternatePowerBar
    if not bar or altHooked[bar] == bar.UpdateTextString then return end
    ns.Hook(bar, "UpdateTextString", ShowAltText)
    altHooked[bar] = bar.UpdateTextString
    if bar:IsShown() then ShowAltText(bar) end
end

local function SetupAltText()
    local frame = PersonalResourceDisplayFrame
    if not frame then return end
    HookAltBar(frame)
    ns.Hook(frame, "SetupAlternatePowerBar", HookAltBar)
end

-- Hidden while the player casts (alpha, allowed in combat).
local CAST_START = {
    UNIT_SPELLCAST_START = true, UNIT_SPELLCAST_CHANNEL_START = true, UNIT_SPELLCAST_EMPOWER_START = true,
}
local CAST_EVENTS = {
    "UNIT_SPELLCAST_START", "UNIT_SPELLCAST_CHANNEL_START", "UNIT_SPELLCAST_EMPOWER_START",
    "UNIT_SPELLCAST_STOP", "UNIT_SPELLCAST_CHANNEL_STOP", "UNIT_SPELLCAST_EMPOWER_STOP",
    "UNIT_SPELLCAST_FAILED", "UNIT_SPELLCAST_INTERRUPTED",
}
local castEvents = CreateFrame("Frame")
local castHidden, hiddenAlpha = false, 1 -- alpha before the cast

local function IsCasting()
    local cast = UnitCastingInfo("player")
    if IsSecret(cast) or cast then return true end
    local channel = UnitChannelInfo("player")
    return IsSecret(channel) or channel ~= nil
end

castEvents:SetScript("OnEvent", function(_, event)
    local frame = PersonalResourceDisplayFrame
    if CAST_START[event] or IsCasting() then
        if not castHidden then
            castHidden, hiddenAlpha = true, frame:GetAlpha()
            frame:SetAlpha(0)
        end
    elseif castHidden then
        castHidden = false
        frame:SetAlpha(hiddenAlpha)
    end
end)

local function SetupCastHide()
    if not PersonalResourceDisplayFrame then return end
    for _, event in ipairs(CAST_EVENTS) do castEvents:RegisterUnitEvent(event, "player") end
end

--------------------------------------------------------------------------------
-- Cooldown Manager icons: action button frame, once per item.
--------------------------------------------------------------------------------
local styledItems = {}

-- Items of the tracked bars viewer (a few parents up).
local function IsBarItem(item)
    local viewer, parent = BuffBarCooldownViewer, item:GetParent()
    for _ = 1, 3 do
        if not parent then return false end
        if parent == viewer then return true end
        parent = parent:GetParent()
    end
    return false
end

local function StyleItem(item)
    if not item or styledItems[item] then return end
    -- Icon viewers: item.Icon is a texture, bar viewer: a frame.
    local holder, icon = item, item.Icon
    if icon and not icon.AddMaskTexture then holder, icon = icon, icon.Icon end
    if not (icon and icon.AddMaskTexture) then return end
    styledItems[item] = true

    for _, region in ipairs({ holder:GetRegions() }) do
        local atlas = region.GetAtlas and region:GetAtlas()
        if not IsSecret(atlas) and atlas and atlas:find("IconOverlay", 1, true) then region:SetAlpha(0) end
    end
    -- Tracked bars: Blizzard's own icon masks, also added later, would shrink
    -- the icon, so only ours is kept.
    local isBar = IsBarItem(item)
    local _, ours = ns.StyleIcon(icon, holder)
    if ours and isBar and icon.GetNumMaskTextures then
        for i = icon:GetNumMaskTextures(), 1, -1 do
            local mask = icon:GetMaskTexture(i)
            if mask and mask ~= ours then icon:RemoveMaskTexture(mask) end
        end
        hooksecurefunc(icon, "AddMaskTexture", function(self, mask)
            if mask ~= ours then self:RemoveMaskTexture(mask) end
        end)
    end
end

-- Text style for every font string of the item.
local styledTexts = {}

local function StyleItemText(item)
    if not item or styledTexts[item] then return end
    styledTexts[item] = true
    ns.StyleAllFonts(item, 2)
end

--------------------------------------------------------------------------------
-- Dynamic layout: buff icons centered and bars stacked with no gaps.
--------------------------------------------------------------------------------
local DYNAMIC = { BuffIconCooldownViewer = "CENTER", BuffBarCooldownViewer = "BOTTOM" }
local items, known, shown = {}, {}, {}
local itemSize, itemScale = {}, {}

local function ByLayoutIndex(a, b) return (a.layoutIndex or 0) < (b.layoutIndex or 0) end

-- Midnight: secret geometry keeps the last readable value.
local function Readable(value, fallback)
    if IsSecret(value) or value == nil then return fallback end
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
    -- Blizzard's padding is converted to the item's scale.
    if measure or not itemSize[viewer] then
        local first, size = shown[1], nil -- no and/or: secrets can't be tested
        if vertical then size = first:GetHeight() else size = first:GetWidth() end
        itemSize[viewer]  = Readable(size, itemSize[viewer])
        itemScale[viewer] = Readable(first:GetScale(), itemScale[viewer])
    end
    local scale = itemScale[viewer] or 1
    local padding
    if vertical then padding = viewer.childYPadding else padding = viewer.childXPadding end
    local pad  = Readable(padding, 0) / scale
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
            -- Items already there.
            local container = viewer.GetItemContainerFrame and viewer:GetItemContainerFrame()
            if container then
                for _, child in ipairs({ container:GetChildren() }) do
                    if child.SetHideWhenInactive then AddItem(child) end
                end
            end
            ns.Hook(viewer, "OnAcquireItemFrame", function(_, item) AddItem(item); Queue() end)
            -- Re-pack after each Blizzard layout.
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
-- Damage Meter: icon frame and text style, once per entry and window.
--------------------------------------------------------------------------------
local function StyleEntryIcon(entry)
    local holder = entry.Icon
    local icon = holder and holder.Icon
    if not (icon and icon.AddMaskTexture) then return end

    local border = ns.StyleIcon(icon, holder)
    if not border then return end
    local function SyncBorder() border:SetShown(icon:IsShown()) end
    SyncBorder()
    ns.Hook(entry, "SetShowBarIcons", SyncBorder)
    ns.Hook(entry, "SetupSharedStyleIconVisibility", SyncBorder)
end

-- Entry texts use an outlined NumberFontNormal (their values can be secret).
local function StyleEntryText(entry)
    local bar = entry.StatusBar
    local font = ns.OutlinedFont(NumberFontNormal)
    if not (bar and font) then return end
    if bar.Name  then bar.Name:SetFontObject(font)  end
    if bar.Value then bar.Value:SetFontObject(font) end
end

-- Pinned player row: Blizzard keeps your row on the edge of the list when it
-- is scrolled out of view, over the other rows; it stays hidden instead.
local function HideLocalPlayerEntry(window)
    local entry = window:GetLocalPlayerEntry()
    if entry then entry:Hide() end
end

local function HidePinnedPlayer(window)
    if not window.GetLocalPlayerEntry then return end
    HideLocalPlayerEntry(window)
    ns.Hook(window, "ShowLocalPlayerEntry", HideLocalPlayerEntry)
end

-- Window texts (title, buttons).
local function StyleWindowText(window)
    ns.StyleAllFonts(window, 2)
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function CB:OnEnable()
    local db = self.db
    EventUtil.ContinueOnAddOnLoaded("Blizzard_BuffFrame", function()
        if db.auraStyle then ForEachAuraButton(StyleAuraButton) end
        if ns.textStyle then ForEachAuraButton(StyleAuraText) end
        ForEachAuraButton(ZoomAuraIcon)
    end)
    if db.auraStyle then StyleLossOfControl() end
    if db.castStyle then ns.ForEachCastBar(SetupCastBar) end
    if ns.textStyle then ns.ForEachCastBar(StyleCastText) end
    if db.prdStyle or ns.textStyle then
        local function Setup()
            if not PersonalResourceDisplayFrame then return end
            if ns.textStyle then StylePRDText() end
            if db.prdStyle then
                SetupPRD()
                SetupAltText()
                SetupCastHide()
            end
        end
        if PersonalResourceDisplayFrame then
            Setup()
        else
            EventUtil.ContinueOnAddOnLoaded("Blizzard_PersonalResourceDisplay", Setup)
        end
    end
    if db.cdmStyle then ns.OnCooldownItem(StyleItem) end
    if ns.textStyle then ns.OnCooldownItem(StyleItemText) end
    if db.cdmDynamic then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_CooldownViewer", SetupDynamicLayout)
    end
    if db.dmStyle then
        ns.OnDamageMeterEntry(StyleEntryIcon)
        ns.OnDamageMeterWindow(HidePinnedPlayer)
    end
    if ns.textStyle then
        ns.OnDamageMeterEntry(StyleEntryText)
        ns.OnDamageMeterWindow(StyleWindowText)
    end
end

-- Live options.
function CB:OnOptionChanged(key)
    if key == "auraIconZoom" then ForEachAuraButton(ZoomAuraIcon) end
end
