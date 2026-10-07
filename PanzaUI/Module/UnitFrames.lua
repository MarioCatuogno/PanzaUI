--[[----------------------------------------------------------------------------
    PanzaUI - Unit Frames
    Player, Target, Focus, Boss and Pet frames: style, class colors, class
    icon portraits and hidden clutter, applied at login and kept with post-hooks.
------------------------------------------------------------------------------]]
local _, ns = ...
local IsSecret = ns.IsSecret

--------------------------------------------------------------------------------
-- Options: Target and Focus share their entries (<prefix><Key>).
--------------------------------------------------------------------------------
local TARGET_FRAMES = {
    { frame = "TargetFrame", prefix = "target", unit = "Target" },
    { frame = "FocusFrame",  prefix = "focus",  unit = "Focus" },
}

local options = {
    { header = "Player" },
    { key = "playerStyle", label = "Refined style",
      tooltip = "Polish the look of the Player frame.",
      bullets = { "Centered name without level", "Health and power as a percentage" } },
    { key = "playerHideClutter", label = "Hide clutter",
      tooltip = "Hide minor elements of the Player frame.",
      bullets = { "Combat and rest glow", "Damage and healing numbers", "PvP, leader and group icons", "Totems and class resources" } },
}

for _, t in ipairs(TARGET_FRAMES) do
    local p = t.prefix
    local styleBullets = { "Centered name without level", "Health and power as a percentage" }
    local clutterBullets = { "PvP and leader icons", "Buffs and debuffs", "Threat glow" }
    if p == "focus" then
        styleBullets[#styleBullets + 1] = "Only 5 debuffs"
        clutterBullets[#clutterBullets + 1] = "Cast bar"
    end
    options[#options + 1] = { header = t.unit }
    options[#options + 1] = { key = p .. "Style", label = "Refined style",
        tooltip = "Polish the look of the " .. t.unit .. " frame.", bullets = styleBullets }
    options[#options + 1] = { key = p .. "HideClutter", label = "Hide clutter",
        tooltip = "Hide minor elements of the " .. t.unit .. " frame.", bullets = clutterBullets }
end

options[#options + 1] = { header = "Boss" }
options[#options + 1] = { key = "bossStyle", label = "Refined style",
    tooltip = "Polish the look of the Boss frames.",
    bullets = { "Health and power as a percentage" } }
options[#options + 1] = { key = "bossHideClutter", label = "Hide clutter",
    tooltip = "Hide minor elements of the Boss frames.",
    bullets = { "Level", "Threat glow" } }

options[#options + 1] = { header = "Pet" }
options[#options + 1] = { key = "petStyle", label = "Refined style",
    tooltip = "Polish the look of the Pet frame.",
    bullets = { "Health and power as a percentage" } }
options[#options + 1] = { key = "petHideClutter", label = "Hide clutter",
    tooltip = "Hide minor elements of the Pet frame.",
    bullets = { "Damage and healing numbers", "Buffs and debuffs" } }

local defaults = {}
for _, o in ipairs(options) do
    if o.key then
        defaults[o.key] = true
        o.reload = true
    end
end

-- Blizzard's class icon portraits (off by default, applied live).
defaults.playerClassIcon, defaults.targetClassIcon = false, false
table.insert(options, 2, { key = "playerClassIcon", label = "Class icon portrait",
    tooltip = "Show your class icon instead of the Player portrait." })
for i, o in ipairs(options) do
    if o.header == "Target" then
        table.insert(options, i + 1, { key = "targetClassIcon", label = "Class icon portrait",
            tooltip = "Show the class icon instead of the portrait of other players." })
        break
    end
end

local UF = ns:RegisterModule("UnitFrames", { title = "Unit Frames", defaults = defaults, options = options })

-- Blizzard's own settings, set only when an option is on or turned off.
local CLASS_ICON_CVARS = { playerClassIcon = "ReplaceMyPlayerPortrait", targetClassIcon = "ReplaceOtherPlayerPortraits" }

local function SetClassIcon(key, on)
    C_CVar.SetCVar(CLASS_ICON_CVARS[key], on and "1" or "0")
    if not UnitFramePortrait_Update then return end
    for _, frame in ipairs({ PlayerFrame, TargetFrame, FocusFrame }) do
        if frame and frame.unit and UnitExists(frame.unit) then UnitFramePortrait_Update(frame) end
    end
end

-- Converts the saved values of older versions.
function UF:Migrate(db)
    local Merge = ns.MergeOptions
    Merge(db, "playerStyle", db, "playerFontStyle", "playerHideLevel", "playerPercentText", "fixPortraits")
    Merge(db, "playerHideClutter", db, "hideStatusGlow", "hideHitText", "playerHidePvpIcon", "playerHideLeaderIcon",
        "hideGroupNumber", "hideTotems", "hideClassResources", "playerHideTotems", "playerHideClassResources")
    for _, t in ipairs(TARGET_FRAMES) do
        local p = t.prefix
        Merge(db, p .. "Style", db, p .. "FontStyle", p .. "HideLevel", p .. "HideNameBackground",
            p .. "PercentText", p .. "HideFollowerMark", p .. "CastIconStyle", "fixPortraits")
        Merge(db, p .. "HideClutter", db, p .. "HidePvpIcon", p .. "HideLeaderIcon", p .. "HideAuras", p .. "HideCastBar")
    end
    Merge(db, "petStyle", db, "petFontStyle", "petPercentText")
    Merge(db, "petHideClutter", db, "petHideHitText", "petHideAuras")
end

-- Player class resources (never the Personal Resource Display ones).
local CLASS_RESOURCES = {
    "RogueComboPointBarFrame", "DruidComboPointBarFrame", "MonkHarmonyBarFrame",
    "MonkStaggerBar", "WarlockPowerFrame", "PaladinPowerBarFrame",
    "MageArcaneChargesFrame", "EssencePlayerFrame", "EvokerEbonMightBar",
    "RuneFrame", "DemonHunterSoulFragmentsBar",
}
local hiddenResources = {}

local function IsInPRD(frame)
    local prd = PersonalResourceDisplayFrame
    while frame and prd do
        if frame == prd then return true end
        frame = frame:GetParent()
    end
    return false
end

-- Restores the normal Player art when the alternate power bar is hidden.
-- Its area is protected in combat: hidden (and the art redone) once it ends.
local artEvents = CreateFrame("Frame")

local function RestorePlayerArt()
    local altBar = PlayerFrame_GetAlternatePowerBar and PlayerFrame_GetAlternatePowerBar()
    if not (altBar and hiddenResources[altBar]) or PlayerFrame.state ~= "player" or UNIT_FRAME_SHOW_HEALTH_ONLY then return end

    local container = PlayerFrame.PlayerFrameContainer
    container.FrameTexture:Show()
    container.AlternatePowerFrameTexture:Hide()
    container.FrameFlash:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-InCombat", TextureKitConstants.UseAtlasSize)
    container.FrameFlash:SetPoint("CENTER", container.FrameFlash:GetParent(), "CENTER", -1.5, 1)
    PlayerFrame_GetManaBar().ManaBarMask:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-Bar-Mana-Mask", TextureKitConstants.UseAtlasSize)
    if InCombatLockdown() then
        artEvents:RegisterEvent("PLAYER_REGEN_ENABLED")
        return
    end
    PlayerFrameAlternatePowerBarArea:Hide()
    if GetPlayerBottomManagedFrameContainer then
        GetPlayerBottomManagedFrameContainer():SetPoint("TOP", PlayerFrame, "BOTTOM", 30, 25)
    end
end

artEvents:SetScript("OnEvent", function(self)
    self:UnregisterAllEvents()
    RestorePlayerArt()
end)

--------------------------------------------------------------------------------
-- Hidden elements: PvP and leader icons, threat glow.
--------------------------------------------------------------------------------
local PVP_PARTS = { "PVPIcon", "PvpIcon", "PrestigePortrait", "PrestigeBadge", "PvpTimerText", "PVPTimerText" }

local function HidePvpIcon(ctx)
    if not ctx then return end
    for _, key in ipairs(PVP_PARTS) do ns.Kill(ctx[key]) end
end

local LEADER_PARTS = { "LeaderIcon", "AssistantIcon", "GuideIcon" }

local function HideLeaderIcon(ctx)
    if not ctx then return end
    for _, key in ipairs(LEADER_PARTS) do ns.Kill(ctx[key]) end
end

-- Target of Target frame of Target/Focus.
local function TotFrame(frame)
    return frame.totFrame or _G[frame:GetName() .. "ToT"]
end

-- Threat glow of Target-style frames.
local function HideThreatGlow(frame)
    local container = frame.TargetFrameContainer
    ns.Kill(frame.threatIndicator or (container and container.Flash))
end

--------------------------------------------------------------------------------
-- Centered name
--------------------------------------------------------------------------------
-- Slightly larger name (refined style), once at login.
local NAME_SIZE_BONUS = 2
local function EnlargeName(name)
    local font, size, flags = name:GetFont()
    if not IsSecret(font) and font and not IsSecret(size) then name:SetFont(font, size + NAME_SIZE_BONUS, flags) end
end

-- Centered over the health bar on one line; long names end with "...".
local NAME_MARGIN = 4 -- pixels kept free on each side
local function CenterName(name, bar)
    name:ClearAllPoints()
    name:SetPoint("BOTTOMLEFT",  bar, "TOPLEFT",  NAME_MARGIN, 1)
    name:SetPoint("BOTTOMRIGHT", bar, "TOPRIGHT", -NAME_MARGIN, 1)
    name:SetJustifyH("CENTER")
    name:SetWordWrap(false)
    if name.SetMaxLines then name:SetMaxLines(1) end
end

-- Target of Target: same position, one line as wide as the health bar.
local function FitToTName(name, bar)
    local width = name and bar and bar:GetWidth()
    if IsSecret(width) or not width or width <= 0 then return end
    name:SetWidth(width)
    name:SetWordWrap(false)
    if name.SetMaxLines then name:SetMaxLines(1) end
end

--------------------------------------------------------------------------------
-- Class colors: class color for players, reaction color for other units,
-- cached per unit.
--------------------------------------------------------------------------------
local classColorBars = {} -- bar -> true, or the unit to use (Target of Target)
local colorR, colorG, colorB = {}, {}, {}
local colorValid = {} -- bar -> unit its color was computed for
local colorEvents = CreateFrame("Frame")

local function ClassColorHealth(bar)
    local fallback = classColorBars[bar]
    if not fallback or bar.disconnected then return end
    local unit = bar.unit
    if IsSecret(unit) then return end
    if not unit and type(fallback) == "string" then unit = fallback end
    if not unit then return end

    bar:GetStatusBarTexture():SetDesaturated(true)
    if colorValid[bar] == unit then
        bar:SetStatusBarColor(colorR[bar], colorG[bar], colorB[bar])
        return
    end

    -- Player and group members: class read from their own token.
    local token = ns.GroupUnit(unit)
    local classed = token ~= unit
    if not classed then
        local isPlayer, inParty = UnitIsPlayer(unit), UnitInParty(unit)
        classed = (not IsSecret(isPlayer) and isPlayer) or (not IsSecret(inParty) and inParty)
    end
    local color
    if classed then
        local class = select(2, UnitClass(token))
        if not IsSecret(class) then
            color = class and RAID_CLASS_COLORS[class]
        elseif C_ClassColor and C_ClassColor.GetClassColor then
            -- Secret class: Blizzard's lookup may accept it.
            local ok, c = pcall(C_ClassColor.GetClassColor, class)
            if ok and not IsSecret(c) and c then color = c end
        end
    end

    local r, g, b
    if color then
        r, g, b = color.r, color.g, color.b
    else
        local tapped = UnitIsTapDenied(unit)
        if not IsSecret(tapped) and tapped then
            r, g, b = 0.5, 0.5, 0.5
        else
            r, g, b = UnitSelectionColor(unit)
        end
    end
    colorR[bar], colorG[bar], colorB[bar], colorValid[bar] = r, g, b, unit
    bar:SetStatusBarColor(r, g, b)
end

-- Every colored bar again (run deferred, after Blizzard's own update).
local function RecolorAll()
    for bar in pairs(classColorBars) do ClassColorHealth(bar) end
end

-- Target of Target bars: Blizzard colors them with its own code.
local colorBusy = false
local function KeepClassColor(bar)
    hooksecurefunc(bar, "SetStatusBarColor", function(self)
        if colorBusy then return end
        colorBusy = true
        ClassColorHealth(self)
        colorBusy = false
    end)
    ClassColorHealth(bar)
end

-- Anything that can change a cached color.
colorEvents:SetScript("OnEvent", function()
    wipe(colorValid)
    ns.Defer(RecolorAll)
end)

--------------------------------------------------------------------------------
-- Shared text style, before the percentage text.
--------------------------------------------------------------------------------
local function StyleTexts(name, level, health, power)
    if not ns.textStyle then return end
    ns.StyleFont(name)
    ns.StyleFont(level)
    ns.StyleBarText(health)
    ns.StyleBarText(power)
end

--------------------------------------------------------------------------------
-- Player
--------------------------------------------------------------------------------
local function SetupPlayer(db)
    local main = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain
    local ctx  = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual
    local health, power = main.HealthBarsContainer.HealthBar, main.ManaBarArea.ManaBar
    StyleTexts(PlayerName, PlayerLevelText, health, power)

    if db.playerHideClutter then
        ns.Kill(main.StatusTexture)
        ns.Kill(PlayerFrame.PlayerFrameContainer.FrameFlash)
        ns.Kill(ctx.PlayerRestLoop)
        ns.Kill(main.HitIndicator)
        HidePvpIcon(ctx)
        ns.Kill(PlayerPVPTimerText)
        HideLeaderIcon(ctx)
        ns.Kill(ctx.GroupIndicator or PlayerFrameGroupIndicator)

        -- Totems: hidden and events stopped.
        ns.Disable(TotemFrame)

        local bars = { PlayerFrame.classPowerBar }
        for i, name in ipairs(CLASS_RESOURCES) do bars[i + 1] = _G[name] end
        for i = 1, #CLASS_RESOURCES + 1 do
            local bar = bars[i]
            if bar and not IsInPRD(bar) then
                ns.Disable(bar)
                hiddenResources[bar] = true
            end
        end
        ns.Hook("PlayerFrame_ToPlayerArt", RestorePlayerArt)
        RestorePlayerArt()
    end

    if db.playerStyle then
        ns.Kill(PlayerLevelText)
        local bar = main.HealthBarsContainer
        CenterName(PlayerName, bar)
        EnlargeName(PlayerName)
        ns.Hook("PlayerFrame_UpdatePlayerNameTextAnchor", function() CenterName(PlayerName, bar) end)

        ns.PercentText(health, false)
        ns.PercentText(power, true)
    end

    if ns.classColors then classColorBars[health] = true end
end

--------------------------------------------------------------------------------
-- NPC followers: the "*" before their name is removed.
--------------------------------------------------------------------------------
local function HideFollowerMark(text, frame, fallbackUnit)
    if not text then return end
    local busy
    local function Fix()
        if busy then return end
        local unit = frame.unit
        if IsSecret(unit) then return end
        unit = unit or fallbackUnit
        if not unit then return end
        local name = UnitName(unit)
        if IsSecret(name) or not name then return end
        busy = true
        if name:byte(1) == 42 then name = name:gsub("^%*+%s*", "") end -- leading "*"
        text:SetText(name)
        busy = false
    end
    hooksecurefunc(text, "SetText", Fix)
    hooksecurefunc(text, "SetFormattedText", Fix)
end

--------------------------------------------------------------------------------
-- Target and Focus
--------------------------------------------------------------------------------

-- Layout parts Blizzard may reset (Focus small size).
local function ApplyLayout(frame, db, p)
    local main = frame.TargetFrameContent.TargetFrameContentMain
    -- Aura limits: Focus refined style keeps 5 debuffs.
    if p == "focus" and db.focusStyle then
        frame.maxBuffs, frame.maxDebuffs = 0, 5
    elseif db[p .. "HideClutter"] then
        frame.maxBuffs, frame.maxDebuffs = 0, 0
    end
    if db[p .. "Style"] then
        CenterName(main.Name, main.HealthBarsContainer)
        -- Cleared, not hidden: name and level are anchored to it.
        main.ReputationColor:SetTexture(nil)
    end
end

local function SetupTargetFrame(frame, db, p)
    local main = frame.TargetFrameContent.TargetFrameContentMain
    local ctx  = frame.TargetFrameContent.TargetFrameContentContextual
    local health, power = main.HealthBarsContainer.HealthBar, main.ManaBar
    StyleTexts(main.Name, main.LevelText, health, power)

    -- Target of Target name.
    local tot = TotFrame(frame)
    local totBar = tot and (tot.HealthBar or tot.healthbar or tot.healthBar)
    if tot and ns.textStyle then
        ns.StyleFont(tot.Name)
        ns.StyleFont(tot.name)
    end

    if db[p .. "HideClutter"] then
        HidePvpIcon(ctx)
        HideLeaderIcon(ctx)
        HideThreatGlow(frame)
    end

    if ns.classColors then
        classColorBars[health] = true
        -- Target of Target: class color kept after Blizzard's update.
        if totBar then
            classColorBars[totBar] = p .. "target"
            KeepClassColor(totBar)
        end
    end

    ApplyLayout(frame, db, p)

    if db[p .. "Style"] then
        -- Only the skull icon is anchored to the level text.
        ns.Kill(main.LevelText)
        ns.Kill(ctx.HighLevelTexture)

        EnlargeName(main.Name)
        HideFollowerMark(main.Name, frame)
        if tot then
            FitToTName(tot.Name, totBar)
            if tot.name ~= tot.Name then FitToTName(tot.name, totBar) end
            HideFollowerMark(tot.Name, tot, p .. "target")
            if tot.name ~= tot.Name then HideFollowerMark(tot.name, tot, p .. "target") end
        end

        local spellbar = frame.spellbar or _G[frame:GetName() .. "SpellBar"]
        if spellbar then ns.StyleIcon(spellbar.Icon, spellbar) end

        ns.PercentText(health, false)
        ns.PercentText(power, true)
    end
end

--------------------------------------------------------------------------------
-- Boss frames
--------------------------------------------------------------------------------
local function SetupBoss(db)
    for i = 1, 5 do
        local frame = _G["Boss" .. i .. "TargetFrame"]
        local content = frame and frame.TargetFrameContent
        if content then
            local main, ctx = content.TargetFrameContentMain, content.TargetFrameContentContextual
            local health, power = main.HealthBarsContainer.HealthBar, main.ManaBar
            StyleTexts(main.Name, main.LevelText, health, power)
            -- Reaction color (the boss bar color comes from Blizzard's atlas).
            classColorBars[health] = true

            if db.bossHideClutter then
                ns.Kill(main.LevelText)
                if ctx then ns.Kill(ctx.HighLevelTexture) end
                HideThreatGlow(frame)
            end

            if db.bossStyle then
                -- Cleared, not hidden: name and level are anchored to it.
                main.ReputationColor:SetTexture(nil)
                local spellbar = frame.spellbar
                if spellbar then ns.StyleIcon(spellbar.Icon, spellbar) end
                ns.PercentText(health, false)
                ns.PercentText(power, true)
            end
        end
    end
end

--------------------------------------------------------------------------------
-- Pet
--------------------------------------------------------------------------------
local function SetupPet(db)
    if not PetFrame then return end
    local health, power = PetFrameHealthBar, PetFrameManaBar
    StyleTexts(PetName, nil, health, power)

    if db.petHideClutter then
        ns.Kill(PetHitIndicator)
        -- Auras hidden with their container.
        ns.Kill(PetFrame.AuraFrameContainer)
    end

    if db.petStyle then
        ns.PercentText(health, false)
        ns.PercentText(power, true)
    end
end

--------------------------------------------------------------------------------
-- Portrait redraw: portraits stuck zoomed in are drawn again after a second.
--------------------------------------------------------------------------------
local PORTRAIT_UNITS = { player = true, vehicle = true, target = true, focus = true }
local portraitPending = false

local PORTRAIT_FRAMES = {}

local function RedrawPortraits()
    portraitPending = false
    for _, frame in ipairs(PORTRAIT_FRAMES) do
        local portrait, unit = frame.portrait, frame.unit
        if portrait and unit and not IsSecret(unit) and portrait:IsVisible() and UnitExists(unit)
            -- Blizzard can show a class icon instead.
            and not (UnitFrame_ShouldReplacePortrait and UnitFrame_ShouldReplacePortrait(frame)) then
            -- Same arguments as UnitFramePortrait_Update.
            SetPortraitTexture(portrait, unit, frame.disablePortraitMask)
        end
    end
end

local function OnPortraitEvent(_, _, unit)
    if IsSecret(unit) or (type(unit) == "string" and not PORTRAIT_UNITS[unit]) then return end
    if portraitPending then return end
    portraitPending = true
    C_Timer.After(1, RedrawPortraits)
end

-- Unit events for the portrait units only (two units per event frame).
local PORTRAIT_UNIT_EVENTS = { "UNIT_PORTRAIT_UPDATE", "UNIT_MODEL_CHANGED" }
local portraitEvents, portraitEvents2 = CreateFrame("Frame"), CreateFrame("Frame")
portraitEvents:SetScript("OnEvent", OnPortraitEvent)
portraitEvents2:SetScript("OnEvent", OnPortraitEvent)

local function SetupPortraits(db)
    if db.playerStyle then PORTRAIT_FRAMES[#PORTRAIT_FRAMES + 1] = PlayerFrame end
    for _, t in ipairs(TARGET_FRAMES) do
        local frame = _G[t.frame]
        if frame and db[t.prefix .. "Style"] then PORTRAIT_FRAMES[#PORTRAIT_FRAMES + 1] = frame end
    end
    if #PORTRAIT_FRAMES == 0 then return end
    for _, event in ipairs(PORTRAIT_UNIT_EVENTS) do
        portraitEvents:RegisterUnitEvent(event, "player", "vehicle")
        portraitEvents2:RegisterUnitEvent(event, "target", "focus")
    end
    for _, event in ipairs({ "PLAYER_ENTERING_WORLD", "PLAYER_TARGET_CHANGED", "PLAYER_FOCUS_CHANGED" }) do
        portraitEvents:RegisterEvent(event)
    end
end

--------------------------------------------------------------------------------
-- Focus debuffs: rounded icon borders.
--------------------------------------------------------------------------------
local styledAuras = {}

local function StyleFocusDebuff(button)
    if styledAuras[button] or not button.Icon then return end
    styledAuras[button] = true
    ns.StyleIcon(button.Icon, button)
end

local function StyleFocusDebuffs(frame)
    ns.ForEachActive(frame.auraPools and frame.auraPools:GetPool("TargetDebuffFrameTemplate"), StyleFocusDebuff)
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function UF:OnEnable()
    local db = self.db
    SetupPlayer(db)

    for _, t in ipairs(TARGET_FRAMES) do
        local frame = _G[t.frame]
        if frame then SetupTargetFrame(frame, db, t.prefix) end
    end

    if FocusFrame then
        ns.Hook(FocusFrame, "SetSmallSize", function(frame) ApplyLayout(frame, db, "focus") end)
        -- Cast bar hidden and its events stopped.
        if db.focusHideClutter then ns.Disable(FocusFrame.spellbar or FocusFrameSpellBar) end
        if db.focusStyle then
            ns.Hook(FocusFrame, "UpdateAuras", StyleFocusDebuffs)
            StyleFocusDebuffs(FocusFrame)
        end
    end

    SetupBoss(db)
    SetupPet(db)
    SetupPortraits(db)
    for key in pairs(CLASS_ICON_CVARS) do
        if db[key] then SetClassIcon(key, true) end
    end

    if next(classColorBars) then
        for _, event in ipairs({ "PLAYER_TARGET_CHANGED", "PLAYER_FOCUS_CHANGED", "GROUP_ROSTER_UPDATE", "PLAYER_ENTERING_WORLD",
                                 "INSTANCE_ENCOUNTER_ENGAGE_UNIT" }) do
            colorEvents:RegisterEvent(event)
        end
        for _, event in ipairs({ "UNIT_TARGET", "UNIT_FACTION", "UNIT_FLAGS", "UNIT_NAME_UPDATE" }) do
            colorEvents:RegisterUnitEvent(event, "target", "focus")
        end
        ns.Hook("UnitFrameHealthBar_Update", ClassColorHealth)
        for bar in pairs(classColorBars) do ClassColorHealth(bar) end
    end
end

-- Live options.
function UF:OnOptionChanged(key, value)
    if CLASS_ICON_CVARS[key] then SetClassIcon(key, value) end
end
