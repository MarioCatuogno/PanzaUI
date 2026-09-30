--[[----------------------------------------------------------------------------
    PanzaUI - Quest Tracker
    Text style, auto-collapse during boss fights and quest count for the
    Objective Tracker.
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
        { key = "combatCollapse", label = "Collapse during boss fights", tooltip = "Collapse the tracker during dungeon and raid boss encounters and expand it again when the encounter ends." },
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
-- Collapse during dungeon/raid boss encounters. Events are registered only
-- while the option is on. The tracker is expanded when the encounter ends
-- (kill or wipe) only if we collapsed it.
--------------------------------------------------------------------------------
local BOSS_INSTANCES = { party = true, raid = true }

local collapsedByUs = false
local events = CreateFrame("Frame")

events:SetScript("OnEvent", function(_, event)
    local tracker = ObjectiveTrackerFrame
    if not tracker then return end

    if event == "ENCOUNTER_START" then
        local _, instanceType = IsInInstance()
        if BOSS_INSTANCES[instanceType] and not tracker:IsCollapsed() then
            tracker:SetCollapsed(true)
            collapsedByUs = true
        end
    elseif collapsedByUs then -- ENCOUNTER_END
        collapsedByUs = false
        if tracker:IsCollapsed() then tracker:SetCollapsed(false) end
    end
end)

local function SetCombatCollapse(on)
    if on then
        events:RegisterEvent("ENCOUNTER_START")
        events:RegisterEvent("ENCOUNTER_END")
    else
        events:UnregisterAllEvents()
        collapsedByUs = false
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
countEvents:SetScript("OnEvent", UpdateCount)

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
