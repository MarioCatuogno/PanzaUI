--[[----------------------------------------------------------------------------
    PanzaUI - Tooltips
    Tooltip style, player info, mounts and IDs.
------------------------------------------------------------------------------]]
local _, ns = ...
local IsSecret = ns.IsSecret

local TT = ns:RegisterModule("Tooltips", {
    title = "Tooltips",
    defaults = {
        style      = true,
        playerInfo = true,
        playerMount = true,
        showIDs    = true,
    },
    options = {
        { key = "style", label = "Refined style", reload = true,
          tooltip = "Polish the look of the unit tooltips.",
          bullets = { "No health bar", "Class and faction colors" } },
        { key = "playerInfo", label = "Player info",
          tooltip = "Show the item level and Mythic+ rating of players." },
        { key = "playerMount", label = "Player mount",
          tooltip = "Show the mount of players." },
        { key = "showIDs", label = "Show IDs",
          tooltip = "Show the ID of items and spells." },
    },
})

-- Converts the saved values of older versions.
function TT:Migrate(db)
    ns.MergeOptions(db, "style", db, "hideHealthBar", "classColorNames")
    ns.MergeOptions(db, "playerInfo", db, "showMythicRating", "showItemLevel")
end

local ILVL_CACHE_TIME  = 300 -- seconds
local INSPECT_THROTTLE = 1.5 -- seconds between inspects

-- Caches per player (GUID), emptied when full.
local ilvlCache, ilvlTime = {}, {}
local CACHE_LIMIT, ilvlCount, ratingCount = 200, 0, 0

local lastInspect, pendingGUID = 0, nil
local ilvlLine -- GameTooltip line of the hovered player's item level

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
    return true
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

    -- Still hovering the same player: its line is filled in place.
    local _, ttUnit = GameTooltip:GetUnit()
    local line = ilvlLine and _G["GameTooltipTextRight" .. ilvlLine]
    if line and GameTooltip:IsShown() and not IsSecret(ttUnit) and ttUnit and SameGUID(ttUnit, guid) then
        line:SetText(ilvlCache[guid])
        GameTooltip:Show()
    end
end)

-- Not cached yet: a placeholder keeps the line in place until the inspect.
local function AddItemLevel(tooltip, unit, guid)
    if guid == UnitGUID("player") then
        local _, equipped = GetAverageItemLevel()
        AddLine(tooltip, "Item Level", floor(equipped + 0.5))
        return
    end
    local cached = ilvlCache[guid]
    local requested = (not cached or GetTime() - ilvlTime[guid] > ILVL_CACHE_TIME) and RequestInspect(unit, guid)
    if not (cached or requested) then return end
    AddLine(tooltip, "Item Level", cached or "...")
    ilvlLine = tooltip:NumLines()
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
-- Mount: found among the player's buffs, with its icon. Skipped in combat
-- and while auras are secret (eg. in instances): reading them would error.
--------------------------------------------------------------------------------
local MOUNT_TEXT = "|T%d:0|t %s"
local GetAura, GetMountFromSpell = C_UnitAuras.GetAuraDataByIndex, C_MountJournal.GetMountFromSpell
local AurasSecret = C_Secrets and C_Secrets.ShouldAurasBeSecret

local function MountText(unit)
    if InCombatLockdown() or (AurasSecret and AurasSecret()) then return end
    for i = 1, 40 do
        local aura = GetAura(unit, i, "HELPFUL")
        if IsSecret(aura) or not aura then return end
        local spellID = aura.spellId
        if IsSecret(spellID) then return end
        local mountID = spellID and GetMountFromSpell(spellID)
        if mountID then
            local name, _, icon = C_MountJournal.GetMountInfoByID(mountID)
            return name and MOUNT_TEXT:format(icon, name)
        end
    end
end

local function AddMount(tooltip, unit)
    local text = MountText(unit)
    if text then AddLine(tooltip, "Mount", text) end
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

-- Faction line of players, in the faction color.
local FACTIONS = {
    Horde    = { text = FACTION_HORDE,    color = PLAYER_FACTION_COLOR_HORDE    or CreateColor(0.90, 0.10, 0.10) },
    Alliance = { text = FACTION_ALLIANCE, color = PLAYER_FACTION_COLOR_ALLIANCE or CreateColor(0.20, 0.50, 1.00) },
}

local function ColorFaction(tooltip, unit)
    local group = UnitFactionGroup(unit)
    local faction = not IsSecret(group) and group and FACTIONS[group]
    if not (faction and faction.text) then return end
    for i = 2, tooltip:NumLines() do
        local line = _G["GameTooltipTextLeft" .. i]
        local text = line and line:GetText()
        if not IsSecret(text) and text == faction.text then
            line:SetTextColor(faction.color:GetRGB())
            return
        end
    end
end

local function OnUnit(tooltip)
    local db = TT.db
    if tooltip ~= GameTooltip or not (db.playerInfo or db.style or db.playerMount) then return end

    local _, unit = tooltip:GetUnit()
    if IsSecret(unit) or not unit then return end
    local isPlayer = UnitIsPlayer(unit)
    if IsSecret(isPlayer) or not isPlayer then return end
    if db.style then
        ColorName(unit)
        ColorFaction(tooltip, unit)
    end

    -- Fixed order: Item Level, M+ Rating, Mount.
    ilvlLine = nil
    if db.playerInfo then
        local guid = UnitGUID(unit)
        if not IsSecret(guid) and guid then
            AddItemLevel(tooltip, unit, guid)
            AddMythicRating(tooltip, unit, guid)
        end
    end
    if db.playerMount then AddMount(tooltip, unit) end
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
