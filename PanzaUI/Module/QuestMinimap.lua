--[[----------------------------------------------------------------------------
    PanzaUI - Quest & Minimap
    Minimap style and clutter, Quest Tracker style, auto-collapse and quest
    count.
------------------------------------------------------------------------------]]
local _, ns = ...

local QM = ns:RegisterModule("QuestMinimap", {
    title = "Quest & Minimap",
    defaults = {
        minimapStyle   = true,
        minimapClutter = true,
        combatCollapse = true,
        trackerStyle   = true,
        questCount     = true,
    },
    options = {
        { header = "Minimap" },
        { key = "minimapStyle", label = "Refined style",
          tooltip = "Polish the look of the minimap." },
        { key = "minimapClutter", label = "Hide clutter",
          tooltip = "Hide the calendar invite alerts on the minimap." },
        { header = "Quest Tracker" },
        { key = "combatCollapse", label = "Collapse in instances",
          tooltip = "Hide the Quest Tracker during boss fights and combat in dungeons and raids." },
        { key = "questCount", label = "Quest count",
          tooltip = "Show how many quests you have in the tracker header." },
        { key = "trackerStyle", label = "Refined style", reload = true,
          tooltip = "Give the Quest Tracker a cleaner header." },
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
-- Minimap backgrounds, hidden with alpha (other elements anchor to them).
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

-- Clock text at the zone name size (its own size kept to restore it).
local clockSize

local function ApplyClockSize()
    local clock, zone = TimeManagerClockTicker, MinimapZoneText
    if not (clock and zone) then return end
    local path, size, flags = clock:GetFont()
    local _, zoneSize = zone:GetFont()
    if not (path and size and zoneSize) then return end
    clockSize = clockSize or size
    local target = QM.db.minimapStyle and zoneSize or clockSize
    if size ~= target then clock:SetFont(path, target, flags) end
end

--------------------------------------------------------------------------------
-- Text style: Quest Tracker fonts and instance texts at the top.
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
-- Quest Tracker auto-collapse in instances. Contents are faded with alpha:
-- Blizzard's SetCollapsed would taint the tracker.
--------------------------------------------------------------------------------
local BOSS_INSTANCES  = { party = true, raid = true }
local LFR_DIFFICULTY  = { [7] = true, [17] = true, [151] = true } -- LFR difficulties (legacy, current, Timewalking)
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

-- Fades every child except the header and the Dungeon / Mythic+ section,
-- restoring its own alpha.
local savedAlpha = {}

local function SetContentHidden(header, hide, ...)
    local scenario = ScenarioObjectiveTracker
    for i = 1, select("#", ...) do
        local child = select(i, ...)
        if child ~= header and child ~= scenario then
            if hide then
                savedAlpha[child] = child:GetAlpha()
                child:SetAlpha(0)
            else
                child:SetAlpha(savedAlpha[child] or 1)
            end
        end
    end
end

local function UpdateCollapse()
    local tracker = ObjectiveTrackerFrame
    if not tracker then return end
    local hide = QM.db.combatCollapse and ShouldCollapse() or false
    if hide == hidden then return end
    hidden = hide
    SetContentHidden(tracker.Header, hide, tracker:GetChildren())
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
    ns.SetEvents(events, on, unpack(COLLAPSE_EVENTS))
    if on then
        inCombat = InCombatLockdown()
    else
        inEncounter, inCombat = false, false
    end
    UpdateCollapse()
end

--------------------------------------------------------------------------------
-- Refined style: the "All Objectives" header without its background and
-- title (hidden with alpha, its collapse button stays where it is).
--------------------------------------------------------------------------------
local function ApplyTrackerStyle()
    local header = ObjectiveTrackerFrame and ObjectiveTrackerFrame.Header
    if not header then return end
    if header.Background then header.Background:SetAlpha(0) end
    if header.Text then header.Text:SetAlpha(0) end
end

--------------------------------------------------------------------------------
-- Quest count in the tracker header (the Quests header with Refined style).
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

local function CountHeader()
    local quests = QM.db.trackerStyle and QuestObjectiveTracker and QuestObjectiveTracker.Header
    if quests and quests.Text then return quests end
    return ObjectiveTrackerFrame.Header
end

local function PlaceCount()
    local header = CountHeader()
    countText:SetParent(header)
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
-- At most one count per second.
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
    local header = ObjectiveTrackerFrame and CountHeader()
    if not (header and header.Text) then return end
    if on and not countText then
        countText = header:CreateFontString(nil, "OVERLAY")
        countText:SetFontObject(header.Text:GetFontObject() or ObjectiveTrackerHeaderFont)
        countText:SetTextColor(header.Text:GetTextColor())
    end
    if not countText then return end
    countText:SetShown(on)
    ns.SetEvents(countEvents, on, unpack(COUNT_EVENTS))
    if on then DelayedCount() end
end

--------------------------------------------------------------------------------
-- Hide clutter: Blizzard help tips with these texts are closed as soon as
-- they are shown (post-hook, option read live).
--------------------------------------------------------------------------------
local CLUTTER_TIPS = {}
if type(GAMETIME_TOOLTIP_CALENDAR_INVITES) == "string" then CLUTTER_TIPS[GAMETIME_TOOLTIP_CALENDAR_INVITES] = true end

local function HideClutterTip(helpTip, parent, info)
    local text = info and info.text
    if QM.db.minimapClutter and type(text) == "string" and CLUTTER_TIPS[text] then
        helpTip:Hide(parent, text)
    end
end

-- Calendar button: the pending invites icon and its flashing glow, moved
-- under the hidden parent (Blizzard keeps flashing them), restored when off.
local INVITE_PARTS = { "GameTimeCalendarInvitesTexture", "GameTimeCalendarInvitesGlow" }
local inviteParents = {}

local function ApplyClutter()
    local hide = QM.db.minimapClutter
    for _, name in ipairs(INVITE_PARTS) do
        local region = _G[name]
        if region then
            inviteParents[region] = inviteParents[region] or region:GetParent()
            region:SetParent(hide and ns.Hider or inviteParents[region])
        end
    end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function QM:OnEnable()
    local db = self.db
    if HelpTip then ns.Hook(HelpTip, "Show", HideClutterTip) end
    if db.minimapClutter then ApplyClutter() end

    if db.minimapStyle then ApplyBackgrounds() end

    if ns.textStyle then ns.StyleFont(MinimapZoneText) end
    EventUtil.ContinueOnAddOnLoaded("Blizzard_TimeManager", function()
        if ns.textStyle then ns.StyleFont(TimeManagerClockTicker) end
        ApplyClockSize()
    end)

    if db.trackerStyle then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_ObjectiveTracker", ApplyTrackerStyle)
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
        ApplyClockSize()
    elseif key == "minimapClutter" then
        ApplyClutter()
    elseif key == "combatCollapse" then
        SetCombatCollapse(value)
    elseif key == "questCount" then
        SetQuestCount(value)
    end
end
