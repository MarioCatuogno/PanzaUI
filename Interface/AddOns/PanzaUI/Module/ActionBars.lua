--[[----------------------------------------------------------------------------
    PanzaUI - Action Bars
    Per-bar visibility (mouseover, Skyriding only / not Skyriding, hidden), text style,
    macro names, keybindings, icon zoom.
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

-- Visibility modes (dropdown values)
local DEFAULT, MOUSEOVER, SKYRIDING, HIDDEN, NO_SKYRIDING = 0, 1, 2, 3, 4
local VISIBILITY = {
    { DEFAULT,   "Default",        "Blizzard's normal behavior." },
    { MOUSEOVER, "Mouseover",      "Shown only while the mouse is over the bar." },
    { SKYRIDING, "Skyriding only", "Shown only while Skyriding." },
    { NO_SKYRIDING, "No Skyriding", "Like Default, but hidden while Skyriding." },
    { HIDDEN,    "Always hidden",  "Never shown (keybindings still work)." },
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
    defaults[bar.key] = DEFAULT
    options[#options + 1] = { key = bar.key, label = bar.label, tooltip = "When " .. bar.label .. " is shown. Bars are always shown in Edit Mode and while dragging a spell.", dropdown = VISIBILITY }
end

local AB = ns:RegisterModule("ActionBars", { title = "Action Bars", defaults = defaults, options = options })

-- Old versions saved a mouseover on/off per bar: keep that choice.
function AB:Migrate(db)
    for _, bar in ipairs(BARS) do
        if type(db[bar.key]) == "boolean" then db[bar.key] = db[bar.key] and MOUSEOVER or DEFAULT end
    end
end

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
-- Visibility. Bars are faded with alpha (allowed in combat); buttons of bars
-- that are not visible also stop taking clicks (EnableMouse, applied out of
-- combat only). A tiny watcher frame runs (throttled) only while a mouseover
-- bar is shown, so there is no CPU cost while the mouse is elsewhere.
--------------------------------------------------------------------------------
local visible      = {}    -- mouseover bars currently shown
local forceShow    = false -- Edit Mode or dragging a spell
local skyriding    = false
local mousePending = false -- mouse state to apply after combat
local hooked       = {}
local watcher      = CreateFrame("Frame")
watcher:Hide()

local function Mode(bar)
    return bar.frame and AB.db[bar.key] or DEFAULT
end

-- Alpha of a managed bar when not hovered.
local function RestingAlpha(bar)
    local mode = Mode(bar)
    if forceShow or mode == DEFAULT then return 1 end
    if mode == SKYRIDING then return skyriding and 1 or 0 end
    if mode == NO_SKYRIDING then return skyriding and 0 or 1 end
    return 0 -- MOUSEOVER, HIDDEN
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
            bar.frame:SetAlpha(RestingAlpha(bar))
            visible[bar] = nil
        end
    end
    if not next(visible) then self:Hide() end
end)

local function OnEnterBar(bar)
    if Mode(bar) ~= MOUSEOVER then return end
    bar.frame:SetAlpha(1)
    visible[bar] = true
    watcher:Show()
end

local function HookBar(bar)
    if hooked[bar] then return end
    hooked[bar] = true
    local onEnter = function() OnEnterBar(bar) end
    bar.frame:HookScript("OnEnter", onEnter)
    for _, btn in ipairs(bar.buttons) do
        btn:HookScript("OnEnter", onEnter)
    end
end

-- Clicks only on bars that can be seen (mouseover bars must keep the mouse).
local function ApplyMouse()
    if InCombatLockdown() then mousePending = true return end
    mousePending = false
    for _, bar in ipairs(BARS) do
        if bar.frame then
            local mode = Mode(bar)
            local enabled = forceShow or mode == DEFAULT or mode == MOUSEOVER
                or (mode == SKYRIDING and skyriding) or (mode == NO_SKYRIDING and not skyriding)
            for _, btn in ipairs(bar.buttons) do btn:EnableMouse(enabled) end
        end
    end
end

local function RefreshBar(bar)
    if not bar.frame then return end
    local mode = Mode(bar)
    if mode == MOUSEOVER then HookBar(bar) end
    if mode ~= MOUSEOVER or not visible[bar] then bar.frame:SetAlpha(RestingAlpha(bar)) end
    if mode ~= MOUSEOVER then visible[bar] = nil end

    -- Cooldown "bling" ignores parent alpha: disable it on managed bars.
    local bling = mode == DEFAULT
    for _, btn in ipairs(bar.buttons) do
        if btn.cooldown then btn.cooldown:SetDrawBling(bling) end
    end
end

local function RefreshVisibility()
    for _, bar in ipairs(BARS) do RefreshBar(bar) end
    ApplyMouse()
end

local function SetForceShow(on)
    forceShow = on
    RefreshVisibility()
    if not on then
        -- Mouseover bars still under the cursor stay visible until left.
        for _, bar in ipairs(BARS) do
            if Mode(bar) == MOUSEOVER and IsHovered(bar) then OnEnterBar(bar) end
        end
    end
end

local function UpdateSkyriding()
    local _, canGlide = C_PlayerInfo.GetGlidingInfo()
    canGlide = not ns.IsSecret(canGlide) and canGlide and true or false -- secret-safe
    if canGlide == skyriding then return end
    skyriding = canGlide
    RefreshVisibility()
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
local initialized = false

function AB:Refresh()
    if not initialized then
        initialized = true
        ResolveBars()

        -- Show managed bars while in Edit Mode or while dragging a spell/item.
        EventRegistry:RegisterCallback("EditMode.Enter", function() SetForceShow(true) end, self)
        EventRegistry:RegisterCallback("EditMode.Exit",  function() SetForceShow(false) end, self)

        local events = CreateFrame("Frame")
        events:RegisterEvent("ACTIONBAR_SHOWGRID")
        events:RegisterEvent("ACTIONBAR_HIDEGRID")
        events:RegisterEvent("PLAYER_REGEN_ENABLED")
        events:RegisterEvent("PLAYER_ENTERING_WORLD")
        events:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED")
        pcall(events.RegisterEvent, events, "PLAYER_CAN_GLIDE_CHANGED")
        events:SetScript("OnEvent", function(_, event)
            if event == "ACTIONBAR_SHOWGRID" or event == "ACTIONBAR_HIDEGRID" then
                SetForceShow(event == "ACTIONBAR_SHOWGRID")
            elseif event == "PLAYER_REGEN_ENABLED" then
                if mousePending then ApplyMouse() end
            else
                UpdateSkyriding()
            end
        end)

        local _, canGlide = C_PlayerInfo.GetGlidingInfo()
        skyriding = not ns.IsSecret(canGlide) and canGlide and true or false
    end

    RefreshVisibility()
    for _, bar in ipairs(BARS) do RefreshButtons(bar) end
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
