--[[----------------------------------------------------------------------------
    PanzaUI - Unit Frames (Player, Target, Focus, Pet)
    Per frame: shared text style, refined style, class colors and hidden
    clutter. Everything is applied once at login and kept with post-hooks:
    no Blizzard update code is called (taint-safe).
------------------------------------------------------------------------------]]
local _, ns = ...

--------------------------------------------------------------------------------
-- Options: Target and Focus share their entries (keys <prefix><Key>, e.g.
-- targetStyle). Every option is on by default.
--------------------------------------------------------------------------------
local TARGET_FRAMES = {
    { frame = "TargetFrame", prefix = "target", unit = "Target" },
    { frame = "FocusFrame",  prefix = "focus",  unit = "Focus" },
}

local options = {
    { header = "Player" },
    { key = "playerStyle", label = "Refined style",
      tooltip = "Polish the look of the Player frame.",
      bullets = { "Centered name, no level", "Health and power as a percentage", "Portrait redrawn when it stays zoomed in" } },
    { key = "playerClassColor", label = "Class colors",
      tooltip = "Color the health bar by class." },
    { key = "playerHideClutter", label = "Hide clutter",
      tooltip = "Hide minor elements of the Player frame.",
      bullets = { "Combat and rest glow", "Damage and healing numbers", "PvP, leader and group icons", "Totems", "Class resources (shown on the Personal Resource Display)" } },
}

