--[[----------------------------------------------------------------------------
    PanzaUI - Party & Raid Frames
    Text style, server-less names and percentage-only health text for the
    compact party/raid frames. PanzaUI absorb texture and aggro border.
    Role icons: optional HD icons, and hidden icons shown again when the role
    becomes known (Blizzard misses it on reload).
------------------------------------------------------------------------------]]
local _, ns = ...
local IsSecret = ns.IsSecret

local GF = ns:RegisterModule("GroupFrames", {
    title = "Party & Raid Frames",
    defaults = {
        fontStyle   = true,
        percentText = true,
        hideServer  = true,
        hdRoleIcons = true,
        absorbTexture = true,
        aggroBorder   = true,
    },
    options = {
        { header = "Style" },
        { key = "fontStyle", label = "Outline + Slug text", tooltip = "Apply outline and slug rendering to names and status text (Dead, Offline, ...) on party and raid frames. Requires Reload UI." },
        { key = "percentText", label = "Percentage-only text", tooltip = "Show health as a plain white percentage (no % symbol), with one decimal below 100, on party and raid frames. Hidden at 0. Dead/Offline are kept. Uses Blizzard's health text setting (Edit Mode: anything but None). Requires Reload UI." },
        { header = "Features" },
        { key = "hdRoleIcons", label = "HD role icons", tooltip = "Use Blizzard's large, high-resolution role icons (like the dungeon finder ready popup) on party and raid frames. Requires Reload UI." },
        { key = "absorbTexture", label = "PanzaUI absorb texture", tooltip = "Show shields/absorbs on party and raid health bars with PanzaUI's own texture instead of Blizzard's striped one. Requires Reload UI." },
        { key = "aggroBorder",   label = "PanzaUI aggro border",   tooltip = "Replace the aggro (threat) border of party and raid frames with a thinner PanzaUI border, colored by threat like Blizzard's. Requires Reload UI." },
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

-- Role icons. Blizzard sets them only on a full frame update or on
-- PLAYER_ROLES_ASSIGNED: when the role isn't known yet at that moment (reload,
-- joining a group, roster changes) the icon stays hidden. Shortly after those
-- events, hidden icons of units with a known role are shown again. With
-- "HD role icons" Blizzard's large icons (GetIconForRole) replace the small
-- ones after each Blizzard update. Vehicle / main tank icons are left alone,
-- Blizzard's "Display role icon" setting is respected, secret roles skipped.
local ROLES = { TANK = true, HEALER = true, DAMAGER = true }
local hdRoles

local function KnownRole(frame)
    local unit = frame.unit
    if not unit or IsSecret(unit) or frame:IsForbidden() then return end
    local options = frame.optionTable
    if not (options and options.displayRoleIcon) then return end
    local role = UnitGroupRolesAssigned(unit)
    if not IsSecret(role) and ROLES[role] then return role end
end

local function SetRoleAtlas(icon, role)
    if hdRoles and GetIconForRole then
        icon:SetAtlas(GetIconForRole(role, false))
    else
        icon:SetAtlas(GetMicroIconForRole(role))
    end
end

-- After Blizzard's update: small role icon -> HD one.
local function UpdateRoleIcon(frame)
    local icon = frame.roleIcon
    if not (icon and icon:IsShown()) then return end
    local role = KnownRole(frame)
    if role and icon:GetAtlas() == GetMicroIconForRole(role) then SetRoleAtlas(icon, role) end
end

-- Hidden icon of a unit whose role is known now.
local function FixRoleIcon(frame)
    local icon = frame.roleIcon
    if not icon or icon:IsShown() then return end
    local role = KnownRole(frame)
    if not role then return end
    local size = icon:GetHeight() -- Blizzard keeps the height, width 1 when hidden
    if IsSecret(size) then return end
    SetRoleAtlas(icon, role)
    icon:SetSize(size, size)
    icon:Show()
end

local rolePending
local function FixRoleIcons()
    rolePending = nil
    ns.ForEachCompactFrame(FixRoleIcon)
end

local roleEvents = CreateFrame("Frame")
roleEvents:SetScript("OnEvent", function()
    if rolePending then return end
    rolePending = true
    C_Timer.After(1, FixRoleIcons) -- one pending check at a time
end)

-- Absorb fill and aggro border. Blizzard sets the absorb atlases in
-- DefaultCompactUnitFrameSetup (re-applied after it) and the aggro border in
-- the frame template; afterwards it only shows/hides and colors them, so our
-- textures keep Blizzard's sizing and threat colors. The aggro border is
-- 9-sliced: constant thickness whatever the frame size. Widget calls only.
local MEDIA = [[Interface\AddOns\PanzaUI\Media\Statusbar\]]
local useAbsorb, useAggro

local function StyleExtras(frame)
    if not frame or frame:IsForbidden() then return end
    if useAbsorb and frame.totalAbsorb then
        frame.totalAbsorb:SetTexture(MEDIA .. "PanzaUI_absorb.tga", "CLAMP", "CLAMP")
        frame.totalAbsorb:SetTexCoord(0, 1, 0, 1)
        if frame.totalAbsorbOverlay then frame.totalAbsorbOverlay:SetAlpha(0) end -- stripes
    end
    local aggro = useAggro and frame.aggroHighlight
    if aggro then
        aggro:SetTexture(MEDIA .. "PanzaUI_aggro.tga")
        aggro:SetTexCoord(0, 1, 0, 1)
        if aggro.SetTextureSliceMargins then
            aggro:SetTextureSliceMargins(16, 16, 16, 16)
            aggro:SetTextureSliceMode(Enum.UITextureSliceMode.Stretched)
        end
    end
end

function GF:OnEnable()
    useAbsorb, useAggro = self.db.absorbTexture, self.db.aggroBorder
    if useAbsorb or useAggro then
        ns.ForEachCompactFrame(StyleExtras)
        ns.Hook("DefaultCompactUnitFrameSetup", StyleExtras)
    end
    roleEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
    roleEvents:RegisterEvent("GROUP_ROSTER_UPDATE")
    roleEvents:RegisterEvent("PLAYER_ROLES_ASSIGNED")
    if self.db.hdRoleIcons then
        hdRoles = true
        ns.Hook("CompactUnitFrame_UpdateRoleIcon", UpdateRoleIcon)
        ns.ForEachCompactFrame(UpdateRoleIcon)
    end
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
