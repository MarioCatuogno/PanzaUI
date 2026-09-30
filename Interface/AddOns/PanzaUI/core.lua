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

-- Keeps the current font and size, only changes the flags.
function ns.StyleFont(obj)
    if not (obj and obj.GetFont) then return end
    local font, size = obj:GetFont()
    if font and not ns.IsSecret(size) then obj:SetFont(font, size, ns.FONT_FLAGS) end
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

    local w, h  = icon:GetSize()
    local scale = w / 45
    local info  = C_Texture.GetAtlasInfo(ICON_MASK)

    local mask = parent:CreateMaskTexture()
    mask:SetAtlas(ICON_MASK)
    mask:SetPoint("CENTER", icon)
    if info then mask:SetSize(info.width * scale, info.height * scale) else mask:SetAllPoints(icon) end
    icon:AddMaskTexture(mask)

    local frame = parent:CreateTexture(nil, "OVERLAY", nil, -1) -- below other overlays (dispel border, ...)
    frame:SetAtlas(ICON_FRAME)
    frame:SetPoint("TOPLEFT", icon)
    frame:SetSize(w * 46 / 45, h)
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
-- Module registry
--   info = { title, defaults = { key = value, ... },
--            options = { { header = "Section" }, { key, label, tooltip [, slider | dropdown] }, ... } }
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
-- or dropdown (opt.dropdown = { { value, label [, tooltip] }, ... }).
local function AddOption(category, m, opt)
    local key = opt.key
    local varType = (opt.slider or opt.dropdown) and Settings.VarType.Number or Settings.VarType.Boolean
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
            for _, o in ipairs(opt.dropdown) do container:Add(o[1], o[2], o[3]) end
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
    AddReloadButton(layout)

    -- Menu pages in alphabetical order (load order of the modules is unchanged).
    local sorted = CopyTable(ns.modules, true)
    table.sort(sorted, function(a, b) return a.title < b.title end)

    for _, m in ipairs(sorted) do
        local sub, subLayout = Settings.RegisterVerticalLayoutSubcategory(category, m.title)

        for _, opt in ipairs(m.options) do
            if opt.header then
                subLayout:AddInitializer(CreateSettingsListSectionHeaderInitializer(opt.header))
            else
                AddOption(sub, m, opt)
            end
        end
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
