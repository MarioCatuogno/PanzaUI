--[[----------------------------------------------------------------------------
    PanzaUI - General (main settings page)
    Health/power bar texture per frame group (incl. Personal Resource Display),
    from LibSharedMedia-3.0
    (SharedMedia).
------------------------------------------------------------------------------]]
local _, ns = ...

local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)
local DEFAULT = "" -- keep Blizzard's own textures

-- Used when SharedMedia is not installed.
local BUILTIN = {
    ["Blizzard"] = [[Interface\TargetingFrame\UI-StatusBar]],
    ["Solid"]    = [[Interface\Buttons\WHITE8X8]],
}

-- Dropdown list, rebuilt each time it opens (new SharedMedia textures appear).
local function TextureList()
    local list = { { DEFAULT, "Default (Blizzard UI)" } }
    local names = LSM and LSM:List("statusbar")
    if not names then
        names = {}
        for name in pairs(BUILTIN) do names[#names + 1] = name end
        table.sort(names)
    end
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
    return (LSM and LSM:Fetch("statusbar", name, true)) or BUILTIN[name]
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
