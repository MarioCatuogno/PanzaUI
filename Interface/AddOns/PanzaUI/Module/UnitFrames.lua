--[[----------------------------------------------------------------------------
    PanzaUI - Unit Frames (Player, Target, Focus, Pet)
    Status glow, hit text, class resources, text style, percentage text,
    level / name, name background, auras, portrait redraw.
    All options are applied once at login (Requires Reload UI): nothing here
    calls Blizzard update code, so no taint reaches secret-value handling.
------------------------------------------------------------------------------]]
local _, ns = ...

local RELOAD = " Requires Reload UI."

--------------------------------------------------------------------------------
-- Options. Target and Focus share the same set, generated from one list
-- (keys: <prefix><Key>, e.g. targetFontStyle, focusHideAuras).
--------------------------------------------------------------------------------
local defaults = {
    playerFontStyle    = true,
    playerHideLevel    = true,
    playerPercentText  = true,
    playerClassColor   = true,
    hideStatusGlow     = true,
    hideHitText        = true,
    hideClassResources = true,
    hideTotems         = true,
    fixPortraits       = true,
}

local options = {
    { header = "Player" },
    { key = "playerFontStyle",    label = "Outline + Slug text",     tooltip = "Apply outline and slug rendering to the Player text." .. RELOAD },
    { key = "playerHideLevel",    label = "Hide level, center name", tooltip = "Remove the Player level and center the name above the health bar." .. RELOAD },
    { key = "hideStatusGlow",     label = "Hide combat/rest glow",   tooltip = "Remove the combat and rest glow and the Zzz animation." .. RELOAD },
    { key = "playerPercentText",  label = "Percentage-only text",    tooltip = "Show health and power as a plain percentage (no % symbol)." .. RELOAD },
    { key = "playerClassColor",   label = "Class colored health bar", tooltip = "Color the health bar with your class color." .. RELOAD },
    { key = "hideHitText",        label = "Hide damage/heal text",   tooltip = "Hide the damage and healing numbers on the portrait." .. RELOAD },
    { key = "hideTotems",         label = "Hide totems",             tooltip = "Hide the totem/guardian icons under the Player frame (e.g. Shaman totems, Monk Niuzao)." .. RELOAD },
    { key = "hideClassResources", label = "Hide class resources",    tooltip = "Hide combo points, chi, stagger, runes, shards, holy power, essence, etc. on the Player frame (the Personal Resource Display keeps them)." .. RELOAD },
    { key = "fixPortraits",       label = "Fix portraits",           tooltip = "Redraw the Player, Target and Focus portraits one second after the game updates them, so they don't stay zoomed in when the character model was not loaded yet." .. RELOAD },
}

local TARGET_OPTIONS = {
    { key = "FontStyle",          label = "Outline + Slug text",     tooltip = "Apply outline and slug rendering to the %s text." },
    { key = "HideLevel",          label = "Hide level, center name", tooltip = "Remove the %s level and center the name above the health bar." },
    { key = "HideNameBackground", label = "Hide name background",    tooltip = "Remove the colored background behind the %s name, like the Player frame." },
    { key = "PercentText",        label = "Percentage-only text",    tooltip = "Show %s health and power as a plain percentage (no % symbol)." },
    { key = "HideAuras",          label = "Hide buffs/debuffs",      tooltip = "Hide buffs and debuffs on the %s frame." },
    { key = "ClassColor",         label = "Class colored health bar", tooltip = "Color the %s health bar with the class color (players and party members, including follower dungeon NPCs); other units use their reaction color (hostile red, neutral yellow, friendly green)." },
    { key = "CastIconStyle",      label = "Action bar style for cast bar icon", tooltip = "Give the %s cast bar spell icon the same rounded frame as action buttons." },
}

-- frame = global name, prefix = option key prefix, unit = menu section / text
local TARGET_FRAMES = {
    { frame = "TargetFrame", prefix = "target", unit = "Target" },
    { frame = "FocusFrame",  prefix = "focus",  unit = "Focus" },
}

