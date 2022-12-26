--------------------------------------------------------------------------------
-- 00. VARIABLES
--------------------------------------------------------------------------------

-- Set Variables
local setupUiVariables = CreateFrame("Frame")

  setupUiVariables:RegisterEvent("PLAYER_LOGIN")
  setupUiVariables:RegisterEvent("ADDON_LOADED")
  setupUiVariables:RegisterEvent("PLAYER_ENTERING_WORLD")
  setupUiVariables:RegisterEvent("CINEMATIC_STOP")
  setupUiVariables:RegisterEvent("CLIENT_SCENE_CLOSED")
  setupUiVariables:RegisterEvent("CLIENT_SCENE_OPENED")
  setupUiVariables:SetScript("OnEvent",function(self, event, ...)

  -- Action Bar
  C_CVar.SetCVar("lockActionBar", 1)

  -- Combat
  C_CVar.SetCVar("autoSelfCast", 1)
  C_CVar.SetCVar("floatingCombatTextCombatHealing", 1)
  C_CVar.SetCVar("floatingCombatTextCombatDamage", 1)
  C_CVar.SetCVar("floatingCombatTextCombatLogPeriodicSpells", 0)
  C_CVar.SetCVar("floatingCombatTextPetMeleeDamage", 0)
  C_CVar.SetCVar("floatingCombatTextPetSpellDamage", 0)

  -- Chat
  C_CVar.SetCVar("colorChatNamesByClass", 1)
  C_CVar.SetCVar("guildMemberNotify", 1)
  C_CVar.SetCVar("profanityFilter", 0)
  C_CVar.SetCVar("spamFilter", 1)
  C_CVar.SetCVar("chatMouseScroll", 1)

  -- Floating Combat Text
  C_CVar.SetCVar("enableFloatingCombatText", 0)
  C_CVar.SetCVar("floatingCombatTextCombatDamageDirectionalScale", 0)
  C_CVar.SetCVar("floatingCombatTextCombatHealingAbsorbTarget", 0)
  C_CVar.SetCVar("floatingCombatTextLowManaHealth", 0)
  C_CVar.SetCVar("floatingCombatTextReactives", 0)

  -- Graphics
  C_CVar.SetCVar("renderscale", 0.999)
  C_CVar.SetCVar("ResampleAlwaysSharpen", 1)

  -- Minimap
  C_CVar.SetCVar("minimapInsideZoom", 2)

  -- Nameplate
  C_CVar.SetCVar('nameplateMaxDistance', 60)
  C_CVar.SetCVar('nameplateOccludedAlphaMult',0.3)
  C_CVar.SetCVar('NameplatePersonalShowAlways',0)
  C_CVar.SetCVar('nameplateSelectedScale',1.4)
  C_CVar.SetCVar('nameplateShowSelf',1)
  C_CVar.SetCVar('nameplateTargetBehindMaxDistance',15)
  C_CVar.SetCVar('nameplateTargetRadialPosition',0)
  C_CVar.SetCVar("nameplateMotion", 1)
  C_CVar.SetCVar("nameplateShowEnemies", 1)
  C_CVar.SetCVar("nameplateShowEnemyPets", 1)
  C_CVar.SetCVar("nameplateShowEnemyTotems", 1)
  C_CVar.SetCVar("nameplateShowOnlyNames", 0)

  -- Unit Frames
  C_CVar.SetCVar("showTargetOfTarget", 0)
  C_CVar.SetCVar("UnitNameEnemyGuardianName", 1)
  C_CVar.SetCVar("UnitNameEnemyPetName", 1)
  C_CVar.SetCVar("UnitNameEnemyPlayerName", 1)
  C_CVar.SetCVar("UnitNameEnemyTotemName", 1)
  C_CVar.SetCVar("UnitNameFriendlyGuardianName", 0)
  C_CVar.SetCVar("UnitNameFriendlyPetName", 0)
  C_CVar.SetCVar("UnitNameFriendlySpecialNPCName", 1)
  C_CVar.SetCVar("UnitNameFriendlyTotemName", 0)
  C_CVar.SetCVar("UnitNameGuildTitle", 0)
  C_CVar.SetCVar("UnitNameInteractiveNPC", 0)
  C_CVar.SetCVar("UnitNameNPC", 0)
  C_CVar.SetCVar("UnitNameOwn", 0)
  C_CVar.SetCVar("UnitNamePlayerGuild", 0)
  C_CVar.SetCVar("UnitNamePlayerPVPTitle", 0)

  -- Raid and Party frames
  C_CVar.SetCVar("findYourselfInRaid", 1)
  C_CVar.SetCVar("findYourselfInRaidOnlyInCombat", 1) 
  C_CVar.SetCVar("useCompactPartyFrames", 1)
  C_CVar.SetCVar("raidFramesDisplayAggroHighlight", 1)
  C_CVar.SetCVar("raidFramesDisplayClassColor", 1)
  C_CVar.SetCVar("raidFramesDisplayOnlyDispellableDebuffs", 1)
  C_CVar.SetCVar("raidFramesDisplayHealthText", 0)
  C_CVar.SetCVar("raidOptionDisplayMainTankAndAssist", 0)
  C_CVar.SetCVar("raidOptionDisplayPets", 0)
  C_CVar.SetCVar("raidFramesDisplayPowerBars", 0)
  C_CVar.SetCVar("raidOptionKeepGroupsTogether", 1)

  -- Toast
  C_CVar.SetCVar("showToastBroadcast", 0)
  C_CVar.SetCVar("showToastFriendRequest", 1)
  C_CVar.SetCVar("showToastOffline", 0)
  C_CVar.SetCVar("showToastOnline", 0)
  C_CVar.SetCVar("showToastWindow", 0)

  -- Various
  C_CVar.SetCVar("alwaysCompareItems", 1)
  C_CVar.SetCVar("autoClearAFK", 1)
  C_CVar.SetCVar("autoDismountFlying", 0)
  C_CVar.SetCVar("autoLootDefault", 1)
  C_CVar.SetCVar("cursorSizePreferred", 0)
  C_CVar.SetCVar("lootUnderMouse", 0)
  C_CVar.SetCVar("maxFPS", 60)
  C_CVar.SetCVar("maxFPSBk", 8)
  C_CVar.SetCVar("movieSubtitle", 1)
  C_CVar.SetCVar("screenEdgeFlash", 0)
  C_CVar.SetCVar("showTutorials", 0)
  C_CVar.SetCVar("synchronizeBindings", 1)
  C_CVar.SetCVar("synchronizeConfig", 1)
  C_CVar.SetCVar("synchronizeMacros", 1)
  C_CVar.SetCVar("synchronizeSettings", 1)

end)

