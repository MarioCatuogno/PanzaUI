--[[----------------------------------------------------------------------------
    PanzaUI - Combat
    Buffs & Debuffs: refined style (rounded icon borders) and icon zoom of
    the player's auras.
    Cast Bar: refined style for the Player, Target, Focus and Boss cast bars
    (elapsed time in the center, hidden right when the cast ends).
    Cooldown Manager: refined style (rounded icon borders), dynamic layout of
    tracked buffs (centered) and bars (bottom-up).
    Damage Meter: refined style (rounded icon borders).
    Personal Resource Display: refined style (centered text, health and power
    as a percentage, alternate bar value always shown, hidden while the
    player casts).
    Every section also follows the shared text style (General > Style).
------------------------------------------------------------------------------]]
local _, ns = ...

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
          tooltip = "Polish the look of buff and debuff icons.",
          bullets = { "Rounded icon borders" } },
        { key = "auraIconZoom", label = "Icon zoom",
          tooltip = "Crop the edges of buff and debuff icons. 0 = off.",
          slider = { min = 0, max = 15, step = 1, suffix = "%" } },
        { header = "Cast Bar" },
        { key = "castStyle", label = "Refined style", reload = true,
          tooltip = "Polish the look of the Player, Target, Focus and Boss cast bars.",
          bullets = { "Elapsed cast time in the center", "Hidden right when the cast ends (no fade out)" } },
        { header = "Cooldown Manager" },
        { key = "cdmStyle", label = "Refined style", reload = true,
          tooltip = "Polish the look of the Cooldown Manager.",
          bullets = { "Rounded icon borders" } },
        { key = "cdmDynamic", label = "Dynamic layout", reload = true,
          tooltip = "Keep tracked buffs and bars packed with no gaps.",
          bullets = { "Buff icons grow from the center", "Buff bars grow from the bottom up" } },
        { header = "Damage Meter" },
        { key = "dmStyle", label = "Refined style", reload = true,
          tooltip = "Polish the look of the Damage Meter.",
          bullets = { "Rounded icon borders" } },
        { header = "Personal Resource Display" },
        { key = "prdStyle", label = "Refined style", reload = true,
          tooltip = "Polish the look of the Personal Resource Display.",
          bullets = { "Centered text", "Health and power as a percentage", "Alternate bar value always shown", "Hidden while you cast" } },
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
-- Buffs & Debuffs: Blizzard creates the aura buttons once at load, so they
-- are styled once (no hooks).
--------------------------------------------------------------------------------
local AURA_CONTAINERS = { "BuffFrame", "DebuffFrame" }

local function ForEachAuraButton(func)
    for _, name in ipairs(AURA_CONTAINERS) do
        local buttons = _G[name] and _G[name].auraFrames
        if buttons then
            for _, button in ipairs(buttons) do
                -- Private-aura anchors have a frame as Icon, not a texture.
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

local function StyleAuraText(button)
    ns.StyleFont(button.Count)
    ns.StyleFont(button.Duration)
end

--------------------------------------------------------------------------------
-- Cast bars: the fade out animations are set to 0 once at login, so the bar
-- hides right when the cast ends (still through Blizzard's own code).
--------------------------------------------------------------------------------
local FADE_ANIMS = { "FadeOutAnim", "HoldFadeOutAnim" }

local function InstantAnims(...)
    for i = 1, select("#", ...) do
        local anim = select(i, ...)
        anim:SetStartDelay(0)
        anim:SetDuration(0)
    end
end

-- Elapsed cast time in the center of the bar, updated 10 times per second
-- while the bar is shown. Secret values go straight to the text.
local CAST_TICK = 0.1
local IsSecretValue = ns.IsSecret

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
        if bar.channeling and not IsSecretValue(value) then
            local _, max = bar:GetMinMaxValues()
            if not IsSecretValue(max) then value = max - value end
        end
        text:SetFormattedText("%.1f", value)
    end)
end

-- Text style: spell name of the cast bar.
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

-- Text style first: the "100" twin of the percentage text copies its font.
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

    -- Alternate power (stagger, ebon might, ...) keeps Blizzard's own value.
    ns.PercentText(health, false, "player")
    ns.PercentText(power,  true,  "player")
end

-- Alternate power bar value always shown (Blizzard shows it only on
-- mouseover), in Blizzard's number format. The bar is set up again on spec
-- changes, so the hook is checked again.
local altHooked = {}

local function ShowAltText(bar)
    local text = bar.TextString
    if not text or text:IsShown() then return end
    local value = bar:GetValue()
    if ns.IsSecret(value) then
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

