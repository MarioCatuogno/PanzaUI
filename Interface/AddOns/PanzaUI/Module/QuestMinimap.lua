--[[----------------------------------------------------------------------------
    PanzaUI - Quest & Minimap
    Minimap: refined style (no zone / tracking / calendar backgrounds).
    Quest Tracker: auto-collapse in instances (boss fights, Mythic+, combat
    in raids and dungeons) and quest count.
    Shared text style: minimap zone text and clock, Quest Tracker and the
    instance texts at the top of the screen.
------------------------------------------------------------------------------]]
local _, ns = ...

local QM = ns:RegisterModule("QuestMinimap", {
    title = "Quest & Minimap",
    defaults = {
        minimapStyle   = true,
        combatCollapse = true,
        questCount     = true,
    },
    options = {
        { header = "Minimap" },
        { key = "minimapStyle", label = "Refined style", reload = true,
          tooltip = "Polish the look of the minimap.",
          bullets = { "No button and zone backgrounds" } },
        { header = "Quest Tracker" },
        { key = "combatCollapse", label = "Collapse in instances",
          tooltip = "Hide the tracker contents during dungeon, raid and Mythic+ combat.",
          bullets = { "Boss fights and the whole Mythic+ run", "Combat in raids and dungeons (not LFR or Follower)", "Only the header stays visible", "Shown again afterwards" } },
        { key = "questCount", label = "Quest count",
          tooltip = "Show the number of quests in your log.",
          bullets = { "In the tracker header (e.g. 20/35)" } },
    },
})

-- Converts the saved values of older versions.
function QM:Migrate(db, saved)
    local mm, qt = saved.Minimap, saved.QuestTracker
    ns.MergeOptions(db, "minimapStyle", mm, "style", "fontStyle", "hideZoneBackground", "hideTrackingBackground", "hideCalendarBackground")
    ns.MergeOptions(db, "combatCollapse", qt, "combatCollapse")
    ns.MergeOptions(db, "questCount", qt, "questCount")
end

