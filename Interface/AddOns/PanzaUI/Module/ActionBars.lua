--[[----------------------------------------------------------------------------
    PanzaUI - Action Bars
    Button style, icon zoom and visibility of the bars.
------------------------------------------------------------------------------]]
local _, ns = ...
local VIS = ns.VIS

--------------------------------------------------------------------------------
-- Managed bars: global frame names and action button prefixes.
--------------------------------------------------------------------------------
local ACTION_BARS = {
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

local OTHER_BARS = {
    -- MicroMenu only, so the Group Finder eye stays visible.
    { key = "microMenu",  label = "Micro Menu",                frames = { "MicroMenu" } },
    { key = "bagBar",     label = "Bag Bar",                   frames = { "BagsBar" } },
    { key = "statusBars", label = "Experience/Reputation bar", frames = { "MainStatusTrackingBarContainer", "SecondaryStatusTrackingBarContainer" } },
}

--------------------------------------------------------------------------------
-- Options
--------------------------------------------------------------------------------
local defaults = { style = true, iconZoom = 5 }
local options  = {
    { header = "Buttons" },
    { key = "style", label = "Refined style", reload = true,
      tooltip = "Polish the look of the action buttons.",
      bullets = { "No macro names or keybindings" } },
    { key = "iconZoom", label = "Icon zoom",
      tooltip = "Crop the edges of the action button icons.",
      slider = { min = 0, max = 15, step = 1, suffix = "%" } },
    { header = "Visibility" },
}
for _, list in ipairs({ ACTION_BARS, OTHER_BARS }) do
    for _, bar in ipairs(list) do
        defaults[bar.key] = VIS.DEFAULT
        options[#options + 1] = { key = bar.key, label = bar.label, dropdown = ns.VISIBILITY_OPTIONS,
            tooltip = "Choose when the bar is shown." }
    end
end

local AB = ns:RegisterModule("ActionBars", { title = "Action Bars", defaults = defaults, options = options })

-- Converts the saved values of older versions.
function AB:Migrate(db, saved)
    for _, bar in ipairs(ACTION_BARS) do
        if type(db[bar.key]) == "boolean" then db[bar.key] = db[bar.key] and VIS.MOUSEOVER or VIS.DEFAULT end
    end
    ns.MergeOptions(db, "style", db, "fontStyle", "hideMacroNames", "hideKeybinds")
    local misc = saved.Miscellaneous
    for _, bar in ipairs(OTHER_BARS) do ns.MergeOptions(db, bar.key, misc, bar.key) end
end

--------------------------------------------------------------------------------
-- Visibility: every bar is registered in the shared engine.
--------------------------------------------------------------------------------
local function ChildButtons(frame, list)
    for _, child in ipairs({ frame:GetChildren() }) do
        if child:IsMouseEnabled() then list[#list + 1] = child end
        ChildButtons(child, list)
    end
    return list
end

local function SetupActionBars()
    for _, bar in ipairs(ACTION_BARS) do
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
            grid    = true,
            flyout  = true,
            getMode = function() return AB.db[bar.key] end,
            -- The cooldown bling ignores the parent alpha.
            onRefresh = function(mode)
                local bling = mode == VIS.DEFAULT
                for _, button in ipairs(bar.buttons) do
                    if button.cooldown then button.cooldown:SetDrawBling(bling) end
                end
            end,
        })
    end
end

local function SetupOtherBars()
    for _, bar in ipairs(OTHER_BARS) do
        local frames, buttons = {}, {}
        for _, name in ipairs(bar.frames) do
            local frame = _G[name]
            if frame then
                frames[#frames + 1] = frame
                ChildButtons(frame, buttons)
            end
        end
        ns.RegisterVisibility({ frames = frames, buttons = buttons, getMode = function() return AB.db[bar.key] end })
    end
end

--------------------------------------------------------------------------------
-- Buttons: refined style, icon zoom and text style.
--------------------------------------------------------------------------------
local function RefreshButtons(bar)
    local db = AB.db
    local textAlpha = db.style and 0 or 1
    for _, btn in ipairs(bar.buttons) do
        if btn.Name   then btn.Name:SetAlpha(textAlpha) end
        if btn.HotKey then btn.HotKey:SetAlpha(textAlpha) end
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
    SetupActionBars()
    SetupOtherBars()
    for _, bar in ipairs(ACTION_BARS) do
        RefreshButtons(bar)
        if ns.textStyle then StyleText(bar) end
    end
end

-- Live options.
function AB:OnOptionChanged()
    ns.RefreshVisibility()
    for _, bar in ipairs(ACTION_BARS) do RefreshButtons(bar) end
end
