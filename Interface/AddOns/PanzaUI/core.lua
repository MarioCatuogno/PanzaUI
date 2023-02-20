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
  --C_CVar.SetCVar("minimapInsideZoom", 2)
  --C_CVar.SetCVar("minimapTrackingShowAll",1)

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

local hideVariousFrames = CreateFrame("Frame")

local function hideFrame(frame)
  if not frame then return end
  frame:UnregisterAllEvents()
  frame:Hide()
  frame:HookScript("OnShow", function() frame:Hide() end)
end

local function hideFrames()
  hideFrame(MicroMenu)
  hideFrame(BagsBar)
  hideFrame(PetActionBar)
  hideFrame(PetFrame)
  hideFrame(UIErrorsFrame)
  hideFrame(StatusTrackingBarManager)
  hideFrame(ChatFrameChannelButton)
  hideFrame(DurabilityFrame)
  hideFrame(VehicleSeatIndicator)
  hideFrame(TotemFrame)
end

hideVariousFrames:RegisterEvent("PLAYER_LOGIN")
hideVariousFrames:RegisterEvent("ADDON_LOADED")
hideVariousFrames:RegisterEvent("PLAYER_ENTERING_WORLD")
hideVariousFrames:RegisterEvent("CINEMATIC_STOP")
hideVariousFrames:RegisterEvent("CLIENT_SCENE_CLOSED")
hideVariousFrames:RegisterEvent("CLIENT_SCENE_OPENED")
hideVariousFrames:SetScript("OnEvent", function()
  hideFrames()
  hideVariousFrames:UnregisterAllEvents()
end)

BuffFrame.CollapseAndExpandButton:SetChecked(false)
BuffFrame.CollapseAndExpandButton:UpdateOrientation()
BuffFrame:SetBuffsExpandedState()

--------------------------------------------------------------------------------
-- 03. UNIT FRAMES
--------------------------------------------------------------------------------

-- Remove damage and healing text in portraits
COMBATFEEDBACK_FADEINTIME = 0 
COMBATFEEDBACK_HOLDTIME = 0 
COMBATFEEDBACK_FADEOUTTIME = 0

-- Remove buffs/debuffs from target frame
TargetFrame.maxBuffs = 0
TargetFrame.maxDebuffs = 0

-- Hide Reputation background for target and focus frames
TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetTexture(nil)
FocusFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetTexture(nil)

-- Hide combat flash and rest
local hideRest = CreateFrame("Frame")

  PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestLoop:SetParent(hideRest)
  PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.StatusTexture:SetParent(hideRest)
  PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerPortraitCornerIcon:SetParent(hideRest)
  PlayerFrame.PlayerFrameContainer.FrameFlash:SetParent(hideRest)
  TargetFrame.TargetFrameContainer.Flash:SetParent(hideRest)
  hideRest:Hide()

