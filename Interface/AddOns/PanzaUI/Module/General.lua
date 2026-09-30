--[[----------------------------------------------------------------------------
    PanzaUI - General (main settings page)
    Global health/power bar texture, from LibSharedMedia-3.0 (SharedMedia).
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

local GEN = ns:RegisterModule("General", {
    title = "General",
    main  = true,
    defaults = {
        barTexture = DEFAULT,
    },
    options = {
        { header = "Textures" },
        { key = "barTexture", label = "Health/Power bar texture", dropdown = TextureList,
          tooltip = "Texture for health and power bars of Player, Target, Focus, Pet, Party, Raid, Boss frames and nameplates. Textures come from SharedMedia. Requires Reload UI." },
    },
})

--------------------------------------------------------------------------------
-- Applying the texture. Only widget calls, no Blizzard fields written;
-- forbidden (protected nameplate) frames are skipped.
--------------------------------------------------------------------------------
local texturePath
local powerBars = {} -- Blizzard unit frame power bars (re-textured on power type change)

local function SetTexture(bar)
    if bar and bar.SetStatusBarTexture and not bar:IsForbidden() then
        bar:SetStatusBarTexture(texturePath)
    end
end

-- Blizzard unit frames color power bars with per-power atlases (white bar
-- color): after its update, put our texture back and color it by power type.
local function UpdatePowerBar(bar)
    if not powerBars[bar] then return end
    SetTexture(bar)
    local token = bar.powerToken
    local info = bar.overrideInfo or (token and not ns.IsSecret(token) and PowerBarColor[token])
    if info and info.r then bar:SetStatusBarColor(info.r, info.g, info.b) end
end

-- Health + power bar of a Blizzard unit frame (Player/Target/Focus/Boss/Party style).
local function UnitFrameBars(frame)
    if not frame then return end
    local main = frame.TargetFrameContent and frame.TargetFrameContent.TargetFrameContentMain
    if main then return main.HealthBarsContainer.HealthBar, main.ManaBar end
    local container = frame.HealthBarContainer or frame.HealthBarsContainer
    local health = container and (container.HealthBar or container.healthBar) or frame.healthbar or frame.HealthBar
    return health, frame.ManaBar or frame.manabar
end

local function SkinUnitFrame(health, power)
    SetTexture(health)
    if power then
        powerBars[power] = true
        UpdatePowerBar(power)
    end
end

local function SkinCompactFrame(frame)
    if frame:IsForbidden() then return end
    SetTexture(frame.healthBar)
    SetTexture(frame.powerBar)
end

local function SkinNameplate(unit)
    local plate = C_NamePlate.GetNamePlateForUnit(unit)
    local uf = plate and not plate:IsForbidden() and plate.UnitFrame
    if not uf then return end
    local container = uf.HealthBarsContainer
    SetTexture(uf.healthBar or (container and container.healthBar))
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function GEN:OnEnable()
    local name = self.db.barTexture
    if name == DEFAULT then return end
    texturePath = (LSM and LSM:Fetch("statusbar", name, true)) or BUILTIN[name]
    if not texturePath then return end

    -- Player, Pet, Target, Focus, Boss 1-5, Party 1-4
    SkinUnitFrame(PlayerFrame_GetHealthBar(), PlayerFrame_GetManaBar())
    SkinUnitFrame(PetFrameHealthBar, PetFrameManaBar)
    local frames = {}
    local function Add(frame) if frame then frames[#frames + 1] = frame end end
    Add(TargetFrame)
    Add(FocusFrame)
    for i = 1, 5 do Add(_G["Boss" .. i .. "TargetFrame"]) end
    for i = 1, 4 do Add(PartyFrame and PartyFrame["MemberFrame" .. i]) end
    for _, frame in ipairs(frames) do SkinUnitFrame(UnitFrameBars(frame)) end
    ns.Hook("UnitFrameManaBar_UpdateType", UpdatePowerBar)

    -- Party / Raid (compact frames): Blizzard resets the textures in setup.
    ns.ForEachCompactFrame(SkinCompactFrame)
    ns.Hook("DefaultCompactUnitFrameSetup", SkinCompactFrame)
    ns.Hook("DefaultCompactMiniFrameSetup", SkinCompactFrame)

    -- Nameplates: re-skinned every time a plate is (re)used.
    local events = CreateFrame("Frame")
    events:RegisterEvent("NAME_PLATE_UNIT_ADDED")
    events:SetScript("OnEvent", function(_, _, unit) SkinNameplate(unit) end)
    for _, plate in ipairs(C_NamePlate.GetNamePlates()) do
        if plate.namePlateUnitToken then SkinNameplate(plate.namePlateUnitToken) end
    end
end
