--[[----------------------------------------------------------------------------
    PanzaUI - Party & Raid Frames
    Text style for the compact party/raid frames.
------------------------------------------------------------------------------]]
local _, ns = ...

local GF = ns:RegisterModule("GroupFrames", {
    title = "Party & Raid Frames",
    defaults = {
        fontStyle = true,
    },
    options = {
        { header = "Style" },
        { key = "fontStyle", label = "Outline + Slug text", tooltip = "Apply outline and slug rendering to names and status text (Dead, Offline, ...) on party and raid frames. Requires Reload UI." },
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

function GF:OnEnable()
    if not self.db.fontStyle then return end
    -- Blizzard (re)applies fonts in these setup functions (new frames and
    -- option changes): restyle right after. Only widget calls, no fields
    -- written, secret sizes skipped (taint-safe).
    ns.Hook("DefaultCompactUnitFrameSetup", StyleFrame)
    ns.Hook("DefaultCompactMiniFrameSetup", StyleFrame)
    StyleExisting()
end
