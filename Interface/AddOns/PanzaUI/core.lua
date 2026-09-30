--[[----------------------------------------------------------------------------
    PanzaUI - Core
    Shared namespace, helpers, saved variables, module registry and the
    settings panel (Options > AddOns > PanzaUI).
------------------------------------------------------------------------------]]
local addonName, ns = ...

ns.modules    = {}                 -- ordered list of registered modules
ns.IsSecret   = issecretvalue or function() return false end -- Midnight secret values
ns.FONT_FLAGS = "OUTLINE, SLUG"    -- shared text style for every module

--------------------------------------------------------------------------------
-- Shared helpers
--------------------------------------------------------------------------------

-- Hidden parent: frames reparented here disappear without hooking Show().
ns.Hider = CreateFrame("Frame")
ns.Hider:Hide()

function ns.Kill(frame)
    if frame then frame:SetParent(ns.Hider) end
end

-- Run a function once on the next frame, however many times it is asked for
-- in the meantime (coalesces bursts of events/hooks). No timers or closures
-- per call: one hidden frame and two reused sets (swapped, so functions
-- deferred while running wait for the next frame).
local pending, running = {}, {}
local deferFrame = CreateFrame("Frame")
deferFrame:Hide()
deferFrame:SetScript("OnUpdate", function(self)
    self:Hide()
    pending, running = running, pending
    for func in pairs(running) do
        running[func] = nil
        func()
    end
end)

function ns.Defer(func)
    pending[func] = true
    deferFrame:Show()
end

-- Outlined copy of a font object, made once per base font and reused.
local outlinedFonts, fontCount = {}, 0
function ns.OutlinedFont(base)
    if not base then return end
    local copy = outlinedFonts[base]
    if not copy then
        local font, size = base:GetFont()
        if not font then return end
        fontCount = fontCount + 1
        copy = CreateFont("PanzaUIFont" .. fontCount)
        copy:CopyFontObject(base)
        copy:SetFont(font, size, ns.FONT_FLAGS)
        outlinedFonts[base] = copy
    end
    return copy
end

-- Keeps the current font and size, only changes the flags. Midnight: a font
-- string showing secret text (e.g. Damage Meter values) returns secret font
-- data, so it gets an outlined copy of its font object instead.
function ns.StyleFont(obj)
    if not (obj and obj.GetFont) then return end
    local font, size = obj:GetFont()
    if not ns.IsSecret(font) and not ns.IsSecret(size) then
        if font then obj:SetFont(font, size, ns.FONT_FLAGS) end
        return
    end
    local base = obj.GetFontObject and obj:GetFontObject()
    if ns.IsSecret(base) then return end -- test secret before truthiness
    local copy = ns.OutlinedFont(base)
    if copy then obj:SetFontObject(copy) end
end

-- Every compact party/raid frame already created (party members, flat raid
-- list, raid groups); nil names are simply skipped.
function ns.ForEachCompactFrame(func)
    for i = 1, 5 do
        local f = _G["CompactPartyFrameMember" .. i]
        if f then func(f) end
    end
    for i = 1, 40 do
        local f = _G["CompactRaidFrame" .. i]
        if f then func(f) end
    end
    for g = 1, 8 do
        for m = 1, 5 do
            local f = _G["CompactRaidGroup" .. g .. "Member" .. m]
            if f then func(f) end
        end
    end
end

-- Chat message with the addon prefix.
function ns.Print(msg)
    print("|cff00FF98Panza|rUI: " .. msg)
end

-- Permanently hide a (non-secure) frame and stop its event processing.
function ns.Disable(frame)
    if not frame then return end
    frame:UnregisterAllEvents()
    frame:Hide()
    frame:HookScript("OnShow", frame.Hide)
end

-- hooksecurefunc only if the function exists (API safety).
-- ns.Hook("GlobalFunc", cb)  or  ns.Hook(object, "Method", cb)
function ns.Hook(target, name, callback)
    if type(target) == "string" then target, name, callback = _G, target, name end
    if target and type(target[name]) == "function" then hooksecurefunc(target, name, callback) end
end

--------------------------------------------------------------------------------
-- Action button look for any icon texture (rounded mask + action bar frame).
-- Same proportions as ActionButtonTemplate (icon = 45x45 button): the mask
-- keeps its native atlas size centered on the icon (it has transparent
-- padding), the frame is 46x45 at the icon's top-left.
-- Only widget calls, no Blizzard fields are written (taint-safe).
--------------------------------------------------------------------------------
local ICON_MASK  = "UI-HUD-ActionBar-IconFrame-Mask"
local ICON_FRAME = "UI-HUD-ActionBar-IconFrame"