for _, t in ipairs(TARGET_FRAMES) do
    options[#options + 1] = { header = t.unit }
    for _, o in ipairs(TARGET_OPTIONS) do
        local key = t.prefix .. o.key
        defaults[key] = true
        options[#options + 1] = {
            key     = key,
            label   = o.label,
            tooltip = o.tooltip:gsub("%%s", t.unit, 1) .. RELOAD,
        }
    end
end

-- Focus only (appended right after the Focus section)
defaults.focusHideCastBar = true
options[#options + 1] = { key = "focusHideCastBar", label = "Hide cast bar", tooltip = "Hide the Focus cast bar." .. RELOAD }

-- Pet
local PET_OPTIONS = {
    { header = "Pet" },
    { key = "petFontStyle",   label = "Outline + Slug text",   tooltip = "Apply outline and slug rendering to the Pet text." .. RELOAD },
    { key = "petPercentText", label = "Percentage-only text",  tooltip = "Show Pet health and power as a plain percentage (no % symbol)." .. RELOAD },
    { key = "petHideHitText", label = "Hide damage/heal text", tooltip = "Hide the damage and healing numbers on the Pet portrait." .. RELOAD },
    { key = "petHideAuras",   label = "Hide buffs/debuffs",    tooltip = "Hide buffs and debuffs on the Pet frame." .. RELOAD },
}
for _, o in ipairs(PET_OPTIONS) do
    if o.key then defaults[o.key] = true end
    options[#options + 1] = o
end

local UF = ns:RegisterModule("UnitFrames", { title = "Unit Frames", defaults = defaults, options = options })

-- Class resource bars (nil entries are simply skipped).
local CLASS_RESOURCES = {
    "RogueComboPointBarFrame", "DruidComboPointBarFrame", "MonkHarmonyBarFrame",
    "MonkStaggerBar", "WarlockPowerFrame", "PaladinPowerBarFrame",
    "MageArcaneChargesFrame", "EssencePlayerFrame", "EvokerEbonMightBar",
    "RuneFrame", "DemonHunterSoulFragmentsBar",
}
local hiddenResources = {} -- frame -> true (disabled class resource bars)

-- The Personal Resource Display builds its own class bars from the same
-- templates (and they can end up in PlayerFrame.classPowerBar): never touch
-- anything that lives inside the PRD, only the Player frame's bars.
local function IsInPRD(frame)
    local prd = PersonalResourceDisplayFrame
    while frame and prd do
        if frame == prd then return true end
        frame = frame:GetParent()
    end
    return false
end

-- Some class resources (e.g. Monk Stagger, Evoker Ebon Might) are "alternate
-- power bars": Blizzard then switches the Player frame to a taller art with
-- an extra bar area. When that bar is hidden, restore the normal art right
-- after PlayerFrame_ToPlayerArt (same values Blizzard uses without the bar).
-- Only widget calls, no Blizzard fields written.
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
-- Name centered above the health bar
--------------------------------------------------------------------------------
local function CenterName(name, bar)
    name:ClearAllPoints()
    name:SetPoint("BOTTOMLEFT",  bar, "TOPLEFT",  0, 1)
    name:SetPoint("BOTTOMRIGHT", bar, "TOPRIGHT", 0, 1)
    name:SetJustifyH("CENTER")
end

--------------------------------------------------------------------------------
-- Class colored health bars. Post-hook of Blizzard's UnitFrameHealthBar_Update
-- (it resets the bar to green on every update): players get their class color
-- on a desaturated texture, other units keep Blizzard's look.
-- Secret values are skipped, never tested.
--------------------------------------------------------------------------------
local IsSecret = ns.IsSecret
local classColorBars = {} -- health bar -> true

-- Blizzard runs this on every health update (many times per second in
-- combat), but the color only changes with the unit, its reaction/tap state
-- or the group: it is computed once and reused until one of those changes
-- (flat tables, no garbage per update).
local colorR, colorG, colorB, colorValid = {}, {}, {}, {} -- colorValid: bar -> unit token it was computed for
local colorEvents = CreateFrame("Frame")
colorEvents:SetScript("OnEvent", function() wipe(colorValid) end)

local function ClassColorHealth(bar)
    if not classColorBars[bar] or bar.disconnected then return end
    local unit = bar.unit
    if not unit or IsSecret(unit) then return end

    bar:GetStatusBarTexture():SetDesaturated(true)
    if colorValid[bar] == unit then -- same unit token (e.g. not switched to a vehicle)
        bar:SetStatusBarColor(colorR[bar], colorG[bar], colorB[bar])
        return
    end

    -- Players and party members (including follower dungeon NPCs) get their
    -- class color; every other unit gets its reaction color (hostile red,
    -- neutral yellow, friendly green), grey when tapped by someone else.
    -- UnitSelectionColor's values go straight to the bar, never tested.
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
            r, g, b = UnitSelectionColor(unit) -- stored and passed on, never tested
        end
    end
    colorR[bar], colorG[bar], colorB[bar], colorValid[bar] = r, g, b, unit
    bar:SetStatusBarColor(r, g, b)
end

--------------------------------------------------------------------------------
-- Player
--------------------------------------------------------------------------------
local function SetupPlayer(db)
    local main = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain
    local ctx  = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual
    local health, power = main.HealthBarsContainer.HealthBar, main.ManaBarArea.ManaBar

    if db.hideStatusGlow then
        ns.Kill(main.StatusTexture)                          -- rest (yellow) / combat (red) pulse
        ns.Kill(PlayerFrame.PlayerFrameContainer.FrameFlash) -- combat border flash
        ns.Kill(ctx.PlayerRestLoop)                          -- Zzz animation
    end

    if db.hideHitText then
        ns.Kill(main.HitIndicator)
    end

    -- Totems (not secure): hidden and events stopped, so the frame below the
    -- Player frame collapses and no totem updates run.
    if db.hideTotems then ns.Disable(TotemFrame) end

    if db.hideClassResources then
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

    if db.playerHideLevel then
        ns.Kill(PlayerLevelText)
        local bar = main.HealthBarsContainer
        CenterName(PlayerName, bar)
        -- Blizzard re-anchors the player name when entering/leaving vehicles.
        ns.Hook("PlayerFrame_UpdatePlayerNameTextAnchor", function() CenterName(PlayerName, bar) end)
    end

    if db.playerFontStyle then
        ns.StyleFont(PlayerName)
        ns.StyleFont(PlayerLevelText)
        ns.StyleBarText(health)
        ns.StyleBarText(power)
    end

    if db.playerPercentText then
        ns.PercentText(health, false)
        ns.PercentText(power, true)
    end

    if db.playerClassColor then classColorBars[health] = true end
end

--------------------------------------------------------------------------------
-- Target-style frames (Target and Focus share TargetFrameMixin/template)
--------------------------------------------------------------------------------

-- Parts that Blizzard may re-anchor or re-texture (Focus "small size" mode):
-- applied at login and again after FocusFrame:SetSmallSize().
local function ApplyLayout(frame, db, p)
    local main = frame.TargetFrameContent.TargetFrameContentMain
    if db[p .. "HideLevel"] then CenterName(main.Name, main.HealthBarsContainer) end
    -- Clear the texture instead of Kill()/SetAlpha(): Name and LevelText are
    -- anchored to it (so it must stay in place), and Blizzard's
    -- SetVertexColor(UnitSelectionColor()) resets the texture alpha.
    if db[p .. "HideNameBackground"] then main.ReputationColor:SetTexture(nil) end
end

local function SetupTargetFrame(frame, db, p)
    local main = frame.TargetFrameContent.TargetFrameContentMain
    local ctx  = frame.TargetFrameContent.TargetFrameContentContextual
    local health, power = main.HealthBarsContainer.HealthBar, main.ManaBar

    if db[p .. "ClassColor"] then classColorBars[health] = true end

    if db[p .. "HideAuras"] then
        frame.maxBuffs   = 0
        frame.maxDebuffs = 0
    end

    if db[p .. "HideLevel"] then
        -- Kill() is safe: nothing is anchored to the level text except the
        -- skull icon, which is a level indicator too. (SetAlpha would not
        -- work: Blizzard's SetVertexColor resets it.)
        ns.Kill(main.LevelText)
        ns.Kill(ctx.HighLevelTexture)
    end

    if db[p .. "CastIconStyle"] then
        local spellbar = frame.spellbar or _G[frame:GetName() .. "SpellBar"]
        if spellbar then ns.StyleIcon(spellbar.Icon, spellbar) end
    end

    ApplyLayout(frame, db, p)

    if db[p .. "FontStyle"] then
        ns.StyleFont(main.Name)
        ns.StyleFont(main.LevelText)
        ns.StyleBarText(health)
        ns.StyleBarText(power)
    end

    if db[p .. "PercentText"] then
        ns.PercentText(health, false)
        ns.PercentText(power, true)
    end
end

--------------------------------------------------------------------------------
-- Pet (bars are named globals; their TextString/LeftText/RightText fields are
-- set by Blizzard at load, like the other unit frames)
--------------------------------------------------------------------------------
local function SetupPet(db)
    if not PetFrame then return end
    local health, power = PetFrameHealthBar, PetFrameManaBar

    if db.petHideHitText then ns.Kill(PetHitIndicator) end
    -- Auras live in their own container (pooled buttons): reparent it,
    -- no Blizzard fields are touched.
    if db.petHideAuras then ns.Kill(PetFrame.AuraFrameContainer) end

    if db.petFontStyle then
        ns.StyleFont(PetName)
        ns.StyleBarText(health)
        ns.StyleBarText(power)
    end

    if db.petPercentText then
        ns.PercentText(health, false)
        ns.PercentText(power, true)
    end
end

--------------------------------------------------------------------------------
-- Portrait redraw. The 2D portrait is a snapshot of the 3D model: taken
-- before the model has loaded (loading screen, mount, transmog, shapeshift)
-- it stays zoomed in until the next update. One second after the game
-- updates a portrait, it is drawn again with the same API Blizzard uses.
-- Bursts are merged into one redraw; the handler and the timer callback are
-- created once (no garbage). Widget/API calls only, no Blizzard code called.
--------------------------------------------------------------------------------
local PORTRAIT_UNITS = { player = true, vehicle = true, target = true, focus = true }
local portraitPending = false

local function RedrawPortraits()
    portraitPending = false
    for _, frame in ipairs({ PlayerFrame, TargetFrame, FocusFrame }) do
        local portrait, unit = frame and frame.portrait, frame and frame.unit
        if portrait and unit and not IsSecret(unit) and portrait:IsVisible() and UnitExists(unit) then
            SetPortraitTexture(portrait, unit)
        end
    end
end

local portraitEvents = CreateFrame("Frame")
portraitEvents:SetScript("OnEvent", function(_, event, unit)
    if unit and (IsSecret(unit) or not PORTRAIT_UNITS[unit]) then return end
    if portraitPending then return end
    portraitPending = true
    C_Timer.After(1, RedrawPortraits)
end)

local function SetupPortraits()
    for _, event in ipairs({ "UNIT_PORTRAIT_UPDATE", "UNIT_MODEL_CHANGED", "PLAYER_ENTERING_WORLD",
                             "PLAYER_TARGET_CHANGED", "PLAYER_FOCUS_CHANGED" }) do
        portraitEvents:RegisterEvent(event)
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
        -- Hidden and events stopped: no casting updates at all (no CPU cost).
        if db.focusHideCastBar then ns.Disable(FocusFrame.spellbar or FocusFrameSpellBar) end
    end

    SetupPet(db)
    if db.fixPortraits then SetupPortraits() end

    if next(classColorBars) then
        -- Anything that can change a cached color: recompute on next update.
        for _, event in ipairs({ "PLAYER_TARGET_CHANGED", "PLAYER_FOCUS_CHANGED", "GROUP_ROSTER_UPDATE",
                                 "UNIT_FACTION", "UNIT_FLAGS", "UNIT_NAME_UPDATE", "PLAYER_ENTERING_WORLD" }) do
            colorEvents:RegisterEvent(event)
        end
        ns.Hook("UnitFrameHealthBar_Update", ClassColorHealth)
        for bar in pairs(classColorBars) do ClassColorHealth(bar) end
    end
end
