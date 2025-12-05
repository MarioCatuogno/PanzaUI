--------------------------------------------------------------------------------
-- PanzaUI
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- HELPER FUNCTIONS
--------------------------------------------------------------------------------

local addonName, addonTable = ...

-- Store class colors in a local table.
local CLASS_COLORS = {
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

local function GetClassColor(class)
    local color = CLASS_COLORS[class]
    if color then
        return color[1], color[2], color[3]
    end
    -- Default to white if class is not found
    return 1.0, 1.0, 1.0
end

addonTable.core = {}

--------------------------------------------------------------------------------
-- CONFIGURE TOOLTIPS
--------------------------------------------------------------------------------

local function configTooltips()
    -- Set the status bar texture once during initialization.
    GameTooltipStatusBar:SetStatusBarTexture("Interface\\AddOns\\SharedMedia\\statusbar\\Smooth")

    -- Hook OnTooltipSetUnit to change color only when a unit is set on the tooltip.
    GameTooltip:HookScript("OnTooltipSetUnit", function(self)
        local unitID = select(1, self:GetUnit())
        if unitID and UnitPlayerControlled(unitID) then
            local _, englishClass = UnitClass(unitID)
            if englishClass then
                local r, g, b = GetClassColor(englishClass)
                GameTooltipStatusBarTexture:SetVertexColor(r, g, b)
            else
                -- Reset to a default color (e.g., white) if class not found
                GameTooltipStatusBarTexture:SetVertexColor(1.0, 1.0, 1.0)
            end
        else
            -- Reset to a default color for non-player-controlled units or if no unit is present
            GameTooltipStatusBarTexture:SetVertexColor(1.0, 1.0, 1.0)
        end
    end)

    -- Hook OnTooltipCleared to reset the color when the tooltip is no longer active or cleared.
    GameTooltip:HookScript("OnTooltipCleared", function(self)
        GameTooltipStatusBarTexture:SetVertexColor(1.0, 1.0, 1.0) -- Reset to default color
    end)
end

--------------------------------------------------------------------------------
-- INITIALIZATION FUNCTION
--------------------------------------------------------------------------------

-- Initialize functions on login
local function InitializeAddon()
    configTooltips()
end

-- Create a local frame to manage addon events.
local frame = CreateFrame("FRAME")

-- Define the OnEvent handler for the frame.
local function OnEvent(self, event, ...)
    if event == "ADDON_LOADED" then
        -- Check if the addon has finished loading before initializing.
        local loadedAddonName = select(1, ...)
        if loadedAddonName == addonName then
            InitializeAddon()
            -- Unregister the ADDON_LOADED event after initialization to save resources.
            self:UnregisterEvent("ADDON_LOADED")
        end
    end
end

frame:SetScript("OnEvent", OnEvent)
frame:RegisterEvent("ADDON_LOADED")
