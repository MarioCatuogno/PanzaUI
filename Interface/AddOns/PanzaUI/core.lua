--------------------------------------------------------------------------------
-- PanzaUI
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- HELPER FUNCTIONS
--------------------------------------------------------------------------------

-- Add any helper functions here that can be reused across other functions
local addonName, addonTable = ...

addonTable.core = {}
--------------------------------------------------------------------------------
-- FUNCTION 00: Configure CVars and commands
--------------------------------------------------------------------------------

-- Set CVars
local function configCVars()
  -- Action Bar
  C_CVar.SetCVar("lockActionBar", 1)

  -- Bags
  C_CVar.SetCVar("combinedBags", 0)

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
  C_CVar.SetCVar("minimapTrackingShowAll",1)

  -- Nameplate (Enable if not using Threat Plates)
  --C_CVar.SetCVar('nameplateMaxDistance', 30)
  --C_CVar.SetCVar('nameplateOccludedAlphaMult', 0.7)
  --C_CVar.SetCVar('NameplatePersonalShowAlways', 0)
  --C_CVar.SetCVar('nameplateSelectedScale', 1.5)
  --C_CVar.SetCVar('nameplateShowSelf', 0)
  --C_CVar.SetCVar('nameplateTargetBehindMaxDistance', 10)
  --C_CVar.SetCVar('nameplateTargetRadialPosition', 0)
  --C_CVar.SetCVar("nameplateMinAlpha", 0.5)
  --C_CVar.SetCVar("nameplateMinAlphaDistance", 10)
  --C_CVar.SetCVar("nameplateMotion", 2)
  --C_CVar.SetCVar("nameplateOtherBottomInset", 0.1)
  --C_CVar.SetCVar("nameplateOtherTopInset", 0.08)
  --C_CVar.SetCVar("nameplateShowEnemies", 1)
  --C_CVar.SetCVar("nameplateShowEnemyPets", 1)
  --C_CVar.SetCVar("nameplateShowEnemyTotems", 1)
  --C_CVar.SetCVar("nameplateShowOnlyNames", 0)
  --C_CVar.SetCVar("NamePlateVerticalScale", 1.2)
  --C_CVar.SetCVar("nameplateOverlapV", 0.7)
  --C_CVar.SetCVar("nameplateOverlapH", 0.4)

  -- Unit Frames
  C_CVar.SetCVar("showTargetOfTarget", 1)
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

-- Create new commands
SlashCmdList["READYCHECK"] = function() DoReadyCheck() end
SLASH_READYCHECK1 = '/rc'
SlashCmdList["RELOADUI"] = function() ReloadUI() end
SLASH_RELOADUI1 = '/rl'
SlashCmdList["CHECKROLE"] = function() InitiateRolePoll() end
SLASH_CHECKROLE1 = '/cr'
end

--------------------------------------------------------------------------------
-- FUNCTION 1: Configure Quest Tracker
--------------------------------------------------------------------------------

-- Configure the Quest Tracker frame and Encounter bar
local function configQuestTracker()
  -- Configuration table to store scale values for ObjectiveTrackerFrame and EncounterBar
  local config = {
    objectiveTrackerScale = 0.95,
    encounterBarScale = 0.7
  }

  -- Set the scale for ObjectiveTrackerFrame
  if ObjectiveTrackerFrame then
    ObjectiveTrackerFrame:SetScale(config.objectiveTrackerScale)
  end

  -- Set the scale for EncounterBar
  if EncounterBar then
    EncounterBar:SetScale(config.encounterBarScale)
  end
end

--------------------------------------------------------------------------------
-- FUNCTION 2: Configure Queue Icon
--------------------------------------------------------------------------------