function ns.StyleIcon(icon, parent)
    if not (icon and icon.AddMaskTexture) then return end
    parent = parent or icon:GetParent()
    local info = C_Texture.GetAtlasInfo(ICON_MASK)

    local mask = parent:CreateMaskTexture()
    mask:SetAtlas(ICON_MASK)
    icon:AddMaskTexture(mask)

    -- Anchored by two corners, so it always follows the icon (a size-only
    -- texture with one anchor stretches wildly while the size is unknown).
    local frame = parent:CreateTexture(nil, "OVERLAY", nil, -1) -- below other overlays (dispel border, ...)
    frame:SetAtlas(ICON_FRAME)
    frame:SetPoint("TOPLEFT", icon)

    -- Sizes follow the icon: icons created from pools can still be 0x0 here
    -- (they get their size at layout; the parent's size is used meanwhile)
    -- and some can be rescaled later (Edit Mode), so this runs again whenever
    -- the parent changes size, and on show until a real size is known.
    -- Nothing is redone when the width did not change.
    -- Midnight: in combat the geometry of frames showing secret data can be
    -- secret too; it can't be compared, so the last good size is kept.
    local lastW = -1
    local function Resize()
        local w = icon:GetWidth()
        if ns.IsSecret(w) or w <= 0 then w = parent:GetWidth() end
        if ns.IsSecret(w) or w == lastW then return end
        lastW = w
        mask:ClearAllPoints()
        if w > 0 and info then
            local scale = w / 45
            mask:SetPoint("CENTER", icon)
            mask:SetSize(info.width * scale, info.height * scale)
        else
            mask:SetAllPoints(icon) -- never hide the icon while its size is unknown
        end
        frame:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", w > 0 and w / 45 or 0, 0) -- 46x45 like action buttons
    end
    Resize()
    parent:HookScript("OnSizeChanged", Resize)
    parent:HookScript("OnShow", function() if lastW <= 0 then Resize() end end)
    return frame, mask
end

-- Icon zoom: crop `percent`% of the texture on each side (0 = full icon).
-- Texcoords survive SetTexture(), so this is applied once per change.
function ns.ZoomIcon(icon, percent)
    if not (icon and icon.SetTexCoord) then return end
    local lo = (tonumber(percent) or 0) / 100
    icon:SetTexCoord(lo, 1 - lo, lo, 1 - lo)
end

--------------------------------------------------------------------------------
-- Status bar text helpers (TextStatusBar: TextString / LeftText / RightText)
--------------------------------------------------------------------------------
function ns.StyleBarText(bar)
    if not bar then return end
    ns.StyleFont(bar.TextString)
    ns.StyleFont(bar.LeftText)
    ns.StyleFont(bar.RightText)
end

-- Percentage-only text (no % symbol). Midnight: health/power are secret
-- values, so the percentage comes from UnitHealthPercent/UnitPowerPercent and
-- is passed straight to the FontString, never read or compared.
-- Runs after Blizzard's UpdateTextString (post-hook: no taint on Blizzard code).
local percentBars = {} -- bar -> { power = bool, unit = fallback unit, respect = bool }
local IsSecret = ns.IsSecret

local function ShowPercent(bar)
    local info, text = percentBars[bar], bar.TextString
    if not (info and text) then return end

    -- respect: keep Blizzard's own visibility choice (e.g. an Edit Mode setting)
    local visible = not info.respect or text:IsShown()
        or (bar.LeftText and bar.LeftText:IsShown()) or (bar.RightText and bar.RightText:IsShown())
    if bar.LeftText  then bar.LeftText:Hide()  end
    if bar.RightText then bar.RightText:Hide() end

    local unit = bar.unit or info.unit
    local _, max = bar:GetMinMaxValues()
    if not visible or not unit or (not IsSecret(max) and max <= 0) then
        text:Hide()
        return
    end

    -- No and/or shortcut: a secret value can't be tested for truthiness.
    local curve = CurveConstants.ScaleTo100
    local pct
    if info.power then
        pct = UnitPowerPercent(unit, bar.powerType, false, curve)
    else
        pct = UnitHealthPercent(unit, true, curve)
    end
    text:SetFormattedText("%.0f", pct)
    text:Show()
end

function ns.PercentText(bar, isPower, unit, respectVisibility)
    if not (bar and CurveConstants and UnitHealthPercent) or percentBars[bar] then return end
    percentBars[bar] = { power = isPower, unit = unit, respect = respectVisibility }
    ns.Hook(bar, "UpdateTextString", ShowPercent)
end

--------------------------------------------------------------------------------
-- Shared visibility engine (Action Bars, Micro Menu, Bag Bar, XP/Rep bars).
-- An entry is { frames = {...}, buttons = {...}?, getMode = fn, grid = bool?,
-- flyout = bool?, onRefresh = fn(mode)? }. Frames are faded with alpha
-- (allowed in combat); buttons of entries that are not visible stop taking
-- clicks (EnableMouse, applied out of combat only). A tiny watcher frame runs
-- (throttled) only while a mouseover entry is shown.
--------------------------------------------------------------------------------
local VIS = { DEFAULT = 0, MOUSEOVER = 1, SKYRIDING = 2, HIDDEN = 3, NO_SKYRIDING = 4 }
ns.VIS = VIS
ns.VISIBILITY_OPTIONS = {
    { VIS.DEFAULT,      "Default",        "Blizzard's normal behavior." },
    { VIS.MOUSEOVER,    "Mouseover",      "Shown only while the mouse is over it." },
    { VIS.SKYRIDING,    "Skyriding only", "Shown only while Skyriding." },
    { VIS.NO_SKYRIDING, "No Skyriding",   "Like Default, but hidden while Skyriding." },
    { VIS.HIDDEN,       "Always hidden",  "Never shown (keybindings still work)." },
}

local visEntries   = {}
local visShown     = {}    -- mouseover entries currently shown
local forced       = {}    -- editMode / grid (dragging a spell)
local skyriding    = false
local mousePending = false
local visWatcher   = CreateFrame("Frame")
visWatcher:Hide()

local function VisMode(e)
    return e.getMode() or VIS.DEFAULT
end

local function IsForced(e)
    return forced.editMode or (e.grid and forced.grid)
end

local function RestingAlpha(e)
    local mode = VisMode(e)
    if IsForced(e) or mode == VIS.DEFAULT then return 1 end
    if mode == VIS.SKYRIDING then return skyriding and 1 or 0 end
    if mode == VIS.NO_SKYRIDING then return skyriding and 0 or 1 end
    return 0 -- MOUSEOVER, HIDDEN
end

local function SetEntryAlpha(e, alpha)
    for _, f in ipairs(e.frames) do f:SetAlpha(alpha) end
end

local function IsHovered(e)
    for _, f in ipairs(e.frames) do
        if f:IsMouseOver() then return true end
    end
    return e.flyout and SpellFlyout and SpellFlyout:IsShown() and SpellFlyout:IsMouseOver()
end

local elapsed = 0
visWatcher:SetScript("OnUpdate", function(self, dt)
    elapsed = elapsed + dt
    if elapsed < 0.2 then return end
    elapsed = 0
    for e in pairs(visShown) do
        if not IsForced(e) and not IsHovered(e) then
            SetEntryAlpha(e, RestingAlpha(e))
            visShown[e] = nil
        end
    end
    if not next(visShown) then self:Hide() end
end)

local function OnEnterEntry(e)
    if VisMode(e) ~= VIS.MOUSEOVER then return end
    SetEntryAlpha(e, 1)
    visShown[e] = true
    visWatcher:Show()
end

local function HookEntry(e)
    if e.hooked then return end
    e.hooked = true
    local onEnter = function() OnEnterEntry(e) end
    for _, f in ipairs(e.frames) do f:HookScript("OnEnter", onEnter) end
    for _, b in ipairs(e.buttons or {}) do b:HookScript("OnEnter", onEnter) end
end

-- Clicks only where the entry can be seen (mouseover entries keep the mouse).
-- Buttons are only touched once an entry has been hidden at least once.
local function ApplyMouse()
    if InCombatLockdown() then mousePending = true return end
    mousePending = false
    for _, e in ipairs(visEntries) do
        if e.buttons then
            local mode = VisMode(e)
            local enabled = IsForced(e) or mode == VIS.DEFAULT or mode == VIS.MOUSEOVER
                or (mode == VIS.SKYRIDING and skyriding) or (mode == VIS.NO_SKYRIDING and not skyriding)
            if not enabled or e.mouseOff then
                for _, b in ipairs(e.buttons) do b:EnableMouse(enabled) end
                e.mouseOff = not enabled
            end
        end
    end
end

local function RefreshEntry(e)
    local mode = VisMode(e)
    if mode == VIS.MOUSEOVER then HookEntry(e) end
    -- Default entries are left alone unless we changed them before.
    if mode ~= VIS.DEFAULT or e.alphaTouched then
        if mode ~= VIS.MOUSEOVER or not visShown[e] then SetEntryAlpha(e, RestingAlpha(e)) end
        e.alphaTouched = mode ~= VIS.DEFAULT
    end
    if mode ~= VIS.MOUSEOVER then visShown[e] = nil end
    if e.onRefresh then e.onRefresh(mode) end
end

function ns.RefreshVisibility()
    for _, e in ipairs(visEntries) do RefreshEntry(e) end
    ApplyMouse()
end

local function SetForced(kind, on)
    forced[kind] = on
    ns.RefreshVisibility()
    if not on then
        -- Mouseover entries still under the cursor stay visible until left.
        for _, e in ipairs(visEntries) do
            if VisMode(e) == VIS.MOUSEOVER and IsHovered(e) then OnEnterEntry(e) end
        end
    end
end

local function ReadSkyriding()
    local _, canGlide = C_PlayerInfo.GetGlidingInfo()
    return not ns.IsSecret(canGlide) and canGlide and true or false -- secret-safe
end

local visInitialized = false
local function InitVisibility()
    visInitialized = true
    skyriding = ReadSkyriding()

    -- Everything is shown in Edit Mode; action bars also while dragging a spell.
    EventRegistry:RegisterCallback("EditMode.Enter", function() SetForced("editMode", true) end, ns)
    EventRegistry:RegisterCallback("EditMode.Exit",  function() SetForced("editMode", false) end, ns)

    local events = CreateFrame("Frame")
    events:RegisterEvent("ACTIONBAR_SHOWGRID")
    events:RegisterEvent("ACTIONBAR_HIDEGRID")
    events:RegisterEvent("PLAYER_REGEN_ENABLED")
    events:RegisterEvent("PLAYER_ENTERING_WORLD")
    events:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED")
    pcall(events.RegisterEvent, events, "PLAYER_CAN_GLIDE_CHANGED")
    events:SetScript("OnEvent", function(_, event)
        if event == "ACTIONBAR_SHOWGRID" or event == "ACTIONBAR_HIDEGRID" then
            SetForced("grid", event == "ACTIONBAR_SHOWGRID")
        elseif event == "PLAYER_REGEN_ENABLED" then
            if mousePending then ApplyMouse() end
        else
            local now = ReadSkyriding()
            if now ~= skyriding then
                skyriding = now
                ns.RefreshVisibility()
            end
        end
    end)
end

-- Registers an entry (nil frames are skipped) and applies its mode.
function ns.RegisterVisibility(e)
    local frames = {}
    for _, f in pairs(e.frames) do frames[#frames + 1] = f end
    if #frames == 0 then return end
    e.frames = frames
    if not visInitialized then InitVisibility() end
    visEntries[#visEntries + 1] = e
    RefreshEntry(e)
    ApplyMouse()
    return e
end

--------------------------------------------------------------------------------
-- Module registry
--   info = { title, defaults = { key = value, ... },
--            options = { { header = "Section" }, { key, label, tooltip [, slider | dropdown] }, ... } }
--   info.main = true puts the options on the main page instead of a sub-page.
--   Optional methods: module:OnEnable(), module:OnOptionChanged(key, value),
--                     module:Migrate(db) (convert old saved values at load)
--------------------------------------------------------------------------------
function ns:RegisterModule(key, info)
    info.key = key
    self.modules[#self.modules + 1] = info
    return info
end

--------------------------------------------------------------------------------
-- Saved variables: fill defaults, drop obsolete keys.
--------------------------------------------------------------------------------
local function InitDB()
    PanzaUI_DB = PanzaUI_DB or {}
    local known = {}
    for _, m in ipairs(ns.modules) do known[m.key] = true end
    for k in pairs(PanzaUI_DB) do
        if not known[k] then PanzaUI_DB[k] = nil end -- removed/renamed modules
    end
    for _, m in ipairs(ns.modules) do
        local db = PanzaUI_DB[m.key] or {}
        if m.Migrate then m:Migrate(db) end -- convert old saved values first
        for k in pairs(db) do
            if m.defaults[k] == nil then db[k] = nil end
        end
        for k, v in pairs(m.defaults) do
            if type(db[k]) ~= type(v) then db[k] = v end -- missing or type changed
        end
        PanzaUI_DB[m.key] = db
        m.db = db
    end
end

--------------------------------------------------------------------------------
-- Settings panel (modern Settings API)
--------------------------------------------------------------------------------
local function AddReloadButton(layout)
    layout:AddInitializer(CreateSettingsButtonInitializer(
        "", "Reload UI", ReloadUI, "Reload the interface to apply changes.", false))
end

-- Checkbox (boolean default), slider (opt.slider = { min, max, step, suffix })
-- or dropdown (opt.dropdown = { { value, label [, tooltip] }, ... } or a
-- function returning that list, rebuilt each time the menu opens).
-- The setting type (boolean / number / string) follows the default value.
local function AddOption(category, m, opt)
    local key = opt.key
    local VAR_TYPES = { boolean = Settings.VarType.Boolean, number = Settings.VarType.Number, string = Settings.VarType.String }
    local varType = VAR_TYPES[type(m.defaults[key])]
    local setting = Settings.RegisterAddOnSetting(category,
        addonName .. "_" .. m.key .. "_" .. key, key, m.db,
        varType, opt.label, m.defaults[key])

    if m.OnOptionChanged then
        setting:SetValueChangedCallback(function(_, value)
            m.db[key] = value
            m:OnOptionChanged(key, value)
        end)
    end

    if opt.dropdown then
        local function GetOptions()
            local container = Settings.CreateControlTextContainer()
            local list = type(opt.dropdown) == "function" and opt.dropdown() or opt.dropdown
            for _, o in ipairs(list) do container:Add(o[1], o[2], o[3]) end
            return container:GetData()
        end
        return Settings.CreateDropdown(category, setting, GetOptions, opt.tooltip)
    end
    if not opt.slider then
        return Settings.CreateCheckbox(category, setting, opt.tooltip)
    end
    local sl = opt.slider
    local sliderOptions = Settings.CreateSliderOptions(sl.min, sl.max, sl.step or 1)
    sliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
        return value .. (sl.suffix or "")
    end)
    return Settings.CreateSlider(category, setting, sliderOptions, opt.tooltip)
end

local function BuildSettings()
    local category, layout = Settings.RegisterVerticalLayoutCategory(addonName)
    local version = C_AddOns.GetAddOnMetadata(addonName, "Version") or ""
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(addonName .. " " .. version))

    local function AddOptions(cat, lay, m)
        for _, opt in ipairs(m.options) do
            if opt.header then
                lay:AddInitializer(CreateSettingsListSectionHeaderInitializer(opt.header))
            else
                AddOption(cat, m, opt)
            end
        end
    end

    -- Global modules (main = true) live on the main page, the others get
    -- their own page, in alphabetical order (module load order is unchanged).
    local sorted = {}
    for _, m in ipairs(ns.modules) do
        if m.main then AddOptions(category, layout, m) else sorted[#sorted + 1] = m end
    end
    AddReloadButton(layout)
    table.sort(sorted, function(a, b) return a.title < b.title end)

    for _, m in ipairs(sorted) do
        local sub, subLayout = Settings.RegisterVerticalLayoutSubcategory(category, m.title)
        AddOptions(sub, subLayout, m)
        AddReloadButton(subLayout)
    end

    Settings.RegisterAddOnCategory(category)
    ns.category = category
end

--------------------------------------------------------------------------------
-- Boot
--------------------------------------------------------------------------------
local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:RegisterEvent("PLAYER_LOGIN")  -- PLAYER_REGEN_ENABLED is used only as a fallback
loader:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" then
        if arg1 ~= addonName then return end
        self:UnregisterEvent(event)
        InitDB()
        BuildSettings()
    else -- PLAYER_LOGIN: Blizzard frames exist, enable modules
        self:UnregisterEvent(event)
        -- Modules touch Blizzard unit/action frames: after a /reload in combat,
        -- wait until combat ends to avoid blocked actions.
        if InCombatLockdown() then
            self:RegisterEvent("PLAYER_REGEN_ENABLED")
            return
        end
        local handler = geterrorhandler()
        for _, m in ipairs(ns.modules) do
            if m.OnEnable then
                xpcall(m.OnEnable, handler, m) -- one broken module can't stop the others
            end
        end
    end
end)

SLASH_PANZAUI1, SLASH_PANZAUI2 = "/panza", "/pui"
SlashCmdList.PANZAUI = function()
    Settings.OpenToCategory(ns.category:GetID())
end

-- Shortcuts: /rl = Reload UI, /rc = ready check, /pl = 10 second pull timer.
SLASH_PANZAUI_RL1 = "/rl"
SlashCmdList.PANZAUI_RL = ReloadUI

SLASH_PANZAUI_RC1 = "/rc"
SlashCmdList.PANZAUI_RC = function() DoReadyCheck() end

SLASH_PANZAUI_PL1 = "/pl"
SlashCmdList.PANZAUI_PL = function() C_PartyInfo.DoCountdown(10) end
