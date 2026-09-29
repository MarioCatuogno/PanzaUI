--[[----------------------------------------------------------------------------
    PanzaUI - Minimap
    Text style (zone and clock), zone / tracking / calendar backgrounds.
------------------------------------------------------------------------------]]
local _, ns = ...

local MM = ns:RegisterModule("Minimap", {
    title = "Minimap",
    defaults = {
        fontStyle              = true,
        hideZoneBackground     = true,
        hideTrackingBackground = true,
        hideCalendarBackground = true,
    },
    options = {
        { header = "Style" },
        { key = "fontStyle",              label = "Outline + Slug text",        tooltip = "Apply outline and slug rendering to the zone text and the clock. Requires Reload UI." },
        { key = "hideZoneBackground",     label = "Hide zone text background",  tooltip = "Remove the background behind the zone name." },
        { key = "hideTrackingBackground", label = "Hide tracking background",   tooltip = "Remove the background of the tracking button." },
        { key = "hideCalendarBackground", label = "Hide calendar background",   tooltip = "Remove the background of the calendar button." },
    },
})

--------------------------------------------------------------------------------
-- Backgrounds: hidden with alpha only. These regions are anchor points for
-- other elements (zone text, tracking button), so they must stay in place.
--------------------------------------------------------------------------------

-- Calendar: every texture of the button except its icon states and the
-- invite/alarm notifications.
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

local BACKGROUNDS = {
    hideZoneBackground     = function() return { MinimapCluster.BorderTop } end,
    hideTrackingBackground = function() return { MinimapCluster.Tracking and MinimapCluster.Tracking.Background } end,
    hideCalendarBackground = CalendarBackgrounds,
}

local function ApplyBackground(key)
    local alpha = MM.db[key] and 0 or 1
    for _, region in ipairs(BACKGROUNDS[key]()) do region:SetAlpha(alpha) end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function MM:OnEnable()
    for key in pairs(BACKGROUNDS) do
        if self.db[key] then ApplyBackground(key) end
    end

    if self.db.fontStyle then
        ns.StyleFont(MinimapZoneText)
        -- The clock lives in a load-on-demand Blizzard addon.
        EventUtil.ContinueOnAddOnLoaded("Blizzard_TimeManager", function()
            ns.StyleFont(TimeManagerClockTicker)
        end)
    end
end

function MM:OnOptionChanged(key)
    if BACKGROUNDS[key] then ApplyBackground(key) end
end
