--[[----------------------------------------------------------------------------
    PanzaUI - Various
    Other addons' styling and quality of life features.
------------------------------------------------------------------------------]]
local _, ns = ...
local IsSecret = ns.IsSecret

-- Saved variables key of the old Miscellaneous module.
local Misc = ns:RegisterModule("Miscellaneous", {
    title = "Various",
    defaults = {
        platynatorStyle = true,
        bigwigsStyle    = true,
        fastLoot        = true,
        ahExpansion     = true,
        autoKeystone    = true,
        flightDestination = true,
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
          tooltip = "Polish the look of the BigWigs bars and icons." },
        { header = "Quality of Life" },
        { key = "ahExpansion", label = "Auction House: current expansion",
          tooltip = "Set the current expansion filter when opening the Auction House." },
        { key = "autoKeystone", label = "Auto-insert keystone",
          tooltip = "Insert your Mythic+ keystone when opening the Font of Power." },
        { key = "fastLoot", label = "Fast auto-loot",
          tooltip = "Loot everything at once when auto-loot is on." },
        { key = "flightDestination", label = "Flight destination",
          tooltip = "Show the destination while flying on a flight path." },
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
    if not ns.StyleIcon(frame.Icon, frame) then return end
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
    if IsSecret(unit) or not unit then return end
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
-- 4x the size of Platynator's (so 1/4 of its scale). Registered before login,
-- ahead of the first nameplates.
--------------------------------------------------------------------------------
local function RegisterPlatynatorBorder()
    local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)
    if not LSM then return end
    local NAME, SIZE = "PanzaUI - Nameplates", ns.BORDER.size
    local margin, maskMargin = ns.BORDER.margin, 8 * 0.49
    LSM:Register("nineslice", NAME, {
        file = ns.BORDER.file,
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
    ns.SetEvents(lootEvents, on, "LOOT_READY")
end

--------------------------------------------------------------------------------
-- Keystone: found in the bags and slotted when the Font of Power opens
-- (skipped in combat or when a keystone is already slotted).
--------------------------------------------------------------------------------
local keystoneEvents = CreateFrame("Frame")
local KEYSTONE_CLASS = Enum.ItemClass and Enum.ItemClass.Reagent
local KEYSTONE_SUBCLASS = Enum.ItemReagentSubclass and Enum.ItemReagentSubclass.Keystone

local function IsKeystone(itemID)
    if C_Item.IsItemKeystoneByID then return C_Item.IsItemKeystoneByID(itemID) end
    local _, _, _, _, _, classID, subclassID = C_Item.GetItemInfoInstant(itemID)
    return classID == KEYSTONE_CLASS and subclassID == KEYSTONE_SUBCLASS
end

local function SlotKeystone()
    if InCombatLockdown() or not C_ChallengeMode.SlotKeystone then return end
    if C_ChallengeMode.HasSlottedKeystone and C_ChallengeMode.HasSlottedKeystone() then return end
    for bag = 0, NUM_BAG_SLOTS or 4 do
        for slot = 1, C_Container.GetContainerNumSlots(bag) do
            local itemID = C_Container.GetContainerItemID(bag, slot)
            if itemID and IsKeystone(itemID) then
                C_Container.PickupContainerItem(bag, slot)
                if CursorHasItem() then C_ChallengeMode.SlotKeystone() end
                return
            end
        end
    end
end

keystoneEvents:SetScript("OnEvent", function() ns.Defer(SlotKeystone) end)

local function SetAutoKeystone(on)
    ns.SetEvents(keystoneEvents, on, "CHALLENGE_MODE_KEYSTONE_RECEPTABLE_OPEN")
end

--------------------------------------------------------------------------------
-- Auction House: the current expansion filter set at every opening (read
-- first, since toggling a filter already set would turn it off).
--------------------------------------------------------------------------------
local ahEvents = CreateFrame("Frame")

local function SetExpansionFilter()
    local searchBar = AuctionHouseFrame and AuctionHouseFrame.SearchBar
    local button = searchBar and searchBar.FilterButton
    local filter = Enum.AuctionHouseFilter and Enum.AuctionHouseFilter.CurrentExpansionOnly
    if not (filter and button and button.GetFilters and button.ToggleFilter) then return end
    local filters = button:GetFilters()
    if filters and filters[filter] then return end
    button:ToggleFilter(filter)
    if searchBar.UpdateClearFiltersButton then searchBar:UpdateClearFiltersButton() end
end

ahEvents:SetScript("OnEvent", function() ns.Defer(SetExpansionFilter) end)

local function SetAuctionFilter(on)
    ns.SetEvents(ahEvents, on, "AUCTION_HOUSE_SHOW")
end

--------------------------------------------------------------------------------
-- Flight destination: shown from the take-off to the landing, checked twice
-- per second only while waiting or flying.
--------------------------------------------------------------------------------
local FLIGHT_CHECK = 0.5     -- seconds between taxi checks
local FLIGHT_START_WAIT = 5  -- seconds from the taxi click to the take-off
local flightFrame, flightDeadline, flying

local function CheckFlight(self, elapsed)
    self.tick = self.tick + elapsed
    if self.tick < FLIGHT_CHECK then return end
    self.tick = 0
    local onTaxi = UnitOnTaxi("player")
    if onTaxi and not flying then
        flying = true
        self.text:Show()
    elseif not onTaxi and (flying or GetTime() > flightDeadline) then
        self:Hide()
    end
end

-- Destination chosen on the flight map: shown once on the taxi.
local function OnTakeTaxiNode(index)
    if not Misc.db.flightDestination then return end
    if not flightFrame then
        flightFrame = CreateFrame("Frame", nil, UIParent)
        flightFrame:SetSize(1, 1)
        flightFrame:SetPoint("TOP", 0, -90)
        flightFrame.text = flightFrame:CreateFontString(nil, "OVERLAY")
        flightFrame.text:SetFontObject(ns.textStyle and ns.OutlinedFont(GameFontNormalLarge) or GameFontNormalLarge)
        flightFrame.text:SetPoint("TOP")
        flightFrame:SetScript("OnUpdate", CheckFlight)
    end
    flightFrame.text:SetText("Destination: " .. TaxiNodeName(index))
    flightFrame.text:Hide()
    flightFrame.tick, flightDeadline, flying = 0, GetTime() + FLIGHT_START_WAIT, false
    flightFrame:Show()
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
local function CloseNotice(frame)
    if IsNotice(frame.owner or frame:GetParent(), frame.info, frame.relativeRegion) then frame:Hide() end
end

local function CloseOpenNotices()
    if Misc.db.hideNotices and HelpTip then ns.ForEachActive(HelpTip.framePool, CloseNotice) end
end

local function SetupNotices()
    if HelpTip then ns.Hook(HelpTip, "Show", HideNotice) end
    ns.Hook("MicroButtonPulse", StopMicroPulse)
    CloseOpenNotices()
    C_Timer.After(3, CloseOpenNotices) -- alerts shown during the login
end

--------------------------------------------------------------------------------
-- BigWigs bars, "Blizzard" style: the Cooldown Manager bar texture (General >
-- Textures) after BigWigs styles each bar; BigWigs restores its own texture
-- when the bar ends.
--------------------------------------------------------------------------------
-- Pixels gained toward the frame border (the frame sits slightly lower).
local BIGWIGS_TOP, BIGWIGS_BOTTOM = 2, 0

local function StyleBigWigsBars()
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
-- BigWigs Battle Res icon: rounded mask, frame and swipe like the action
-- bars, BigWigs' own border hidden. The icon has no name: found among the
-- UIParent children by its fields.
--------------------------------------------------------------------------------
local HideBackdropEdges = ns.HideFramePieces

local function FindBattleRes(...)
    for i = 1, select("#", ...) do
        local frame = select(i, ...)
        if not frame:IsForbidden() and frame.chargesText and frame.cdText and frame.cooldown
            and frame.border and frame.icon then
            return frame
        end
    end
end

local function StyleBattleRes()
    local frame = FindBattleRes(UIParent:GetChildren())
    local ring = frame and ns.StyleIcon(frame.icon, frame)
    if not ring then return end
    ns.RoundSwipe(frame.cooldown)
    hooksecurefunc(frame.border, "SetBackdrop", HideBackdropEdges)
    hooksecurefunc(frame.border, "SetBackdropBorderColor", HideBackdropEdges)
    HideBackdropEdges(frame.border)
    -- Text only mode: no icon, so no frame either.
    hooksecurefunc(frame.icon, "SetTexture", function(_, texture) ring:SetShown(texture ~= nil) end)
    hooksecurefunc(frame.icon, "SetColorTexture", function() ring:Hide() end)
    ring:SetShown(frame.icon:GetTexture() ~= nil)
end

-- Queue timer (under the "group formed" dialog): Interface bars texture
-- (General > Textures) and the PanzaUI border instead of the old cast bar
-- frame. Styled through BigWigs' own callback, when it is created.
local QUEUE_BORDER_OUTSET = 3 -- room for the border corners around the thin bar
local CAST_BORDER = 130874    -- Interface\CastingBar\UI-CastingBar-Border

local function StyleQueueTimer(_, bar, name)
    if name ~= "QueueTimer" or not bar or bar:IsForbidden() then return end
    local path = ns.InterfaceBarTexture()
    if path then bar:SetStatusBarTexture(path) end
    for _, region in ipairs({ bar:GetRegions() }) do
        local file = region:GetObjectType() == "Texture" and region:GetTexture()
        if file == CAST_BORDER or (type(file) == "string" and file:find("CastingBar%-Border")) then
            region:SetAlpha(0)
        end
    end
    ns.PanelBorder(bar, bar, QUEUE_BORDER_OUTSET):SetDrawLayer("OVERLAY", 6) -- over the bar fill
end

-- Start timer (eg. battleground and arena gates, shown by Blizzard next to
-- BigWigs' timers): its bar frame hidden, the same border as the queue timer.
-- Timers are created by the tracker's events, so they are checked after each one.
local styledTimers = {}

local function StyleStartTimers()
    local timers = TimerTracker.timerList
    if not timers then return end
    for _, timer in ipairs(timers) do
        local bar = timer.bar
        if bar and not styledTimers[bar] then
            styledTimers[bar] = true
            local name = bar:GetName()
            local frame = name and _G[name .. "Border"]
            if frame then frame:SetAlpha(0) end
            ns.PanelBorder(bar, bar, QUEUE_BORDER_OUTSET):SetDrawLayer("OVERLAY", 6) -- over the bar fill
        end
    end
end

local function SetupBigWigs()
    StyleBigWigsBars()
    StyleBattleRes()
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function Misc:OnLoad()
    if self.db.platynatorStyle and C_AddOns.IsAddOnLoaded("Platynator") then RegisterPlatynatorBorder() end
end

-- Other addons are already loaded when modules are enabled.
function Misc:OnEnable()
    if self.db.platynatorStyle and C_AddOns.IsAddOnLoaded("Platynator") then SetupPlatynator() end
    if self.db.bigwigsStyle then
        EventUtil.ContinueOnAddOnLoaded("BigWigs_Plugins", SetupBigWigs)
        -- The queue timer is part of BigWigs itself, loaded with the game.
        if BigWigsLoader and BigWigsLoader.RegisterMessage then
            BigWigsLoader.RegisterMessage(ns, "BigWigs_FrameCreated", StyleQueueTimer)
        end
        if TimerTracker then TimerTracker:HookScript("OnEvent", StyleStartTimers) end
    end
    SetFastLoot(self.db.fastLoot)
    SetAuctionFilter(self.db.ahExpansion)
    SetAutoKeystone(self.db.autoKeystone)
    ns.Hook("TakeTaxiNode", OnTakeTaxiNode)
    SetCursorRing(self.db.cursorRing)
    ns.Hook("StaticPopup_Show", FillDeleteText)
    SetupNotices()
    if self.db.waypoints then SetupWaypoints() end
end

-- Live options.
function Misc:OnOptionChanged(key, value)
    if key == "fastLoot" then
        SetFastLoot(value)
    elseif key == "ahExpansion" then
        SetAuctionFilter(value)
    elseif key == "autoKeystone" then
        SetAutoKeystone(value)
    elseif key == "flightDestination" then
        if not value and flightFrame then flightFrame:Hide() end
    elseif key == "hideNotices" then
        if value then CloseOpenNotices() end
    elseif key == "cursorRing" then
        SetCursorRing(value)
    end
end
