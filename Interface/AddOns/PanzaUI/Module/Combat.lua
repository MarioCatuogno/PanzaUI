--[[----------------------------------------------------------------------------
    PanzaUI - Combat
    Personal Resource Display: text style, centered text, percentage-only
    health/power text (always shown, like Player/Target, regardless of the
    Edit Mode "Show Bar Text" setting).
    Cooldown Manager: action bar style for the icons of every viewer.
------------------------------------------------------------------------------]]
local _, ns = ...

-- Module key kept from the old "Personal Resource Display" module, so saved
-- settings stay.
local CB = ns:RegisterModule("PersonalResource", {
    title = "Combat",
    defaults = {
        fontStyle     = true,
        centerText    = true,
        percentText   = true,
        cdmIconStyle  = true,
    },
    options = {
        { header = "Personal Resource Display" },
        { key = "fontStyle",    label = "Outline + Slug text",  tooltip = "Apply outline and slug rendering to the bar text. Requires Reload UI." },
        { key = "centerText",   label = "Center text",          tooltip = "Center the text on the bars. Requires Reload UI." },
        { key = "percentText",  label = "Percentage-only text", tooltip = "Always show health and power as a plain percentage (no % symbol), like the Player and Target frames. Requires Reload UI." },
        { header = "Cooldown Manager" },
        { key = "cdmIconStyle", label = "Action bar style",     tooltip = "Give the Cooldown Manager icons (Essential, Utility, tracked buffs and buff bars) the same rounded frame as action buttons. Requires Reload UI." },
    },
})

--------------------------------------------------------------------------------
-- Personal Resource Display
--------------------------------------------------------------------------------
local function SetupPRD(db)
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
        ns.PercentText(health, false, "player")
        ns.PercentText(power,  true,  "player")
    end
end

--------------------------------------------------------------------------------
-- Cooldown Manager icons. Items come from a pool per viewer: styled once when
-- acquired (and the ones already there). Blizzard's own square icon overlay
-- is hidden so only the action bar frame shows. Widget calls only.
--------------------------------------------------------------------------------
local VIEWERS = { "EssentialCooldownViewer", "UtilityCooldownViewer", "BuffIconCooldownViewer", "BuffBarCooldownViewer" }
local styledItems = {}

local function StyleItem(item)
    if not item or styledItems[item] then return end
    -- Icon viewers: item.Icon is the texture. Bar viewer: item.Icon is a frame.
    local holder, icon = item, item.Icon
    if icon and not icon.AddMaskTexture then holder, icon = icon, icon.Icon end
    if not (icon and icon.AddMaskTexture) then return end
    styledItems[item] = true

    for _, region in ipairs({ holder:GetRegions() }) do
        local atlas = region.GetAtlas and region:GetAtlas()
        if atlas and atlas:find("IconOverlay", 1, true) then region:SetAlpha(0) end
    end
    ns.StyleIcon(icon, holder)
end

local function StyleViewer(viewer)
    if viewer.GetItemFrames then
        for _, item in ipairs(viewer:GetItemFrames()) do StyleItem(item) end
    end
end

local function SetupCooldownManager()
    for _, name in ipairs(VIEWERS) do
        local viewer = _G[name]
        if viewer then
            StyleViewer(viewer)
            ns.Hook(viewer, "OnAcquireItemFrame", function(_, item) StyleItem(item) end)
            ns.Hook(viewer, "RefreshLayout", StyleViewer)
        end
    end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function CB:OnEnable()
    local db = self.db
    if db.fontStyle or db.centerText or db.percentText then
        if PersonalResourceDisplayFrame then
            SetupPRD(db)
        else
            EventUtil.ContinueOnAddOnLoaded("Blizzard_PersonalResourceDisplay", function() SetupPRD(db) end)
        end
    end
    if db.cdmIconStyle then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_CooldownViewer", SetupCooldownManager)
    end
end
