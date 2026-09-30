--[[----------------------------------------------------------------------------
    PanzaUI - Action Bars
    Per-bar visibility (shared engine in core.lua), text style, macro names,
    keybindings, icon zoom.
------------------------------------------------------------------------------]]
local _, ns = ...
local VIS = ns.VIS

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
    { header = "Visibility" },
}
for _, bar in ipairs(BARS) do
    defaults[bar.key] = VIS.DEFAULT
    options[#options + 1] = { key = bar.key, label = bar.label, dropdown = ns.VISIBILITY_OPTIONS,
        tooltip = "When " .. bar.label .. " is shown. Bars are always shown in Edit Mode and while dragging a spell." }
end

local AB = ns:RegisterModule("ActionBars", { title = "Action Bars", defaults = defaults, options = options })

-- Old versions saved a mouseover on/off per bar: keep that choice.
function AB:Migrate(db)
    for _, bar in ipairs(BARS) do
        if type(db[bar.key]) == "boolean" then db[bar.key] = db[bar.key] and VIS.MOUSEOVER or VIS.DEFAULT end
    end
end

--------------------------------------------------------------------------------
-- Bar / button lookup and visibility registration (once, at login)
--------------------------------------------------------------------------------
local function SetupBars()
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

        ns.RegisterVisibility({
            frames  = { bar.frame },
            buttons = bar.buttons,
            grid    = true, -- also shown while dragging a spell
            flyout  = true, -- stays shown while its spell flyout is hovered
            getMode = function() return AB.db[bar.key] end,
            -- Cooldown "bling" ignores parent alpha: off on managed bars.
            onRefresh = function(mode)
                local bling = mode == VIS.DEFAULT
                for _, btn in ipairs(bar.buttons) do
                    if btn.cooldown then btn.cooldown:SetDrawBling(bling) end
                end
            end,
        })
    end
end

--------------------------------------------------------------------------------
-- Button text and icons
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
function AB:OnEnable()
    SetupBars()
    for _, bar in ipairs(BARS) do
        RefreshButtons(bar)
        if self.db.fontStyle then StyleText(bar) end
    end
end

-- Everything except the font style applies live.
function AB:OnOptionChanged()
    ns.RefreshVisibility()
    for _, bar in ipairs(BARS) do RefreshButtons(bar) end
end
