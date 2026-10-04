--[[----------------------------------------------------------------------------
    PanzaUI - Various
    Other addons' styling and quality of life features.
------------------------------------------------------------------------------]]
local _, ns = ...

-- Saved variables key of the old Miscellaneous module.
local Misc = ns:RegisterModule("Miscellaneous", {
    title = "Various",
    defaults = {
        platynatorStyle = true,
        bigwigsStyle    = true,
        fastLoot        = true,
        cursorRing      = 0, -- off
        fastDelete      = true,
        waypoints       = true,
        hideNotices     = true,
    },
    options = {
        { header = "Other Addons" },
        { key = "platynatorStyle", label = "Platynator: Refined style", reload = true,
          tooltip = "Polish the look of the Platynator nameplates." },
        { key = "bigwigsStyle", label = "BigWigs: Refined style", reload = true,
          tooltip = "Polish the look of the BigWigs bars." },
        { header = "Quality of Life" },
        { key = "fastLoot", label = "Fast auto-loot",
          tooltip = "Loot everything at once when auto-loot is on." },
        { key = "fastDelete", label = "Fast item delete",
          tooltip = "Type \"DELETE\" for you when deleting an item." },
        { key = "hideNotices", label = "Hide system notices",
          tooltip = "Hide the alerts on the micro menu buttons.",
          bullets = { "Help tips like unspent talent points", "Flashing buttons" } },
        { key = "waypoints", label = "Waypoint command", reload = true,
          tooltip = "Set a map waypoint with /way and coordinates.",
          bullets = { "/way 45.2 61.8 on the current map", "/way #2371 45.2 61.8 on another map", "/way clear removes it", "Off when TomTom is enabled" } },
        { key = "cursorRing", label = "Cursor ring",
          tooltip = "Show a ring in your class color around the cursor.",
          dropdown = {
              { 0, "Off", "Never shown." },
              { 1, "Always", "Always shown." },
              { 2, "In combat", "Shown in combat." },
              { 3, "In combat (group)", "Shown in combat while in a group." },
          } },
    },
})

--------------------------------------------------------------------------------
-- Platynator aura icons: styled while Platynator builds each button, before
-- secret aura data locks it (found through a post-hook of CreateFrame).
--------------------------------------------------------------------------------
local AURA_KINDS = { "buffs", "debuffs", "crowdControl" }
local styledAuras = {}

-- Styles a button once its icon, cooldown and border exist.
local function StyleAuraFrame(frame)
    if styledAuras[frame] or not (frame.Icon and frame.Cooldown and frame.Border) then return end
    if not ns.StyleIcon(frame.Icon, frame, true) then return end
    styledAuras[frame] = true
    ns.RoundSwipe(frame.Cooldown)
    frame.Border:SetAlpha(0)
end

