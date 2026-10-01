--[[----------------------------------------------------------------------------
    PanzaUI - General (main settings page)
    Style: the shared text style used by every module.
    Textures: bar textures (SharedMedia or PanzaUI's own) for unit frames,
    cast bars, Cooldown Manager, Damage Meter and the other interface bars.
------------------------------------------------------------------------------]]
local _, ns = ...

local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)
local DEFAULT = ""

-- PanzaUI bar textures, also registered in SharedMedia for other addons.
local MEDIA = [[Interface\AddOns\PanzaUI\Media\Statusbar\]]
local PANZA = {
    ["PanzaUI - General"] = MEDIA .. "PanzaUI_general.tga",
    ["PanzaUI - Glass"]   = MEDIA .. "PanzaUI_glass.tga",
    ["PanzaUI - Player"]  = MEDIA .. "PanzaUI_player.tga",
    ["PanzaUI - Target"]  = MEDIA .. "PanzaUI_target.tga",
    ["PanzaUI - Focus"]   = MEDIA .. "PanzaUI_focus.tga",
    ["PanzaUI - Party"]   = MEDIA .. "PanzaUI_party.tga",
    ["PanzaUI - Damage Meter"] = MEDIA .. "PanzaUI_damagemeter.tga",
    ["PanzaUI - PRD"]     = MEDIA .. "PanzaUI_prd.tga",
    ["PanzaUI - Absorb"]  = MEDIA .. "PanzaUI_absorb.tga",
    ["PanzaUI - Cast Bar"] = MEDIA .. "PanzaUI_castbar.tga",
    ["PanzaUI - Cast Bar (Full)"] = MEDIA .. "PanzaUI_castbar_full.tga",
}

-- Used when SharedMedia is not installed.
local BUILTIN = {
    ["Blizzard"] = [[Interface\TargetingFrame\UI-StatusBar]],
    ["Solid"]    = [[Interface\Buttons\WHITE8X8]],
}
for name, path in pairs(PANZA) do
    BUILTIN[name] = path
    if LSM then LSM:Register("statusbar", name, path) end
end

-- Blizzard atlases usable as bar textures (not registered in SharedMedia,
-- which expects file paths).
local ATLASES = {
    ["Blizzard Cooldown Manager"] = "UI-HUD-CoolDownManager-Bar",
}

-- Dropdown list, shared by every texture option: built once, and again only
-- when another addon registers a new bar texture.
local textureList
if LSM then
    LSM.RegisterCallback("PanzaUI", "LibSharedMedia_Registered", function(_, mediaType)
        if mediaType == "statusbar" then textureList = nil end
    end)
end

