--[[----------------------------------------------------------------------------
    PanzaUI - Personal Resource Display
    Text style, centered text, percentage-only health/power text.
    Bar text is shown when "Show Bar Text" is enabled in Edit Mode.
------------------------------------------------------------------------------]]
local _, ns = ...

local PRD = ns:RegisterModule("PersonalResource", {
    title = "Personal Resource Display",
    defaults = {
        fontStyle   = true,
        centerText  = true,
        percentText = true,
    },
    options = {
        { header = "Style" },
        { key = "fontStyle",   label = "Outline + Slug text",  tooltip = "Apply outline and slug rendering to the bar text. Requires Reload UI." },
        { key = "centerText",  label = "Center text",          tooltip = "Center the text on the bars. Requires Reload UI." },
        { header = "Features" },
        { key = "percentText", label = "Percentage-only text", tooltip = "Show health and power as a plain percentage (no % symbol). Enable \"Show Bar Text\" in Edit Mode. Requires Reload UI." },
    },
})

local function Setup(db)
    local frame = PersonalResourceDisplayFrame
    if not frame then return end

    local container = frame.HealthBarsContainer
    local health    = container and (container.healthBar or container.HealthBar)
    local power     = frame.PowerBar
    local bars      = { health, power, frame.AlternatePowerBar }

    for i = 1, 3 do
        local bar = bars[i]
        if bar then
            if db.fontStyle then ns.StyleBarText(bar) end
            if db.centerText and bar.TextString then
                bar.TextString:ClearAllPoints()
                bar.TextString:SetPoint("CENTER")
                bar.TextString:SetJustifyH("CENTER")
            end
        end
    end

    -- Alternate power (stagger, ebon might, ...) keeps Blizzard's own text.
    if db.percentText then
        ns.PercentText(health, false, "player", true)
        ns.PercentText(power,  true,  "player", true)
    end
end

function PRD:OnEnable()
    local db = self.db
    if db.fontStyle or db.centerText or db.percentText then
        if PersonalResourceDisplayFrame then
            Setup(db)
        else
            EventUtil.ContinueOnAddOnLoaded("Blizzard_PersonalResourceDisplay", function() Setup(db) end)
        end
    end
end
