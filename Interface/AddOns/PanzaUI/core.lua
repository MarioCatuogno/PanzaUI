--[[----------------------------------------------------------------------------
    PanzaUI - Core
    Shared namespace, helpers, saved variables, module registry and the
    settings panel (Options > AddOns > PanzaUI).
------------------------------------------------------------------------------]]
local addonName, ns = ...

ns.modules    = {}
ns.IsSecret   = issecretvalue or function() return false end
ns.FONT_FLAGS = "OUTLINE, SLUG" -- shared text style
ns.textStyle  = false           -- General > Style > Refined text

--------------------------------------------------------------------------------
-- Shared helpers
--------------------------------------------------------------------------------

-- Hidden parent: frames moved here disappear for good.
ns.Hider = CreateFrame("Frame")
ns.Hider:Hide()

function ns.Kill(frame)
    if frame then frame:SetParent(ns.Hider) end
end

-- Runs a function once on the next frame, however many times it is asked
-- for meanwhile (one hidden frame, no timers or closures).
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

-- Outlined copy of a font object, one per base font.
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

-- Applies the shared text style to a font string or font object. Midnight:
-- secret font data gets an outlined copy of the font object instead.
function ns.StyleFont(obj)
    if not (obj and obj.GetFont) then return end
    local font, size = obj:GetFont()
    if not ns.IsSecret(font) and not ns.IsSecret(size) then
        if font then obj:SetFont(font, size, ns.FONT_FLAGS) end
        return
    end
    local base = obj.GetFontObject and obj:GetFontObject()
    if ns.IsSecret(base) then return end
    local copy = ns.OutlinedFont(base)
    if copy then obj:SetFontObject(copy) end
end