-- Configure the Queue Status Button and Icon
local function configQueueIcon()
  -- Configuration table to store scale and position values for the Queue Status Button
  local config = {
    buttonScale = 0.7,
    iconPosition = {
      point = "BOTTOM",
      relativeTo = Minimap,
      offsetX = 0,
      offsetY = -10
    }
  }

  -- Check if both QueueStatusButtonIcon and QueueStatusButton exist
  if not (QueueStatusButtonIcon and QueueStatusButton) then
    return
  end

  -- Clear all points and set the new position for the QueueStatusButtonIcon
  QueueStatusButtonIcon:ClearAllPoints()
  QueueStatusButtonIcon:SetPoint(config.iconPosition.point, config.iconPosition.relativeTo, config.iconPosition.offsetX, config.iconPosition.offsetY)

  -- Clear all points, set the scale and set the new position for the QueueStatusButton
  QueueStatusButton:ClearAllPoints()
  QueueStatusButton:SetScale(config.buttonScale)
  QueueStatusButton:SetPoint(config.iconPosition.point, config.iconPosition.relativeTo, config.iconPosition.offsetX, config.iconPosition.offsetY)
end

--------------------------------------------------------------------------------
-- FUNCTION 3: Hide Micro Menu Alerts
--------------------------------------------------------------------------------

-- This function disables alerts for the Micro Menu Bar
local function hideMicroMenuAlerts()
  -- Hook the function that checks if MainMenuMicroButton alerts are enabled
  hooksecurefunc("MainMenuMicroButton_AreAlertsEnabled", function()
    return false
  end)
end

--------------------------------------------------------------------------------
-- FUNCTION 4: Auto-Collapse Buff Frame
--------------------------------------------------------------------------------

-- This function auto-collapses the buff frame in World of Warcraft
local function autoCollapseBuffFrame()
  -- Check if BuffFrame and CollapseAndExpandButton exist
  if not (BuffFrame and BuffFrame.CollapseAndExpandButton) then return end
  
  -- Set the CollapseAndExpandButton to unchecked (collapsed) state
  BuffFrame.CollapseAndExpandButton:SetChecked(false)
  
  -- Update the orientation of the CollapseAndExpandButton
  BuffFrame.CollapseAndExpandButton:UpdateOrientation()
  
  -- Set the expanded state of the BuffFrame
  BuffFrame:SetBuffsExpandedState()
end

--------------------------------------------------------------------------------
-- FUNCTION 5: Hide Various UI Frames
--------------------------------------------------------------------------------

-- This function hides a specific UI frame and unregisters its events
local function hideUIFrame(frame)
  if not frame or frame:IsProtected() then return end
  
  frame:UnregisterAllEvents()
  frame:Hide()
  frame:HookScript("OnShow", function() frame:Hide() end)
end

-- This function hides multiple UI frames
local function hideMultipleUIFrames()
  hideUIFrame(MicroMenu)
  hideUIFrame(BagsBar)
  hideUIFrame(PetActionBar)
  hideUIFrame(PetFrame)
  hideUIFrame(UIErrorsFrame)
  hideUIFrame(StatusTrackingBarManager)
  hideUIFrame(ChatFrameChannelButton)
  hideUIFrame(DurabilityFrame)
  hideUIFrame(VehicleSeatIndicator)
  hideUIFrame(TotemFrame)
end

--------------------------------------------------------------------------------
-- FUNCTION 6: Configure Player Frame
--------------------------------------------------------------------------------

-- Helper function to hide power bars
local function hidePowerBar(powerBar)
  if powerBar then
    powerBar:SetAlpha(0)
  end
end

local function configPlayerFrame()
  -- Hide combat flash and rest
  local hideRest = CreateFrame("Frame")
  PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestLoop:SetParent(hideRest)
  PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.StatusTexture:SetParent(hideRest)
  PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerPortraitCornerIcon:SetParent(hideRest)
  PlayerFrame.PlayerFrameContainer.FrameFlash:SetParent(hideRest)
  TargetFrame.TargetFrameContainer.Flash:SetParent(hideRest)
  hideRest:Hide()

  -- Hide Power Bars
  hidePowerBar(ComboPointDruidPlayerFrame)
  hidePowerBar(ComboPointPlayerFrame)
  hidePowerBar(EssencePlayerFrame)
  hidePowerBar(MageArcaneChargesFrame)
  hidePowerBar(MonkHarmonyBarFrame)
  hidePowerBar(MonkStaggerBar)
  hidePowerBar(PaladinPowerBarFrame)
  hidePowerBar(PlayerFrameAlternateManaBar)
  hidePowerBar(RuneFrame)
  hidePowerBar(WarlockPowerFrame)

  -- Remove damage and healing text in portraits
  COMBATFEEDBACK_FADEINTIME = 0
  COMBATFEEDBACK_HOLDTIME = 0
  COMBATFEEDBACK_FADEOUTTIME = 0