-- The button being built is the last one of its container.
local function IsNewAuraButton(button, container)
    if not container or container:IsForbidden() then return false end
    local list = container.frames
    return type(list) == "table" and list[#list] == button
end

local function CheckAuraButton(button)
    if button:IsForbidden() or not button.Border or styledAuras[button] then return end
    local container = button:GetParent()
    if IsNewAuraButton(button, container) or (container and IsNewAuraButton(button, container:GetParent())) then
        StyleAuraFrame(button)
    end
end

-- Forbidden parents can't be indexed: the check runs protected.
local function OnCreateFrame(frameType, name, parent, template)
    if frameType ~= "Frame" or name ~= nil or template ~= nil or type(parent) ~= "table" then return end
    pcall(CheckAuraButton, parent)
end

-- Buttons made before the hook (e.g. after a reload).
local function StyleExistingAuras(manager)
    for _, kind in ipairs(AURA_KINDS) do
        local list = manager[kind] and manager[kind].frames
        if type(list) == "table" then
            for _, frame in ipairs(list) do
                if not frame:IsForbidden() then StyleAuraFrame(frame) end
            end
        end
    end
end

--------------------------------------------------------------------------------
-- Platynator cast icon: border and mask follow the marker kind.
--------------------------------------------------------------------------------
local markerBorder, markerMask, markerMasked = {}, {}, {}

local function UpdateMarker(marker)
    local isCast = marker.details ~= nil and marker.details.kind == "castIcon"
    local icon = marker.marker
    if isCast and not markerBorder[marker] then
        markerBorder[marker], markerMask[marker] = ns.StyleIcon(icon, marker)
        markerMasked[marker] = true
    elseif markerBorder[marker] then
        markerBorder[marker]:SetShown(isCast)
        if isCast ~= markerMasked[marker] then
            if isCast then icon:AddMaskTexture(markerMask[marker]) else icon:RemoveMaskTexture(markerMask[marker]) end
            markerMasked[marker] = isCast
        end
    end
    if isCast and marker.background then marker.background:SetAlpha(0) end
end

local hookedMarkers = {}

local function HookMarkers(display)
    local widgets = display.widgets
    if not widgets then return end
    for _, widget in ipairs(widgets) do
        if widget.marker and widget.Init and not hookedMarkers[widget] then
            hookedMarkers[widget] = true
            hooksecurefunc(widget, "Init", UpdateMarker)
            UpdateMarker(widget)
        end
    end
end

--------------------------------------------------------------------------------
-- Displays: found among the nameplate children, once each.
--------------------------------------------------------------------------------
local pendingUnits, knownDisplays = {}, {}

local function RegisterDisplays(...)
    for i = 1, select("#", ...) do
        local display = select(i, ...)
        if not knownDisplays[display] and not display:IsForbidden() and display.AurasManager then
            knownDisplays[display] = true
            StyleExistingAuras(display.AurasManager)
        end
        if knownDisplays[display] then HookMarkers(display) end
    end
end

local function UpdatePending()
    for unit in pairs(pendingUnits) do
        pendingUnits[unit] = nil
        local plate = C_NamePlate.GetNamePlateForUnit(unit)
        if plate and not plate:IsForbidden() then RegisterDisplays(plate:GetChildren()) end
    end
end

local events = CreateFrame("Frame")
events:SetScript("OnEvent", function(_, _, unit)
    if ns.IsSecret(unit) or not unit then return end
    pendingUnits[unit] = true
    ns.Defer(UpdatePending)
end)

local function SetupPlatynator()
    hooksecurefunc("CreateFrame", OnCreateFrame)
    events:RegisterEvent("NAME_PLATE_UNIT_ADDED")
    for _, plate in ipairs(C_NamePlate.GetNamePlates()) do
        if not plate:IsForbidden() then RegisterDisplays(plate:GetChildren()) end
    end
end

--------------------------------------------------------------------------------
-- Platynator border "PanzaUI - Nameplates": an HD take on Blizzard Midnight,
-- 4x the size of Platynator's (so 1/4 of its scale), always listed.
--------------------------------------------------------------------------------
local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)
if LSM then
    local NAME, SIZE = "PanzaUI - Nameplates", 136
    local margin, maskMargin = SIZE * 0.35, 8 * 0.49
    LSM:Register("nineslice", NAME, {
        file = [[Interface\AddOns\PanzaUI\Media\Borders\PanzaUI_nameplates.tga]],
        previewWidth = SIZE, previewHeight = SIZE,
        margins = { left = margin, right = margin, top = margin, bottom = margin },
        padding = { left = 6, right = 6, top = 6, bottom = 6 },
        scaleModifier = 0.1,
        mode = Enum.UITextureSliceMode.Stretched,
    })
    LSM:Register("ninesliceborder", NAME, {
        nineslice = NAME,
        mask = {
            file = [[Interface\Buttons\WHITE8X8]],
            margins = { left = maskMargin, right = maskMargin, top = maskMargin, bottom = maskMargin },
        },
    })
end

--------------------------------------------------------------------------------
-- Fast auto-loot: every slot looted at once (repeats skipped).
--------------------------------------------------------------------------------
local LOOT_LOCK = 0.3 -- seconds
local lastLoot = 0
local lootEvents = CreateFrame("Frame")

lootEvents:SetScript("OnEvent", function()
    local now = GetTime()
    if now - lastLoot < LOOT_LOCK then return end
    if C_CVar.GetCVarBool("autoLootDefault") == IsModifiedClick("AUTOLOOTTOGGLE") then return end
    lastLoot = now
    for slot = GetNumLootItems(), 1, -1 do LootSlot(slot) end
end)

local function SetFastLoot(on)
    if on then
        lootEvents:RegisterEvent("LOOT_READY")
    else
        lootEvents:UnregisterAllEvents()
    end
end

--------------------------------------------------------------------------------
-- Cursor ring: class colored ring following the cursor (OnUpdate only
-- while shown).
--------------------------------------------------------------------------------
local RING = { OFF = 0, ALWAYS = 1, COMBAT = 2, GROUP = 3 }
local RING_TEXTURE = [[Interface\AddOns\PanzaUI\Media\Icons\PanzaUI_ring.tga]]
local RING_SIZE = 48
local ring, ringCombat

local function RingVisible(mode)
    if mode == RING.ALWAYS then return true end
    if mode == RING.COMBAT then return ringCombat end
    if mode == RING.GROUP then return ringCombat and IsInGroup() end
    return false
