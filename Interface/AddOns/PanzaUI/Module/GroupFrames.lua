--[[----------------------------------------------------------------------------
    PanzaUI - Party & Raid Frames
    Text style and bar texture for the compact party/raid frames.
------------------------------------------------------------------------------]]
local _, ns = ...

local GF = ns:RegisterModule("GroupFrames", {
    title = "Party & Raid Frames",
    defaults = {
        fontStyle  = true,
        barTexture = true,
    },
    options = {
        { header = "Style" },
        { key = "fontStyle",  label = "Outline + Slug text", tooltip = "Apply outline and slug rendering to names and status text (Dead, Offline, ...) on party and raid frames. Requires Reload UI." },
        { key = "barTexture", label = "Player frame texture", tooltip = "Use the Player frame health bar texture for health and power bars on party and raid frames. Requires Reload UI." },
    },
})

-- Player frame health bar atlas, desaturated so Blizzard's class/power
-- colors show cleanly on it.
local BAR_TEXTURE = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Health"

local function SetBarTexture(bar)
    if not bar then return end
    bar:SetStatusBarTexture(BAR_TEXTURE)
    local texture = bar:GetStatusBarTexture()
    if texture then texture:SetDesaturated(true) end
end

-- One compact frame (member or pet). Only widget calls, no fields written,
-- secret font sizes skipped (taint-safe).
local function StyleFrame(frame)
    if not frame then return end
    local db = GF.db
    if db.fontStyle then
        ns.StyleFont(frame.name)
        ns.StyleFont(frame.statusText)
    end
    if db.barTexture then
        SetBarTexture(frame.healthBar)
        SetBarTexture(frame.powerBar)
    end
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
    if GF.db.fontStyle and title and title.GetFontString then ns.StyleFont(title:GetFontString()) end
end

function GF:OnEnable()
    if not (self.db.fontStyle or self.db.barTexture) then return end
    -- Blizzard (re)applies fonts and bar textures in these setup functions
    -- (new frames and option changes): restyle right after.
    ns.Hook("DefaultCompactUnitFrameSetup", StyleFrame)
    ns.Hook("DefaultCompactMiniFrameSetup", StyleFrame)
    StyleExisting()
end
