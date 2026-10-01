--[[----------------------------------------------------------------------------
    PanzaUI - General (main settings page)
    Style: one refined text style (outlined text) for every PanzaUI module.
    Textures: health/power bar texture per frame group (incl. Personal Resource Display),
    cast bars (in Blizzard's cast colors), Reputation panel bars,
    experience/reputation tracking bars, Achievement window, Quest Tracker,
    tooltip, Cooldown Manager and Damage Meter bars, from LibSharedMedia-3.0
    (SharedMedia).
------------------------------------------------------------------------------]]
local _, ns = ...

local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)
local DEFAULT = ""        -- keep Blizzard's own textures

-- PanzaUI's own bar textures (selectable, not defaults). Bundled with the
-- addon and also registered in SharedMedia so other addons can use them (if a
-- same-named texture is already registered, that one is kept).
local MEDIA = [[Interface\AddOns\PanzaUI\Media\Statusbar\]]
local PANZA = {
    ["PanzaUI - General"] = MEDIA .. "PanzaUI_general.tga",
    ["PanzaUI - Glass"]   = MEDIA .. "PanzaUI_glass.tga",
    ["PanzaUI - Player"]  = MEDIA .. "PanzaUI_player.tga",
    ["PanzaUI - Target"]  = MEDIA .. "PanzaUI_target.tga",
    ["PanzaUI - Focus"]   = MEDIA .. "PanzaUI_focus.tga",                  -- Target with wide stripes
    ["PanzaUI - Party"]   = MEDIA .. "PanzaUI_party.tga",
    ["PanzaUI - Damage Meter"] = MEDIA .. "PanzaUI_damagemeter.tga", -- inset: stays inside the bar border
    ["PanzaUI - PRD"]     = MEDIA .. "PanzaUI_prd.tga",                   -- inset: stays inside the bar border
    ["PanzaUI - Absorb"]  = MEDIA .. "PanzaUI_absorb.tga",                -- semi-transparent (shields)
    ["PanzaUI - Cast Bar"] = MEDIA .. "PanzaUI_castbar.tga",              -- inset: stays inside the bar border
    ["PanzaUI - Cast Bar (Full)"] = MEDIA .. "PanzaUI_castbar_full.tga",  -- no inset: for other addons' bars
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

-- Blizzard atlases usable as bar textures (StatusBar:SetStatusBarTexture
-- takes atlas names). Not registered in SharedMedia: other addons expect
-- file paths there.
local ATLASES = {
    ["Blizzard Cooldown Manager"] = "UI-HUD-CoolDownManager-Bar",
}

-- Dropdown list, rebuilt each time it opens (new SharedMedia textures appear).
-- LSM's list is copied, never modified.
local function TextureList()
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
    return list
end

--------------------------------------------------------------------------------
-- Options: the shared text style and one texture per bar group (listed
-- alphabetically by the core).
--------------------------------------------------------------------------------
local UNIT_BARS = {
    { key = "texBoss",   label = "Boss frames",               tooltip = "Texture for the Boss health and power bars." },
    { key = "texFocus",  label = "Focus",                     tooltip = "Texture for the Focus health and power bars." },
    { key = "texGroup",  label = "Party/Raid",                tooltip = "Texture for the party and raid health and power bars." },
    { key = "texPRD",    label = "Personal Resource Display", tooltip = "Texture for the Personal Resource Display bars." },
    { key = "texPet",    label = "Pet",                       tooltip = "Texture for the Pet health and power bars." },
    { key = "texPlayer", label = "Player",                    tooltip = "Texture for the Player health and power bars." },
    { key = "texTarget", label = "Target",                    tooltip = "Texture for the Target health and power bars." },
}

local OTHER_BARS = {
    { key = "texAchievements", label = "Achievements",              tooltip = "Texture for the Achievements window bars." },
    { key = "texCastBar",      label = "Cast Bars",                 tooltip = "Texture for the Player, Target, Focus and Boss cast bars, in Blizzard's cast colors." },
    { key = "texCooldownBars", label = "Cooldown Manager",          tooltip = "Texture for the Cooldown Manager tracked bars." },
    { key = "texDamageMeter",  label = "Damage Meter",              tooltip = "Texture for the Damage Meter bars." },
    { key = "texTracking",     label = "Experience/Reputation bar", tooltip = "Texture for the experience, reputation and honor bars." },
    { key = "texQuestTracker", label = "Quest Tracker",             tooltip = "Texture for the Quest Tracker progress bars." },
    { key = "texRepPanel",     label = "Reputation panel",          tooltip = "Texture for the Reputation panel bars." },
    { key = "texTooltips",     label = "Tooltips",                  tooltip = "Texture for the progress bars inside tooltips." },
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
        options[#options + 1] = { key = o.key, label = o.label, tooltip = o.tooltip,
            dropdown = TextureList, reload = true }
    end
end
AddTextureOptions("Textures - Unit Frames", UNIT_BARS)
AddTextureOptions("Textures - Other Bars", OTHER_BARS)

local GEN = ns:RegisterModule("General", { title = "General", main = true, defaults = defaults, options = options })

-- 2.0.49 had a single texture for every frame: keep it for each group.
-- Up to 2.0.110 the only own texture was "PanzaUI": now "PanzaUI - Glass".
function GEN:Migrate(db, saved)
    if type(db.barTexture) == "string" then
        for _, g in ipairs(UNIT_BARS) do
            if db[g.key] == nil then db[g.key] = db.barTexture end
        end
    end
    for k, v in pairs(db) do
        if v == "PanzaUI" then db[k] = "PanzaUI - Glass" end
    end
    -- 2.0.153 applied the cast bar texture from Combat's cast bar style.
    local combat = saved and saved.PersonalResource
    if db.texCastBar == nil and combat and combat.castStyle ~= nil then
        db.texCastBar = combat.castStyle and "PanzaUI - Cast Bar" or DEFAULT
    end
    -- Up to 2.0.159 each module's refined style had its own outlined text:
    -- on if any of them was on (default when none was saved).
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
-- Applying textures. Only widget calls, no Blizzard fields written.
--------------------------------------------------------------------------------
local powerBars = {} -- Blizzard unit frame power bar -> texture path

local function TexturePath(key)
    local name = GEN.db[key]
    if name == DEFAULT then return end
    return ATLASES[name] or (LSM and LSM:Fetch("statusbar", name, true)) or BUILTIN[name]
end

-- The fill keeps Blizzard's draw layer: a new texture would go to the default
-- layer and could cover things drawn above the original fill at the same
-- frame level (e.g. the dispel icon on party/raid frames). Midnight: bars
-- showing secret data (e.g. enemy cast bars in combat) can return a secret
-- draw layer; it can't be passed back, and the layer is then left as is.
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

-- Some frames put their atlas back on the bar texture object (e.g. Target,
-- Focus and Boss frames on every target change, in CheckClassification):
-- re-apply our texture right after. The hook fires only for Lua SetAtlas
-- calls, so our own SetStatusBarTexture can't loop.
local keptTextures = {}
local function KeepTexture(bar, path)
    local texture = bar and path and bar.GetStatusBarTexture and bar:GetStatusBarTexture()
    if not texture or keptTextures[texture] then return end
    keptTextures[texture] = true
    hooksecurefunc(texture, "SetAtlas", function() SetTexture(bar, path) end)
end

-- Power spend/gain flash (FeedbackFrame, e.g. on the part of energy just
-- spent): Blizzard draws it with the power type's own atlas. Our texture goes
-- there too, tinted like the bar. A busy flag stops our own calls from
-- re-entering the hooks.
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
-- Bars colored by their atlas (experience, reputation, honor...): when
-- Blizzard sets an atlas, our texture replaces it and the bar is tinted with
-- the color that atlas stood for (read from its name). Bars colored with
-- SetStatusBarColor keep Blizzard's color. A busy flag stops our own
-- SetStatusBarTexture from re-entering the hook.
--------------------------------------------------------------------------------
local ATLAS_COLORS = { -- order matters: first match wins
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

-- Results are cached per atlas name (a handful of names): the string work
-- runs once per atlas, not on every Blizzard update.
local atlasColors = {} -- atlas -> color entry or false
local function AtlasColor(atlas)
    -- Secret names are never used as cache keys (each one would be a new key).
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

-- Blizzard's fill atlas has shaped (angled/rounded) ends that fit the bar
-- border; a plain texture would spill over them. The original atlas is used
-- as a mask over the whole bar, so the new texture keeps the same shape.
-- Bars with a plain (non-atlas) texture inside a separate border, like the
-- Reputation panel bars, get a square mask inset by `inset` pixels instead,
-- applied to the fill and to the black background, so nothing shows outside
-- the border.
local trackedBars = {}
local function TrackTexture(bar, path, inset)
    if not (bar and path and bar.SetStatusBarTexture) or trackedBars[bar] then return end
    trackedBars[bar] = true

    -- The mask is created from the first Blizzard atlas seen: at tracking time
    -- or later (reused list entries can get their atlas after we hook them).
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

    -- Keep the fill on Blizzard's original draw layer, so overlays like the
    -- tick separators of tooltip bars stay on top of it.
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

-- Blizzard unit frames color power bars with per-power atlases (white bar
-- color): after its update, put our texture back and color it by power type.
local function UpdatePowerBar(bar)
    local path = powerBars[bar]
    if not path then return end
    SetTexture(bar, path)
    local token = bar.powerToken
    local info = bar.overrideInfo or (token and not ns.IsSecret(token) and PowerBarColor[token])
    if info and info.r then bar:SetStatusBarColor(info.r, info.g, info.b) end
end

-- Health + power bar of a Blizzard unit frame (Target/Focus/Boss/Party style).
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

-- Note: UnitFrameBars() returns two values, so it must be the last argument.
local function SkinFrame(frame, path)
    if not (frame and path) then return end
    local health, power = UnitFrameBars(frame)
    SkinBars(health, power, path)
end

--------------------------------------------------------------------------------
-- Cast bars (Player, Target, Focus, Boss). Blizzard sets a colored fill atlas
-- for each cast type on every cast, then resets the bar color: right after
-- each, the chosen texture is put back and tinted with that type's color
-- (matched by the atlas name, cached per name). The fill keeps Blizzard's
-- draw layer (SetTexture). A busy flag stops our own calls from re-entering
-- the hooks.
--------------------------------------------------------------------------------
local CAST_COLORS = { -- order matters: first match wins
    { "uninterrupt", 0.60, 0.60, 0.60 },
    { "interrupt",   0.85, 0.15, 0.15 },
    { "channel",     0.25, 0.80, 0.35 },
    { "empower",     0.30, 0.60, 1.00 },
    { "craft",       0.95, 0.55, 0.10 },
    { "",            1.00, 0.72, 0.10 }, -- standard cast
}
local castColors = {} -- atlas -> color entry

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
local castBarColor = {} -- cast bar -> color entry of its current cast

local function KeepCastColor(bar)
    local c = castBarColor[bar]
    if castBusy or not c then return end
    castBusy = true
    bar:SetStatusBarColor(c[2], c[3], c[4])
    castBusy = false
end

-- The cast type comes from Blizzard's bar type ("standard", "channel",
-- "uninterruptable"...), or else from the fill atlas name. Midnight: for
-- other units both can be secret in combat; that cast then keeps Blizzard's
-- own fill. Our own SetStatusBarTexture call is skipped by the busy flag.
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
-- Module API
--------------------------------------------------------------------------------
function GEN:OnEnable()
    local player, target, focus = TexturePath("texPlayer"), TexturePath("texTarget"), TexturePath("texFocus")
    local pet, boss, group = TexturePath("texPet"), TexturePath("texBoss"), TexturePath("texGroup")

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

    local prd = TexturePath("texPRD")
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
            -- Alternate power (Stagger, Ebon Might...): Blizzard swaps its
            -- colored atlas on state changes, so it is tracked like the
            -- atlas-colored bars. The bar is set up again on spec changes.
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

    -- Reputation panel (scrolling list: entries are created/reused on scroll)
    local repPanel = TexturePath("texRepPanel")
    local scrollBox = ReputationFrame and ReputationFrame.ScrollBox
    if repPanel and scrollBox and ScrollUtil then
        ScrollUtil.AddInitializedFrameCallback(scrollBox, ns.ScrollFrameCallback(function(entry)
            local content = entry.Content or entry
            TrackTexture(content.ReputationBar or entry.ReputationBar, repPanel, 2)
        end), self, true)
    end

    -- Achievement window (load-on-demand): every status bar inside it, scanned
    -- when the window opens, plus the criteria bars of expanded achievements.
    local achievements = TexturePath("texAchievements")
    if achievements then
        local function Scan(frame)
            for _, child in ipairs({ frame:GetChildren() }) do
                if child:IsObjectType("StatusBar") then TrackTexture(child, achievements, 2) end
                Scan(child)
            end
        end
        EventUtil.ContinueOnAddOnLoaded("Blizzard_AchievementUI", function()
            AchievementFrame:HookScript("OnShow", Scan)
            -- Criteria bars of an expanded achievement come from a pool on the
            -- objectives frame (AchievementsObjectivesMixin:GetProgressBar).
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

    -- Quest Tracker: progress/timer bars come from each module's pool
    -- (ObjectiveTrackerModuleMixin:GetProgressBar / GetTimerBar).
    local questTracker = TexturePath("texQuestTracker")
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

    -- Tooltips: progress/status bars come from pools on each tooltip
    -- (GameTooltip_ShowProgressBar / GameTooltip_ShowStatusBar).
    local tooltips = TexturePath("texTooltips")
    if tooltips then
        local function TrackTooltipPool(tooltip, poolKey)
            local pool = tooltip and tooltip[poolKey]
            if not pool then return end
            -- Plain texture inside a separate rounded border: inset square mask.
            -- The active list is read directly (no iterator closure per call).
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

    -- Cooldown Manager buff bars (shared item registry in core.lua).
    local cooldownBars = TexturePath("texCooldownBars")
    if cooldownBars then
        -- Only bar items have .Bar (icon viewers' items are skipped).
        ns.OnCooldownItem(function(item) TrackTexture(item.Bar, cooldownBars) end)
    end

    -- Damage Meter bars (session and spell breakdown windows): shaped like
    -- Blizzard's atlas, which also follows the Edit Mode size and scale.
    local damageMeter = TexturePath("texDamageMeter")
    if damageMeter then
        ns.OnDamageMeterEntry(function(entry) TrackTexture(entry.StatusBar, damageMeter) end)
    end

    -- Experience / reputation / honor tracking bars
    local tracking = TexturePath("texTracking")
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
        -- Bars may be created later: rescan when Blizzard updates the containers.
        for _, container in ipairs(containers) do
            ns.Hook(container, "UpdateBarsShown", ScanTracking)
        end
    end

    if group then
        -- Classic party frames
        for i = 1, 4 do
            local frame = PartyFrame and PartyFrame["MemberFrame" .. i]
            if frame then SkinFrame(frame, group) end
        end
        -- Compact party/raid frames: Blizzard resets the textures in setup.
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
