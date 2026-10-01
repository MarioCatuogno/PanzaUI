--[[----------------------------------------------------------------------------
    PanzaUI - Party & Raid Frames
    Text style, server-less names and percentage-only health text for the
    compact party/raid frames.
------------------------------------------------------------------------------]]
local _, ns = ...
local IsSecret = ns.IsSecret

local GF = ns:RegisterModule("GroupFrames", {
    title = "Party & Raid Frames",
    defaults = {
        fontStyle   = true,
        percentText = true,
        hideServer  = true,
    },
    options = {
        { header = "Style" },
        { key = "fontStyle", label = "Outline + Slug text", tooltip = "Apply outline and slug rendering to names and status text (Dead, Offline, ...) on party and raid frames. Requires Reload UI." },
        { key = "percentText", label = "Percentage-only text", tooltip = "Show health as a plain white percentage (no % symbol), with one decimal below 100, on party and raid frames. Hidden at 0. Dead/Offline are kept. Uses Blizzard's health text setting (Edit Mode: anything but None). Requires Reload UI." },
        { header = "Features" },
        { key = "hideServer", label = "Hide server name",  tooltip = "Show only the character name on party and raid frames: no server, and no * mark on NPC followers. Requires Reload UI." },
    },
})

-- Name + status text of one compact frame (member or pet).
local function StyleFrame(frame)
    if not frame then return end
    ns.StyleFont(frame.name)
    ns.StyleFont(frame.statusText)
    ns.SyncPercentFont(frame.statusText) -- "100" twin of the percentage text
end

-- Frames already created before login.
local function StyleExisting()
    ns.ForEachCompactFrame(StyleFrame)
    local title = CompactPartyFrame and CompactPartyFrame.title
    if title and title.GetFontString then ns.StyleFont(title:GetFontString()) end
end

-- Clean names: runs after Blizzard's CompactUnitFrame_UpdateName. Shows only
-- the character name: no server for players from another server, no "*" mark
-- Blizzard puts on NPC followers (follower dungeons, delves). Skipped when the
-- name is a secret value (it can't be inspected then).
local function UpdateName(frame)
    if frame:IsForbidden() then return end
    local unit = frame.unit
    if not unit or IsSecret(unit) or unit:find("nameplate", 1, true) or not frame.name then return end
    local name = UnitName(unit)
    if not name or IsSecret(name) then return end
    frame.name:SetText((name:gsub("^%*+%s*", "")))
end

-- Percentage-only health text: runs after Blizzard's
-- CompactUnitFrame_UpdateStatusText, only where Blizzard shows a health text
-- (its Edit Mode setting decides). Dead/Offline/Ghost texts are left alone.
-- Nameplates (same function) are skipped. Values go straight to the text.
local function UpdateStatusText(frame)
    if frame:IsForbidden() then return end
    local text, unit = frame.statusText, frame.displayedUnit or frame.unit
    if not (text and unit) or IsSecret(unit) or unit:find("nameplate", 1, true) then return end
    if not text:IsShown() then ns.HidePercentFull(text) return end
    local connected, dead = UnitIsConnected(unit), UnitIsDeadOrGhost(unit)
    if IsSecret(connected) or IsSecret(dead) or not connected or dead then
        text:SetAlpha(1) -- status text (Dead, Offline...) always visible
        text:SetTextColor(GameFontDisable:GetTextColor()) -- Blizzard's grey
        ns.HidePercentFull(text)
        return
    end
    text:SetTextColor(1, 1, 1) -- white, like the rest of the UI text
    ns.SetPercentText(text, unit, false)
end

function GF:OnEnable()
    if self.db.hideServer then ns.Hook("CompactUnitFrame_UpdateName", UpdateName) end
    if self.db.percentText and CurveConstants and UnitHealthPercent then
        ns.Hook("CompactUnitFrame_UpdateStatusText", UpdateStatusText)
        ns.ForEachCompactFrame(UpdateStatusText)
    end
    if not self.db.fontStyle then return end
    -- Blizzard (re)applies fonts in these setup functions (new frames and
    -- option changes): restyle right after. Only widget calls, no fields
    -- written, secret sizes skipped (taint-safe).
    ns.Hook("DefaultCompactUnitFrameSetup", StyleFrame)
    ns.Hook("DefaultCompactMiniFrameSetup", StyleFrame)
    StyleExisting()
end