end

--------------------------------------------------------------------------------
-- FUNCTION 7: Configure Target Frame
--------------------------------------------------------------------------------

-- Configure Target Frame
local function configTargetFrame()
  -- Remove buffs/debuffs from target frame
  TargetFrame.maxBuffs = 0
  TargetFrame.maxDebuffs = 0

  -- Hide Reputation background for target and focus frames
  if TargetFrame.TargetFrameContent and TargetFrame.TargetFrameContent.TargetFrameContentMain and TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor then
    TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetTexture(nil)
  end
  if FocusFrame.TargetFrameContent and FocusFrame.TargetFrameContent.TargetFrameContentMain and FocusFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor then
    FocusFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetTexture(nil)
  end
end

--------------------------------------------------------------------------------
-- FUNCTION 8: Class colour player and target frames
--------------------------------------------------------------------------------

local function UpdateHealthBarColor(self)
  if UnitIsPlayer(self.unit) and UnitIsConnected(self.unit) then
    local _, classToken = UnitClass(self.unit)
    local classColor = RAID_CLASS_COLORS[classToken]
    
    if classColor then
      self:SetStatusBarColor(classColor.r, classColor.g, classColor.b)
    else
      self:SetStatusBarColor(0.5, 0.5, 0.5)
    end
  elseif UnitIsPlayer(self.unit) then
    self:SetStatusBarColor(0.5, 0.5, 0.5)
  else
    self:SetStatusBarColor(0.0, 1.0, 0.0)
  end
  self:SetStatusBarDesaturated(true)
end

local function configClassColorFrames()
  hooksecurefunc("HealthBar_OnValueChanged", UpdateHealthBarColor)
  hooksecurefunc("UnitFrameHealthBar_Update", UpdateHealthBarColor)
end

--------------------------------------------------------------------------------
-- FUNCTION 9: Configure chat
--------------------------------------------------------------------------------

-- Helper function to hide frames and set chat scrolling
local function SetAlphaForFrame(frame, alpha)
  if frame then
    frame:SetAlpha(alpha)
    frame:EnableMouse(alpha ~= 0)
  end
end

local function ImproveMouseScroll(self, direction)
  local scrollFunc = IsShiftKeyDown() and (direction > 0 and "ScrollToTop" or "ScrollToBottom") or (direction > 0 and "ScrollUp" or "ScrollDown")
  self[scrollFunc](self)
  if not IsShiftKeyDown() then
    self[scrollFunc](self)
  end
end

local function configChatFrame()
  -- Hide buttons and toast
  SetAlphaForFrame(ChatFrameMenuButton, 0)
  SetAlphaForFrame(QuickJoinToastButton, 0)

  -- Improve mousewheel scrolling
  hooksecurefunc("FloatingChatFrame_OnMouseScroll", ImproveMouseScroll)
end

-- Chat style
STRING_STYLE = "%s|| "
CHANNEL_STYLE = "%d"
PLAYER_STYLE = "%s"

-- Lines to scroll on mousewheel
NUM_LINES_TO_SCROLL = 1

-- Reduce overlay animation
CHAT_TAB_SHOW_DELAY = 0.1
CHAT_TAB_HIDE_DELAY = 0.1
CHAT_FRAME_FADE_TIME = 0.1
CHAT_FRAME_FADE_OUT_TIME = 0.1

-- Configure more font sizes
CHAT_FONT_HEIGHTS = {10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}

-- Chat mouseover
CHAT_FRAME_TAB_SELECTED_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0
CHAT_FRAME_TAB_NORMAL_MOUSEOVER_ALPHA = 0.5
CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0

-- Tag players in chat
CHAT_FLAG_AFK = "[AFK] "
CHAT_FLAG_DND = "[DND] "
CHAT_FLAG_GM = "[GM] "

--------------------------------------------------------------------------------
-- FUNCTION 10: Configure minimap
--------------------------------------------------------------------------------