--------------------------------------------------------------------------------
-- 01. COMMANDS
--------------------------------------------------------------------------------

-- Create new commands
SlashCmdList["READYCHECK"] = function() DoReadyCheck() end
SLASH_READYCHECK1 = '/rc'
SlashCmdList["RELOADUI"] = function() ReloadUI() end
SLASH_RELOADUI1 = '/rl'
SlashCmdList["CHECKROLE"] = function() InitiateRolePoll() end
SLASH_CHECKROLE1 = '/cr'

--------------------------------------------------------------------------------
-- 02. HIDE FRAMES
--------------------------------------------------------------------------------

-- Register events and hide frames
local hideVariousFrames = CreateFrame("Frame")

  hideVariousFrames:RegisterEvent("PLAYER_LOGIN")
  hideVariousFrames:RegisterEvent("ADDON_LOADED")
  hideVariousFrames:RegisterEvent("PLAYER_ENTERING_WORLD")
  hideVariousFrames:RegisterEvent("CINEMATIC_STOP")
  hideVariousFrames:RegisterEvent("CLIENT_SCENE_CLOSED")
  hideVariousFrames:RegisterEvent("CLIENT_SCENE_OPENED")
  hideVariousFrames:SetScript("OnEvent",function(self, event, ...)

  -- Hide Micro buttons and bags
  MicroButtonAndBagsBar:UnregisterAllEvents()
  MicroButtonAndBagsBar:Hide()
  MicroButtonAndBagsBar:HookScript("OnShow",function(self) self:Hide() end)

  -- Hide Pet bar
  PetActionBar:UnregisterAllEvents()
  PetActionBar:Hide()
  PetActionBar:HookScript("OnShow",function(self) self:Hide() end)

  -- Hide Pet Unit frame
  PetFrame:UnregisterAllEvents()
  PetFrame:Hide()
  PetFrame:HookScript("OnShow",function(self) self:Hide() end)

  -- Hide Totem frame
  TotemFrame:UnregisterAllEvents()
  TotemFrame:Hide()
  TotemFrame:HookScript("OnShow",function(self) self:Hide() end)

  -- Hide UI errors
  UIErrorsFrame:Hide()

  -- Hide Reputation/XP bar
  StatusTrackingBarManager:UnregisterAllEvents()
  StatusTrackingBarManager:Hide()
  StatusTrackingBarManager:SetScript("OnShow", function() StatusTrackingBarManager:Hide() end)

  -- Hide Chat Frame Channel button
  ChatFrameChannelButton:UnregisterAllEvents()
  ChatFrameChannelButton:Hide()
  ChatFrameChannelButton:EnableMouse(false)

end)

