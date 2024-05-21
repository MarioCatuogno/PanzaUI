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

createSectionHeader("Configure Frames", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Action Bars", "Remove interaction, blink and GCD animation.", "configActionBars", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Cast Bar", "Resize and reskin cast bar.", "configCastBar", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Chat", "Cleanup the chat, hide unnecessary buttons and improve scrolling.", "configChat", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Minimap", "Hide unnecessary elements and resize text.", "configMinimap", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Player Frame", "Hide power bars, hide combat animation and class colour frames.", "configPlayerFrame", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Quest Tracker", "Resize Quest tracker.", "configQuestTracker", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Raid & Party", "Resize and colour Role icons.", "configRaidFrames", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Target Frame", "Hide background and remove buffs/debuffs on target.", "configTargetFrame", yOffset)
yOffset = yOffset - 28
addCheckbox("Configure Various frames", "Reskin Tooltip and Nameplate's healthbar, etc.", "configVariousFrames", yOffset)
yOffset = yOffset - 28

createSectionHeader("Hide Frames", yOffset)
yOffset = yOffset - 28
addCheckbox("Hide Buffs Frame", "Auto collapse Buffs frame.", "hideCollapseBuffFrame", yOffset)
yOffset = yOffset - 28
addCheckbox("Hide Micro Menu", "Hide Micro Menu alerts.", "hideMicroMenu", yOffset)
yOffset = yOffset - 28
addCheckbox("Hide Realm names", "Hide Server names in Raid frame.", "hideRealmNames", yOffset)
yOffset = yOffset - 28
addCheckbox("Hide Various frames", "Hide various frames (eg. Pet, Totems, etc.).", "hideVariousFrames", yOffset)
yOffset = yOffset - 28

createSectionHeader("Other", yOffset)
yOffset = yOffset - 28
addCheckbox("Setup CVars", "Setup various CVars and add new commands (eg. Reload, Ready Check, etc.).", "setupCVars", yOffset)
yOffset = yOffset - 28
addCheckbox("Setup QOL Features", "Setup various Quality of Life features (eg. hide Talking Head, hide UI while taxi, etc.).", "setupQol", yOffset)