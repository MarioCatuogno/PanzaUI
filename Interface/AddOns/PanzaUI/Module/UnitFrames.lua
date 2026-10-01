--[[----------------------------------------------------------------------------
    PanzaUI - Unit Frames (Player, Target, Focus, Pet)
    Per frame: refined style (outlined text, centered name, health and power
    as a percentage, portrait redraw...), class colors and hidden clutter
    (minor icons, glows, numbers, auras; Player: totems and class resources;
    Focus: cast bar). Focus refined style shows only 4 debuffs.
    All options are applied once at login (Requires Reload UI): nothing here
    calls Blizzard update code, so no taint reaches secret-value handling.
------------------------------------------------------------------------------]]
local _, ns = ...

--------------------------------------------------------------------------------
-- Options. Target and Focus share most entries (keys <prefix><Key>, e.g.
-- targetStyle, focusHideClutter). Every option is on by default.
--------------------------------------------------------------------------------
-- frame = global name, prefix = option key prefix, unit = section / text
local TARGET_FRAMES = {
    { frame = "TargetFrame", prefix = "target", unit = "Target" },
    { frame = "FocusFrame",  prefix = "focus",  unit = "Focus" },
}

local options = {
    { header = "Player" },
    { key = "playerStyle", label = "Refined style",
      tooltip = "Polish the look of the Player frame.",
      bullets = { "Outlined text", "Centered name, no level", "Health and power as a percentage", "Portrait redrawn when it stays zoomed in" } },
    { key = "playerClassColor", label = "Class colors",
      tooltip = "Color the health bar by class." },
    { key = "playerHideClutter", label = "Hide clutter",
      tooltip = "Hide minor elements of the Player frame.",
      bullets = { "Combat and rest glow", "Damage and healing numbers", "PvP, leader and group icons", "Totems", "Class resources (shown on the Personal Resource Display)" } },
}

for _, t in ipairs(TARGET_FRAMES) do
    local p = t.prefix
    local styleBullets = { "Outlined text", "Centered name, no level or name background", "Health and power as a percentage",
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
    bullets = { "Outlined text", "Health and power as a percentage" } }
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

-- Old saved values: one option per detail (several versions).
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
-- PvP icon: the faction / prestige badge (and the Player's PvP timer) of a
-- unit frame's contextual layer. Blizzard keeps showing/hiding them, so
-- they are moved under the hidden parent (key names differ per frame).
--------------------------------------------------------------------------------
local PVP_PARTS = { "PVPIcon", "PvpIcon", "PrestigePortrait", "PrestigeBadge", "PvpTimerText", "PVPTimerText" }

local function HidePvpIcon(ctx)
    if not ctx then return end
    for _, key in ipairs(PVP_PARTS) do ns.Kill(ctx[key]) end
end

-- Group leader (crown), assistant and guide icons.
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

    if db.playerHideClutter then
        ns.Kill(main.StatusTexture)                          -- rest (yellow) / combat (red) pulse
        ns.Kill(PlayerFrame.PlayerFrameContainer.FrameFlash) -- combat border flash
        ns.Kill(ctx.PlayerRestLoop)                          -- Zzz animation
        ns.Kill(main.HitIndicator)                           -- damage / healing numbers
        HidePvpIcon(ctx)
        ns.Kill(PlayerPVPTimerText)
        HideLeaderIcon(ctx)
        -- Raid group indicator ("Group 5" + its background): Blizzard keeps
        -- showing/hiding it, so it is moved under the hidden parent.
        ns.Kill(ctx.GroupIndicator or PlayerFrameGroupIndicator)

        -- Totems (not secure): hidden and events stopped, so the frame below
        -- the Player frame collapses and no totem updates run.
        ns.Disable(TotemFrame)

        -- Class resources (the Personal Resource Display keeps its own).
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
        -- Blizzard re-anchors the player name when entering/leaving vehicles.
        ns.Hook("PlayerFrame_UpdatePlayerNameTextAnchor", function() CenterName(PlayerName, bar) end)

        ns.StyleFont(PlayerName)
        ns.StyleFont(PlayerLevelText)
        ns.StyleBarText(health)
        ns.StyleBarText(power)
        ns.PercentText(health, false)
        ns.PercentText(power, true)
    end

    if db.playerClassColor then classColorBars[health] = true end
end

--------------------------------------------------------------------------------
-- NPC followers (follower dungeons, delves): Blizzard puts a "*" before their
-- name. After each Blizzard SetText the name is rewritten from UnitName
-- without it. Skipped when unit or name are secret values (never inspected).
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
        if name:byte(1) == 42 then name = name:gsub("^%*+%s*", "") end -- "*": no string work otherwise
        text:SetText(name)
        busy = false
    end)
end

--------------------------------------------------------------------------------
-- Target-style frames (Target and Focus share TargetFrameMixin/template)
--------------------------------------------------------------------------------