--------------------------------------------------------------------------------
-- 03. UNIT FRAMES
--------------------------------------------------------------------------------

-- Remove damage and healing text in portraits
local COMBATFEEDBACK_FADEINTIME = 0 
local COMBATFEEDBACK_HOLDTIME = 0 
local COMBATFEEDBACK_FADEOUTTIME = 0

-- Remove buffs/debuffs from target frame
TargetFrame.maxBuffs = 0
TargetFrame.maxDebuffs = 0

-- Hide Reputation background for target and focus frames
TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetTexture(nil)
FocusFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetTexture(nil)

--------------------------------------------------------------------------------
-- 04. CHAT
--------------------------------------------------------------------------------

-- Chat style
STRING_STYLE  = "%s|| "
CHANNEL_STYLE = "%d"
PLAYER_STYLE  = "%s"

-- Lines to scroll on mousewheel
NUM_LINES_TO_SCROLL = 3

-- Reduce overlay animation
CHAT_TAB_SHOW_DELAY = 0.1
CHAT_TAB_HIDE_DELAY = 0.1
CHAT_FRAME_FADE_TIME = 0.1
CHAT_FRAME_FADE_OUT_TIME = 0.1

-- Configure more font sizes
CHAT_FONT_HEIGHTS = {10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}

-- Chat mousover
CHAT_FRAME_TAB_SELECTED_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0
CHAT_FRAME_TAB_NORMAL_MOUSEOVER_ALPHA = 0.5
CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0

--------------------------------------------------------------------------------
-- 05. MAP
--------------------------------------------------------------------------------

-- Enlarge Minimap
Minimap:SetScale(1.1)

--------------------------------------------------------------------------------
-- 06. RAID AND DUNGEONS
--------------------------------------------------------------------------------

-- Hide Realm name from Raid frames
hooksecurefunc("CompactUnitFrame_UpdateName",function(frame)

  if frame and not frame:IsForbidden() then
  local frame_name = frame:GetName()
    if frame_name and frame_name:match("^CompactRaidFrame%d") and frame.unit and frame.name then
    local unit_name = GetUnitName(frame.unit,true)
      if unit_name then
      frame.name:SetText(unit_name:match("[^-]+"))
      end
    end
  end

end)

-- Hide Objective Tracker while in Raid Boss encounter
local hideQuestTracker = CreateFrame("Frame")

  hideQuestTracker:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
  if event == "INSTANCE_ENCOUNTER_ENGAGE_UNIT" and instanceType == 'raid' then
  ObjectiveTracker_Collapse()

end

--------------------------------------------------------------------------------
-- 07. ACTION BARS
--------------------------------------------------------------------------------

-- Hide GCD blink
for i = 1, 12 do

  local button = _G["ActionButton"..i]
  button.cooldown:SetDrawBling(false)

end