--------------------------------------------------------------------------------
-- Minimap backgrounds (zone text, tracking and calendar buttons), hidden
-- with alpha only: other elements are anchored to them.
--------------------------------------------------------------------------------
local function CalendarBackgrounds()
    local list, f = {}, GameTimeFrame
    if not f then return list end
    local keep = {
        [f:GetNormalTexture() or f] = true, [f:GetPushedTexture() or f] = true, [f:GetHighlightTexture() or f] = true,
    }
    for _, name in ipairs({ "GameTimeCalendarInvitesTexture", "GameTimeCalendarInvitesGlow", "GameTimeCalendarEventAlarmTexture" }) do
        if _G[name] then keep[_G[name]] = true end
    end
    for _, region in ipairs({ f:GetRegions() }) do
        if region:IsObjectType("Texture") and not keep[region] then list[#list + 1] = region end
    end
    return list
end

local function Backgrounds()
    local list = CalendarBackgrounds()
    list[#list + 1] = MinimapCluster.BorderTop
    list[#list + 1] = MinimapCluster.Tracking and MinimapCluster.Tracking.Background
    return list
end

local function ApplyBackgrounds()
    local alpha = QM.db.minimapStyle and 0 or 1
    for _, region in pairs(Backgrounds()) do region:SetAlpha(alpha) end
end

--------------------------------------------------------------------------------
-- Text style: the Quest Tracker's two shared font objects, and the instance
-- texts at the top of the screen (pooled widgets, restyled after each layout).
--------------------------------------------------------------------------------
local FONTS = { "ObjectiveTrackerHeaderFont", "ObjectiveTrackerLineFont" }

local function StyleFonts()
    for _, name in ipairs(FONTS) do ns.StyleFont(_G[name]) end
end

local function StyleTopWidgets(container)
    local widgets = container.widgetFrames
    if not widgets then return end
    for _, widget in pairs(widgets) do ns.StyleAllFonts(widget, 1) end
end

--------------------------------------------------------------------------------
-- Quest Tracker auto-collapse during boss fights, Mythic+ runs and combat in
-- raids and dungeons (not LFR or Follower). The contents are faded out with
-- alpha (header kept): calling Blizzard's SetCollapsed from an addon taints
-- the tracker, whose layout then can't read the auras that are secret in
-- combat.
--------------------------------------------------------------------------------
local BOSS_INSTANCES  = { party = true, raid = true }
local LFR_DIFFICULTY  = { [7] = true, [17] = true, [151] = true } -- LFR, legacy LFR, Timewalking LFR
local FOLLOWER_DUNGEON = 205

local COLLAPSE_EVENTS = {
    "ENCOUNTER_START", "ENCOUNTER_END", "PLAYER_REGEN_DISABLED", "PLAYER_REGEN_ENABLED",
    "CHALLENGE_MODE_START", "CHALLENGE_MODE_COMPLETED", "CHALLENGE_MODE_RESET",
    "PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA",
}

local hidden, inEncounter, inCombat = false, false, false
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

-- Every child of the tracker except its header (varargs, no tables).
local function SetContentAlpha(header, alpha, ...)
    for i = 1, select("#", ...) do
        local child = select(i, ...)
        if child ~= header then child:SetAlpha(alpha) end
    end
end

local function UpdateCollapse()
    local tracker = ObjectiveTrackerFrame
    if not tracker then return end
    local hide = ShouldCollapse()
    if hide == hidden then return end
    hidden = hide
    SetContentAlpha(tracker.Header, hide and 0 or 1, tracker:GetChildren())
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
        UpdateCollapse()
    end
end

--------------------------------------------------------------------------------
-- Quest count (e.g. 20/35) in the tracker header: only quests that count
-- toward the log limit. Updated when quests enter or leave the log
-- (QUEST_LOG_UPDATE fires constantly and is used only until the log loads).
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
-- Bursts of events: at most one count per second.
local COUNT_EVENTS = { "QUEST_ACCEPTED", "QUEST_REMOVED", "QUEST_TURNED_IN", "QUEST_LOG_UPDATE" }
local countPending, logLoaded = false, false
local function DelayedCount()
    countPending = false
    UpdateCount()
    if logLoaded then countEvents:UnregisterEvent("QUEST_LOG_UPDATE") end
end
countEvents:SetScript("OnEvent", function(_, event)
    if event == "QUEST_LOG_UPDATE" then logLoaded = true end
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
        for _, event in ipairs(COUNT_EVENTS) do countEvents:RegisterEvent(event) end
        DelayedCount()
    else
        countEvents:UnregisterAllEvents()
    end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function QM:OnEnable()
    local db = self.db

    if db.minimapStyle then ApplyBackgrounds() end

    if ns.textStyle then
        ns.StyleFont(MinimapZoneText)
        EventUtil.ContinueOnAddOnLoaded("Blizzard_TimeManager", function()
            ns.StyleFont(TimeManagerClockTicker)
        end)
    end

    if db.questCount then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_ObjectiveTracker", function() SetQuestCount(true) end)
    end
    if ns.textStyle then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_ObjectiveTracker", function()
            StyleFonts()
            -- Edit Mode "Text Size" resets the font objects.
            ns.Hook(ObjectiveTrackerManager, "SetTextSize", StyleFonts)
        end)
        local top = UIWidgetTopCenterContainerFrame
        if top then
            ns.Hook(top, "UpdateWidgetLayout", StyleTopWidgets)
            StyleTopWidgets(top)
        end
    end
    SetCombatCollapse(db.combatCollapse)
end

-- Live options.
function QM:OnOptionChanged(key, value)
    if key == "minimapStyle" then
        ApplyBackgrounds()
    elseif key == "combatCollapse" then
        SetCombatCollapse(value)
    elseif key == "questCount" then
        SetQuestCount(value)
    end
end