end

local function UpdateRing()
    if ring then ring:SetShown(RingVisible(Misc.db.cursorRing)) end
end

-- Moved only when the cursor moved.
local lastX, lastY
local function FollowCursor(self)
    local x, y = GetCursorPosition()
    if x == lastX and y == lastY then return end
    lastX, lastY = x, y
    local scale = self:GetEffectiveScale()
    self:ClearAllPoints()
    self:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x / scale, y / scale)
end

local ringEvents = CreateFrame("Frame")
ringEvents:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_REGEN_DISABLED" then
        ringCombat = true
    elseif event == "PLAYER_REGEN_ENABLED" then
        ringCombat = false
    end
    UpdateRing()
end)

local function SetCursorRing(mode)
    if mode == RING.OFF then
        ringEvents:UnregisterAllEvents()
        if ring then ring:Hide() end
        return
    end
    if not ring then
        ring = CreateFrame("Frame", nil, UIParent)
        ring:SetFrameStrata("TOOLTIP")
        ring:SetSize(RING_SIZE, RING_SIZE)
        ring:EnableMouse(false)
        local tex = ring:CreateTexture(nil, "OVERLAY")
        tex:SetAllPoints()
        tex:SetTexture(RING_TEXTURE)
        local color = RAID_CLASS_COLORS[select(2, UnitClass("player"))] or HIGHLIGHT_FONT_COLOR
        tex:SetVertexColor(color.r, color.g, color.b)
        ring:SetScript("OnUpdate", FollowCursor)
        ring:Hide()
    end
    ringEvents:RegisterEvent("PLAYER_REGEN_DISABLED")
    ringEvents:RegisterEvent("PLAYER_REGEN_ENABLED")
    ringEvents:RegisterEvent("GROUP_ROSTER_UPDATE")
    ringCombat = InCombatLockdown()
    UpdateRing()
end

--------------------------------------------------------------------------------
-- Fast item delete: the confirmation text is filled in when Blizzard's delete
-- popup opens (post-hook, option read live). The player still clicks Yes.
--------------------------------------------------------------------------------
local DELETE_POPUPS = { DELETE_GOOD_ITEM = true, DELETE_GOOD_QUEST_ITEM = true }

local function FillDeleteText(which)
    if not (Misc.db.fastDelete and DELETE_POPUPS[which]) then return end
    local popup = StaticPopup_FindVisible and StaticPopup_FindVisible(which)
    if not popup then return end
    local editBox = (popup.GetEditBox and popup:GetEditBox()) or popup.editBox
    if editBox then editBox:SetText(DELETE_ITEM_CONFIRM_STRING) end
end

--------------------------------------------------------------------------------
-- Waypoint command: /way [#mapID] x y, set as Blizzard's own map pin and
-- tracked on screen. Not registered when TomTom provides /way.
--------------------------------------------------------------------------------
local function SetWaypoint(msg)
    msg = (msg or ""):gsub(",", " ")
    if msg:lower():match("^%s*clear") then
        C_Map.ClearUserWaypoint()
        ns.Print("waypoint cleared.")
        return
    end
    local mapID, x, y = msg:match("^%s*#(%d+)%s+([%d%.]+)%s+([%d%.]+)")
    if not mapID then
        x, y = msg:match("^%s*([%d%.]+)%s+([%d%.]+)")
        mapID = C_Map.GetBestMapForUnit("player")
    end
    mapID, x, y = tonumber(mapID), tonumber(x), tonumber(y)
    if not (mapID and x and y and x <= 100 and y <= 100) then
        ns.Print("usage: /way [#mapID] x y, or /way clear.")
        return
    end
    if not C_Map.CanSetUserWaypointOnMap(mapID) then
        ns.Print("waypoints can't be set on this map.")
        return
    end
    C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(mapID, x / 100, y / 100))
    C_SuperTrack.SetSuperTrackedUserWaypoint(true)
    local info = C_Map.GetMapInfo(mapID)
    ns.Print(("waypoint set at %.1f, %.1f%s."):format(x, y, info and (" in " .. info.name) or ""))
end

local function SetupWaypoints()
    if C_AddOns.IsAddOnLoaded("TomTom") or not (C_Map and C_Map.SetUserWaypoint) then return end
    SLASH_PANZAUI_WAY1 = "/way"
    SlashCmdList.PANZAUI_WAY = SetWaypoint
end

