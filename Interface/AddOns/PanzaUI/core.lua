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
    -- Default to white if class is not found.
    return 1.0, 1.0, 1.0
end

-- Helper function to set frame scale.
local function SetScaleForFrame(frame, scale)
  if frame then
    frame:SetScale(scale)
  end
end

-- Helper function to set frame alpha.
local function SetAlphaForFrame(frame, alpha)
    if frame then
      frame:SetAlpha(alpha)
    end
end

addonTable.core = {}

--------------------------------------------------------------------------------
-- CONFIGURE BUFFS AND DEBUFFS
--------------------------------------------------------------------------------

local function configBuffsDebuffs()

end

--------------------------------------------------------------------------------
-- CONFIGURE MINIMAP
--------------------------------------------------------------------------------

local function configMinimap()

  -- Set scale for Minimap and its cluster.
  SetScaleForFrame(Minimap, 1.0)
  SetScaleForFrame(MinimapCluster, 1.0)

  -- Set alpha for specific minimap elements to hide them.
  SetAlphaForFrame(MinimapCluster.BorderTop, 0)
  SetAlphaForFrame(AddonCompartmentFrame, 0)

end

--------------------------------------------------------------------------------
-- CONFIGURE PLAYER FRAME
--------------------------------------------------------------------------------

local function configMicroMenu()

  -- Hide Micro Menu frame.
  SetAlphaForFrame(MicroMenu, 0)

end

--------------------------------------------------------------------------------
-- CONFIGURE QUEST TRACKER
--------------------------------------------------------------------------------

local function configQuestTracker()

  -- Set scale for Objective Tracker.
  SetScaleForFrame(ObjectiveTrackerFrame, 0.95)

end

--------------------------------------------------------------------------------
-- CONFIGURE TOOLTIPS
--------------------------------------------------------------------------------

local function configTooltips()
    -- Change the status bar texture once during initialization.
    GameTooltipStatusBar:SetStatusBarTexture("Interface\\AddOns\\SharedMedia\\statusbar\\Wglass")

    GameTooltip:HookScript("OnUpdate", function(self)
        -- Check if the unit currently being moused over is a player.
        if UnitIsPlayer("mouseover") then
            local _, englishClass = UnitClass("mouseover")
            if englishClass then
                local r, g, b = GetClassColor(englishClass)
                GameTooltipStatusBarTexture:SetVertexColor(r, g, b)
            else
                -- Fallback to white if class cannot be determined for a player unit.
                GameTooltipStatusBarTexture:SetVertexColor(0.0, 1.0, 0.0)
            end
        else
            -- If it's not a player, or no unit is moused over, reset to a default color.
            GameTooltipStatusBarTexture:SetVertexColor(0.0, 1.0, 0.0)
        end
    end)

end

--------------------------------------------------------------------------------
-- SETUP CVARS
--------------------------------------------------------------------------------

local function setupCVars()

  -- Action Bar
  C_CVar.SetCVar("lockActionBar", 1)
  C_CVar.SetCVar("AutoPushSpellToActionBar",0)

  -- Combat
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
  C_CVar.SetCVar("floatingCombatTextCombatDamageDirectionalScale", 0)
  C_CVar.SetCVar("floatingCombatTextCombatHealingAbsorbTarget", 0)
  C_CVar.SetCVar("floatingCombatTextLowManaHealth", 0)
  C_CVar.SetCVar("floatingCombatTextReactives", 0)

  -- Graphics
  C_CVar.SetCVar("ResampleAlwaysSharpen", 1)

  -- Minimap
  C_CVar.SetCVar("minimapInsideZoom", 2)
  C_CVar.SetCVar("minimapTrackingShowAll",1)

  -- Raid and Party frames
  C_CVar.SetCVar("findYourselfInRaid", 1)
  C_CVar.SetCVar("findYourselfInRaidOnlyInCombat", 1) 
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
  --C_CVar.SetCVar("maxFPS", 60)
  --C_CVar.SetCVar("maxFPSBk", 8)
  C_CVar.SetCVar("movieSubtitle", 1)
  C_CVar.SetCVar("screenEdgeFlash", 0)
  C_CVar.SetCVar("synchronizeBindings", 1)
  C_CVar.SetCVar("synchronizeConfig", 1)
  C_CVar.SetCVar("synchronizeMacros", 1)
  C_CVar.SetCVar("synchronizeSettings", 1)

  -- Create new commands
SLASH_RELOADUI1 = "/rl"
SlashCmdList["RELOADUI"] = ReloadUI
SLASH_READYCHECK1 = "/rc"
SlashCmdList["READYCHECK"] = DoReadyCheck

end

--------------------------------------------------------------------------------
-- INITIALIZATION FUNCTION
--------------------------------------------------------------------------------

-- Initialize functions on login
local function InitializeAddon()

    configBuffsDebuffs()
    configMicroMenu()
    configMinimap()
    configQuestTracker()
    configTooltips()
    setupCVars()

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
