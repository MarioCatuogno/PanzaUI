--------------------------------------------------------------------------------
-- PanzaUI
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- HELPER FUNCTIONS
--------------------------------------------------------------------------------

-- Add any helper functions here that can be reused across other functions
local addonName, addonTable = ...

  -- Helper function to hide frames
  local function SetAlphaForFrame(frame, alpha)
    if frame then
      frame:SetAlpha(alpha)
    end
  end

  -- Helper function to scale frames
  local function SetScaleForFrame(frame, scale)
    if frame then
      frame:SetScale(scale)
    end
  end

  -- Helper function to unregister events and hide frames
  local function HideFrameAndUnregisterEvents(frame)
    if not frame or frame:IsProtected() then return end
    if frame then
      frame:UnregisterAllEvents()
      frame:Hide()
      frame:HookScript("OnShow", function() frame:Hide() end)
    end
  end

    -- Helper function to clear points and hide frames
    local function ClearAllPointsHideFrame(frame)
      if not frame or frame:IsProtected() then return end
      if frame then
        frame:ClearAllPoints()
        frame:Hide()
        frame:HookScript("OnShow", function() frame:Hide() end)
      end
    end

  -- Helper function to get class colour
  local function GetClassColor(class)
    local colors = {
        ["WARRIOR"] = {1.0, 0.78, 0.55},
        ["PALADIN"] = {0.96, 0.55, 0.73},
        ["HUNTER"] = {0.67, 0.83, 0.45},
        ["ROGUE"] = {1.0, 0.96, 0.41},
        ["PRIEST"] = {1.0, 1.0, 1.0},
        ["DEATHKNIGHT"] = {0.77, 0.12, 0.23},
        ["SHAMAN"] = {0.0, 0.44, 0.87},
        ["MAGE"] = {0.41, 0.8, 0.94},
        ["WARLOCK"] = {0.58, 0.51, 0.79},
        ["MONK"] = {0.0, 1.0, 0.59},
        ["DRUID"] = {1.0, 0.49, 0.04},
        ["DEMONHUNTER"] = {0.64, 0.19, 0.79},
        ["EVOKER"] = {0.2, 0.58, 0.5},
    }
    return unpack(colors[class])
  end

addonTable.core = {}

--------------------------------------------------------------------------------
-- CONFIGURE ACTION BARS
--------------------------------------------------------------------------------

