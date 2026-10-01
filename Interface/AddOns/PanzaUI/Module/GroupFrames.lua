--[[----------------------------------------------------------------------------
    PanzaUI - Party & Raid Frames
    Refined style (outlined text, clean names, health as a percentage),
    refined overlays (absorb, heal prediction and aggro border textures, no
    over-absorb glow) and HD role icons (also on the Player frame) for the
    compact party/raid frames.
    Always on: hidden role icons shown again when the role becomes known
    (Blizzard misses it on reload), group border fitted at the bottom.
------------------------------------------------------------------------------]]
local _, ns = ...
local IsSecret = ns.IsSecret

local GF = ns:RegisterModule("GroupFrames", {
    title = "Party & Raid Frames",
    defaults = {
        style       = true,
        overlays    = true,
        hdRoleIcons = true,
    },
    options = {
        { key = "style", label = "Refined style", reload = true,
          tooltip = "Polish the look of party and raid frames.",
          bullets = { "Outlined text", "Names without server", "Health as a simple percentage" } },
        { key = "overlays", label = "Refined overlays", reload = true,
          tooltip = "Use cleaner textures on party and raid health bars.",
          bullets = { "Shields and incoming heals", "Aggro border", "No over-absorb glow" } },
        { key = "hdRoleIcons", label = "HD role icons", reload = true,
          tooltip = "Use Blizzard's high-resolution role icons.",
          bullets = { "Party and raid frames", "Player frame" } },
    },
})

function GF:Migrate(db)
    ns.MergeOptions(db, "style", db, "fontStyle", "percentText", "hideServer")
    ns.MergeOptions(db, "overlays", db, "absorbTexture", "aggroBorder", "healPredTexture", "hideOverAbsorb")
end

--------------------------------------------------------------------------------
-- Refined style: outlined name and status text, clean names, percentage text.
--------------------------------------------------------------------------------

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
    if name:byte(1) == 42 then name = name:gsub("^%*+%s*", "") end -- "*": no string work otherwise
    frame.name:SetText(name)
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

--------------------------------------------------------------------------------
-- Role icons. Blizzard sets them only on a full frame update or on
-- PLAYER_ROLES_ASSIGNED: when the role isn't known yet at that moment (reload,
-- joining a group, roster changes) the icon stays hidden, and after a reload
-- it can be shown at 0x0 size. Shortly after those events, hidden or 0-sized
-- icons of units with a known role are fixed. With
-- "HD role icons" Blizzard's large icons (GetIconForRole) replace the small
-- ones after each Blizzard update. Vehicle / main tank icons are left alone,
-- Blizzard's "Display role icon" setting is respected, secret roles skipped.
--------------------------------------------------------------------------------
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

-- Player frame role icon (PlayerFrame_UpdateRolesAssigned sets a "tiny"
-- atlas per role): replaced with the HD one right after.
local TINY_ROLE_ATLASES = {
    ["roleicon-tiny-tank"]   = "TANK",
    ["roleicon-tiny-healer"] = "HEALER",
    ["roleicon-tiny-dps"]    = "DAMAGER",
}

local function UpdatePlayerRoleIcon()
    local icon = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.RoleIcon
    if not (icon and icon:IsShown() and GetIconForRole) then return end
    local role = TINY_ROLE_ATLASES[icon:GetAtlas()]
    if role then icon:SetAtlas(GetIconForRole(role, false), TextureKitConstants.IgnoreAtlasSize) end
end

-- Icon size: Blizzard reuses the icon's current height (GetHeight). Right
-- after a reload that can still be 0 (layout not done yet), so the icon is
-- "shown" at 0x0 and stays invisible until the frame is set up again. The
-- name's font size is used then (the icon is as tall as the name).
local function RoleIconSize(frame, icon)
    local size = icon:GetHeight()
    if not IsSecret(size) and size >= 2 then return size end
    local _, fontSize = frame.name and frame.name:GetFont()
    if fontSize and not IsSecret(fontSize) and fontSize >= 2 then return fontSize end
    return 12
end

-- Hidden (or 0-sized) icon of a unit whose role is known now.
local function FixRoleIcon(frame)
    local icon = frame.roleIcon
    if not icon then return end
    if icon:IsShown() then
        local w, h = icon:GetSize()
        if IsSecret(w) or IsSecret(h) or (w >= 2 and h >= 2) then return end
    end
    local role = KnownRole(frame)
    if not role then return end
    local size = RoleIconSize(frame, icon)
    if not icon:IsShown() then SetRoleAtlas(icon, role) end
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