--------------------------------------------------------------------------------
-- System notices: micro menu alerts (help tips on or pointing at a micro
-- button, or with a known alert text) closed as soon as they are shown,
-- their button flash stopped, and the ones already open closed at login.
-- Post-hooks, option read live.
--------------------------------------------------------------------------------
local NOTICE_TEXTS = {}
for _, key in ipairs({ "TALENT_MICRO_BUTTON_UNSPENT_TALENTS", "TALENT_MICRO_BUTTON_UNSPENT_PVP_TALENTS",
                       "PLAYER_SPELLS_MICRO_BUTTON_UNSPENT_TALENTS" }) do
    if type(_G[key]) == "string" then NOTICE_TEXTS[_G[key]] = true end
end

local function IsMicroButton(frame)
    if type(frame) ~= "table" or not frame.GetName or frame:IsForbidden() then return false end
    local name = frame:GetName()
    if name and name:find("MicroButton", 1, true) then return true end
    local parent = frame:GetParent()
    return parent ~= nil and (parent == MicroMenu or parent == MicroMenuContainer)
end

local function IsNotice(parent, info, relativeRegion)
    local text = info and info.text
    if type(text) == "string" and NOTICE_TEXTS[text] then return true end
    return IsMicroButton(parent) or IsMicroButton(relativeRegion)
end

local function HideNotice(helpTip, parent, info, relativeRegion)
    if Misc.db.hideNotices and info and info.text and IsNotice(parent, info, relativeRegion) then
        helpTip:Hide(parent, info.text)
    end
end

local function StopMicroPulse(button)
    if Misc.db.hideNotices and MicroButtonPulseStop and IsMicroButton(button) then MicroButtonPulseStop(button) end
end

-- Help tips already open (Blizzard's pool): closed when they are notices.
local function CloseOpenNotices()
    local pool = Misc.db.hideNotices and HelpTip and HelpTip.framePool
    local active = pool and pool.activeObjects
    if not active then return end
    for frame in pairs(active) do
        if IsNotice(frame.owner or frame:GetParent(), frame.info, frame.relativeRegion) then frame:Hide() end
    end
end

local function SetupNotices()
    if HelpTip then ns.Hook(HelpTip, "Show", HideNotice) end
    ns.Hook("MicroButtonPulse", StopMicroPulse)
    CloseOpenNotices()
    C_Timer.After(3, CloseOpenNotices) -- alerts shown during the login
end

--------------------------------------------------------------------------------
-- BigWigs "Blizzard" bar style: the Cooldown Manager bar texture (General >
-- Textures) after BigWigs styles each bar; BigWigs restores its own texture
-- when the bar ends.
--------------------------------------------------------------------------------
-- Pixels gained toward the frame border (the frame sits slightly lower).
local BIGWIGS_TOP, BIGWIGS_BOTTOM = 2, 0

local function SetupBigWigs()
    local path = ns.CooldownBarTexture()
    local style = path and BigWigsAPI and BigWigsAPI:GetBarStyle("Blizzard")
    if not style then return end
    hooksecurefunc(style, "ApplyStyle", function(bar)
        local statusbar = bar.candyBarBar
        if not statusbar then return end
        statusbar:SetStatusBarTexture(path)
        local fill = statusbar:GetStatusBarTexture()
        fill:SetTexCoord(0, 1, 0, 1)
        fill:ClearTextureSlice()
        fill:ClearVertexOffsets()
        -- Blizzard's fill is drawn inside an inset: the flat texture reaches
        -- the frame border instead.
        for i = 1, statusbar:GetNumPoints() do
            local point, relative, relativePoint, x, y = statusbar:GetPoint(i)
            if y and y ~= 0 then
                statusbar:SetPoint(point, relative, relativePoint, x, y > 0 and y - BIGWIGS_BOTTOM or y + BIGWIGS_TOP)
            end
        end
    end)
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
-- Other addons are already loaded when modules are enabled.
function Misc:OnEnable()
    if self.db.platynatorStyle and C_AddOns.IsAddOnLoaded("Platynator") then SetupPlatynator() end
    if self.db.bigwigsStyle then EventUtil.ContinueOnAddOnLoaded("BigWigs_Plugins", SetupBigWigs) end
    SetFastLoot(self.db.fastLoot)
    SetCursorRing(self.db.cursorRing)
    ns.Hook("StaticPopup_Show", FillDeleteText)
    SetupNotices()
    if self.db.waypoints then SetupWaypoints() end
end

-- Live options.
function Misc:OnOptionChanged(key, value)
    if key == "fastLoot" then
        SetFastLoot(value)
    elseif key == "hideNotices" then
        if value then CloseOpenNotices() end
    elseif key == "cursorRing" then
        SetCursorRing(value)
    end
end