-- Avoid interaction with MainActionBar buttons
MultiBar5Button1:SetScript("OnEnter", nil)
MultiBar5Button1:SetScript("OnClick", nil)
MultiBar5Button2:SetScript("OnEnter", nil)
MultiBar5Button2:SetScript("OnClick", nil)
MultiBar5Button3:SetScript("OnEnter", nil)
MultiBar5Button3:SetScript("OnClick", nil)
MultiBar5Button4:SetScript("OnEnter", nil)
MultiBar5Button4:SetScript("OnClick", nil)
MultiBar5Button5:SetScript("OnEnter", nil)
MultiBar5Button5:SetScript("OnClick", nil)
MultiBar5Button6:SetScript("OnEnter", nil)
MultiBar5Button6:SetScript("OnClick", nil)
MultiBar5Button7:SetScript("OnEnter", nil)
MultiBar5Button7:SetScript("OnClick", nil)
MultiBar5Button8:SetScript("OnEnter", nil)
MultiBar5Button8:SetScript("OnClick", nil)
MultiBar5Button9:SetScript("OnEnter", nil)
MultiBar5Button9:SetScript("OnClick", nil)
MultiBar5Button10:SetScript("OnEnter", nil)
MultiBar5Button10:SetScript("OnClick", nil)
MultiBar5Button11:SetScript("OnEnter", nil)
MultiBar5Button11:SetScript("OnClick", nil)
MultiBar5Button12:SetScript("OnEnter", nil)
MultiBar5Button12:SetScript("OnClick", nil)

MultiBar7Button1:SetScript("OnEnter", nil)
MultiBar7Button1:SetScript("OnClick", nil)
MultiBar7Button2:SetScript("OnEnter", nil)
MultiBar7Button2:SetScript("OnClick", nil)
MultiBar7Button3:SetScript("OnEnter", nil)
MultiBar7Button3:SetScript("OnClick", nil)
MultiBar7Button4:SetScript("OnEnter", nil)
MultiBar7Button4:SetScript("OnClick", nil)
MultiBar7Button5:SetScript("OnEnter", nil)
MultiBar7Button5:SetScript("OnClick", nil)
MultiBar7Button6:SetScript("OnEnter", nil)
MultiBar7Button6:SetScript("OnClick", nil)
MultiBar7Button7:SetScript("OnEnter", nil)
MultiBar7Button7:SetScript("OnClick", nil)
MultiBar7Button8:SetScript("OnEnter", nil)
MultiBar7Button8:SetScript("OnClick", nil)
MultiBar7Button9:SetScript("OnEnter", nil)
MultiBar7Button9:SetScript("OnClick", nil)
MultiBar7Button10:SetScript("OnEnter", nil)
MultiBar7Button10:SetScript("OnClick", nil)
MultiBar7Button11:SetScript("OnEnter", nil)
MultiBar7Button11:SetScript("OnClick", nil)
MultiBar7Button12:SetScript("OnEnter", nil)
MultiBar7Button12:SetScript("OnClick", nil)

-- Hide MainActionBar out of combat/in combat
MainMenuBar:SetAlpha(0)
local hideMainMenu = CreateFrame("Frame")

  hideMainMenu:RegisterEvent("PLAYER_ENTERING_WORLD")
  hideMainMenu:RegisterEvent("PLAYER_LOGIN")
  hideMainMenu:RegisterEvent("ADDON_LOADED")
  hideMainMenu:RegisterEvent("PLAYER_REGEN_ENABLED")
  hideMainMenu:RegisterEvent("PLAYER_REGEN_DISABLED")
  hideMainMenu:SetScript("OnEvent", function(self, event)

  if event == "PLAYER_REGEN_ENABLED" then
    MainMenuBar:SetAlpha(0)
    MainMenuBar:SetScript("OnShow", function() MainMenuBar:SetAlpha(0) end)
  elseif event == "PLAYER_REGEN_DISABLED" then
    MainMenuBar:SetAlpha(0)
    MainMenuBar:SetScript("OnShow", function() MainMenuBar:SetAlpha(0) end)
  end

end)

--------------------------------------------------------------------------------
-- 08. POWER BARS
--------------------------------------------------------------------------------

-- Hide Power bars out of combat
MonkStaggerBar:SetAlpha(0)
MonkHarmonyBarFrame:SetAlpha(0)