for _, t in ipairs(TARGET_FRAMES) do
    local p = t.prefix
    local styleBullets = { "Centered name, no level or name background", "Health and power as a percentage",
                           "Rounded cast bar icon border", "Portrait redrawn when it stays zoomed in" }
    local clutterBullets = { "PvP and leader icons", "Buffs and debuffs" }
    if p == "focus" then
        styleBullets[#styleBullets + 1] = "Only 4 debuffs, with rounded borders"
        clutterBullets = { "PvP and leader icons", "Cast bar", "Buffs and debuffs (Refined style keeps 4 debuffs)" }
    end
    options[#options + 1] = { header = t.unit }
    options[#options + 1] = { key = p .. "Style", label = "Refined style",
        tooltip = "Polish the look of the " .. t.unit .. " frame.", bullets = styleBullets }
    options[#options + 1] = { key = p .. "ClassColor", label = "Class colors",
        tooltip = "Color the health bar by class or reaction.",
        bullets = { "Also on its Target of Target" } }
    options[#options + 1] = { key = p .. "HideClutter", label = "Hide clutter",
        tooltip = "Hide minor elements of the " .. t.unit .. " frame.", bullets = clutterBullets }
end

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

local UF = ns:RegisterModule("UnitFrames", { title = "Unit Frames", defaults = defaults, options = options })

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

-- Class resource bars hidden from the Player frame (never the ones inside
-- the Personal Resource Display, built from the same templates).
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

-- Alternate power class resources (e.g. Stagger) switch the Player frame to a
-- taller art: with the bar hidden, the normal art is restored after Blizzard.
local function RestorePlayerArt()
    local altBar = PlayerFrame_GetAlternatePowerBar and PlayerFrame_GetAlternatePowerBar()
    if not (altBar and hiddenResources[altBar]) or PlayerFrame.state ~= "player" or UNIT_FRAME_SHOW_HEALTH_ONLY then return end

    local container = PlayerFrame.PlayerFrameContainer
    container.FrameTexture:Show()
    container.AlternatePowerFrameTexture:Hide()
    container.FrameFlash:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-InCombat", TextureKitConstants.UseAtlasSize)
    container.FrameFlash:SetPoint("CENTER", container.FrameFlash:GetParent(), "CENTER", -1.5, 1)
    PlayerFrame_GetManaBar().ManaBarMask:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-Bar-Mana-Mask", TextureKitConstants.UseAtlasSize)
    PlayerFrameAlternatePowerBarArea:Hide()
    if not InCombatLockdown() then
        GetPlayerBottomManagedFrameContainer():SetPoint("TOP", PlayerFrame, "BOTTOM", 30, 25)
    end
end

--------------------------------------------------------------------------------
-- PvP and group leader icons, moved under the hidden parent (Blizzard keeps
-- showing them).
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

--------------------------------------------------------------------------------
-- Name centered above the health bar
--------------------------------------------------------------------------------
local function CenterName(name, bar)
    name:ClearAllPoints()
    name:SetPoint("BOTTOMLEFT",  bar, "TOPLEFT",  0, 1)
    name:SetPoint("BOTTOMRIGHT", bar, "TOPRIGHT", 0, 1)
    name:SetJustifyH("CENTER")
end

--------------------------------------------------------------------------------
-- Class colored health bars: players get their class color, other units
-- their reaction color, after each Blizzard update. The color is computed
-- once per unit and reused until the unit or its state changes.
--------------------------------------------------------------------------------
local IsSecret = ns.IsSecret
local classColorBars = {}

local colorR, colorG, colorB, colorValid = {}, {}, {}, {} -- colorValid: bar -> unit it was computed for
local colorEvents = CreateFrame("Frame")
colorEvents:SetScript("OnEvent", function() wipe(colorValid) end)

local function ClassColorHealth(bar)
    if not classColorBars[bar] or bar.disconnected then return end
    local unit = bar.unit
    if not unit or IsSecret(unit) then return end

    bar:GetStatusBarTexture():SetDesaturated(true)
    if colorValid[bar] == unit then
        bar:SetStatusBarColor(colorR[bar], colorG[bar], colorB[bar])
        return
    end

    -- Secret values are passed on, never tested.
    local isPlayer = UnitIsPlayer(unit)
    local inParty  = UnitInParty(unit)
    local classed  = (not IsSecret(isPlayer) and isPlayer) or (not IsSecret(inParty) and inParty)
    local _, class = UnitClass(unit)
    local color = classed and class and not IsSecret(class) and RAID_CLASS_COLORS[class]

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

--------------------------------------------------------------------------------
-- Shared text style, before the percentage text (its "100" twin copies the
-- bar text font).
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
        ns.Hook("PlayerFrame_UpdatePlayerNameTextAnchor", function() CenterName(PlayerName, bar) end)

        ns.PercentText(health, false)
        ns.PercentText(power, true)
    end

    if db.playerClassColor then classColorBars[health] = true end
end

--------------------------------------------------------------------------------
-- NPC followers: the "*" Blizzard puts before their name is removed after
-- each SetText (secret names are skipped).
--------------------------------------------------------------------------------
local function HideFollowerMark(text, frame)
    if not text then return end
    local busy
    hooksecurefunc(text, "SetText", function()
        if busy then return end
        local unit = frame.unit
        if not unit or IsSecret(unit) then return end
        local name = UnitName(unit)
        if not name or IsSecret(name) then return end
        busy = true
        if name:byte(1) == 42 then name = name:gsub("^%*+%s*", "") end -- leading "*"
        text:SetText(name)
        busy = false
    end)
end

--------------------------------------------------------------------------------
-- Target and Focus (same Blizzard template)
--------------------------------------------------------------------------------

-- Layout parts Blizzard may reset (Focus small size): applied at login and
-- after SetSmallSize().
local function ApplyLayout(frame, db, p)
    local main = frame.TargetFrameContent.TargetFrameContentMain
    -- Aura limits: Focus refined style keeps 4 debuffs, hidden clutter none.
    if p == "focus" and db.focusStyle then
        frame.maxBuffs, frame.maxDebuffs = 0, 4
    elseif db[p .. "HideClutter"] then
        frame.maxBuffs, frame.maxDebuffs = 0, 0
    end
    if db[p .. "Style"] then
        CenterName(main.Name, main.HealthBarsContainer)
        -- Texture cleared, not hidden: the name and level are anchored to it.
        main.ReputationColor:SetTexture(nil)
    end
end

local function SetupTargetFrame(frame, db, p)
    local main = frame.TargetFrameContent.TargetFrameContentMain
    local ctx  = frame.TargetFrameContent.TargetFrameContentContextual
    local health, power = main.HealthBarsContainer.HealthBar, main.ManaBar
    StyleTexts(main.Name, main.LevelText, health, power)

    if db[p .. "HideClutter"] then
        HidePvpIcon(ctx)
        HideLeaderIcon(ctx)
    end

    if db[p .. "ClassColor"] then
        classColorBars[health] = true
        local tot = frame.totFrame
        local totHealth = tot and (tot.healthbar or tot.HealthBar)
        if totHealth then classColorBars[totHealth] = true end
    end

    ApplyLayout(frame, db, p)

    if db[p .. "Style"] then
        -- Nothing but the skull icon is anchored to the level text.
        ns.Kill(main.LevelText)
        ns.Kill(ctx.HighLevelTexture)

        HideFollowerMark(main.Name, frame)
        local tot = frame.totFrame
        if tot then HideFollowerMark(tot.name or tot.Name, tot) end

        local spellbar = frame.spellbar or _G[frame:GetName() .. "SpellBar"]
        if spellbar then ns.StyleIcon(spellbar.Icon, spellbar) end

        ns.PercentText(health, false)
        ns.PercentText(power, true)
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
        -- Auras: their container is moved under the hidden parent.
        ns.Kill(PetFrame.AuraFrameContainer)
    end

    if db.petStyle then
        ns.PercentText(health, false)
        ns.PercentText(power, true)
    end
end

--------------------------------------------------------------------------------
-- Portrait redraw: a portrait taken before the 3D model has loaded stays
-- zoomed in, so it is drawn again one second after each update (bursts
-- merged), with the same API Blizzard uses.
--------------------------------------------------------------------------------
local PORTRAIT_UNITS = { player = true, vehicle = true, target = true, focus = true }
local portraitPending = false

local PORTRAIT_FRAMES = {}

local function RedrawPortraits()
    portraitPending = false
    for _, frame in ipairs(PORTRAIT_FRAMES) do
        local portrait, unit = frame and frame.portrait, frame and frame.unit
        if portrait and unit and not IsSecret(unit) and portrait:IsVisible() and UnitExists(unit)
            -- Blizzard can show a class icon instead of the portrait.
            and not (UnitFrame_ShouldReplacePortrait and UnitFrame_ShouldReplacePortrait(frame)) then
            -- Same arguments as Blizzard's UnitFramePortrait_Update.
            SetPortraitTexture(portrait, unit, frame.disablePortraitMask)
        end
    end
end

local function OnPortraitEvent(_, _, unit)
    if unit and (IsSecret(unit) or not PORTRAIT_UNITS[unit]) then return end
    if portraitPending then return end
    portraitPending = true
    C_Timer.After(1, RedrawPortraits)
end

-- Unit events only for the portrait units (at most two units per frame).
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
-- Focus debuffs (refined style): rounded icon borders, once per pooled button.
--------------------------------------------------------------------------------
local styledAuras = {}

local function StyleFocusDebuff(button)
    if styledAuras[button] or not button.Icon then return end
    styledAuras[button] = true
    ns.StyleIcon(button.Icon, button)
end

local function StyleFocusDebuffs(frame)
    local pool = frame.auraPools and frame.auraPools:GetPool("TargetDebuffFrameTemplate")
    if not pool then return end
    local active = pool.activeObjects
    if active then
        for button in pairs(active) do StyleFocusDebuff(button) end
    else
        for button in pool:EnumerateActive() do StyleFocusDebuff(button) end
    end
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

    SetupPet(db)
    SetupPortraits(db)

    if next(classColorBars) then
        -- Anything that can change a cached color (unit events: target and focus
        -- only).
        for _, event in ipairs({ "PLAYER_TARGET_CHANGED", "PLAYER_FOCUS_CHANGED", "GROUP_ROSTER_UPDATE", "PLAYER_ENTERING_WORLD" }) do
            colorEvents:RegisterEvent(event)
        end
        for _, event in ipairs({ "UNIT_TARGET", "UNIT_FACTION", "UNIT_FLAGS", "UNIT_NAME_UPDATE" }) do
            colorEvents:RegisterUnitEvent(event, "target", "focus")
        end
        ns.Hook("UnitFrameHealthBar_Update", ClassColorHealth)
        for bar in pairs(classColorBars) do ClassColorHealth(bar) end
    end
end