-- Unit Frames color (thanks to: http://www.vranx.com/ui.htm)
hooksecurefunc("HealthBar_OnValueChanged", function (self)

  if UnitIsPlayer(self.unit) and UnitIsConnected(self.unit) then
    local c = RAID_CLASS_COLORS[select(2,UnitClass(self.unit))];
    if c then
      self:SetStatusBarColor(c.r, c.g, c.b)
      self:SetStatusBarDesaturated(true)
    else
      self:SetStatusBarColor(0.5, 0.5, 0.5)
      self:SetStatusBarDesaturated(true)
    end
    elseif UnitIsPlayer(self.unit) then
      self:SetStatusBarColor(0.5, 0.5, 0.5)
      self:SetStatusBarDesaturated(true)
    else
      self:SetStatusBarColor(0.0, 1.0, 0.0)
      self:SetStatusBarDesaturated(true)
  end

end)

hooksecurefunc("UnitFrameHealthBar_Update", function (self)
  if UnitIsPlayer(self.unit) and UnitIsConnected(self.unit) then
    local c = RAID_CLASS_COLORS[select(2,UnitClass(self.unit))];
    if c then
      self:SetStatusBarColor(c.r, c.g, c.b)
      self:SetStatusBarDesaturated(true)
    else
      self:SetStatusBarColor(0.5, 0.5, 0.5)
      self:SetStatusBarDesaturated(true)
    end
    elseif UnitIsPlayer(self.unit) then
      self:SetStatusBarColor(0.5, 0.5, 0.5)
      self:SetStatusBarDesaturated(true)
    else
      self:SetStatusBarColor(0.0, 1.0, 0.0)
      self:SetStatusBarDesaturated(true)
    end

end)

--------------------------------------------------------------------------------
-- 04. CHAT
--------------------------------------------------------------------------------

-- Chat style
STRING_STYLE  = "%s|| "
CHANNEL_STYLE = "%d"
PLAYER_STYLE  = "%s"

-- Lines to scroll on mousewheel
NUM_LINES_TO_SCROLL = 1

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

-- Tag players in chat
CHAT_FLAG_AFK = "[AFK] "
CHAT_FLAG_DND = "[DND] "
CHAT_FLAG_GM = "[GM] "

-- Improve mousewheel scrolling
local function MouseScrollHandler(self, direction)
  if direction > 0 then
  if IsShiftKeyDown() then
  self:ScrollToTop()
  else
  self:ScrollUp()
  self:ScrollUp()
  end
  elseif direction < 0 then
  if IsShiftKeyDown() then
  self:ScrollToBottom()
  else
  self:ScrollDown()
  self:ScrollDown()
  end
  end
  end
  
  hooksecurefunc("FloatingChatFrame_OnMouseScroll", MouseScrollHandler)
  
  -- Hide chat menu
  if ChatFrameMenuButton then
  ChatFrameMenuButton:SetAlpha(0)
  ChatFrameMenuButton:EnableMouse(false)
  end
  
  if QuickJoinToastButton then
  QuickJoinToastButton:SetAlpha(0)
  QuickJoinToastButton:EnableMouse(false)
  end

--------------------------------------------------------------------------------
-- 05. MAP
--------------------------------------------------------------------------------

-- Set Minimap scale
local function SetMinimapScale()
  Minimap:SetScale(1.0)
  MinimapCluster:SetScale(1.0)
  end
  
  -- Hide Minimap elements
  local function HideMinimapElements()
  MinimapZoneText:SetScale(1.0)
  MinimapCluster.BorderTop:SetAlpha(0)
  end
  
  -- Hide zoom buttons
  local function HideMinimapZoomButtons()
  Minimap.ZoomIn:UnregisterAllEvents()
  Minimap.ZoomIn:Hide()
  Minimap.ZoomIn:HookScript("OnShow", function(self) self:Hide() end)
  Minimap.ZoomOut:UnregisterAllEvents()
  Minimap.ZoomOut:Hide()
  Minimap.ZoomOut:HookScript("OnShow", function(self) self:Hide() end)
  end
  
  -- Set Garrison button scale
  local function SetGarrisonButtonScale()
  if ExpansionLandingPageMinimapButton then
  ExpansionLandingPageMinimapButton:SetScale(0.85)
  end
  end
  
  -- Initialize functions on login
  local function InitializeAddon()
  SetMinimapScale()
  HideMinimapElements()
  HideMinimapZoomButtons()
  SetGarrisonButtonScale()
  end
  
  local frame = CreateFrame("FRAME")
  frame:RegisterEvent("PLAYER_LOGIN")
  frame:SetScript("OnEvent", function(self, event, ...)
  InitializeAddon()
  self:UnregisterEvent("PLAYER_LOGIN")
  end)

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

--------------------------------------------------------------------------------
-- 07. ACTION BARS
--------------------------------------------------------------------------------

-- Hide MainMenuBar
local function HideMainMenuBar()
  MainMenuBar:SetAlpha(0)
  MainMenuBar:EnableMouse(false)
  end
  
  -- Call the function on load
  local f = CreateFrame("Frame")
  f:RegisterEvent("PLAYER_LOGIN")
  f:SetScript("OnEvent", function(self, event)
  if event == "PLAYER_LOGIN" then
  HideMainMenuBar()
  end
  end)

-- Hide GCD blink
for i = 1, 12 do
  local button = _G["ActionButton"..i]
  if button then
  button.cooldown:SetDrawBling(false)
  end
end

  -- Avoid interaction with action bars
  local bars = {
  "ActionButton",
  "MultiBarLeftButton",
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
  end
  end
  end

--------------------------------------------------------------------------------
-- 08. POWER BARS
--------------------------------------------------------------------------------

local EventRegistry = EventRegistry
local UIParent = UIParent
local frames = {
  ["ComboPointDruidPlayerFrame"] = { alpha = 0, y = -190 },
  ["ComboPointPlayerFrame"] = { alpha = 0, y = -190 },
  ["EssencePlayerFrame"] = { alpha = 0, y = -190 },
  ["MageArcaneChargesFrame"] = { alpha = 0, y = -190 },
  ["MonkHarmonyBarFrame"] = { alpha = 0, y = -190 },
  ["MonkStaggerBar"] = { alpha = 0, y = -75 },
  ["PaladinPowerBarFrame"] = { alpha = 0, y = -190 },
  ["RuneFrame"] = { alpha = 0, y = -100  },
  ["WarlockPowerFrame"] = { alpha = 0,  },
}

for frameName, properties in pairs(frames) do
  local frame = _G[frameName]
  frame:SetAlpha(properties.alpha)
  frame:SetScript("OnShow", function() frame:Hide() end)
end

EventRegistry:RegisterCallback("PLAYER_REGEN_ENABLED", function()
  for frameName, properties in pairs(frames) do
    local frame = _G[frameName]
    frame:SetAlpha(properties.alpha)
    frame:SetScript("OnShow", function() frame:Hide() end)
  end
end)

EventRegistry:RegisterCallback("PLAYER_REGEN_DISABLED", function()
  for frameName, properties in pairs(frames) do
    local frame = _G[frameName]
    frame:SetAlpha(0)
    frame:ClearAllPoints()
    frame:SetScale(1.5)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, properties.y)
    frame:SetScript("OnShow", function() frame:Show() end)
  end
end)

--------------------------------------------------------------------------------
-- 09. OTHER FRAMES
--------------------------------------------------------------------------------

-- Resize QuestTracker frame and EncounterBar
local scale = 0.95
ObjectiveTrackerFrame:SetScale(scale)

local barScale = 0.7
EncounterBar:SetScale(barScale)

-- Hide Micro Menu alerts
function MainMenuMicroButton_AreAlertsEnabled()
return false
end

-- Position Queue Status
local queueStatus = QueueStatusButton
local queueStatusIcon = QueueStatusButtonIcon

queueStatusIcon:ClearAllPoints()
queueStatusIcon:SetPoint("TOPRIGHT", UIParent, -15, -25)
queueStatus:ClearAllPoints()
queueStatus:SetPoint("TOPRIGHT",UIParent, -15, -25)

-- Check if the QueueStatusButtonIcon and QueueStatusButton exist before trying to manipulate them
if not (queueStatusIcon and queueStatus) then return end

queueStatusIcon:ClearAllPoints()
queueStatusIcon:SetPoint("TOPRIGHT", UIParent, -15, -25)
queueStatus:ClearAllPoints()
queueStatus:SetPoint("TOPRIGHT",UIParent, -15, -25)