EventRegistry:RegisterCallback("PLAYER_REGEN_DISABLED", function() 

  if UnitInVehicle  ("player") then

    -- Rogue
    ComboPointPlayerFrame:SetAlpha(0)
    ComboPointPlayerFrame:SetScript("OnShow", function() MonkHarmonyBarFrame:Hide() end)
    -- Mage
    MageArcaneChargesFrame:SetAlpha(0)
    MageArcaneChargesFrame:SetScript("OnShow", function() MonkHarmonyBarFrame:Hide() end)
    -- Monk
    MonkHarmonyBarFrame:SetAlpha(0)
    MonkHarmonyBarFrame:SetScript("OnShow", function() MonkHarmonyBarFrame:Hide() end)
    MonkStaggerBar:SetAlpha(0)
    MonkStaggerBar:SetScript("OnShow", function() MonkStaggerBar:Hide() end)
    -- Paladin
    PaladinPowerBarFrame:SetAlpha(0)
    PaladinPowerBarFrame:SetScript("OnShow", function() MonkHarmonyBarFrame:Hide() end)
    -- Death Knight
    RuneFrame:SetAlpha(0)
    RuneFrame:SetScript("OnShow", function() MonkHarmonyBarFrame:Hide() end)
    -- Warlock
    WarlockPowerFrame:SetAlpha(0)
    WarlockPowerFrame:SetScript("OnShow", function() MonkHarmonyBarFrame:Hide() end)

  else

    -- Rogue
    ComboPointPlayerFrame:SetAlpha(1)
    ComboPointPlayerFrame:ClearAllPoints()
    ComboPointPlayerFrame:SetScale(1.0)
    ComboPointPlayerFrame:SetPoint("CENTER",UIParent,"CENTER", 0, -190)
    -- Mage
    MageArcaneChargesFrame:SetAlpha(1)
    MageArcaneChargesFrame:ClearAllPoints()
    MageArcaneChargesFrame:SetScale(1.0)
    MageArcaneChargesFrame:SetPoint("CENTER",UIParent,"CENTER", 0, -190)
    -- Monk
    MonkHarmonyBarFrame:SetAlpha(1)
    MonkHarmonyBarFrame:ClearAllPoints()
    MonkHarmonyBarFrame:SetScale(1.0)
    MonkHarmonyBarFrame:SetPoint("CENTER",UIParent,"CENTER", 0, -190)
    MonkStaggerBar:SetAlpha(1)
    MonkStaggerBar:ClearAllPoints()
    MonkStaggerBar:SetScale(1.1)
    MonkStaggerBar:SetPoint("CENTER",UIParent,"CENTER", 0, -170)
    -- Paladin
    PaladinPowerBarFrame:SetAlpha(1)
    PaladinPowerBarFrame:ClearAllPoints()
    PaladinPowerBarFrame:SetScale(1.0)
    PaladinPowerBarFrame:SetPoint("CENTER",UIParent,"CENTER", 0, -190)
    -- Death Knight
    RuneFrame:SetAlpha(1)
    RuneFrame:ClearAllPoints()
    RuneFrame:SetScale(1.0)
    RuneFrame:SetPoint("CENTER",UIParent,"CENTER", 0, -190)
    -- Warlock
    WarlockPowerFrame:SetAlpha(1)
    WarlockPowerFrame:ClearAllPoints()
    WarlockPowerFrame:SetScale(1.0)
    WarlockPowerFrame:SetPoint("CENTER",UIParent,"CENTER", 0, -190)

  end

end)

EventRegistry:RegisterCallback("PLAYER_REGEN_ENABLED", function() 

    -- Rogue
    ComboPointPlayerFrame:SetAlpha(0)
    ComboPointPlayerFrame:SetScript("OnShow", function() MonkHarmonyBarFrame:Hide() end)
    -- Mage
    MageArcaneChargesFrame:SetAlpha(0)
    MageArcaneChargesFrame:SetScript("OnShow", function() MonkHarmonyBarFrame:Hide() end)
    -- Monk
    MonkHarmonyBarFrame:SetAlpha(0)
    MonkHarmonyBarFrame:SetScript("OnShow", function() MonkHarmonyBarFrame:Hide() end)
    MonkStaggerBar:SetAlpha(0)
    MonkStaggerBar:SetScript("OnShow", function() MonkStaggerBar:Hide() end)
    -- Paladin
    PaladinPowerBarFrame:SetAlpha(0)
    PaladinPowerBarFrame:SetScript("OnShow", function() MonkHarmonyBarFrame:Hide() end)
    -- Death Knight
    RuneFrame:SetAlpha(0)
    RuneFrame:SetScript("OnShow", function() MonkHarmonyBarFrame:Hide() end)
    -- Warlock
    WarlockPowerFrame:SetAlpha(0)
    WarlockPowerFrame:SetScript("OnShow", function() MonkHarmonyBarFrame:Hide() end)

end)
