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

local function addCheckbox(label, description, funcName, y)
  local checkbox = createCheckbox("PanzaUI" .. funcName, label, description, function(self)
    if self:GetChecked() then
      addonTable.core[funcName]()
    end
  end)
  checkbox:SetPoint("TOPLEFT", 16, y)
  table.insert(addonTable.checkboxes, checkbox)
end

addCheckbox("Auto Collapse Buff Frame", "Enable or disable auto-collapsing of the buff frame.", "autoCollapseBuffFrame", -40)
addCheckbox("Class colored frames", "Enable or disable the class colored frames.", "configClassColorFrames", -64)
addCheckbox("Configure Action bars", "Enable or disable the configuration of action bars.", "configActionBars", -88)
addCheckbox("Configure Chat frame", "Enable or disable the configuration of chat frame.", "configChatFrame", -112)
addCheckbox("Configure CVars", "Enable or disable the CVars.", "configCVars", -136)
addCheckbox("Configure LFG Queue icon", "Enable or disable the configuration of LFG Queue icon.", "configQueueIcon", -160)
addCheckbox("Configure Minimap", "Enable or disable the Minimap configuration.", "configMapElements", -184)
addCheckbox("Configure Player frame", "Enable or disable the configuration of player frame.", "configPlayerFrame", -208)
addCheckbox("Configure Quest tracker", "Enable or disable the configuration of Quest tracker.", "configQuestTracker", -232)
addCheckbox("Configure Target frame", "Enable or disable the configuration of target frame.", "configTargetFrame", -256)
addCheckbox("Hide Micro menu", "Enable or disable the Micro menu.", "hideMicroMenuAlerts", -280)
addCheckbox("Hide Realm names", "Enable or disable Realm names in Raid frame.", "hideRealmNameFromRaidFrames", -304)
addCheckbox("Hide various frames", "Enable or disable various frames (e.g. Pet, Totems, etc.).", "hideMultipleUIFrames", -328)
addCheckbox("Configure Raid frame", "Enable or disable the Raid frames configuration.", "configureRaidFrames", -352)
