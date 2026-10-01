--[[----------------------------------------------------------------------------
    PanzaUI - Quest Tracker
    Text style, auto-collapse in instances (boss fights, Mythic+, combat in
    raids and dungeons) and quest count for the Objective Tracker.
------------------------------------------------------------------------------]]
local _, ns = ...

local QT = ns:RegisterModule("QuestTracker", {
    title = "Quest Tracker",
    defaults = {
        fontStyle      = true,
        combatCollapse = true,
        questCount     = true,
    },
    options = {
        { header = "Style" },
        { key = "fontStyle",      label = "Outline + Slug text", tooltip = "Apply outline and slug rendering to quest tracker text. Requires Reload UI." },
        { header = "Features" },
        { key = "combatCollapse", label = "Collapse in instances", tooltip = "Collapse the tracker during dungeon and raid boss fights, for the whole Mythic+ run, and in combat in raids (not LFR) and dungeons (not Follower dungeons). It is expanded again afterwards." },
        { key = "questCount",     label = "Show quest count",    tooltip = "Show the number of quests in your log out of the maximum (e.g. 20/35) in the tracker header." },
    },
})

--------------------------------------------------------------------------------
-- Text style: every tracker text inherits these two shared font objects,
-- so styling them covers headers, quest titles and objectives with no hooks
-- on layout updates.
--------------------------------------------------------------------------------
local FONTS = { "ObjectiveTrackerHeaderFont", "ObjectiveTrackerLineFont" }

local function StyleFonts()
    for _, name in ipairs(FONTS) do ns.StyleFont(_G[name]) end
end

--------------------------------------------------------------------------------
-- Auto-collapse. The tracker is collapsed while any of these is true:
--  * a dungeon/raid boss encounter is in progress;
--  * a Mythic+ run is active (the whole run);
--  * the player is in combat in a raid (not LFR) or dungeon (not Follower).
-- It is expanded again when none is true any more, only if we collapsed it
-- (a tracker collapsed by hand stays collapsed). Events are registered only
-- while the option is on; state is re-checked on each of them.
--------------------------------------------------------------------------------
local BOSS_INSTANCES  = { party = true, raid = true }
local LFR_DIFFICULTY  = { [7] = true, [17] = true, [151] = true } -- LFR, legacy LFR, Timewalking LFR
local FOLLOWER_DUNGEON = 205

local COLLAPSE_EVENTS = {
    "ENCOUNTER_START", "ENCOUNTER_END", "PLAYER_REGEN_DISABLED", "PLAYER_REGEN_ENABLED",
    "CHALLENGE_MODE_START", "CHALLENGE_MODE_COMPLETED", "CHALLENGE_MODE_RESET",
    "PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA",
}

local collapsedByUs, inEncounter, inCombat = false, false, false
local events = CreateFrame("Frame")

local function ShouldCollapse()
    local _, instanceType, difficulty = GetInstanceInfo()
    if not BOSS_INSTANCES[instanceType] then return false end
    if inEncounter then return true end
    if C_ChallengeMode and C_ChallengeMode.IsChallengeModeActive and C_ChallengeMode.IsChallengeModeActive() then
        return true
    end
    return inCombat and not LFR_DIFFICULTY[difficulty] and difficulty ~= FOLLOWER_DUNGEON
end

local function UpdateCollapse()
    local tracker = ObjectiveTrackerFrame
    if not tracker then return end
    if ShouldCollapse() then
        if not tracker:IsCollapsed() then
            tracker:SetCollapsed(true)
            collapsedByUs = true
        end
    elseif collapsedByUs then
        collapsedByUs = false
        if tracker:IsCollapsed() then tracker:SetCollapsed(false) end
    end
end

events:SetScript("OnEvent", function(_, event)
    if event == "ENCOUNTER_START" then
        inEncounter = true
    elseif event == "ENCOUNTER_END" then
        inEncounter = false
    elseif event == "PLAYER_REGEN_DISABLED" then
        inCombat = true
    elseif event == "PLAYER_REGEN_ENABLED" then
        inCombat = false
    elseif event == "PLAYER_ENTERING_WORLD" then
        inEncounter, inCombat = false, InCombatLockdown()
    end
    UpdateCollapse()
end)

local function SetCombatCollapse(on)
    if on then
        for _, event in ipairs(COLLAPSE_EVENTS) do events:RegisterEvent(event) end
        inCombat = InCombatLockdown()
        UpdateCollapse()
    else
        events:UnregisterAllEvents()
        inEncounter, inCombat = false, false
        UpdateCollapse() -- expands it if we collapsed it
    end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Quest count (e.g. 20/35) in the "All Objectives" header, same font and
-- color as its title, right before the minimize button. Only quests that
-- count toward the log limit (no headers, hidden, world/bonus or bounty
-- quests). Updated on quest log changes, only while the option is on.
--------------------------------------------------------------------------------
local countText
local countEvents = CreateFrame("Frame")

local function CountQuests()
    local count = 0
    for i = 1, C_QuestLog.GetNumQuestLogEntries() do
        local info = C_QuestLog.GetInfo(i)
        if info and not (info.isHeader or info.isHidden or info.isTask or info.isBounty) then
            count = count + 1
        end
    end
    return count
end

-- Right before the minimize button, on the same line as the header title.
local function PlaceCount()
    local header = ObjectiveTrackerFrame.Header
    local button = header.MinimizeButton or header
    local _, textY = header.Text:GetCenter()
    local _, buttonY = button:GetCenter()
    local offsetY = (textY and buttonY) and (textY - buttonY) or 0
    countText:ClearAllPoints()
    countText:SetPoint("RIGHT", button, "LEFT", -6, offsetY)
end

local function UpdateCount()
    if not countText then return end
    PlaceCount()
    countText:SetFormattedText("%d/%d", CountQuests(), C_QuestLog.GetMaxNumQuestsCanAccept())
end
-- QUEST_LOG_UPDATE fires very often (and in bursts), and each count reads
-- one info table per log entry: count at most once per second, always after
-- the last change. Timer callback made once (no closure per event).
local countPending = false
local function DelayedCount()
    countPending = false
    UpdateCount()
end
countEvents:SetScript("OnEvent", function()
    if countPending then return end
    countPending = true
    C_Timer.After(1, DelayedCount)
end)

local function SetQuestCount(on)
    local header = ObjectiveTrackerFrame and ObjectiveTrackerFrame.Header
    if not (header and header.Text) then return end
    if on and not countText then
        countText = header:CreateFontString(nil, "OVERLAY")
        countText:SetFontObject(header.Text:GetFontObject() or ObjectiveTrackerHeaderFont)
        countText:SetTextColor(header.Text:GetTextColor())
    end
    if not countText then return end
    countText:SetShown(on)
    if on then
        countEvents:RegisterEvent("QUEST_LOG_UPDATE")
        UpdateCount()
    else
        countEvents:UnregisterAllEvents()
    end
end

function QT:OnEnable()
    if self.db.questCount then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_ObjectiveTracker", function() SetQuestCount(true) end)
    end
    if self.db.fontStyle then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_ObjectiveTracker", function()
            StyleFonts()
            -- Edit Mode "Text Size" resets the font objects: restyle after it.
            ns.Hook(ObjectiveTrackerManager, "SetTextSize", StyleFonts)
        end)
    end
    SetCombatCollapse(self.db.combatCollapse)
end

function QT:OnOptionChanged(key, value)
    if key == "combatCollapse" then
        SetCombatCollapse(value)
    elseif key == "questCount" then
        SetQuestCount(value)
    end
end
