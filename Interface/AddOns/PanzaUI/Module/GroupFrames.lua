--[[----------------------------------------------------------------------------
    PanzaUI - Party & Raid Frames
    Text style and server-less names for the compact party/raid frames.
------------------------------------------------------------------------------]]
local _, ns = ...
local IsSecret = ns.IsSecret

local GF = ns:RegisterModule("GroupFrames", {
    title = "Party & Raid Frames",
    defaults = {
        fontStyle  = true,
        hideServer = true,
    },
    options = {
        { header = "Style" },
        { key = "fontStyle", label = "Outline + Slug text", tooltip = "Apply outline and slug rendering to names and status text (Dead, Offline, ...) on party and raid frames. Requires Reload UI." },
        { header = "Features" },
        { key = "hideServer", label = "Hide server name",  tooltip = "Show only the character name, without the server, on party and raid frames. Requires Reload UI." },
    },
})

-- Name + status text of one compact frame (member or pet).
local function StyleFrame(frame)
    if not frame then return end
    ns.StyleFont(frame.name)
    ns.StyleFont(frame.statusText)
end

-- Frames already created before login: party members, flat raid list and
-- raid groups (nil names are simply skipped).
local function StyleExisting()
    for i = 1, 5 do StyleFrame(_G["CompactPartyFrameMember" .. i]) end
    for i = 1, 40 do StyleFrame(_G["CompactRaidFrame" .. i]) end
    for g = 1, 8 do
        for m = 1, 5 do StyleFrame(_G["CompactRaidGroup" .. g .. "Member" .. m]) end
    end
    local title = CompactPartyFrame and CompactPartyFrame.title
    if title and title.GetFontString then ns.StyleFont(title:GetFontString()) end
end

-- Names without server: runs after Blizzard's CompactUnitFrame_UpdateName.
-- Only players from another server are touched (NPC followers and same-server
-- players keep Blizzard's text). The name is passed straight to SetText and
-- never inspected, so secret values are safe.
local function UpdateName(frame)
    if frame:IsForbidden() then return end
    local unit = frame.unit
    if not unit or IsSecret(unit) or unit:find("nameplate", 1, true) or not frame.name then return end
    local name, realm = UnitName(unit)
    if realm and not IsSecret(realm) and realm ~= "" then frame.name:SetText(name) end
end

function GF:OnEnable()
    if self.db.hideServer then ns.Hook("CompactUnitFrame_UpdateName", UpdateName) end
    if not self.db.fontStyle then return end
    -- Blizzard (re)applies fonts in these setup functions (new frames and
    -- option changes): restyle right after. Only widget calls, no fields
    -- written, secret sizes skipped (taint-safe).
    ns.Hook("DefaultCompactUnitFrameSetup", StyleFrame)
    ns.Hook("DefaultCompactMiniFrameSetup", StyleFrame)
    StyleExisting()
end