-- Parts that Blizzard may re-anchor or re-texture (Focus "small size" mode):
-- applied at login and again after FocusFrame:SetSmallSize().
local function ApplyLayout(frame, db, p)
    local main = frame.TargetFrameContent.TargetFrameContentMain
    -- Aura limits (Blizzard's own fields, also reset by SetSmallSize).
    -- Focus refined style: 4 debuffs, no buffs. Otherwise hidden clutter
    -- hides every aura.
    if p == "focus" and db.focusStyle then
        frame.maxBuffs, frame.maxDebuffs = 0, 4
    elseif db[p .. "HideClutter"] then
        frame.maxBuffs, frame.maxDebuffs = 0, 0
    end
    if db[p .. "Style"] then
        CenterName(main.Name, main.HealthBarsContainer)
        -- Clear the texture instead of Kill()/SetAlpha(): Name and LevelText
        -- are anchored to it (so it must stay in place), and Blizzard's
        -- SetVertexColor(UnitSelectionColor()) resets the texture alpha.
        main.ReputationColor:SetTexture(nil)
    end
end

local function SetupTargetFrame(frame, db, p)
    local main = frame.TargetFrameContent.TargetFrameContentMain
    local ctx  = frame.TargetFrameContent.TargetFrameContentContextual
    local health, power = main.HealthBarsContainer.HealthBar, main.ManaBar

    if db[p .. "HideClutter"] then
        HidePvpIcon(ctx)
        HideLeaderIcon(ctx)
    end

    if db[p .. "ClassColor"] then
        classColorBars[health] = true
        -- Its Target of Target frame (TargetFrameToT / FocusFrameToT).
        local tot = frame.totFrame
        local totHealth = tot and (tot.healthbar or tot.HealthBar)
        if totHealth then classColorBars[totHealth] = true end
    end

    ApplyLayout(frame, db, p)

    if db[p .. "Style"] then
        -- Kill() is safe: nothing is anchored to the level text except the
        -- skull icon, which is a level indicator too. (SetAlpha would not
        -- work: Blizzard's SetVertexColor resets it.)
        ns.Kill(main.LevelText)
        ns.Kill(ctx.HighLevelTexture)

        -- NPC follower names without "*" (the frame and its Target of Target).
        HideFollowerMark(main.Name, frame)
        local tot = frame.totFrame
        if tot then HideFollowerMark(tot.name or tot.Name, tot) end

        local spellbar = frame.spellbar or _G[frame:GetName() .. "SpellBar"]
        if spellbar then ns.StyleIcon(spellbar.Icon, spellbar) end

        ns.StyleFont(main.Name)
        ns.StyleFont(main.LevelText)
        ns.StyleBarText(health)
        ns.StyleBarText(power)
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

    if db.petHideClutter then
        ns.Kill(PetHitIndicator)
        -- Auras live in their own container (pooled buttons): reparent it,
        -- no Blizzard fields are touched.
        ns.Kill(PetFrame.AuraFrameContainer)
    end

    if db.petStyle then
        ns.StyleFont(PetName)
        ns.StyleBarText(health)
        ns.StyleBarText(power)
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

local PORTRAIT_FRAMES = {} -- frames whose refined style is on (filled at login)

local function RedrawPortraits()
    portraitPending = false
    for _, frame in ipairs(PORTRAIT_FRAMES) do
        local portrait, unit = frame and frame.portrait, frame and frame.unit
        if portrait and unit and not IsSecret(unit) and portrait:IsVisible() and UnitExists(unit)
            -- Blizzard can show a class icon instead of the portrait: leave it.
            and not (UnitFrame_ShouldReplacePortrait and UnitFrame_ShouldReplacePortrait(frame)) then
            -- Same arguments as Blizzard's UnitFramePortrait_Update: the Player
            -- frame draws an unmasked portrait (its own mask has a square
            -- corner); without the flag the image comes out pre-rounded.
            SetPortraitTexture(portrait, unit, frame.disablePortraitMask)
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

-- Redraws the portraits of the frames whose refined style is on.
local function SetupPortraits(db)
    if db.playerStyle then PORTRAIT_FRAMES[#PORTRAIT_FRAMES + 1] = PlayerFrame end
    for _, t in ipairs(TARGET_FRAMES) do
        local frame = _G[t.frame]
        if frame and db[t.prefix .. "Style"] then PORTRAIT_FRAMES[#PORTRAIT_FRAMES + 1] = frame end
    end
    if #PORTRAIT_FRAMES == 0 then return end
    for _, event in ipairs({ "UNIT_PORTRAIT_UPDATE", "UNIT_MODEL_CHANGED", "PLAYER_ENTERING_WORLD",
                             "PLAYER_TARGET_CHANGED", "PLAYER_FOCUS_CHANGED" }) do
        portraitEvents:RegisterEvent(event)
    end
end

--------------------------------------------------------------------------------
-- Focus debuffs (refined style): rounded icon borders. Debuff buttons come from the frame's aura
-- pool: after each aura update the active ones are styled (once each).
--------------------------------------------------------------------------------
local styledAuras = {}

local function StyleFocusDebuffs(frame)
    local pool = frame.auraPools and frame.auraPools:GetPool("TargetDebuffFrameTemplate")
    if not pool then return end
    for button in pool:EnumerateActive() do
        if not styledAuras[button] and button.Icon then
            styledAuras[button] = true
            ns.StyleIcon(button.Icon, button)
        end
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
        -- Cast bar hidden and events stopped: no casting updates at all.
        if db.focusHideClutter then ns.Disable(FocusFrame.spellbar or FocusFrameSpellBar) end
        if db.focusStyle then
            ns.Hook(FocusFrame, "UpdateAuras", StyleFocusDebuffs)
            StyleFocusDebuffs(FocusFrame)
        end
    end

    SetupPet(db)
    SetupPortraits(db)

    if next(classColorBars) then
        -- Anything that can change a cached color: recompute on next update.
        -- UNIT_TARGET: the target/focus changed its own target (Target of Target).
        for _, event in ipairs({ "PLAYER_TARGET_CHANGED", "PLAYER_FOCUS_CHANGED", "UNIT_TARGET", "GROUP_ROSTER_UPDATE",
                                 "UNIT_FACTION", "UNIT_FLAGS", "UNIT_NAME_UPDATE", "PLAYER_ENTERING_WORLD" }) do
            colorEvents:RegisterEvent(event)
        end
        ns.Hook("UnitFrameHealthBar_Update", ClassColorHealth)
        for bar in pairs(classColorBars) do ClassColorHealth(bar) end
    end
end
