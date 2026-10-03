--[[----------------------------------------------------------------------------
    PanzaUI - Tooltips
    Tooltip style, player info and IDs.
------------------------------------------------------------------------------]]
local _, ns = ...

local TT = ns:RegisterModule("Tooltips", {
    title = "Tooltips",
    defaults = {
        style      = true,
        playerInfo = true,
        showIDs    = true,
    },
    options = {
        { key = "style", label = "Refined style", reload = true,
          tooltip = "Polish the look of the unit tooltips.",
          bullets = { "No health bar", "Class colored player names" } },
        { key = "playerInfo", label = "Player info",
          tooltip = "Show more information about players.",
          bullets = { "Mythic+ rating", "Item level" } },
        { key = "showIDs", label = "Show IDs",
          tooltip = "Show the ID of items and spells." },
    },
})

-- Converts the saved values of older versions.
function TT:Migrate(db)
    ns.MergeOptions(db, "style", db, "hideHealthBar", "classColorNames")
    ns.MergeOptions(db, "playerInfo", db, "showMythicRating", "showItemLevel")
end

local IsSecret = ns.IsSecret

local ILVL_CACHE_TIME  = 300 -- seconds
local INSPECT_THROTTLE = 1.5 -- seconds between inspects

-- Caches per player (GUID), emptied when full.
local ilvlCache, ilvlTime = {}, {}
local CACHE_LIMIT, ilvlCount, ratingCount = 200, 0, 0

local lastInspect, pendingGUID = 0, nil

local function IsUsable(tooltip)
    return tooltip.AddDoubleLine and not (tooltip.IsForbidden and tooltip:IsForbidden())
end

local function AddLine(tooltip, label, value, r, g, b)
    local n = NORMAL_FONT_COLOR
    tooltip:AddDoubleLine(label, value, n.r, n.g, n.b, r or 1, g or 1, b or 1)
end

--------------------------------------------------------------------------------
-- Item level: direct for the player, inspected for others.
--------------------------------------------------------------------------------
local function RequestInspect(unit, guid)
    local now = GetTime()
    if now - lastInspect < INSPECT_THROTTLE or InCombatLockdown() or not CanInspect(unit) then return end
    if InspectFrame and InspectFrame:IsShown() then return end
    lastInspect, pendingGUID = now, guid
    NotifyInspect(unit)
end

-- The tooltip unit's GUID can be secret: compared only when readable.
local function SameGUID(unit, guid)
    local unitGUID = UnitGUID(unit)
    return not IsSecret(unitGUID) and unitGUID == guid
end

local inspectEvents = CreateFrame("Frame")
inspectEvents:SetScript("OnEvent", function(_, _, guid)
    if IsSecret(guid) or not guid or guid ~= pendingGUID then return end
    pendingGUID = nil

    local unit = UnitTokenFromGUID(guid)
    local ilvl = unit and C_PaperDollInfo.GetInspectItemLevel(unit)
    if not (InspectFrame and InspectFrame:IsShown()) then ClearInspectPlayer() end
    if IsSecret(ilvl) or not ilvl or ilvl <= 0 then return end

    local hadValue = ilvlCache[guid] ~= nil
    if not hadValue then
        ilvlCount = ilvlCount + 1
        if ilvlCount > CACHE_LIMIT then wipe(ilvlCache); wipe(ilvlTime); ilvlCount = 1 end
    end
    ilvlCache[guid], ilvlTime[guid] = floor(ilvl + 0.5), GetTime()

    -- Still hovering the same player: add it now.
    local _, ttUnit = GameTooltip:GetUnit()
    if not hadValue and TT.db.playerInfo and GameTooltip:IsShown()
        and not IsSecret(ttUnit) and ttUnit and SameGUID(ttUnit, guid) then
        AddLine(GameTooltip, "Item Level", ilvlCache[guid])
        GameTooltip:Show()
    end
end)

local function AddItemLevel(tooltip, unit, guid)
    if guid == UnitGUID("player") then
        local _, equipped = GetAverageItemLevel()
        AddLine(tooltip, "Item Level", floor(equipped + 0.5))
        return
    end
    local cached = ilvlCache[guid]
    if cached then AddLine(tooltip, "Item Level", cached) end
    if not cached or GetTime() - ilvlTime[guid] > ILVL_CACHE_TIME then RequestInspect(unit, guid) end
end

--------------------------------------------------------------------------------
-- M+ rating, read once per player per minute.
--------------------------------------------------------------------------------
local RATING_CACHE_TIME = 60 -- seconds
local ratingScore, ratingTime, ratingR, ratingG, ratingB = {}, {}, {}, {}, {}

local function AddMythicRating(tooltip, unit, guid)
    local now = GetTime()
    if not ratingTime[guid] or now - ratingTime[guid] > RATING_CACHE_TIME then
        local summary = C_PlayerInfo.GetPlayerMythicPlusRatingSummary(unit)
        local score = summary and summary.currentSeasonScore
        if IsSecret(score) or not score then score = 0 end
        if not ratingTime[guid] then
            ratingCount = ratingCount + 1
            if ratingCount > CACHE_LIMIT then
                wipe(ratingScore); wipe(ratingTime); wipe(ratingR); wipe(ratingG); wipe(ratingB)
                ratingCount = 1
            end
        end
        ratingScore[guid], ratingTime[guid] = score, now
        if score > 0 then
            local color = C_ChallengeMode.GetDungeonScoreRarityColor(score) or HIGHLIGHT_FONT_COLOR
            ratingR[guid], ratingG[guid], ratingB[guid] = color:GetRGB()
        end
    end
    local score = ratingScore[guid]
    if score <= 0 then return end
    AddLine(tooltip, "M+ Rating", score, ratingR[guid], ratingG[guid], ratingB[guid])
end

--------------------------------------------------------------------------------
-- Tooltip post-calls (options read live, secrets skipped).
--------------------------------------------------------------------------------
local function ColorName(unit)
    local _, class = UnitClass(unit)
    local color = not IsSecret(class) and class and RAID_CLASS_COLORS[class]
    local line = color and GameTooltipTextLeft1
    if line then line:SetTextColor(color.r, color.g, color.b) end
end

local function OnUnit(tooltip)
    local db = TT.db
    if tooltip ~= GameTooltip or not (db.playerInfo or db.style) then return end

    local _, unit = tooltip:GetUnit()
    if IsSecret(unit) or not unit then return end
    local isPlayer = UnitIsPlayer(unit)
    if IsSecret(isPlayer) or not isPlayer then return end
    if db.style then ColorName(unit) end

    if not db.playerInfo then return end
    local guid = UnitGUID(unit)
    if IsSecret(guid) or not guid then return end
    AddMythicRating(tooltip, unit, guid)
    AddItemLevel(tooltip, unit, guid)
end

local function IDLine(label)
    return function(tooltip, data)
        if not TT.db.showIDs or not data or not IsUsable(tooltip) then return end
        local id = data.id
        if not IsSecret(id) and id then AddLine(tooltip, label, id) end
    end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function TT:OnEnable()
    if self.db.style then
        -- Hidden, not reparented: no empty space is left.
        ns.Disable(GameTooltip.StatusBar or GameTooltipStatusBar)
    end

    local add, types = TooltipDataProcessor.AddTooltipPostCall, Enum.TooltipDataType
    add(types.Unit,  OnUnit)
    add(types.Item,  IDLine("Item ID"))
    add(types.Spell, IDLine("Spell ID"))
    inspectEvents:RegisterEvent("INSPECT_READY")
end
