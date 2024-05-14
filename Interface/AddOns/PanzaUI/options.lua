local _, addonTable = ...

local function createCheckbox(name, label, description, onClick)
  local checkbox = CreateFrame("CheckButton", name, addonTable.panel, "ChatConfigCheckButtonTemplate")
  _G[name .. "Text"]:SetText(label)
  checkbox.tooltip = description
  checkbox:SetScript("OnClick", onClick)
  return checkbox
end

addonTable.panel = CreateFrame("FRAME", "PanzaUIOptions")
local addonTitle, addonVersion = GetAddOnInfo("PanzaUI")
addonTable.panel.name = addonVersion

local title = addonTable.panel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText(addonVersion)

-- Register the panel with the Interface Options
InterfaceOptions_AddCategory(addonTable.panel)

-- Addon version
local addonVersion = GetAddOnMetadata("PanzaUI", "Version")
local versionText = addonTable.panel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
versionText:SetPoint("BOTTOMRIGHT", -16, 48)
versionText:SetText("v" .. addonVersion)

-- Create a ReloadUI button
local reloadUIButton = CreateFrame("Button", nil, addonTable.panel, "UIPanelButtonTemplate")
reloadUIButton:SetSize(100, 24)
reloadUIButton:SetText("Reload UI")
reloadUIButton:SetPoint("BOTTOMRIGHT", -16, 16)
reloadUIButton:SetScript("OnClick", function()
  ReloadUI()
end)

-- Load and Save settings
function addonTable.panel.default()
  PanzaUIDB = nil
  ReloadUI()
end

function addonTable.panel.okay()
  PanzaUIDB = {}
  for _, checkbox in ipairs(addonTable.checkboxes) do
    local key = checkbox:GetName():gsub("PanzaUI", "")
    PanzaUIDB[key] = checkbox:GetChecked()
  end
end

function addonTable.panel.cancel()
  for _, checkbox in ipairs(addonTable.checkboxes) do
    local key = checkbox:GetName():gsub("PanzaUI", "")
    checkbox:SetChecked(PanzaUIDB[key])
  end
end

function addonTable.panel.refresh()
  for _, checkbox in ipairs(addonTable.checkboxes) do
    local key = checkbox:GetName():gsub("PanzaUI", "")
    checkbox:SetChecked(PanzaUIDB[key])
  end
end

local function OnEvent(self, event, ...)
  if event == "PLAYER_LOGIN" then
    addonTable.panel.refresh()
  elseif event == "PLAYER_LOGOUT" then
    addonTable.panel.okay()
  end
end

local eventFrame = CreateFrame("FRAME")
eventFrame:SetScript("OnEvent", OnEvent)
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:RegisterEvent("PLAYER_LOGOUT")

-- Create checkboxes
addonTable.checkboxes = {}

local function createSectionHeader(text, yOffset)
  local header = addonTable.panel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  header:SetPoint("TOPLEFT", 16, yOffset)
  header:SetText(text)
  return header
end

local function addCheckbox(label, description, funcName, yOffset)
  local checkbox = createCheckbox("PanzaUI" .. funcName, label, description, function(self)
    if self:GetChecked() then
      addonTable.core[funcName]()
    end
  end)
  checkbox:SetPoint("TOPLEFT", 32, yOffset)
  table.insert(addonTable.checkboxes, checkbox)
end

-- Add sections and checkboxes
local yOffset = -48

createSectionHeader("Action Bars", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Action bars", "Enable or disable the configuration of action bars.", "configActionBars", yOffset)
yOffset = yOffset - 28

createSectionHeader("Chat and Minimap", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Chat frame", "Enable or disable the configuration of chat frame.", "configChatFrame", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Minimap", "Enable or disable the Minimap configuration.", "configMapElements", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Quest tracker", "Enable or disable the configuration of Quest tracker.", "configQuestTracker", yOffset)
yOffset = yOffset - 28

createSectionHeader("Party and Raid", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Raid frame", "Enable or disable the Raid frames configuration.", "configureRaidFrames", yOffset)
yOffset = yOffset - 28
addCheckbox("Hide Realm names", "Enable or disable Realm names in Raid frame.", "hideRealmNameFromRaidFrames", yOffset)
yOffset = yOffset - 28

createSectionHeader("Player and Target", yOffset)
yOffset = yOffset - 28
addCheckbox("Class colored frames", "Enable or disable the class colored frames.", "configClassColorFrames", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Player frame", "Enable or disable the configuration of player frame.", "configPlayerFrame", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Target frame", "Enable or disable the configuration of target frame.", "configTargetFrame", yOffset)
yOffset = yOffset - 28

createSectionHeader("Various", yOffset)
yOffset = yOffset - 28
addCheckbox("Auto Collapse Buff Frame", "Enable or disable auto-collapsing of the buff frame.", "autoCollapseBuffFrame", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure CVars", "Enable or disable the CVars.", "configCVars", yOffset)
yOffset = yOffset - 28
addCheckbox("Hide Micro menu", "Enable or disable the Micro menu.", "hideMicroMenuAlerts", yOffset)
yOffset = yOffset - 28
addCheckbox("Hide various frames", "Enable or disable various frames (e.g. Pet, Totems, etc.).", "hideMultipleUIFrames", yOffset)