-- Every compact party/raid frame that exists (names built once).
local COMPACT_FRAMES = {}
for i = 1, 5 do COMPACT_FRAMES[#COMPACT_FRAMES + 1] = "CompactPartyFrameMember" .. i end
for i = 1, 40 do COMPACT_FRAMES[#COMPACT_FRAMES + 1] = "CompactRaidFrame" .. i end
for g = 1, 8 do
    for m = 1, 5 do COMPACT_FRAMES[#COMPACT_FRAMES + 1] = "CompactRaidGroup" .. g .. "Member" .. m end
end

function ns.ForEachCompactFrame(func)
    for i = 1, #COMPACT_FRAMES do
        local f = _G[COMPACT_FRAMES[i]]
        if f then func(f) end
    end
end

function ns.Print(msg)
    print("|cff00FF98Panza|rUI: " .. msg)
end

-- Permanently hides a (non-secure) frame and stops its events.
function ns.Disable(frame)
    if not frame then return end
    frame:UnregisterAllEvents()
    frame:Hide()
    frame:HookScript("OnShow", frame.Hide)
end

-- hooksecurefunc, only if the function exists.
-- ns.Hook("GlobalFunc", cb) or ns.Hook(object, "Method", cb)
function ns.Hook(target, name, callback)
    if type(target) == "string" then target, name, callback = _G, target, name end
    if target and type(target[name]) == "function" then hooksecurefunc(target, name, callback) end
end

--------------------------------------------------------------------------------
-- Action button look for any icon texture: rounded mask and action bar frame,
-- sized like ActionButtonTemplate and following the icon size.
-- anchored: lightweight version for icons made in large numbers (e.g.
-- nameplate auras): mask and frame are simply anchored to the icon, with no
-- size tracking (no closure or hook per icon). Returns nil when the frame
-- can't be styled now (forbidden, secret aspects).
--------------------------------------------------------------------------------
local ICON_MASK  = "UI-HUD-ActionBar-IconFrame-Mask"
local ICON_FRAME = "UI-HUD-ActionBar-IconFrame"
local ICON_SWIPE = [[Interface\AddOns\PanzaUI\Media\Icons\PanzaUI_iconswipe.tga]] -- rounded icon shape

local maskInfo

function ns.StyleIcon(icon, parent, anchored)
    if not (icon and icon.AddMaskTexture) or icon:IsForbidden() then return end
    parent = parent or icon:GetParent()
    if not parent or parent:IsForbidden() then return end
    maskInfo = maskInfo or C_Texture.GetAtlasInfo(ICON_MASK)
    local info = maskInfo

    local ok, mask = pcall(parent.CreateMaskTexture, parent)
    if not ok then return end
    local frame = parent:CreateTexture(nil, "OVERLAY", nil, -1) -- below other overlays
    frame:SetAtlas(ICON_FRAME)

    if anchored then
        mask:SetTexture(ICON_SWIPE, "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
        mask:SetAllPoints(icon)
        icon:AddMaskTexture(mask)
        frame:SetAllPoints(icon)
        return frame, mask
    end

    mask:SetAtlas(ICON_MASK)
    icon:AddMaskTexture(mask)
    frame:SetPoint("TOPLEFT", icon)

    -- Width and height follow the icon (or the parent while the icon is 0x0).
    -- Midnight: secret geometry is skipped, the last good size is kept.
    local lastW, lastH = -1, -1
    local function Resize()
        local w, h = icon:GetSize()
        if ns.IsSecret(w) or ns.IsSecret(h) or w <= 0 or h <= 0 then w, h = parent:GetSize() end
        if ns.IsSecret(w) or ns.IsSecret(h) or (w == lastW and h == lastH) then return end
        lastW, lastH = w, h
        mask:ClearAllPoints()
        if w > 0 and h > 0 and info then
            mask:SetPoint("CENTER", icon)
            mask:SetSize(info.width * w / 45, info.height * h / 45)
        else
            mask:SetAllPoints(icon)
        end
        frame:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", w > 0 and w / 45 or 0, 0)
    end
    Resize()
    parent:HookScript("OnSizeChanged", Resize)
    parent:HookScript("OnShow", function() if lastW <= 0 then Resize() end end)
    return frame, mask
end

-- Rounded cooldown swipe for icons styled with ns.StyleIcon.

function ns.RoundSwipe(cooldown)
    if cooldown and cooldown.SetSwipeTexture and not cooldown:IsForbidden() then
        cooldown:SetSwipeTexture(ICON_SWIPE)
    end
end

-- Icon zoom: crops `percent`% of the texture on each side.
function ns.ZoomIcon(icon, percent)
    if not (icon and icon.SetTexCoord) then return end
    local lo = (tonumber(percent) or 0) / 100
    icon:SetTexCoord(lo, 1 - lo, lo, 1 - lo)
end

--------------------------------------------------------------------------------
-- ScrollBox frame callback that always gets the frame (ScrollUtil passes
-- different arguments for new and existing frames).
--------------------------------------------------------------------------------
function ns.ScrollFrameCallback(func)
    return function(a, b)
        if type(a) == "table" and a.GetObjectType then func(a) else func(b) end
    end
end

--------------------------------------------------------------------------------
-- Damage Meter registry: every registered function runs once per entry and
-- once per window (session and spell breakdown), as soon as Blizzard makes
-- them. One set of hooks for every module.
--------------------------------------------------------------------------------
local dmFuncs, dmEntries, dmHooked = {}, {}, {}
local dmWindowFuncs, dmWindows = {}, {}
local dmSetup = false

local function OnDamageMeterWindow(window)
    if not window or dmWindows[window] then return end
    dmWindows[window] = true
    for _, func in ipairs(dmWindowFuncs) do func(window) end
end

local function OnDamageMeterEntry(entry)
    if not entry or dmEntries[entry] then return end
    dmEntries[entry] = true
    for _, func in ipairs(dmFuncs) do func(entry) end
end

local OnDamageMeterFrame = ns.ScrollFrameCallback(OnDamageMeterEntry)
local function HookDamageMeterBox(box)
    if not box or dmHooked[box] then return end
    dmHooked[box] = true
    ScrollUtil.AddAcquiredFrameCallback(box, OnDamageMeterFrame, ns, true)
    ScrollUtil.AddInitializedFrameCallback(box, OnDamageMeterFrame, ns, true)
end

local function HookDamageMeterSource(window)
    local source = window.GetSourceWindow and window:GetSourceWindow()
    if not source then return end
    OnDamageMeterWindow(source)
    if source.GetScrollBox then HookDamageMeterBox(source:GetScrollBox()) end
end

local function HookDamageMeterWindow(window)
    if not window or dmHooked[window] then return end
    dmHooked[window] = true
    OnDamageMeterWindow(window)
    if window.GetScrollBox then HookDamageMeterBox(window:GetScrollBox()) end
    -- The pinned local player row is not part of the scroll box.
    if window.GetLocalPlayerEntry then OnDamageMeterEntry(window:GetLocalPlayerEntry()) end
    HookDamageMeterSource(window)
    ns.Hook(window, "ShowSourceWindow", HookDamageMeterSource)
end

local function SetupDamageMeter()
    if dmSetup or not ScrollUtil then return end
    dmSetup = true
    for i = 1, 10 do HookDamageMeterWindow(_G["DamageMeterSessionWindow" .. i]) end
    ns.Hook(DamageMeter, "SetupSessionWindow", function(_, index)
        HookDamageMeterWindow(_G["DamageMeterSessionWindow" .. tostring(index)])
    end)
end

-- func(entry): entry.Icon.Icon is the icon, entry.StatusBar the bar.
function ns.OnDamageMeterEntry(func)
    dmFuncs[#dmFuncs + 1] = func
    for entry in pairs(dmEntries) do func(entry) end
    EventUtil.ContinueOnAddOnLoaded("Blizzard_DamageMeter", SetupDamageMeter)
end

-- func(window): session and spell breakdown windows.
function ns.OnDamageMeterWindow(func)
    dmWindowFuncs[#dmWindowFuncs + 1] = func
    for window in pairs(dmWindows) do func(window) end
    EventUtil.ContinueOnAddOnLoaded("Blizzard_DamageMeter", SetupDamageMeter)
end

--------------------------------------------------------------------------------
-- Cooldown Manager registry: every registered function runs once per item
-- of every viewer, when acquired or (already there) at load.
--------------------------------------------------------------------------------
local CDM_VIEWERS = { "EssentialCooldownViewer", "UtilityCooldownViewer", "BuffIconCooldownViewer", "BuffBarCooldownViewer" }
local cdmFuncs, cdmItems = {}, {}

local function OnCooldownItem(item)
    if not item or cdmItems[item] then return end
    cdmItems[item] = true
    for _, func in ipairs(cdmFuncs) do func(item) end
end

local function OnAcquireCooldownItem(_, item) OnCooldownItem(item) end

local function SetupCooldownItems()
    for _, name in ipairs(CDM_VIEWERS) do
        local viewer = _G[name]
        if viewer then
            if viewer.GetItemFrames then
                for _, item in ipairs(viewer:GetItemFrames()) do OnCooldownItem(item) end
            end
            ns.Hook(viewer, "OnAcquireItemFrame", OnAcquireCooldownItem)
        end
    end
end

-- func(item): func skips the items it doesn't handle.
function ns.OnCooldownItem(func)
    cdmFuncs[#cdmFuncs + 1] = func
    for item in pairs(cdmItems) do func(item) end
    if #cdmFuncs == 1 then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_CooldownViewer", SetupCooldownItems)
    end
end

--------------------------------------------------------------------------------
-- Item level on item buttons (bags, Character and Inspect panels), in the
-- quality color. The text is kept in a local table (taint-safe).
--------------------------------------------------------------------------------
function ns.LocationItemLevel(location)
    if not C_Item.DoesItemExist(location) then return end
    local ilvl = C_Item.GetCurrentItemLevel(location)
    if not ilvl or ilvl <= 1 then return end
    return ilvl, ITEM_QUALITY_COLORS[C_Item.GetItemQuality(location)]
end

local ilvlTexts = {}
-- Shows ilvl on the button, or hides it when ilvl is nil.
function ns.ItemLevelText(button, ilvl, color)
    local text = ilvlTexts[button]
    if not ilvl then
        if text then text:Hide() end
        return
    end
    if not text then
        text = button:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
        text:SetPoint("TOP", 0, -2)
        if ns.textStyle then ns.StyleFont(text) end
        ilvlTexts[button] = text
    end
    text:SetText(ilvl)
    if color then text:SetTextColor(color.r, color.g, color.b) else text:SetTextColor(1, 1, 1) end
    text:Show()
end

--------------------------------------------------------------------------------
-- Every font string of a frame and of `levels` levels of children.
--------------------------------------------------------------------------------
local StyleAllFonts

local function StyleFontRegions(...)
    for i = 1, select("#", ...) do
        local region = select(i, ...)
        if region:GetObjectType() == "FontString" then ns.StyleFont(region) end
    end
end

local function StyleChildFonts(levels, ...)
    for i = 1, select("#", ...) do StyleAllFonts((select(i, ...)), levels) end
end

function StyleAllFonts(frame, levels)
    if not frame or frame:IsForbidden() then return end
    StyleFontRegions(frame:GetRegions())
    if levels and levels > 0 then StyleChildFonts(levels - 1, frame:GetChildren()) end
end
ns.StyleAllFonts = StyleAllFonts

--------------------------------------------------------------------------------
-- Cast bars of Player, Target, Focus and Boss frames.
--------------------------------------------------------------------------------
function ns.ForEachCastBar(func)
    if PlayerCastingBarFrame then func(PlayerCastingBarFrame) end
    if TargetFrame and TargetFrame.spellbar then func(TargetFrame.spellbar) end
    if FocusFrame and FocusFrame.spellbar then func(FocusFrame.spellbar) end
    for i = 1, 5 do
        local boss = _G["Boss" .. i .. "TargetFrame"]
        if boss and boss.spellbar then func(boss.spellbar) end
    end
end

--------------------------------------------------------------------------------
-- Status bar texts (TextString / LeftText / RightText)
--------------------------------------------------------------------------------
function ns.StyleBarText(bar)
    if not bar then return end
    ns.StyleFont(bar.TextString)
    ns.StyleFont(bar.LeftText)
    ns.StyleFont(bar.RightText)
end

--------------------------------------------------------------------------------
-- Percentage text: one decimal below 100, "100" when full, nothing at 0.
-- Midnight: health/power are secret, so the value goes straight to the text
-- and curves set its alpha; a twin FontString shows the "100". Runs after
-- Blizzard's UpdateTextString.
--------------------------------------------------------------------------------
local IsSecret = ns.IsSecret
local percentBars = {}
local fullTexts   = {}

local partCurve, fullCurve
if C_CurveUtil and C_CurveUtil.CreateCurve then
    partCurve = C_CurveUtil.CreateCurve()
    partCurve:AddPoint(0,       0)
    partCurve:AddPoint(0.0004,  0)
    partCurve:AddPoint(0.0005,  1)
    partCurve:AddPoint(0.99949, 1)
    partCurve:AddPoint(0.9995,  0)
    partCurve:AddPoint(1,       0)
    fullCurve = C_CurveUtil.CreateCurve()
    fullCurve:AddPoint(0,       0)
    fullCurve:AddPoint(0.99949, 0)
    fullCurve:AddPoint(0.9995,  1)
    fullCurve:AddPoint(1,       1)
end

-- Copies the bar text font to its twin (after a restyle).
function ns.SyncPercentFont(text)
    local twin = text and fullTexts[text]
    if not twin then return end
    local font, size, flags = text:GetFont()
    if not IsSecret(font) and not IsSecret(size) and font then twin:SetFont(font, size, flags) end
end

local function FullText(text)
    local twin = fullTexts[text]
    if twin then return twin end
    twin = text:GetParent():CreateFontString(nil, (text:GetDrawLayer()))
    local base = text:GetFontObject()
    if base and not IsSecret(base) then twin:SetFontObject(base) end
    twin:SetAllPoints(text)
    twin:SetJustifyH(text:GetJustifyH())
    twin:SetJustifyV(text:GetJustifyV())
    twin:SetTextColor(text:GetTextColor())
    twin:SetText("100")
    fullTexts[text] = twin
    ns.SyncPercentFont(text)
    hooksecurefunc(text, "Hide", function() twin:Hide() end)
    return twin
end

-- Text color of a percentage text and its twin.
function ns.SetPercentColor(text, r, g, b)
    text:SetTextColor(r, g, b)
    local twin = fullTexts[text]
    if twin then twin:SetTextColor(r, g, b) end
end

-- Hides the twin (status texts or no unit).
function ns.HidePercentFull(text)
    local twin = text and fullTexts[text]
    if twin then twin:Hide() end
end

-- Writes the health (or power) percentage of unit. No and/or: secret values
-- can't be tested.
function ns.SetPercentText(text, unit, isPower, powerType)
    local curve = CurveConstants.ScaleTo100
    local pct, alpha, full
    if isPower then
        pct = UnitPowerPercent(unit, powerType, false, curve)
        if partCurve then
            alpha = UnitPowerPercent(unit, powerType, false, partCurve)
            full  = UnitPowerPercent(unit, powerType, false, fullCurve)
        end
    else
        pct = UnitHealthPercent(unit, true, curve)
        if partCurve then
            alpha = UnitHealthPercent(unit, true, partCurve)
            full  = UnitHealthPercent(unit, true, fullCurve)
        end
    end
    text:SetFormattedText("%.1f", pct)
    if partCurve then
        text:SetAlpha(alpha)
        local twin = FullText(text)
        twin:SetAlpha(full)
        twin:Show()
    end
end

local function ShowPercent(bar)
    local info, text = percentBars[bar], bar.TextString
    if not (info and text) then return end
    if bar.LeftText  then bar.LeftText:Hide()  end
    if bar.RightText then bar.RightText:Hide() end

    local unit = bar.unit or info.unit
    if not unit then
        text:Hide()
        return
    end
    ns.SetPercentText(text, unit, info.power, bar.powerType)
    text:Show()
end

-- Call after styling the bar text (the twin copies its font).
function ns.PercentText(bar, isPower, unit)
    if not (bar and CurveConstants and UnitHealthPercent) or percentBars[bar] then return end
    percentBars[bar] = { power = isPower, unit = unit }
    if partCurve and bar.TextString then FullText(bar.TextString):Hide() end
    ns.Hook(bar, "UpdateTextString", ShowPercent)
end

--------------------------------------------------------------------------------
-- Shared visibility engine (Action Bars, Micro Menu, Bag Bar, XP/Rep bars).
-- Entry: { frames, buttons?, getMode, grid?, flyout?, onRefresh? }. Frames
-- are faded with alpha, hidden buttons stop taking clicks (out of combat).
-- A small watcher runs only while a mouseover entry is shown.
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
local visShown     = {}
local forced       = {} -- editMode / grid
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
    return 0
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
    if e.buttons then
        for _, b in ipairs(e.buttons) do b:HookScript("OnEnter", onEnter) end
    end
end

-- Clicks only where the entry can be seen.
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
        -- Mouseover entries still under the cursor stay visible.
        for _, e in ipairs(visEntries) do
            if VisMode(e) == VIS.MOUSEOVER and IsHovered(e) then OnEnterEntry(e) end
        end
    end
end

local function ReadSkyriding()
    local _, canGlide = C_PlayerInfo.GetGlidingInfo()
    return not ns.IsSecret(canGlide) and canGlide and true or false
end

local visInitialized = false
local function InitVisibility()
    visInitialized = true
    skyriding = ReadSkyriding()

    -- Everything is shown in Edit Mode, action bars also while dragging a spell.
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

-- Registers an entry and applies its mode.
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
--   info = {
--       title    = "Page title",
--       main     = true,                     -- options on the main page
--       defaults = { key = value, ... },
--       options  = {
--           { header = "Section" },
--           { key, label, tooltip, bullets = { ... }, reload = true,
--             slider = { min, max, step, suffix } | dropdown = list or func },
--       },
--   }
--   Sections (by header) and the options inside them are listed
--   alphabetically.
--   Optional methods: module:OnEnable(), module:OnOptionChanged(key, value),
--                     module:Migrate(db, saved) (convert old saved values;
--                     saved = every module's table, old modules included).
--------------------------------------------------------------------------------
function ns:RegisterModule(key, info)
    info.key = key
    self.modules[#self.modules + 1] = info
    return info
end

-- Migration helper: newKey takes the value of older options (booleans: on if
-- any was on; other types: the first saved).
function ns.MergeOptions(db, newKey, old, ...)
    if db[newKey] ~= nil or not old then return end
    local value
    for i = 1, select("#", ...) do
        local v = old[(select(i, ...))]
        if type(v) == "boolean" then
            value = value or v
        elseif v ~= nil and value == nil then
            value = v
        end
    end
    if value ~= nil then db[newKey] = value end
end

--------------------------------------------------------------------------------
-- Saved variables: migrations first, then unknown keys and wrong types are
-- dropped and missing values get their defaults.
--------------------------------------------------------------------------------
local function InitDB()
    PanzaUI_DB = PanzaUI_DB or {}
    local saved = PanzaUI_DB

    for _, m in ipairs(ns.modules) do
        saved[m.key] = saved[m.key] or {}
        if m.Migrate then m:Migrate(saved[m.key], saved) end
    end

    local known = {}
    for _, m in ipairs(ns.modules) do known[m.key] = true end
    for k in pairs(saved) do
        if not known[k] then saved[k] = nil end
    end

    for _, m in ipairs(ns.modules) do
        local db = saved[m.key]
        for k in pairs(db) do
            if m.defaults[k] == nil then db[k] = nil end
        end
        for k, v in pairs(m.defaults) do
            if type(db[k]) ~= type(v) then db[k] = v end
        end
        m.db = db
    end
end

--------------------------------------------------------------------------------
-- Settings panel (modern Settings API)
--------------------------------------------------------------------------------
-- Reload UI button next to Blizzard's "Defaults", only on PanzaUI's pages.
local reloadButton

local function IsOwnCategory(category)
    if not (category and ns.category) then return false end
    if category == ns.category then return true end
    local parent = category.GetParentCategory and category:GetParentCategory()
    return parent == ns.category
end

local function UpdateReloadButton(_, category)
    local list = SettingsPanel.GetSettingsList and SettingsPanel:GetSettingsList()
    local header = list and list.Header
    local defaults = header and header.DefaultsButton
    if not defaults then return end
    if not reloadButton then
        reloadButton = CreateFrame("Button", nil, header, "UIPanelButtonTemplate")
        reloadButton:SetSize(defaults:GetSize())
        reloadButton:SetPoint("RIGHT", defaults, "LEFT", -8, 0)
        reloadButton:SetText("Reload UI")
        reloadButton:SetScript("OnClick", ReloadUI)
        reloadButton:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            GameTooltip:SetText("Reload the interface to apply changes.")
            GameTooltip:Show()
        end)
        reloadButton:SetScript("OnLeave", GameTooltip_Hide)
    end
    reloadButton:SetShown(IsOwnCategory(category))
end

-- Tooltip: summary, bullets (alphabetical) and reload note.
local function ByText(a, b)
    return a:lower() < b:lower()
end

local function BuildTooltip(opt)
    local text = opt.tooltip or ""
    if opt.bullets then
        local bullets = CopyTable(opt.bullets)
        table.sort(bullets, ByText)
        for _, line in ipairs(bullets) do text = text .. "\n• " .. line end
    end
    if opt.reload then text = text .. "\n\n" .. RED_FONT_COLOR:WrapTextInColorCode("Requires Reload UI.") end
    return text
end

-- Checkbox, slider or dropdown, by the option's fields; the setting type
-- follows the default value. Dropdown data is built once per list.
local dropdownData = setmetatable({}, { __mode = "k" })

local function DropdownData(list)
    local data = dropdownData[list]
    if not data then
        local container = Settings.CreateControlTextContainer()
        for _, o in ipairs(list) do container:Add(o[1], o[2], o[3]) end
        data = container:GetData()
        dropdownData[list] = data
    end
    return data
end

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

    local tooltip = BuildTooltip(opt)
    if opt.dropdown then
        local function GetOptions()
            return DropdownData(type(opt.dropdown) == "function" and opt.dropdown() or opt.dropdown)
        end
        return Settings.CreateDropdown(category, setting, GetOptions, tooltip)
    end
    if not opt.slider then
        return Settings.CreateCheckbox(category, setting, tooltip)
    end
    local sl = opt.slider
    local sliderOptions = Settings.CreateSliderOptions(sl.min, sl.max, sl.step or 1)
    sliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
        return value .. (sl.suffix or "")
    end)
    return Settings.CreateSlider(category, setting, sliderOptions, tooltip)
end

local function ByLabel(a, b)
    return a.label:lower() < b.label:lower()
end

local function BuildSettings()
    local category, layout = Settings.RegisterVerticalLayoutCategory("|cff00FF98Panza|rUI")
    local version = C_AddOns.GetAddOnMetadata(addonName, "Version") or ""
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer("Version: " .. version))

    -- Sections and options are listed alphabetically.
    local function AddOptions(cat, lay, m)
        local sections, current = {}, { options = {} }
        sections[1] = current
        for _, opt in ipairs(m.options) do
            if opt.header then
                current = { header = opt.header, label = opt.header, options = {} }
                sections[#sections + 1] = current
            else
                current.options[#current.options + 1] = opt
            end
        end
        local untitled = table.remove(sections, 1)
        table.sort(sections, ByLabel)
        table.insert(sections, 1, untitled)

        for _, section in ipairs(sections) do
            if section.header then
                lay:AddInitializer(CreateSettingsListSectionHeaderInitializer(section.header))
            end
            table.sort(section.options, ByLabel)
            for _, opt in ipairs(section.options) do AddOption(cat, m, opt) end
        end
    end

    -- Main modules on the main page, the others on their own page.
    local sorted = {}
    for _, m in ipairs(ns.modules) do
        if m.main then AddOptions(category, layout, m) else sorted[#sorted + 1] = m end
    end
    table.sort(sorted, function(a, b) return a.title < b.title end)

    for _, m in ipairs(sorted) do
        local sub, subLayout = Settings.RegisterVerticalLayoutSubcategory(category, m.title)
        AddOptions(sub, subLayout, m)
    end

    Settings.RegisterAddOnCategory(category)
    ns.category = category
    if SettingsPanel then
        ns.Hook(SettingsPanel, SettingsPanel.DisplayCategory and "DisplayCategory" or "SelectCategory", UpdateReloadButton)
    end
end

--------------------------------------------------------------------------------
-- Boot
--------------------------------------------------------------------------------
local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:RegisterEvent("PLAYER_LOGIN")
loader:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" then
        if arg1 ~= addonName then return end
        self:UnregisterEvent(event)
        InitDB()
        ns.textStyle = PanzaUI_DB.General.textStyle
        BuildSettings()
    else -- PLAYER_LOGIN
        self:UnregisterEvent(event)
        -- After a /reload in combat, modules wait until combat ends.
        if InCombatLockdown() then
            self:RegisterEvent("PLAYER_REGEN_ENABLED")
            return
        end
        local handler = geterrorhandler()
        for _, m in ipairs(ns.modules) do
            if m.OnEnable then
                xpcall(m.OnEnable, handler, m)
            end
        end
    end
end)

-- Memory report: PanzaUI memory before and after a garbage collection.
local function MemoryReport()
    local GetMemory = GetAddOnMemoryUsage or (C_AddOns and C_AddOns.GetAddOnMemoryUsage)
    if not GetMemory then return end
    UpdateAddOnMemoryUsage()
    local before = GetMemory(addonName)
    collectgarbage("collect")
    UpdateAddOnMemoryUsage()
    ns.Print(format("memory %.0f KB, %.0f KB after garbage collection.", before, GetMemory(addonName)))
end

-- /pui: options. /pui mem: memory report.
SLASH_PANZAUI1 = "/pui"
SlashCmdList.PANZAUI = function(msg)
    if msg and msg:lower():find("^%s*mem") then
        MemoryReport()
    else
        Settings.OpenToCategory(ns.category:GetID())
    end
end

-- Shortcuts: /rl Reload UI, /rc ready check, /pl 10 second pull timer.
SLASH_PANZAUI_RL1 = "/rl"
SlashCmdList.PANZAUI_RL = ReloadUI

SLASH_PANZAUI_RC1 = "/rc"
SlashCmdList.PANZAUI_RC = function() DoReadyCheck() end

SLASH_PANZAUI_PL1 = "/pl"
SlashCmdList.PANZAUI_PL = function() C_PartyInfo.DoCountdown(10) end