local function configActionBars()

  -- Hide MainMenuBar
  MainMenuBar:SetAlpha(0)
  MainMenuBar:EnableMouse(false)
  MultiBarBottomLeft:SetAlpha(0)
  MultiBarBottomLeft:EnableMouse(false)
  MultiBarBottomRight:SetAlpha(0)
  MultiBarBottomRight:EnableMouse(false)

  -- Avoid interaction with action bars
  local bars = {
    "MainMenuBar",
    "ActionButton",
    "MultiBarLeftButton",
    "MultiBarBottomRightButton",
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

  -- Avoid blink in Action Bars
  local gdcbars = {
    "MainMenuBar",
    "ActionButton",
    "MultiBarLeftButton",
    "MultiBarRightButton",
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
        button.cooldown:Hide()
      end
    end
  end

  -- Avoid blink in Stance Bar
  local stanceBar = "StanceButton"
  for i = 1, 10 do
    local button = _G[stanceBar..i]
    if button and button.cooldown then
      button.cooldown:SetDrawBling(false)
      button.cooldown:Hide() -- This will hide the cooldown frame
    end
  end

  -- Remove GCD animation to all icons (temporary until I fix the StanceBar problem)
  --hooksecurefunc("CooldownFrame_Set", function(self, start, duration, enable, forceShowDrawEdge, modRate)
  --  if enable and enable ~= 0 and start > 0 and duration <= 1.5 then
  --    CooldownFrame_Clear(self)
  --  end
  --end)

end

--------------------------------------------------------------------------------
-- CONFIGURE CAST BAR
--------------------------------------------------------------------------------

local function configCastBar()

  -- Configure Player Cast Bar
  PlayerCastingBarFrame:HookScript("OnEvent", function()

    PlayerCastingBarFrame.StandardGlow:Hide()
    PlayerCastingBarFrame.TextBorder:Hide()
    PlayerCastingBarFrame:SetSize(200, 10)
    PlayerCastingBarFrame.TextBorder:ClearAllPoints()
    PlayerCastingBarFrame.TextBorder:SetAlpha(0)
    PlayerCastingBarFrame.Text:ClearAllPoints()
    PlayerCastingBarFrame.Text:SetPoint("TOP", PlayerCastingBarFrame, "TOP", 0, -10)
    PlayerCastingBarFrame.Text:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
    PlayerCastingBarFrame:SetStatusBarTexture("Interface\\AddOns\\SharedMedia\\statusbar\\Wglass")
    PlayerCastingBarFrame:Hide()

    -- Color Player Cast Bar based on class
    local _, playerClass = UnitClass("player")
    local r, g, b = GetClassColor(playerClass)
    PlayerCastingBarFrame:SetStatusBarColor(r, g, b)

  end)

end

--------------------------------------------------------------------------------
-- CONFIGURE CHAT
--------------------------------------------------------------------------------

local function configChat()

  -- Hide buttons and toast
  HideFrameAndUnregisterEvents(ChatFrameMenuButton)
  HideFrameAndUnregisterEvents(QuickJoinToastButton)

  -- Improve mousewheel scrolling
  local function ImproveMouseScroll(self, direction)
    local scrollFunc = IsShiftKeyDown() and (direction > 0 and "ScrollToTop" or "ScrollToBottom") or (direction > 0 and "ScrollUp" or "ScrollDown")
    self[scrollFunc](self)
    if not IsShiftKeyDown() then
      self[scrollFunc](self)
    end
  end
  hooksecurefunc("FloatingChatFrame_OnMouseScroll", ImproveMouseScroll)

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

end

--------------------------------------------------------------------------------
-- CONFIGURE MINIMAP
--------------------------------------------------------------------------------

local function configMinimap()

  -- Set Alpha, Position and Scale
  --SetScaleForFrame(MinimapZoneText, 1.15)
  --MinimapZoneText:ClearAllPoints()
  --MinimapZoneText:SetPoint("LEFT", Minimap, "TOP", -55, 27.5)
  --MinimapZoneText:SetJustifyH("RIGHT")
  SetScaleForFrame(Minimap, 1.0)
  SetScaleForFrame(MinimapCluster, 1.0)
  SetAlphaForFrame(MinimapCluster.BorderTop, 0)
  SetAlphaForFrame(AddonCompartmentFrame, 0)

  -- Hide Minimap zoom buttons
  HideFrameAndUnregisterEvents(Minimap.ZoomIn)
  HideFrameAndUnregisterEvents(Minimap.ZoomOut)
  HideFrameAndUnregisterEvents(MinimapCluster.TrackingFrame)

  -- Set Scale to Clock button
  --LoadAddOn("Blizzard_TimeManager")
  --HideFrameAndUnregisterEvents(TimeManagerClockButton)

  -- Set Garrison button scale
  SetScaleForFrame(ExpansionLandingPageMinimapButton, 0.85)

end

--------------------------------------------------------------------------------
-- CONFIGURE PLAYER FRAME
--------------------------------------------------------------------------------

local function configPlayerFrame()

  -- Hide combat flash and rest
--  local hideRest = CreateFrame("Frame")
--    PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestLoop:SetParent(hideRest)
--    PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.StatusTexture:SetParent(hideRest)
--    PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerPortraitCornerIcon:SetParent(hideRest)
--    PlayerFrame.PlayerFrameContainer.FrameFlash:SetParent(hideRest)
--    TargetFrame.TargetFrameContainer.Flash:SetParent(hideRest)
--  hideRest:Hide()

  -- Hide Power Bars
  --ClearAllPointsHideFrame(ComboPointDruidPlayerFrame)
  --ClearAllPointsHideFrame(ComboPointPlayerFrame)
  --ClearAllPointsHideFrame(EssencePlayerFrame)
  --ClearAllPointsHideFrame(MageArcaneChargesFrame)
  --ClearAllPointsHideFrame(MonkHarmonyBarFrame)
  --ClearAllPointsHideFrame(MonkStaggerBar)
  --ClearAllPointsHideFrame(MonkStaggerBar.PowerBarMask)
  --ClearAllPointsHideFrame(PaladinPowerBarFrame)
  --ClearAllPointsHideFrame(PlayerFrameAlternateManaBar)
  --ClearAllPointsHideFrame(RogueComboPointBarFrame)
  --ClearAllPointsHideFrame(RuneFrame)
  --ClearAllPointsHideFrame(WarlockPowerFrame)

  -- Remove damage and healing text in portraits
  COMBATFEEDBACK_FADEINTIME = 0
  COMBATFEEDBACK_HOLDTIME = 0
  COMBATFEEDBACK_FADEOUTTIME = 0

  -- Class Colour frames
  --local function UpdateHealthBarColor(self)
  --  if UnitIsPlayer(self.unit) and UnitIsConnected(self.unit) then
  --    local _, classToken = UnitClass(self.unit)
  --    local classColor = RAID_CLASS_COLORS[classToken]
  --    if classColor then
  --      self:SetStatusBarColor(classColor.r, classColor.g, classColor.b)
  --    else
  --      self:SetStatusBarColor(0.5, 0.5, 0.5)
  --    end
  --  elseif UnitIsPlayer(self.unit) then
  --    self:SetStatusBarColor(0.5, 0.5, 0.5)
  --  else
  --    self:SetStatusBarColor(0.0, 1.0, 0.0)
  --  end
  --  self:SetStatusBarDesaturated(true)
  --end
  --hooksecurefunc("HealthBar_OnValueChanged", UpdateHealthBarColor)
  --hooksecurefunc("UnitFrameHealthBar_Update", UpdateHealthBarColor)

end

--------------------------------------------------------------------------------
-- CONFIGURE QUEST TRACKER
--------------------------------------------------------------------------------

local function configQuestTracker()

  -- Set scale and hide header for Objective Tracker
  SetScaleForFrame(ObjectiveTrackerFrame, 0.95)
  --ClearAllPointsHideFrame(ObjectiveTrackerBlocksFrame.QuestHeader.Background)
  --ClearAllPointsHideFrame(ObjectiveTrackerBlocksFrame.CampaignQuestHeader.Background)
  --ClearAllPointsHideFrame(ObjectiveTrackerBlocksFrame.AchievementHeader.Background)

      -- Color Quest Tracker text based on class
      --local _, playerClass = UnitClass("player")
      --local r, g, b = GetClassColor(playerClass)
      --ObjectiveTrackerBlocksFrame.QuestHeader.Text:SetTextColor(r, g, b)
      --ObjectiveTrackerBlocksFrame.QuestHeader.Text:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
      --ObjectiveTrackerBlocksFrame.CampaignQuestHeader.Text:SetTextColor(r, g, b)
      --ObjectiveTrackerBlocksFrame.CampaignQuestHeader.Text:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
      --ObjectiveTrackerBlocksFrame.AchievementHeader.Text:SetTextColor(r, g, b)
      --ObjectiveTrackerBlocksFrame.AchievementHeader.Text:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
      --ObjectiveTrackerBlocksFrame.ScenarioHeader.Text:SetTextColor(r, g, b)
      --ObjectiveTrackerBlocksFrame.ScenarioHeader.Text:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")

end

--------------------------------------------------------------------------------
-- CONFIGURE RAID & PARTY
--------------------------------------------------------------------------------

local function configRaidFrames()

  -- Reduce alpha for Role icon in Raid frames
--  hooksecurefunc("CompactUnitFrame_UpdateName", function(frame)
--    if frame.optionTable == DefaultCompactUnitFrameOptions then
--      frame.roleIcon:SetAlpha(0.3)
--    end
--  end)

end

--------------------------------------------------------------------------------
-- CONFIGURE TARGET FRAME
--------------------------------------------------------------------------------

local function configTargetFrame()

  -- Remove buffs/debuffs from Target frame
--  TargetFrame.maxBuffs = 0
--  TargetFrame.maxDebuffs = 0
--
--  FocusFrame.maxBuffs = 0
--  FocusFrame.maxDebuffs = 0

  -- Hide Reputation background for Target and Focus frames
  --if TargetFrame.TargetFrameContent and TargetFrame.TargetFrameContent.TargetFrameContentMain and TargetFrame.--TargetFrameContent.TargetFrameContentMain.ReputationColor then
  --  TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetTexture(nil)
  --end
  --if FocusFrame.TargetFrameContent and FocusFrame.TargetFrameContent.TargetFrameContentMain and FocusFrame.--TargetFrameContent.TargetFrameContentMain.ReputationColor then
  --  FocusFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetTexture(nil)
  --end

end

--------------------------------------------------------------------------------
-- CONFIGURE VARIOUS FRAME
--------------------------------------------------------------------------------

local function configVariousFrames()

  -- Reskin and colour the health bar of Tooltips
  local function SetHealthBarTexture()
    GameTooltipStatusBar:SetStatusBarTexture("Interface\\AddOns\\SharedMedia\\statusbar\\Wglass")
      GameTooltip:HookScript("OnUpdate", function()
              if UnitPlayerControlled("mouseover") then
                  local _, englishClass = UnitClass("mouseover")
                  local r,g,b = GetClassColor(englishClass)
                  GameTooltipStatusBarTexture:SetVertexColor(r,g,b)
              end
      end)
  end
  SetHealthBarTexture()

  ---- Reskin the health bar of Nameplates
  --local function SetNameplateTexture()
  --  for _, nameplate in ipairs(C_NamePlate.GetNamePlates()) do
  --      if nameplate.UnitFrame and nameplate.UnitFrame.healthBar then
  --          nameplate.UnitFrame.healthBar:SetStatusBarTexture("Interface\\AddOns\\SharedMedia\\statusbar\\Wglass")
  --      end
  --  end
  --  hooksecurefunc("DefaultCompactNamePlateFrameSetupInternal", function(frame)
  --    if frame and frame.healthBar then
  --        frame.healthBar:SetStatusBarTexture("Interface\\AddOns\\SharedMedia\\statusbar\\Wglass")
  --    end
  --  end)
  --end
  --SetNameplateTexture()

end

--------------------------------------------------------------------------------
-- HIDE COLLAPSED BUFFS FRAME
--------------------------------------------------------------------------------

local function hideCollapseBuffFrame()

  -- Auto collapse Buffs frame
  if not (BuffFrame and BuffFrame.CollapseAndExpandButton) then return end
  BuffFrame.CollapseAndExpandButton:SetChecked(false)
  BuffFrame.CollapseAndExpandButton:UpdateOrientation()
  BuffFrame:SetBuffsExpandedState()

end

--------------------------------------------------------------------------------
-- HIDE REALM NAMES
--------------------------------------------------------------------------------

local function hideRealmNames()

  -- Hide Realm names from Raid frames
--  hooksecurefunc("CompactUnitFrame_UpdateName", function(frame)
--    if frame and not frame:IsForbidden() then
--      local frame_name = frame:GetName()
--      if frame_name and frame_name:match("^CompactRaidFrame%d") and frame.unit and frame.name then
--        local unit_name = GetUnitName(frame.unit, true)
--        if unit_name then
--          frame.name:SetText(unit_name:match("[^-]+"))
--        end
--      end
--    end
--  end)

end

--------------------------------------------------------------------------------
-- HIDE MICRO MENU
--------------------------------------------------------------------------------

local function hideMicroMenu()

  -- Hook the function that checks if MainMenuMicroButton alerts are enabled
  hooksecurefunc("MainMenuMicroButton_AreAlertsEnabled", function()
    return false
  end)

end

--------------------------------------------------------------------------------
-- HIDE VARIOUS FRAMES
--------------------------------------------------------------------------------

local function hideVariousFrames()

  -- Hide various UI frames
  HideFrameAndUnregisterEvents(BagsBar)
  HideFrameAndUnregisterEvents(ChatFrameChannelButton)
  HideFrameAndUnregisterEvents(DurabilityFrame)
  HideFrameAndUnregisterEvents(EncounterBar)
  HideFrameAndUnregisterEvents(MicroMenu)
  --HideFrameAndUnregisterEvents(PetActionBar)
  --HideFrameAndUnregisterEvents(PetFrame)
  HideFrameAndUnregisterEvents(StatusTrackingBarManager)
  --HideFrameAndUnregisterEvents(TotemFrame)
  HideFrameAndUnregisterEvents(UIErrorsFrame)
  HideFrameAndUnregisterEvents(VehicleSeatIndicator)

end

--------------------------------------------------------------------------------
-- SETUP CVARS
--------------------------------------------------------------------------------

local function setupCVars()

  -- Action Bar
  C_CVar.SetCVar("lockActionBar", 1)

  -- Bags
  C_CVar.SetCVar("combinedBags", 1)

  -- Combat
  C_CVar.SetCVar("autoSelfCast", 1)
  C_CVar.SetCVar("floatingCombatTextCombatHealing", 1)
  C_CVar.SetCVar("floatingCombatTextCombatDamage", 1)
  C_CVar.SetCVar("floatingCombatTextCombatLogPeriodicSpells", 0)
  C_CVar.SetCVar("floatingCombatTextPetMeleeDamage", 0)
  C_CVar.SetCVar("floatingCombatTextPetSpellDamage", 0)

  -- Chat
  C_CVar.SetCVar("colorChatNamesByClass", 1)
  C_CVar.SetCVar("chatClassColorOverride", 0)
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
  C_CVar.SetCVar("renderscale", 0.760)
  C_CVar.SetCVar("ResampleAlwaysSharpen", 1)

  -- Minimap
  C_CVar.SetCVar("minimapInsideZoom", 2)
  C_CVar.SetCVar("minimapTrackingShowAll",1)

  -- Nameplates (Disabled whil using Threat Plates)
  --C_CVar.SetCVar("NamePlateHorizontalScale", 1.3)
  C_CVar.SetCVar("nameplateLargeTopInset", 0.15)
  --C_CVar.SetCVar("nameplateMaxDistance", 40)
  --C_CVar.SetCVar("nameplateMinAlpha", 1)
  --C_CVar.SetCVar("nameplateMinAlphaDistance", 10)
  --C_CVar.SetCVar("nameplateMotion", 1)
  --C_CVar.SetCVar("nameplateOccludedAlphaMult", 0.4)
  --C_CVar.SetCVar("nameplateOtherBottomInset", 0.1)
  C_CVar.SetCVar("nameplateOtherTopInset", 0.15)
  C_CVar.SetCVar("nameplateOverlapH", 1)
  C_CVar.SetCVar("nameplateOverlapV", 0.5)
  --C_CVar.SetCVar("NameplatePersonalShowAlways", 0)
  --C_CVar.SetCVar("nameplateSelectedScale", 1.5)
  --C_CVar.SetCVar("nameplateShowEnemies", 1)
  --C_CVar.SetCVar("nameplateShowEnemyPets", 1)
  --C_CVar.SetCVar("nameplateShowEnemyTotems", 1)
  C_CVar.SetCVar("nameplateShowOnlyNames", 1)
  --C_CVar.SetCVar("nameplateShowSelf", 0)
  --C_CVar.SetCVar("nameplateTargetBehindMaxDistance", 5)
  --C_CVar.SetCVar("nameplateTargetRadialPosition", 0)
  --C_CVar.SetCVar("NamePlateVerticalScale", 1.5)

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
  C_CVar.SetCVar("UnitNameNPC", 1)
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
  C_CVar.SetCVar("hideAdventureJournalAlerts", 1)
  C_CVar.SetCVar("lootUnderMouse", 0)
  C_CVar.SetCVar("maxFPS", 60)
  C_CVar.SetCVar("maxFPSBk", 8)
  C_CVar.SetCVar("movieSubtitle", 1)
  C_CVar.SetCVar("screenEdgeFlash", 0)
  C_CVar.SetCVar("showNPETutorials", 0)
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
-- SETUP QUALITY OF LIFE FEATURES
--------------------------------------------------------------------------------

local function setupQol()

  -- Easyily delete items
  hooksecurefunc(StaticPopupDialogs["DELETE_GOOD_ITEM"], "OnShow", function(deleteItems) deleteItems.editBox:SetText(DELETE_ITEM_CONFIRM_STRING) end)
  hooksecurefunc(StaticPopupDialogs["DELETE_GOOD_QUEST_ITEM"], "OnShow", function(deleteItems) deleteItems.editBox:SetText(DELETE_ITEM_CONFIRM_STRING) end)

  -- Hide UI while using Taxi Service
  local hideUiTaxiService = CreateFrame("Frame")
  hideUiTaxiService:SetScript("OnEvent", function()
    C_Timer.After(.05,function() 
      if UnitOnTaxi("player") then
          UIParent:Hide();
          end
      end)
    end)
  hideUiTaxiService:RegisterEvent("PLAYER_CONTROL_LOST")

  -- Show UI after using Taxi Service
  local showUiTaxiService = CreateFrame("Frame")
  showUiTaxiService:SetScript("OnEvent", function()
                UIParent:Show();
    end)
    showUiTaxiService:RegisterEvent("PLAYER_CONTROL_GAINED")

  -- Hide Talking Head
--  hooksecurefunc(TalkingHeadFrame, "PlayCurrent", function(self)
--    self:CloseImmediately()
--  end)

  -- Set Action Cam
  ConsoleExec( "ActionCam off" ); -- full/basic/off

end

--------------------------------------------------------------------------------
-- INITIALIZATION FUNCTION
--------------------------------------------------------------------------------

-- Initialize functions on login
local function InitializeAddon()

  configActionBars()
  configCastBar()
  configChat()
  configMinimap()
  configPlayerFrame()
  configQuestTracker()
  configTargetFrame()
  configVariousFrames()
  hideCollapseBuffFrame()
  hideRealmNames()
  hideMicroMenu()
  hideVariousFrames()
  setupCVars()
  setupQol()

end

local frame = CreateFrame("FRAME")

  frame:SetScript("OnEvent", OnEvent)
  frame:RegisterEvent("ADDON_LOADED")
  InitializeAddon()
