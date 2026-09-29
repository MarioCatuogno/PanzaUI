--[[----------------------------------------------------------------------------
    PanzaUI - Tooltips
    Health bar, M+ rating and item level of players, item/spell IDs.
------------------------------------------------------------------------------]]
local _, ns = ...

local TT = ns:RegisterModule("Tooltips", {
    title = "Tooltips",
    defaults = {
        hideHealthBar    = true,
        showMythicRating = true,
        showItemLevel    = true,
        showIDs          = true,
    },
    options = {
        { header = "Style" },
        { key = "hideHealthBar",    label = "Hide health bar",       tooltip = "Remove the health bar under unit tooltips. Requires Reload UI." },
        { header = "Features" },
        { key = "showMythicRating", label = "Show M+ rating",        tooltip = "Show the Mythic+ rating of players." },
        { key = "showItemLevel",    label = "Show item level",       tooltip = "Show the average equipped item level of players (other players are inspected when possible)." },
        { key = "showIDs",          label = "Show item/spell ID",    tooltip = "Show the ID of items and spells." },
    },
})

local IsSecret = ns.IsSecret

local ILVL_CACHE_TIME  = 300 -- seconds before a player is inspected again
local INSPECT_THROTTLE = 1.5 -- min seconds between inspect requests

local ilvlCache = {}         -- guid -> { ilvl = n, time = t }

local lastInspect, pendingGUID = 0, nil

local function IsUsable(tooltip)
    return tooltip.AddDoubleLine and not (tooltip.IsForbidden and tooltip:IsForbidden())
end

local function AddLine(tooltip, label, value, r, g, b)
    local n = NORMAL_FONT_COLOR
    tooltip:AddDoubleLine(label, value, n.r, n.g, n.b, r or 1, g or 1, b or 1)
end

--------------------------------------------------------------------------------
-- Item level (players). Self: direct. Others: inspect, throttled and cached.
--------------------------------------------------------------------------------
local function RequestInspect(unit, guid)
    local now = GetTime()
    if now - lastInspect < INSPECT_THROTTLE or InCombatLockdown() or not CanInspect(unit) then return end
    if InspectFrame and InspectFrame:IsShown() then return end -- don't steal the user's inspect
    lastInspect, pendingGUID = now, guid
    NotifyInspect(unit)
end

local inspectEvents = CreateFrame("Frame")
inspectEvents:SetScript("OnEvent", function(_, _, guid)
    if not guid or IsSecret(guid) or guid ~= pendingGUID then return end
    pendingGUID = nil

    local unit = UnitTokenFromGUID(guid)
    local ilvl = unit and C_PaperDollInfo.GetInspectItemLevel(unit)
    if not (InspectFrame and InspectFrame:IsShown()) then ClearInspectPlayer() end
    if not ilvl or IsSecret(ilvl) or ilvl <= 0 then return end

    local hadValue = ilvlCache[guid] ~= nil
    ilvlCache[guid] = { ilvl = floor(ilvl + 0.5), time = GetTime() }

    -- Still hovering the same player and no value shown yet: add it now.
    local _, ttUnit = GameTooltip:GetUnit()
    if not hadValue and TT.db.showItemLevel and GameTooltip:IsShown()
        and ttUnit and not IsSecret(ttUnit) and UnitGUID(ttUnit) == guid then
        AddLine(GameTooltip, "Item Level", ilvlCache[guid].ilvl)
        GameTooltip:Show() -- resize
    end
end)

local function AddItemLevel(tooltip, unit, guid)
    if guid == UnitGUID("player") then
        local _, equipped = GetAverageItemLevel()
        AddLine(tooltip, "Item Level", floor(equipped + 0.5))
        return
    end
    local cached = ilvlCache[guid]
    if cached then AddLine(tooltip, "Item Level", cached.ilvl) end
    if not cached or GetTime() - cached.time > ILVL_CACHE_TIME then RequestInspect(unit, guid) end
end

--------------------------------------------------------------------------------
-- M+ rating
--------------------------------------------------------------------------------
local function AddMythicRating(tooltip, unit)
    local summary = C_PlayerInfo.GetPlayerMythicPlusRatingSummary(unit)
    local score = summary and summary.currentSeasonScore
    if not score or IsSecret(score) or score <= 0 then return end
    local color = C_ChallengeMode.GetDungeonScoreRarityColor(score) or HIGHLIGHT_FONT_COLOR
    AddLine(tooltip, "M+ Rating", score, color:GetRGB())
end

--------------------------------------------------------------------------------
-- Tooltip post-calls (registered once; options are checked at runtime, so
-- they apply live). Secret values (restricted combat/instance data) are
-- skipped, never read.
--------------------------------------------------------------------------------
local function OnUnit(tooltip)
    local db = TT.db
    if tooltip ~= GameTooltip or not (db.showMythicRating or db.showItemLevel) then return end

    local _, unit = tooltip:GetUnit()
    if not unit or IsSecret(unit) then return end
    local isPlayer = UnitIsPlayer(unit)
    if IsSecret(isPlayer) or not isPlayer then return end
    local guid = UnitGUID(unit)
    if not guid or IsSecret(guid) then return end

    if db.showMythicRating then AddMythicRating(tooltip, unit) end
    if db.showItemLevel    then AddItemLevel(tooltip, unit, guid) end
end

local function IDLine(label)
    return function(tooltip, data)
        if not TT.db.showIDs or not data or not IsUsable(tooltip) then return end
        local id = data.id
        if id and not IsSecret(id) then AddLine(tooltip, label, id) end
    end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function TT:OnEnable()
    if self.db.hideHealthBar then
        -- Hidden (not reparented): the tooltip then sees the bar as not shown
        -- and leaves no empty space for it at the bottom.
        ns.Disable(GameTooltip.StatusBar or GameTooltipStatusBar)
    end

    local add, types = TooltipDataProcessor.AddTooltipPostCall, Enum.TooltipDataType
    add(types.Unit,  OnUnit)
    add(types.Item,  IDLine("Item ID"))
    add(types.Spell, IDLine("Spell ID"))
    inspectEvents:RegisterEvent("INSPECT_READY")
end