local function TextureList()
    if textureList then return textureList end
    local names = {}
    if LSM then
        for _, name in ipairs(LSM:List("statusbar")) do names[#names + 1] = name end
    else
        for name in pairs(BUILTIN) do names[#names + 1] = name end
    end
    for name, atlas in pairs(ATLASES) do
        if C_Texture.GetAtlasInfo(atlas) then names[#names + 1] = name end
    end
    table.sort(names)

    local list = { { DEFAULT, "Blizzard UI (unchanged)" } }
    for _, name in ipairs(names) do list[#list + 1] = { name, name } end
    textureList = list
    return list
end

--------------------------------------------------------------------------------
-- Options: the shared text style and one texture per bar group (listed
-- alphabetically by the core).
--------------------------------------------------------------------------------
-- old: option keys merged into this one (see Migrate).
local UNIT_BARS = {
    { key = "texFocus",      label = "Focus",                     tooltip = "Texture for the Focus health and power bars." },
    { key = "texGroup",      label = "Party/Raid",                tooltip = "Texture for the party and raid health and power bars." },
    { key = "texPlayerPet",  label = "Player & Pet",              tooltip = "Texture for the health and power bars of these frames.",
      bullets = { "Player", "Pet" }, old = { "texPlayer", "texPet" } },
    { key = "texTargetBoss", label = "Target & Boss",             tooltip = "Texture for the health and power bars of these frames.",
      bullets = { "Target", "Boss frames" }, old = { "texTarget", "texBoss" } },
}

local OTHER_BARS = {
    { key = "texCastBar",      label = "Cast Bars",              tooltip = "Texture for the Player, Target, Focus and Boss cast bars, in Blizzard's cast colors." },
    { key = "texCdmPRD",       label = "Cooldown Manager & PRD", tooltip = "Texture for the bars of these frames.",
      bullets = { "Cooldown Manager tracked bars", "Personal Resource Display" }, old = { "texPRD", "texCooldownBars" } },
    { key = "texDamageMeter",  label = "Damage Meter",           tooltip = "Texture for the Damage Meter bars." },
    { key = "texInterface",    label = "Interface bars",         tooltip = "Texture for the progress bars of the interface.",
      bullets = { "Achievements", "Experience/Reputation bar", "Quest Tracker", "Reputation panel", "Tooltips" },
      old = { "texAchievements", "texTracking", "texQuestTracker", "texRepPanel", "texTooltips" } },
}

local defaults = { textStyle = true }
local options  = {
    { header = "Style" },
    { key = "textStyle", label = "Refined text", reload = true,
      tooltip = "Polish the look of text across the whole UI.",
      bullets = { "Outlined, sharper text" } },
}
local function AddTextureOptions(header, list)
    options[#options + 1] = { header = header }
    for _, o in ipairs(list) do
        defaults[o.key] = DEFAULT
        options[#options + 1] = { key = o.key, label = o.label, tooltip = o.tooltip, bullets = o.bullets,
            dropdown = TextureList, reload = true }
    end
end
AddTextureOptions("Textures - Unit Frames", UNIT_BARS)
AddTextureOptions("Textures - Other Bars", OTHER_BARS)

local GEN = ns:RegisterModule("General", { title = "General", main = true, defaults = defaults, options = options })

-- Converts the saved values of older versions.
function GEN:Migrate(db, saved)
    if type(db.barTexture) == "string" then
        for _, g in ipairs(UNIT_BARS) do
            if db[g.key] == nil then db[g.key] = db.barTexture end
        end
    end
    for k, v in pairs(db) do
        if v == "PanzaUI" then db[k] = "PanzaUI - Glass" end
    end
    for _, list in ipairs({ UNIT_BARS, OTHER_BARS }) do
        for _, g in ipairs(list) do
            if g.old and db[g.key] == nil then
                for _, oldKey in ipairs(g.old) do
                    local v = db[oldKey]
                    if type(v) == "string" and (db[g.key] == nil or db[g.key] == DEFAULT) then db[g.key] = v end
                end
            end
        end
    end
    local combat = saved and saved.PersonalResource
    if db.texCastBar == nil and combat and combat.castStyle ~= nil then
        db.texCastBar = combat.castStyle and "PanzaUI - Cast Bar" or DEFAULT
    end
    if db.textStyle == nil and saved then
        local found, on = false, false
        for name, t in pairs(saved) do
            if name ~= "General" and type(t) == "table" then
                for k, v in pairs(t) do
                    if type(v) == "boolean" and type(k) == "string" and k:lower():find("style$") then
                        found, on = true, on or v
                    end
                end
            end
        end
        if found then db.textStyle = on end
    end
end

--------------------------------------------------------------------------------
-- Applying textures (widget calls only, no Blizzard fields written).
--------------------------------------------------------------------------------
local powerBars = {}

local function TexturePath(key)
    local name = GEN.db[key]
    if name == DEFAULT then return end
    return ATLASES[name] or (LSM and LSM:Fetch("statusbar", name, true)) or BUILTIN[name]
end

-- Sets a bar texture keeping Blizzard's draw layer, so overlays drawn above
-- the fill stay on top (secret layers are left as they are).
local function SetTexture(bar, path)
    if not (bar and path and bar.SetStatusBarTexture) or bar:IsForbidden() then return end
    local fill = bar:GetStatusBarTexture()
    local layer, sublevel
    if fill then layer, sublevel = fill:GetDrawLayer() end
    if ns.IsSecret(layer) or ns.IsSecret(sublevel) then layer = nil end
    bar:SetStatusBarTexture(path)
    fill = bar:GetStatusBarTexture()
    if fill and layer then fill:SetDrawLayer(layer, sublevel) end
end

-- Frames that put their atlas back on the fill (e.g. Target on every target
-- change) get the texture again right after.
local keptTextures = {}
local function KeepTexture(bar, path)
    local texture = bar and path and bar.GetStatusBarTexture and bar:GetStatusBarTexture()
    if not texture or keptTextures[texture] then return end
    keptTextures[texture] = true
    hooksecurefunc(texture, "SetAtlas", function() SetTexture(bar, path) end)
end

-- Power spend/gain flash: same texture, tinted like the bar.
local function KeepFeedback(bar, path)
    local feedback = bar and path and bar.FeedbackFrame
    local texture = feedback and feedback.BarTexture
    if not texture or keptTextures[texture] then return end
    keptTextures[texture] = true
    local busy
    local function Reapply()
        if busy then return end
        busy = true
        texture:SetTexture(path)
        texture:SetVertexColor(bar:GetStatusBarColor())
        busy = false
    end
    hooksecurefunc(texture, "SetAtlas", Reapply)
    hooksecurefunc(texture, "SetTexture", Reapply)
    hooksecurefunc(texture, "SetVertexColor", Reapply)
    Reapply()
end

--------------------------------------------------------------------------------
-- Bars colored by their atlas (experience, reputation, honor...): the texture
-- replaces the atlas and the bar is tinted with the color the atlas name
-- stands for (cached per name).
--------------------------------------------------------------------------------
local ATLAS_COLORS = { -- first match wins
    { "rested",   0.00, 0.39, 0.88 },
    { "renown",   0.00, 0.55, 0.90 },
    { "red",      0.80, 0.13, 0.13 },
    { "orange",   0.93, 0.45, 0.10 },
    { "yellow",   0.95, 0.80, 0.10 },
    { "green",    0.00, 0.70, 0.20 },
    { "blue",     0.20, 0.50, 0.95 },
    { "purple",   0.60, 0.30, 0.90 },
    { "honor",    1.00, 0.24, 0.00 },
    { "artifact", 0.90, 0.80, 0.50 },
    { "azerite",  0.90, 0.80, 0.50 },
    { "xp",       0.58, 0.00, 0.55 },
    { "experience", 0.58, 0.00, 0.55 },
}

local atlasColors = {}
local function AtlasColor(atlas)
    -- Secret names are never used as cache keys.
    if ns.IsSecret(atlas) or type(atlas) ~= "string" then return end
    local cached = atlasColors[atlas]
    if cached ~= nil then return cached or nil end
    local name = atlas:lower()
    name = name:match("fill%-(.+)") or name
    local found = false
    for _, c in ipairs(ATLAS_COLORS) do
        if name:find(c[1], 1, true) then found = c break end
    end
    atlasColors[atlas] = found
    return found or nil
end

-- The original atlas (with shaped ends) is kept as a mask, so the new texture
-- has the same shape. Plain bars inside a separate border get a square mask
-- inset by `inset` pixels instead.
local trackedBars = {}
local function TrackTexture(bar, path, inset)
    if not (bar and path and bar.SetStatusBarTexture) or trackedBars[bar] then return end
    trackedBars[bar] = true

    local mask, masked = nil, {}
    if inset then
        mask = bar:CreateMaskTexture()
        mask:SetTexture([[Interface\Buttons\WHITE8X8]], "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
        mask:SetPoint("TOPLEFT", inset, -inset)
        mask:SetPoint("BOTTOMRIGHT", -inset, inset)
        if bar.Background then bar.Background:AddMaskTexture(mask) end
    end
    local function EnsureMask(atlas)
        if not mask and not ns.IsSecret(atlas) and type(atlas) == "string" and C_Texture.GetAtlasInfo(atlas) then
            mask = bar:CreateMaskTexture()
            mask:SetAtlas(atlas)
            mask:SetAllPoints(bar)
        end
        local fill = bar:GetStatusBarTexture()
        if mask and fill and not masked[fill] then
            fill:AddMaskTexture(mask)
            masked[fill] = true
        end
    end

    local original = bar:GetStatusBarTexture()
    local layer, sublevel
    if original then layer, sublevel = original:GetDrawLayer() end

    local busy
    local function Reapply(atlas)
        if busy then return end
        busy = true
        EnsureMask(atlas)
        bar:SetStatusBarTexture(path)
        local fill = bar:GetStatusBarTexture()
        if fill and layer then fill:SetDrawLayer(layer, sublevel) end
        EnsureMask()
        local c = AtlasColor(atlas)
        if c then bar:SetStatusBarColor(c[2], c[3], c[4]) end
        busy = false
    end

    local texture = bar:GetStatusBarTexture()
    Reapply(texture and texture.GetAtlas and texture:GetAtlas())
    hooksecurefunc(bar, "SetStatusBarTexture", function(_, asset) Reapply(asset) end)
    if texture then hooksecurefunc(texture, "SetAtlas", function(_, atlas) Reapply(atlas) end) end
end

-- Unit frame power bars: texture back and colored by power type after
-- Blizzard's update.
local function UpdatePowerBar(bar)
    local path = powerBars[bar]
    if not path then return end
    SetTexture(bar, path)
    local token = bar.powerToken
    local info = bar.overrideInfo or (token and not ns.IsSecret(token) and PowerBarColor[token])
    if info and info.r then bar:SetStatusBarColor(info.r, info.g, info.b) end
end

local function UnitFrameBars(frame)
    local main = frame.TargetFrameContent and frame.TargetFrameContent.TargetFrameContentMain
    if main then return main.HealthBarsContainer.HealthBar, main.ManaBar end
    local container = frame.HealthBarContainer or frame.HealthBarsContainer
    local health = container and (container.HealthBar or container.healthBar) or frame.healthbar or frame.HealthBar
    return health, frame.ManaBar or frame.manabar
end

local function SkinBars(health, power, path)
    if not path then return end
    SetTexture(health, path)
    KeepTexture(health, path)
    if power then
        powerBars[power] = path
        UpdatePowerBar(power)
    end
end

-- UnitFrameBars() returns two values: it must be the last argument.
local function SkinFrame(frame, path)
    if not (frame and path) then return end
    local health, power = UnitFrameBars(frame)
    SkinBars(health, power, path)
end

--------------------------------------------------------------------------------
-- Cast bars: after Blizzard sets the fill atlas of a cast and resets its
-- color, the texture is put back and tinted with the cast type's color.
--------------------------------------------------------------------------------
local CAST_COLORS = { -- first match wins
    { "uninterrupt", 0.60, 0.60, 0.60 },
    { "interrupt",   0.85, 0.15, 0.15 },
    { "channel",     0.25, 0.80, 0.35 },
    { "empower",     0.30, 0.60, 1.00 },
    { "craft",       0.95, 0.55, 0.10 },
    { "",            1.00, 0.72, 0.10 }, -- standard cast
}
local castColors = {}

local function CastColor(asset)
    local color = castColors[asset]
    if color then return color end
    local name = asset:lower()
    for _, c in ipairs(CAST_COLORS) do
        if name:find(c[1], 1, true) then color = c break end
    end
    castColors[asset] = color
    return color
end

local castTexture, castBusy
local castBarColor = {}

local function KeepCastColor(bar)
    local c = castBarColor[bar]
    if castBusy or not c then return end
    castBusy = true
    bar:SetStatusBarColor(c[2], c[3], c[4])
    castBusy = false
end

-- Cast type from the bar type, or else from the atlas name. Midnight: casts
-- of other units can be secret in combat and keep Blizzard's own fill.
local function KeepCastTexture(bar, asset)
    if castBusy then return end
    local kind = bar.barType
    if ns.IsSecret(kind) or type(kind) ~= "string" then kind = asset end
    if ns.IsSecret(kind) or type(kind) ~= "string" then
        castBarColor[bar] = nil
        return
    end
    castBusy = true
    SetTexture(bar, castTexture)
    castBusy = false
    castBarColor[bar] = CastColor(kind)
    KeepCastColor(bar)
end

local function SkinCastBar(bar)
    hooksecurefunc(bar, "SetStatusBarTexture", KeepCastTexture)
    hooksecurefunc(bar, "SetStatusBarColor", KeepCastColor)
end


--------------------------------------------------------------------------------
-- Text style for Blizzard texts no other module handles: the framerate
-- counter (Ctrl+R).
--------------------------------------------------------------------------------
local function StyleBlizzardTexts()
    local fps = FramerateFrame
    if fps then
        ns.StyleFont(fps.Label)
        ns.StyleFont(fps.FramerateText)
    end
    ns.StyleFont(FramerateLabel) -- older global names
    ns.StyleFont(FramerateText)
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function GEN:OnEnable()
    if ns.textStyle then StyleBlizzardTexts() end
    local player, target, focus = TexturePath("texPlayerPet"), TexturePath("texTargetBoss"), TexturePath("texFocus")
    local pet, boss, group = player, target, TexturePath("texGroup")
    local interface = TexturePath("texInterface")

    SkinBars(PlayerFrame_GetHealthBar(), PlayerFrame_GetManaBar(), player)
    SkinBars(PetFrameHealthBar, PetFrameManaBar, pet)
    if target then SkinFrame(TargetFrame, target) end
    if focus and FocusFrame then SkinFrame(FocusFrame, focus) end
    if boss then
        for i = 1, 5 do
            local frame = _G["Boss" .. i .. "TargetFrame"]
            if frame then SkinFrame(frame, boss) end
        end
    end
    if next(powerBars) then ns.Hook("UnitFrameManaBar_UpdateType", UpdatePowerBar) end

    castTexture = TexturePath("texCastBar")
    if castTexture then ns.ForEachCastBar(SkinCastBar) end

    local prd = TexturePath("texCdmPRD")
    if prd then
        local function SkinPRD()
            local frame = PersonalResourceDisplayFrame
            if not frame then return end
            local container = frame.HealthBarsContainer
            for _, bar in ipairs({ container and (container.healthBar or container.HealthBar), frame.PowerBar }) do
                SetTexture(bar, prd)
                KeepTexture(bar, prd)
            end
            KeepFeedback(frame.PowerBar, prd)
            -- Alternate power bar: atlas-colored, set up again on spec changes.
            local function SkinAlt(f) TrackTexture(f.AlternatePowerBar, prd) end
            SkinAlt(frame)
            ns.Hook(frame, "SetupAlternatePowerBar", SkinAlt)
        end
        if PersonalResourceDisplayFrame then
            SkinPRD()
        else
            EventUtil.ContinueOnAddOnLoaded("Blizzard_PersonalResourceDisplay", SkinPRD)
        end
    end

    -- Reputation panel (scrolling list).
    local repPanel = interface
    local scrollBox = ReputationFrame and ReputationFrame.ScrollBox
    if repPanel and scrollBox and ScrollUtil then
        ScrollUtil.AddInitializedFrameCallback(scrollBox, ns.ScrollFrameCallback(function(entry)
            local content = entry.Content or entry
            TrackTexture(content.ReputationBar or entry.ReputationBar, repPanel, 2)
        end), self, true)
    end

    -- Achievement window: bars scanned when it opens, plus the criteria bars.
    local achievements = interface
    if achievements then
        local function Scan(frame)
            for _, child in ipairs({ frame:GetChildren() }) do
                if child:IsObjectType("StatusBar") then TrackTexture(child, achievements, 2) end
                Scan(child)
            end
        end
        EventUtil.ContinueOnAddOnLoaded("Blizzard_AchievementUI", function()
            AchievementFrame:HookScript("OnShow", Scan)
            ns.Hook(AchievementFrameAchievementsObjectives, "GetProgressBar", function(objectives)
                local bars = objectives.progressBars
                if not bars then return end
                for _, bar in pairs(bars) do
                    if type(bar) == "table" and bar.IsObjectType and bar:IsObjectType("StatusBar") then
                        TrackTexture(bar, achievements, 2)
                    end
                end
            end)
            if AchievementFrame:IsShown() then Scan(AchievementFrame) end
        end)
    end

    -- Quest Tracker: progress and timer bars from each module's pool.
    local questTracker = interface
    if questTracker then
        local function TrackPool(pool)
            if not pool then return end
            for _, bar in pairs(pool) do
                if type(bar) == "table" then TrackTexture(bar.Bar or bar, questTracker) end
            end
        end
        EventUtil.ContinueOnAddOnLoaded("Blizzard_ObjectiveTracker", function()
            for _, name in ipairs({
                "ScenarioObjectiveTracker", "UIWidgetObjectiveTracker", "CampaignQuestObjectiveTracker",
                "QuestObjectiveTracker", "AdventureObjectiveTracker", "AchievementObjectiveTracker",
                "MonthlyActivitiesObjectiveTracker", "InitiativeTasksObjectiveTracker",
                "ProfessionsRecipeTracker", "BonusObjectiveTracker", "WorldQuestObjectiveTracker",
            }) do
                local module = _G[name]
                if module then
                    TrackPool(module.usedProgressBars)
                    TrackPool(module.usedTimerBars)
                    ns.Hook(module, "GetProgressBar", function(m) TrackPool(m.usedProgressBars) end)
                    ns.Hook(module, "GetTimerBar",    function(m) TrackPool(m.usedTimerBars) end)
                end
            end
        end)
    end

    -- Tooltips: progress and status bars from each tooltip's pools (inset mask).
    local tooltips = interface
    if tooltips then
        local function TrackTooltipPool(tooltip, poolKey)
            local pool = tooltip and tooltip[poolKey]
            if not pool then return end
            local active = pool.activeObjects
            if active then
                for bar in pairs(active) do TrackTexture(bar.Bar or bar, tooltips, 1) end
            elseif pool.EnumerateActive then
                for bar in pool:EnumerateActive() do TrackTexture(bar.Bar or bar, tooltips, 1) end
            end
        end
        ns.Hook("GameTooltip_ShowProgressBar", function(tooltip) TrackTooltipPool(tooltip, "progressBarPool") end)
        ns.Hook("GameTooltip_ShowStatusBar",   function(tooltip) TrackTooltipPool(tooltip, "statusBarPool") end)
    end

    -- Cooldown Manager bars (shared registry in core.lua).
    local cooldownBars = prd
    if cooldownBars then
        ns.OnCooldownItem(function(item) TrackTexture(item.Bar, cooldownBars) end)
    end

    -- Damage Meter bars (shared registry in core.lua).
    local damageMeter = TexturePath("texDamageMeter")
    if damageMeter then
        ns.OnDamageMeterEntry(function(entry) TrackTexture(entry.StatusBar, damageMeter) end)
    end

    -- Experience, reputation and honor bars (rescanned when Blizzard updates them).
    local tracking = interface
    if tracking then
        local containers = { MainStatusTrackingBarContainer, SecondaryStatusTrackingBarContainer }
        local function ScanTracking()
            for _, container in ipairs(containers) do
                local bars = container.bars
                if bars then
                    for _, bar in pairs(bars) do
                        if type(bar) == "table" then TrackTexture(bar.StatusBar, tracking) end
                    end
                end
            end
        end
        ScanTracking()
        for _, container in ipairs(containers) do
            ns.Hook(container, "UpdateBarsShown", ScanTracking)
        end
    end

    if group then
        -- Party frames: classic and compact (Blizzard resets them in its setup).
        for i = 1, 4 do
            local frame = PartyFrame and PartyFrame["MemberFrame" .. i]
            if frame then SkinFrame(frame, group) end
        end
        local function SkinCompact(frame)
            if frame:IsForbidden() then return end
            SetTexture(frame.healthBar, group)
            SetTexture(frame.powerBar, group)
        end
        ns.ForEachCompactFrame(SkinCompact)
        ns.Hook("DefaultCompactUnitFrameSetup", SkinCompact)
        ns.Hook("DefaultCompactMiniFrameSetup", SkinCompact)
    end
end