-- Hidden while the player casts: faded out with alpha (allowed in combat)
-- and restored when the cast ends. Secret cast names count as casting.
local CAST_START = {
    UNIT_SPELLCAST_START = true, UNIT_SPELLCAST_CHANNEL_START = true, UNIT_SPELLCAST_EMPOWER_START = true,
}
local CAST_EVENTS = {
    "UNIT_SPELLCAST_START", "UNIT_SPELLCAST_CHANNEL_START", "UNIT_SPELLCAST_EMPOWER_START",
    "UNIT_SPELLCAST_STOP", "UNIT_SPELLCAST_CHANNEL_STOP", "UNIT_SPELLCAST_EMPOWER_STOP",
    "UNIT_SPELLCAST_FAILED", "UNIT_SPELLCAST_INTERRUPTED",
}
local castEvents = CreateFrame("Frame")
local hiddenAlpha -- alpha before the cast, nil while shown

local function IsCasting()
    local cast = UnitCastingInfo("player")
    if ns.IsSecret(cast) or cast then return true end
    local channel = UnitChannelInfo("player")
    return ns.IsSecret(channel) or channel ~= nil
end

castEvents:SetScript("OnEvent", function(_, event)
    local frame = PersonalResourceDisplayFrame
    if CAST_START[event] or IsCasting() then
        if not hiddenAlpha then
            hiddenAlpha = frame:GetAlpha()
            frame:SetAlpha(0)
        end
    elseif hiddenAlpha then
        frame:SetAlpha(hiddenAlpha)
        hiddenAlpha = nil
    end
end)

local function SetupCastHide()
    if not PersonalResourceDisplayFrame then return end
    for _, event in ipairs(CAST_EVENTS) do castEvents:RegisterUnitEvent(event, "player") end
end

--------------------------------------------------------------------------------
-- Cooldown Manager icons: action bar frame instead of Blizzard's square
-- overlay, once per item (shared registry in core.lua).
--------------------------------------------------------------------------------
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

-- Text style: every font string of the item, two levels deep, once per item.
local styledTexts = {}

local function StyleItemText(item)
    if not item or styledTexts[item] then return end
    styledTexts[item] = true
    ns.StyleAllFonts(item, 2)
end

--------------------------------------------------------------------------------
-- Dynamic layout: shown buff icons centered and bars stacked from the bottom,
-- with no gaps. Show/hide asks for one reflow on the next frame; sizes are
-- measured after Blizzard's layout and reused.
--------------------------------------------------------------------------------
local DYNAMIC = { BuffIconCooldownViewer = "CENTER", BuffBarCooldownViewer = "BOTTOM" }
local items, known, shown = {}, {}, {}
local itemSize, itemScale = {}, {}

local function ByLayoutIndex(a, b) return (a.layoutIndex or 0) < (b.layoutIndex or 0) end

-- Midnight: item geometry can be secret in combat, so the last readable
-- value is kept.
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
    -- Blizzard's padding is in the viewer's scale: converted to the item's.
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
            -- Items already there (one-time scan).
            local container = viewer.GetItemContainerFrame and viewer:GetItemContainerFrame()
            if container then
                for _, child in ipairs({ container:GetChildren() }) do
                    if child.SetHideWhenInactive then AddItem(child) end
                end
            end
            ns.Hook(viewer, "OnAcquireItemFrame", function(_, item) AddItem(item); Queue() end)
            -- Blizzard's layout puts every item back in its fixed slot: re-pack after it.
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
-- Damage Meter: icon frame and text style, once per entry and per window
-- (shared registry in core.lua).
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

-- Entry texts are secret in combat: an outlined copy of their template font
-- is used instead.
local function StyleEntryText(entry)
    local bar = entry.StatusBar
    local font = ns.OutlinedFont(NumberFontNormal)
    if not (bar and font) then return end
    if bar.Name  then bar.Name:SetFontObject(font)  end
    if bar.Value then bar.Value:SetFontObject(font) end
end

-- Window texts (title, buttons); the entries are deeper, in the scroll box.
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
    if db.dmStyle then ns.OnDamageMeterEntry(StyleEntryIcon) end
    if ns.textStyle then
        ns.OnDamageMeterEntry(StyleEntryText)
        ns.OnDamageMeterWindow(StyleWindowText)
    end
end

-- Live options.
function CB:OnOptionChanged(key)
    if key == "auraIconZoom" then ForEachAuraButton(ZoomAuraIcon) end
end
