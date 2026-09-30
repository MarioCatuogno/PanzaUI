--[[----------------------------------------------------------------------------
    PanzaUI - General (main settings page)
    Health/power bar texture per frame group (incl. Personal Resource Display),
    Reputation panel bars, experience/reputation tracking bars, Achievement
    window, Quest Tracker, tooltip, Cooldown Manager and Damage Meter bars, from
    LibSharedMedia-3.0 (SharedMedia).
------------------------------------------------------------------------------]]
local _, ns = ...

local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)
local DEFAULT = ""        -- keep Blizzard's own textures
local PANZA   = "PanzaUI" -- PanzaUI's own bar texture (selectable, not a default)

-- Bundled with the addon; also registered in SharedMedia so other addons can
-- use it (if a same-named texture is already registered, that one is kept).
local PANZA_PATH = [[Interface\AddOns\PanzaUI\Media\Statusbar\PanzaUI_bar.tga]]
if LSM then LSM:Register("statusbar", PANZA, PANZA_PATH) end

-- Used when SharedMedia is not installed.
local BUILTIN = {
    [PANZA]      = PANZA_PATH,
    ["Blizzard"] = [[Interface\TargetingFrame\UI-StatusBar]],
    ["Solid"]    = [[Interface\Buttons\WHITE8X8]],
}

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

-- One texture option per frame group (menu order).
local GROUPS = {
    { key = "texPlayer", label = "Player" },
    { key = "texTarget", label = "Target" },
    { key = "texFocus",  label = "Focus" },
    { key = "texPet",    label = "Pet" },
    { key = "texBoss",   label = "Boss frames" },
    { key = "texGroup",  label = "Party/Raid" },
    { key = "texPRD",    label = "Personal Resource Display" },
}

local defaults = {}
local options  = { { header = "Health/Power Bar Textures" } }
for _, g in ipairs(GROUPS) do
    defaults[g.key] = DEFAULT
    options[#options + 1] = {
        key = g.key, label = g.label, dropdown = TextureList,
        tooltip = "Texture for the " .. g.label .. " health and power bars. Textures come from SharedMedia. Requires Reload UI.",
    }
end

-- Other bars (not health/power)
local OTHER = {
    { key = "texRepPanel", label = "Reputation panel",          tooltip = "Texture for the bars in the Reputation panel of the character window." },
    { key = "texTracking", label = "Experience/Reputation bar", tooltip = "Texture for the experience, reputation and honor tracking bars." },
    { key = "texAchievements", label = "Achievement frame",     tooltip = "Texture for the progress bars of the Achievements window (summary, categories and criteria)." },
    { key = "texQuestTracker", label = "Quest Tracker",         tooltip = "Texture for the progress and timer bars shown in the Quest Tracker (bonus objectives, world quests, scenarios...)." },
    { key = "texTooltips",     label = "Tooltips",              tooltip = "Texture for the progress bars shown inside tooltips (e.g. world quests on the map)." },
    { key = "texCooldownBars", label = "Cooldown Manager bars",  tooltip = "Texture for the tracked buff bars of the Cooldown Manager." },
    { key = "texDamageMeter",  label = "Damage Meter",           tooltip = "Texture for the bars of the Damage Meter (including the spell breakdown)." },
}
options[#options + 1] = { header = "Other Bar Textures" }
for _, o in ipairs(OTHER) do
    defaults[o.key] = DEFAULT
    options[#options + 1] = { key = o.key, label = o.label, dropdown = TextureList,
        tooltip = o.tooltip .. " Textures come from SharedMedia. Requires Reload UI." }
end

local GEN = ns:RegisterModule("General", { title = "General", main = true, defaults = defaults, options = options })

-- 2.0.49 had a single texture for every frame: keep it for each group.
function GEN:Migrate(db)
    if type(db.barTexture) == "string" then
        for _, g in ipairs(GROUPS) do
            if db[g.key] == nil then db[g.key] = db.barTexture end
        end
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

local function SetTexture(bar, path)
    if bar and path and bar.SetStatusBarTexture and not bar:IsForbidden() then
        bar:SetStatusBarTexture(path)
    end
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
    hooksecurefunc(texture, "SetAtlas", function() bar:SetStatusBarTexture(path) end)
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
    if type(atlas) ~= "string" then return end
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
        if not mask and type(atlas) == "string" and C_Texture.GetAtlasInfo(atlas) then
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

    local prd = TexturePath("texPRD")
    if prd then
        local function SkinPRD()
            local frame = PersonalResourceDisplayFrame
            if not frame then return end
            local container = frame.HealthBarsContainer
            for _, bar in ipairs({ container and (container.healthBar or container.HealthBar), frame.PowerBar, frame.AlternatePowerBar }) do
                SetTexture(bar, prd)
                KeepTexture(bar, prd)
            end
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
        ScrollUtil.AddInitializedFrameCallback(scrollBox, function(_, entry)
            local content = entry.Content or entry
            TrackTexture(content.ReputationBar or entry.ReputationBar, repPanel, 2)
        end, self, true)
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
            if not (pool and pool.EnumerateActive) then return end
            -- Plain texture inside a separate rounded border: inset square mask.
            for bar in pool:EnumerateActive() do TrackTexture(bar.Bar or bar, tooltips, 1) end
        end
        ns.Hook("GameTooltip_ShowProgressBar", function(tooltip) TrackTooltipPool(tooltip, "progressBarPool") end)
        ns.Hook("GameTooltip_ShowStatusBar",   function(tooltip) TrackTooltipPool(tooltip, "statusBarPool") end)
    end

    -- Cooldown Manager buff bars: items come from the viewer's pool, so the
    -- bar of each item is tracked when acquired (and the ones already there).
    local cooldownBars = TexturePath("texCooldownBars")
    if cooldownBars then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_CooldownViewer", function()
            local viewer = BuffBarCooldownViewer
            if not viewer then return end
            local function TrackItem(item) if item then TrackTexture(item.Bar, cooldownBars) end end
            local function TrackAll(v)
                if v.GetItemFrames then
                    for _, item in ipairs(v:GetItemFrames()) do TrackItem(item) end
                end
            end
            TrackAll(viewer)
            ns.Hook(viewer, "OnAcquireItemFrame", function(_, item) TrackItem(item) end)
            ns.Hook(viewer, "RefreshLayout", TrackAll)
        end)
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