-- Helper function to unregister events and set scale
local function HideFrameAndUnregisterEvents(frame)
  if frame then
    frame:UnregisterAllEvents()
    frame:Hide()
    frame:HookScript("OnShow", function() frame:Hide() end)
  end
end

local function SetScaleForFrame(frame, scale)
  if frame then
    frame:SetScale(scale)
  end
end

local function SetAlphaForFrame(frame, alpha)
  if frame then
    frame:SetAlpha(alpha)
  end
end

local function configMapElements()
  -- Set Alpha and Scale
  SetScaleForFrame(MinimapZoneText, 1.0)
  SetScaleForFrame(Minimap, 1.0)
  SetScaleForFrame(MinimapCluster, 1.0)
  SetAlphaForFrame(MinimapCluster.BorderTop, 0)

  -- Hide Minimap zoom buttons
  HideFrameAndUnregisterEvents(Minimap.ZoomIn)
  HideFrameAndUnregisterEvents(Minimap.ZoomOut)

  -- Set Garrison button scale
  SetScaleForFrame(ExpansionLandingPageMinimapButton, 0.85)
end

--------------------------------------------------------------------------------
-- FUNCTION 11: Hide server names from raid frames
--------------------------------------------------------------------------------

-- Hide Realm name from Raid frames
local function hideRealmNameFromRaidFrames()
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
end

--------------------------------------------------------------------------------
-- FUNCTION 12: Configure action bars
--------------------------------------------------------------------------------

-- Hide MainMenuBar
local function configActionBars()
  -- Set Alpha to 0
  MainMenuBar:SetAlpha(0)
  MainMenuBar:EnableMouse(false)

  -- Avoid interaction with action bars
  local bars = {
    "MainMenuBar",
    "ActionButton",
    "MultiBarLeftButton",
--    "MultiBarBottomRightButton",
    "MultiBarBottomLeftButton",
    "MultiBar5Button",
    "MultiBar6Button",
    "MultiBar7Button"
  }

  for _, bar in pairs(bars) do
    for i = 1, 12 do
      local button = _G[bar..i]
      if button then
        button:SetScript("OnEnter", nil)
        button:SetScript("OnClick", nil)
        button.cooldown:SetDrawBling(false)
      end
    end
  end

  -- Avoid blink in action bars
  local gdcbars = {
    "MainMenuBar",
    "ActionButton",
    "MultiBarLeftButton",
    "MultiBarBottomRightButton",
    "MultiBarBottomLeftButton",
    "MultiBar5Button",
    "MultiBar6Button",
    "MultiBar7Button"
  }

  for _, gdcbar in pairs(gdcbars) do
    for i = 1, 12 do
      local button = _G[gdcbar..i]
      if button then
        button.cooldown:SetDrawBling(false)
      end
    end
  end

end

--------------------------------------------------------------------------------
-- INITIALIZATION FUNCTION
--------------------------------------------------------------------------------

addonTable.core.autoCollapseBuffFrame = autoCollapseBuffFrame
addonTable.core.configActionBars = configActionBars
addonTable.core.configChatFrame = configChatFrame
addonTable.core.configClassColorFrames = configClassColorFrames
addonTable.core.configCVars = configCVars
addonTable.core.configMapElements = configMapElements
addonTable.core.configPlayerFrame = configPlayerFrame
addonTable.core.configQuestTracker = configQuestTracker
addonTable.core.configQueueIcon = configQueueIcon
addonTable.core.configTargetFrame = configTargetFrame
addonTable.core.hideMicroMenuAlerts = hideMicroMenuAlerts
addonTable.core.hideMultipleUIFrames = hideMultipleUIFrames
addonTable.core.hideRealmNameFromRaidFrames = hideRealmNameFromRaidFrames

local function OnEvent(self, event, ...)
  if event == "ADDON_LOADED" and ... == addonName then
    if not PanzaUIDB then
      PanzaUIDB = {}
    end
    self:UnregisterEvent("ADDON_LOADED")
  else
    return
  end

  -- Apply saved settings
  for key, value in pairs(PanzaUIDB) do
    if addonTable.core[key] and value then
      addonTable.core[key]()
    end
  end
end

local frame = CreateFrame("FRAME")
frame:SetScript("OnEvent", OnEvent)
frame:RegisterEvent("ADDON_LOADED")