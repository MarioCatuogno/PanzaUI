--[[----------------------------------------------------------------------------
    PanzaUI - Action Bars
    Per-bar mouseover fading, text style, hide macro names and keybindings.
------------------------------------------------------------------------------]]
local _, ns = ...

-- key = option key, frames = global bar names (new name first), prefix = button name
local BARS = {
    { key = "bar1",   label = "Action Bar 1", frames = { "MainActionBar", "MainMenuBar" }, prefix = "ActionButton" },
    { key = "bar2",   label = "Action Bar 2", frames = { "MultiBarBottomLeft" },  prefix = "MultiBarBottomLeftButton" },
    { key = "bar3",   label = "Action Bar 3", frames = { "MultiBarBottomRight" }, prefix = "MultiBarBottomRightButton" },
    { key = "bar4",   label = "Action Bar 4", frames = { "MultiBarRight" },       prefix = "MultiBarRightButton" },
    { key = "bar5",   label = "Action Bar 5", frames = { "MultiBarLeft" },        prefix = "MultiBarLeftButton" },
    { key = "bar6",   label = "Action Bar 6", frames = { "MultiBar5" },           prefix = "MultiBar5Button" },
    { key = "bar7",   label = "Action Bar 7", frames = { "MultiBar6" },           prefix = "MultiBar6Button" },
    { key = "bar8",   label = "Action Bar 8", frames = { "MultiBar7" },           prefix = "MultiBar7Button" },
    { key = "pet",    label = "Pet Bar",      frames = { "PetActionBar" },        prefix = "PetActionButton" },
    { key = "stance", label = "Stance Bar",   frames = { "StanceBar" },           prefix = "StanceButton" },
}

local defaults = { fontStyle = true, hideMacroNames = true, hideKeybinds = true, iconZoom = 5 }
local options  = {
    { header = "Style" },
    { key = "fontStyle",      label = "Outline + Slug text", tooltip = "Apply outline and slug rendering to keybind, count and macro text. Requires Reload UI." },
    { key = "hideMacroNames", label = "Hide macro names",      tooltip = "Hide the macro name shown on action buttons." },
    { key = "hideKeybinds",   label = "Hide keybindings",      tooltip = "Hide the keybinding text (and range dot) on action buttons." },
    { key = "iconZoom",       label = "Icon zoom",             tooltip = "Crop the edges of action button icons (percent per side) to hide the built-in border of older icons. 0 = off.",
      slider = { min = 0, max = 15, step = 1, suffix = "%" } },
    { header = "Features" },
}
for _, bar in ipairs(BARS) do
    defaults[bar.key] = false
    options[#options + 1] = { key = bar.key, label = "Mouseover: " .. bar.label, tooltip = "Show " .. bar.label .. " only on mouseover." }
end

local AB = ns:RegisterModule("ActionBars", { title = "Action Bars", defaults = defaults, options = options })

--------------------------------------------------------------------------------
-- Bar / button lookup (resolved once, at login)
--------------------------------------------------------------------------------
local function ResolveBars()
    for _, bar in ipairs(BARS) do
        for _, name in ipairs(bar.frames) do
            bar.frame = bar.frame or _G[name]
        end
        bar.buttons = {}
        local i, btn = 1, _G[bar.prefix .. 1]
        while btn do
            bar.buttons[i] = btn
            i = i + 1
            btn = _G[bar.prefix .. i]
        end
    end
end

--------------------------------------------------------------------------------
-- Mouseover fading
-- A tiny watcher frame runs (throttled) only while a faded bar is visible,
-- so there is no CPU cost while the mouse is elsewhere.
--------------------------------------------------------------------------------
local visible   = {}      -- faded bars currently shown
local forceShow = false   -- Edit Mode or dragging a spell
local hooked    = {}
local watcher   = CreateFrame("Frame")
watcher:Hide()

local function IsFaded(bar)
    return AB.db[bar.key] and bar.frame ~= nil
end

local function IsHovered(bar)
    return bar.frame:IsMouseOver() or (SpellFlyout and SpellFlyout:IsShown() and SpellFlyout:IsMouseOver())
end

local elapsed = 0
watcher:SetScript("OnUpdate", function(self, dt)
    elapsed = elapsed + dt
    if elapsed < 0.2 then return end
    elapsed = 0
    if forceShow then return end
    for bar in pairs(visible) do
        if not IsHovered(bar) then
            bar.frame:SetAlpha(0)
            visible[bar] = nil
        end
    end
    if not next(visible) then self:Hide() end
end)

local function ShowBar(bar)
    if not IsFaded(bar) then return end
    bar.frame:SetAlpha(1)
    visible[bar] = true
    watcher:Show()
end

local function HookBar(bar)
    if hooked[bar] then return end
    hooked[bar] = true
    local onEnter = function() ShowBar(bar) end
    bar.frame:HookScript("OnEnter", onEnter)
    for _, btn in ipairs(bar.buttons) do
        btn:HookScript("OnEnter", onEnter)
    end
end

local function SetForceShow(on)
    forceShow = on
    for _, bar in ipairs(BARS) do
        if IsFaded(bar) then ShowBar(bar) end -- the watcher fades them back afterwards
    end
end

local function RefreshFade(bar)
    if not bar.frame then return end
    if IsFaded(bar) then
        HookBar(bar)
        bar.frame:SetAlpha(forceShow and 1 or 0)
        if forceShow then visible[bar] = true; watcher:Show() end
    else
        visible[bar] = nil
        bar.frame:SetAlpha(1)
    end
    -- Cooldown "bling" ignores parent alpha: disable it on faded bars.
    local bling = not IsFaded(bar)
    for _, btn in ipairs(bar.buttons) do
        if btn.cooldown then btn.cooldown:SetDrawBling(bling) end
    end
end

--------------------------------------------------------------------------------
-- Button text
--------------------------------------------------------------------------------

local function RefreshButtons(bar)
    local db = AB.db
    local nameAlpha = db.hideMacroNames and 0 or 1
    local keyAlpha  = db.hideKeybinds   and 0 or 1
    for _, btn in ipairs(bar.buttons) do
        if btn.Name   then btn.Name:SetAlpha(nameAlpha) end
        if btn.HotKey then btn.HotKey:SetAlpha(keyAlpha) end
        ns.ZoomIcon(btn.icon or btn.Icon, db.iconZoom)
    end
end

local function StyleText(bar)
    for _, btn in ipairs(bar.buttons) do
        ns.StyleFont(btn.HotKey)
        ns.StyleFont(btn.Count)
        ns.StyleFont(btn.Name)
    end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
local initialized = false

function AB:Refresh()
    if not initialized then
        initialized = true
        ResolveBars()

        -- Show faded bars while in Edit Mode or while dragging a spell/item.
        EventRegistry:RegisterCallback("EditMode.Enter", function() SetForceShow(true) end, self)
        EventRegistry:RegisterCallback("EditMode.Exit",  function() SetForceShow(false) end, self)
        local events = CreateFrame("Frame")
        events:RegisterEvent("ACTIONBAR_SHOWGRID")
        events:RegisterEvent("ACTIONBAR_HIDEGRID")
        events:SetScript("OnEvent", function(_, event) SetForceShow(event == "ACTIONBAR_SHOWGRID") end)
    end

    for _, bar in ipairs(BARS) do
        RefreshFade(bar)
        RefreshButtons(bar)
    end
end

function AB:OnEnable()
    self:Refresh()
    if self.db.fontStyle then
        for _, bar in ipairs(BARS) do StyleText(bar) end
    end
end

-- Everything except the font style applies live.
function AB:OnOptionChanged()
    self:Refresh()
end
