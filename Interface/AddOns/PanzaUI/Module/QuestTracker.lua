--[[----------------------------------------------------------------------------
    PanzaUI - Quest Tracker
    Text style and auto-collapse during boss fights for the Objective Tracker.
------------------------------------------------------------------------------]]
local _, ns = ...

local QT = ns:RegisterModule("QuestTracker", {
    title = "Quest Tracker",
    defaults = {
        fontStyle      = true,
        combatCollapse = true,
    },
    options = {
        { header = "Style" },
        { key = "fontStyle",      label = "Outline + Slug text", tooltip = "Apply outline and slug rendering to quest tracker text. Requires Reload UI." },
        { header = "Features" },
        { key = "combatCollapse", label = "Collapse during boss fights", tooltip = "Collapse the tracker during dungeon and raid boss encounters and expand it again when the encounter ends." },
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
function QT:OnEnable()
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
    if key == "combatCollapse" then SetCombatCollapse(value) end
end