--------------------------------------------------------------------------------
-- Refined overlays: absorb fill, heal prediction, aggro border, over-absorb
-- glow. Blizzard sets the absorb atlases in DefaultCompactUnitFrameSetup
-- (re-applied after it) and the aggro border in the frame template;
-- afterwards it only shows/hides and colors them, so our textures keep
-- Blizzard's sizing and threat colors. The aggro border is 9-sliced:
-- constant thickness whatever the frame size. Widget calls only.
--------------------------------------------------------------------------------
local MEDIA = [[Interface\AddOns\PanzaUI\Media\Statusbar\]]
local HEAL_PRED = MEDIA .. "PanzaUI_general.tga"

-- Heal prediction: Blizzard uses plain color fills (set in the setup): our
-- texture tinted with the same color (alpha included).
local function StyleHealPrediction(bar, color)
    if not (bar and color) then return end
    bar:SetTexture(HEAL_PRED)
    bar:SetTexCoord(0, 1, 0, 1)
    bar:SetVertexColor(color:GetRGBA())
end

local function StyleOverlays(frame)
    if not frame or frame:IsForbidden() then return end
    if frame.totalAbsorb then
        frame.totalAbsorb:SetTexture(MEDIA .. "PanzaUI_absorb.tga", "CLAMP", "CLAMP")
        frame.totalAbsorb:SetTexCoord(0, 1, 0, 1)
        if frame.totalAbsorbOverlay then frame.totalAbsorbOverlay:SetAlpha(0) end -- stripes
    end
    StyleHealPrediction(frame.myHealPrediction, CUF_MY_HEAL_PREDICTION_COLOR)
    StyleHealPrediction(frame.otherHealPrediction, CUF_OTHER_HEAL_PREDICTION_COLOR)
    -- Over-absorb glow: Blizzard only shows/hides it, alpha 0 keeps it hidden.
    if frame.overAbsorbGlow then frame.overAbsorbGlow:SetAlpha(0) end
    local aggro = frame.aggroHighlight
    if aggro then
        aggro:SetTexture(MEDIA .. "PanzaUI_aggro.tga")
        aggro:SetTexCoord(0, 1, 0, 1)
        if aggro.SetTextureSliceMargins then
            aggro:SetTextureSliceMargins(16, 16, 16, 16)
            aggro:SetTextureSliceMode(Enum.UITextureSliceMode.Stretched)
        end
    end
end

--------------------------------------------------------------------------------
-- Group border (party frame and raid groups, Edit Mode "Display Border"):
-- Blizzard's panel reaches 5 px below the last member, leaving a visible gap
-- at the bottom. Its texture (not the frame: combat-safe) is pulled up 0.6 px
-- (more uncovers the bottom corners of the last member).
--------------------------------------------------------------------------------
local function FitGroupBorder(group)
    local border = group and group.borderFrame
    local bg = border and border.Background
    if not bg then return end
    bg:ClearAllPoints()
    bg:SetPoint("TOPLEFT", border, "TOPLEFT")
    bg:SetPoint("BOTTOMRIGHT", border, "BOTTOMRIGHT", 0, 0.6)
end

local function SetupGroupBorders()
    FitGroupBorder(CompactPartyFrame)
    for i = 1, 8 do FitGroupBorder(_G["CompactRaidGroup" .. i]) end
    -- Raid groups are created on demand.
    ns.Hook("CompactRaidGroup_GenerateForGroup", function(index) FitGroupBorder(_G["CompactRaidGroup" .. tostring(index)]) end)
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function GF:OnEnable()
    local db = self.db
    SetupGroupBorders()

    roleEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
    roleEvents:RegisterEvent("GROUP_ROSTER_UPDATE")
    roleEvents:RegisterEvent("PLAYER_ROLES_ASSIGNED")
    if db.hdRoleIcons then
        hdRoles = true
        ns.Hook("CompactUnitFrame_UpdateRoleIcon", UpdateRoleIcon)
        ns.ForEachCompactFrame(UpdateRoleIcon)
        ns.Hook("PlayerFrame_UpdateRolesAssigned", UpdatePlayerRoleIcon)
        UpdatePlayerRoleIcon()
    end

    if db.overlays then
        ns.ForEachCompactFrame(StyleOverlays)
        ns.Hook("DefaultCompactUnitFrameSetup", StyleOverlays)
    end

    if not db.style then return end
    ns.Hook("CompactUnitFrame_UpdateName", UpdateName)
    if CurveConstants and UnitHealthPercent then
        ns.Hook("CompactUnitFrame_UpdateStatusText", UpdateStatusText)
        ns.ForEachCompactFrame(UpdateStatusText)
    end
    -- Blizzard (re)applies fonts in these setup functions (new frames and
    -- option changes): restyle right after. Only widget calls, no fields
    -- written, secret sizes skipped (taint-safe).
    ns.Hook("DefaultCompactUnitFrameSetup", StyleFrame)
    ns.Hook("DefaultCompactMiniFrameSetup", StyleFrame)
    StyleExisting()
end
