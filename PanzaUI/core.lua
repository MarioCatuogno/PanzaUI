--[[----------------------------------------------------------------------------
    PanzaUI - Core
    Shared helpers, saved variables, module registry and settings panel.
------------------------------------------------------------------------------]]
local addonName, ns = ...

ns.modules    = {}
ns.IsSecret   = issecretvalue or function() return false end
local IsSecret = ns.IsSecret
ns.FONT_FLAGS = "OUTLINE, SLUG" -- shared text style
ns.textStyle  = false -- General > Style > Refined text
ns.classColors = false -- General > Style > Class colors

--------------------------------------------------------------------------------
-- Shared helpers
--------------------------------------------------------------------------------

-- Hidden parent for frames removed for good.
ns.Hider = CreateFrame("Frame")
ns.Hider:Hide()

function ns.Kill(frame)
    if frame then frame:SetParent(ns.Hider) end
end

-- Runs a function once on the next frame, however often it is requested.
local pending, running = {}, {}
local deferFrame = CreateFrame("Frame")
deferFrame:Hide()
deferFrame:SetScript("OnUpdate", function(self)
    self:Hide()
    pending, running = running, pending
    local handler = geterrorhandler()
    for func in pairs(running) do
        running[func] = nil
        xpcall(func, handler) -- one failing function can't stop the others
    end
end)

function ns.Defer(func)
    pending[func] = true
    deferFrame:Show()
end

-- Registers the given events on `frame` when `on`, otherwise unregisters all
-- of them (event frames used only while their option is on).
function ns.SetEvents(frame, on, ...)
    if not on then
        frame:UnregisterAllEvents()
        return
    end
    for i = 1, select("#", ...) do frame:RegisterEvent((select(i, ...))) end
end

-- Runs func on the next frame each time `frame` shows, and now if it is
-- already shown. Returns the queuing function, for other hooks too.
function ns.OnShowDeferred(frame, func)
    local function Queue() ns.Defer(func) end
    frame:HookScript("OnShow", Queue)
    if frame:IsShown() then Queue() end
    return Queue
end

-- Outlined copy of a font object, one per base font.
local outlinedFonts, fontCount = {}, 0
function ns.OutlinedFont(base)
    if not base then return end
    local copy = outlinedFonts[base]
    if not copy then
        local font, size = base:GetFont()
        if not font then return end
        fontCount = fontCount + 1
        copy = CreateFont("PanzaUIFont" .. fontCount)
        copy:CopyFontObject(base)
        copy:SetFont(font, size, ns.FONT_FLAGS)
        outlinedFonts[base] = copy
    end
    return copy
end

-- Applies the shared text style; secret fonts get an outlined font object.
-- Already styled texts are skipped (flags as read back from the game).
local styledFlags = ns.FONT_FLAGS

function ns.StyleFont(obj)
    if not (obj and obj.GetFont) then return end
    local font, size, flags = obj:GetFont()
    if not IsSecret(font) and not IsSecret(size) then
        if not font or (not IsSecret(flags) and (flags == styledFlags or flags == ns.FONT_FLAGS)) then return end
        obj:SetFont(font, size, ns.FONT_FLAGS)
        local _, _, applied = obj:GetFont()
        if not IsSecret(applied) and applied then styledFlags = applied end
        return
    end
    local base = obj.GetFontObject and obj:GetFontObject()
    if IsSecret(base) then return end
    local copy = ns.OutlinedFont(base)
    if copy then obj:SetFontObject(copy) end
end

-- Calls func for every existing compact party/raid frame.
local COMPACT_FRAMES = {}
for i = 1, 5 do COMPACT_FRAMES[#COMPACT_FRAMES + 1] = "CompactPartyFrameMember" .. i end
for i = 1, 40 do COMPACT_FRAMES[#COMPACT_FRAMES + 1] = "CompactRaidFrame" .. i end
for g = 1, 8 do
    for m = 1, 5 do COMPACT_FRAMES[#COMPACT_FRAMES + 1] = "CompactRaidGroup" .. g .. "Member" .. m end
end

function ns.ForEachCompactFrame(func)
    for i = 1, #COMPACT_FRAMES do
        local f = _G[COMPACT_FRAMES[i]]
        if f then func(f) end
    end
end

-- Midnight: compound units (e.g. targettarget) can be secret in combat.
-- Returns the matching player/party/raid token, or the unit itself.
local PARTY_UNITS, RAID_UNITS = {}, {}
for i = 1, 4 do PARTY_UNITS[i] = "party" .. i end
for i = 1, 40 do RAID_UNITS[i] = "raid" .. i end

local function IsUnit(unit, token)
    local same = UnitIsUnit(unit, token)
    return not IsSecret(same) and same
end

function ns.GroupUnit(unit)
    if IsUnit(unit, "player") then return "player" end
    local tokens, count = PARTY_UNITS, GetNumSubgroupMembers()
    if IsInRaid() then tokens, count = RAID_UNITS, GetNumGroupMembers() end
    for i = 1, count do
        local token = tokens[i]
        if token and IsUnit(unit, token) then return token end
    end
    return unit
end

-- Chat message with the addon prefix.
function ns.Print(msg)
    print("|cff00FF98Panza|rUI: " .. msg)
end

-- Permanently hides a frame and stops its events. Protected frames shown
-- again in combat (eg. the Totem frame) are made invisible, then hidden
-- once combat ends.
local pendingHide = {}
local hideEvents = CreateFrame("Frame")
hideEvents:SetScript("OnEvent", function(self)
    self:UnregisterAllEvents()
    for frame, alpha in pairs(pendingHide) do
        frame:Hide()
        frame:SetAlpha(alpha)
    end
    wipe(pendingHide)
end)

local function HideFrame(frame)
    if InCombatLockdown() and frame:IsProtected() then
        if not pendingHide[frame] then pendingHide[frame] = frame:GetAlpha() end
        frame:SetAlpha(0)
        hideEvents:RegisterEvent("PLAYER_REGEN_ENABLED")
    else
        frame:Hide()
    end
end

function ns.Disable(frame)
    if not frame then return end
    frame:UnregisterAllEvents()
    HideFrame(frame)
    frame:HookScript("OnShow", HideFrame)
end

-- hooksecurefunc, only when the function exists.
-- ns.Hook("GlobalFunc", cb) or ns.Hook(object, "Method", cb)
function ns.Hook(target, name, callback)
    if type(target) == "string" then target, name, callback = _G, target, name end
    if target and type(target[name]) == "function" then hooksecurefunc(target, name, callback) end
end

--------------------------------------------------------------------------------
-- PanzaUI border: sliced texture in the action bar icon frame colors, with a
-- transparent padding around it (sizes in texture pixels).
--------------------------------------------------------------------------------
ns.BORDER = {
    file    = [[Interface\AddOns\PanzaUI\Media\Borders\PanzaUI_nameplates.tga]],
    size    = 136,
    margin  = 136 * 0.35,
    padding = 16,
}
local BORDER_SCALE = 0.2 -- panels: the border at the icon frame size
local panelBorders = {}

-- PanzaUI border on `owner`, around `anchor` pushed out by `outset` (screen
-- units). Created once per owner.
function ns.PanelBorder(owner, anchor, outset)
    if panelBorders[owner] then return panelBorders[owner] end
    local border = owner:CreateTexture(nil, "BORDER", nil, 7)
    local m = ns.BORDER.margin
    local pad = ns.BORDER.padding + outset / BORDER_SCALE
    border:SetTexture(ns.BORDER.file)
    border:SetTextureSliceMargins(m, m, m, m)
    border:SetTextureSliceMode(Enum.UITextureSliceMode.Stretched)
    border:SetScale(BORDER_SCALE)
    border:SetPoint("TOPLEFT", anchor, "TOPLEFT", -pad, pad)
    border:SetPoint("BOTTOMRIGHT", anchor, "BOTTOMRIGHT", pad, -pad)
    panelBorders[owner] = border
    return border
end

-- Hides the corners and edges of a Blizzard frame border (nine-slice or
-- backdrop); its background is kept.
local FRAME_PIECES = { "TopLeftCorner", "TopRightCorner", "BottomLeftCorner", "BottomRightCorner",
    "TopEdge", "BottomEdge", "LeftEdge", "RightEdge" }

function ns.HideFramePieces(frame)
    for _, key in ipairs(FRAME_PIECES) do
        local piece = frame[key]
        if piece then piece:SetAlpha(0) end
    end
end

--------------------------------------------------------------------------------
-- Icon look, one style for every icon: action button frame and rounded mask,
-- both on the icon's own edges (they follow its size, no size reading).
-- Returns the frame and the mask, nil when the icon can't be styled.
--------------------------------------------------------------------------------
local ICON_FRAME = "UI-HUD-ActionBar-IconFrame"
local ICON_SHAPE = [[Interface\AddOns\PanzaUI\Media\Icons\PanzaUI_iconmask.tga]] -- inner shape of the frame (cooldown swipe)
-- Icon mask: reaches under the frame band, so no gap is left in the corners
-- of the frame opening (it isn't centered in Blizzard's atlas).
local ICON_FILL  = [[Interface\AddOns\PanzaUI\Media\Icons\PanzaUI_iconfill.tga]]

local frameInfo

function ns.StyleIcon(icon, parent)
    if not (icon and icon.AddMaskTexture) or icon:IsForbidden() then return end
    parent = parent or icon:GetParent()
    if not parent or parent:IsForbidden() then return end

    local ok, mask = pcall(parent.CreateMaskTexture, parent)
    if not ok then return end
    mask:SetTexture(ICON_FILL, "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
    mask:SetAllPoints(icon)
    icon:AddMaskTexture(mask)

    local frame = parent:CreateTexture(nil, "OVERLAY", nil, -1) -- below other overlays
    frame:SetAtlas(ICON_FRAME)
    -- The 46x45 frame atlas is cropped to 45x45 to center its opening.
    frameInfo = frameInfo or C_Texture.GetAtlasInfo(ICON_FRAME)
    local fi = frameInfo
    if fi and fi.file and fi.width and fi.width > 1 then
        local l, r = fi.leftTexCoord, fi.rightTexCoord
        frame:SetTexture(fi.file)
        frame:SetTexCoord(l, r - (r - l) / fi.width, fi.topTexCoord, fi.bottomTexCoord)
    end
    frame:SetAllPoints(icon)
    return frame, mask
end

-- Rounded cooldown swipe, without the edge line drawn outside the frame.
local BLANK = [[Interface\AddOns\PanzaUI\Media\Icons\PanzaUI_blank.tga]]

function ns.RoundSwipe(cooldown)
    if cooldown and cooldown.SetSwipeTexture and not cooldown:IsForbidden() then
        cooldown:SetSwipeTexture(ICON_SHAPE)
        cooldown:SetEdgeTexture(BLANK)
    end
end

-- Crops `percent`% of the icon on each side.
function ns.ZoomIcon(icon, percent)
    if not (icon and icon.SetTexCoord) then return end
    local lo = (tonumber(percent) or 0) / 100
    icon:SetTexCoord(lo, 1 - lo, lo, 1 - lo)
end

--------------------------------------------------------------------------------
-- Item buttons (rewards, reagents, profession gear): the icon look, its frame
-- in the item quality color instead of Blizzard's square quality border.
-- The color is read from every way Blizzard sets that border: quality,
-- vertex color or colored atlas. hideSlotArt: the square slot art behind
-- (background layers, normal texture) is hidden too. Styled once per button.
--------------------------------------------------------------------------------
local qualityFrames = setmetatable({}, { __mode = "k" }) -- button -> icon frame
local QUALITY_MIN = Enum.ItemQuality and Enum.ItemQuality.Uncommon or 2
local Q = Enum.ItemQuality or {}
local ATLAS_QUALITY = { -- word in the border atlas name -> quality
    green = Q.Uncommon or 2, blue = Q.Rare or 3, purple = Q.Epic or 4, orange = Q.Legendary or 5,
    artifact = Q.Artifact or 6, heirloom = Q.Heirloom or 7, account = Q.Heirloom or 7,
    uncommon = Q.Uncommon or 2, rare = Q.Rare or 3, epic = Q.Epic or 4, legendary = Q.Legendary or 5,
}

local function SetFrameColor(frame, r, g, b)
    if r then frame:SetVertexColor(r, g, b) else frame:SetVertexColor(1, 1, 1) end
end

local function QualityColor(quality)
    if IsSecret(quality) or not quality or quality < QUALITY_MIN then return end
    local c = ITEM_QUALITY_COLORS[quality]
    if c then return c.r, c.g, c.b end
end

local function TintQualityFrame(button, quality)
    local frame = qualityFrames[button]
    if frame then SetFrameColor(frame, QualityColor(quality)) end
end
if SetItemButtonQuality then hooksecurefunc("SetItemButtonQuality", TintQualityFrame) end

local function AtlasQuality(atlas)
    if IsSecret(atlas) or type(atlas) ~= "string" then return end
    atlas = atlas:lower()
    for word, quality in pairs(ATLAS_QUALITY) do
        if atlas:find(word, 1, true) then return quality end
    end
end

-- Colored border tints the frame (white means no quality color).
local function BorderColor(frame, r, g, b)
    if IsSecret(r) or IsSecret(g) or IsSecret(b) or not r then return end
    if r + g + b < 2.9 then SetFrameColor(frame, r, g, b) end
end

local function HideSlotArt(button, icon, frame, ...)
    for i = 1, select("#", ...) do
        local region = select(i, ...)
        if region ~= icon and region ~= frame and region:GetObjectType() == "Texture" then
            local layer = region:GetDrawLayer()
            if layer == "BACKGROUND" or layer == "BORDER" then region:SetAlpha(0) end
        end
    end
    local normal = button.GetNormalTexture and button:GetNormalTexture()
    if normal then normal:SetAlpha(0) end
end

function ns.StyleItemButton(button, icon, hideSlotArt)
    if not button or qualityFrames[button] or not icon then return end
    local frame = ns.StyleIcon(icon, button)
    if not frame then return end
    qualityFrames[button] = frame
    if hideSlotArt then HideSlotArt(button, icon, frame, button:GetRegions()) end
    if button.SetItemButtonQuality then hooksecurefunc(button, "SetItemButtonQuality", TintQualityFrame) end
    local border = button.IconBorder
    if not border then return frame end
    border:SetAlpha(0)
    hooksecurefunc(border, "Hide", function() SetFrameColor(frame) end)
    hooksecurefunc(border, "SetAtlas", function(_, atlas)
        local quality = AtlasQuality(atlas)
        if quality then SetFrameColor(frame, QualityColor(quality)) end
    end)
    hooksecurefunc(border, "SetVertexColor", function(_, r, g, b) BorderColor(frame, r, g, b) end)
    -- Border already set before styling.
    if border:IsShown() then
        local quality = AtlasQuality(border:GetAtlas())
        if quality then SetFrameColor(frame, QualityColor(quality)) else BorderColor(frame, border:GetVertexColor()) end
    end
    return frame
end

--------------------------------------------------------------------------------
-- Scrolling lists (eg. Currency tab, Equipment Manager): the icon look on
-- each row as Blizzard creates it; GetIcon(row) returns icon, parent and
-- optionally an overlay drawn over the icon (masked to the same shape).
--------------------------------------------------------------------------------
local styledRowIcons = setmetatable({}, { __mode = "k" })

function ns.StyleScrollIcons(box, GetIcon)
    if not (box and ScrollUtil) then return end
    ScrollUtil.AddInitializedFrameCallback(box, ns.ScrollFrameCallback(function(row)
        local icon, parent, overlay = GetIcon(row)
        if not icon or styledRowIcons[icon] then return end
        local frame, mask = ns.StyleIcon(icon, parent)
        if not frame then return end
        styledRowIcons[icon] = true
        if overlay and overlay.AddMaskTexture then overlay:AddMaskTexture(mask) end
    end), ns, true)
end


--------------------------------------------------------------------------------
-- ScrollBox frame callback that always receives the frame.
--------------------------------------------------------------------------------
function ns.ScrollFrameCallback(func)
    return function(a, b)
        if type(a) == "table" and a.GetObjectType then func(a) else func(b) end
    end
end

-- Calls func(object) for each active object of a Blizzard frame pool.
function ns.ForEachActive(pool, func)
    if not pool then return end
    local active = pool.activeObjects
    if active then
        for object in pairs(active) do func(object) end
    elseif pool.EnumerateActive then
        for object in pool:EnumerateActive() do func(object) end
    end
end

--------------------------------------------------------------------------------
-- Damage Meter registry: each function runs once per entry and per window.
--------------------------------------------------------------------------------
local dmFuncs, dmEntries, dmHooked = {}, {}, {}
local dmWindowFuncs, dmWindows = {}, {}
local dmSetup = false

local function OnDamageMeterWindow(window)
    if not window or dmWindows[window] then return end
    dmWindows[window] = true
    for _, func in ipairs(dmWindowFuncs) do func(window) end
end

local function OnDamageMeterEntry(entry)
    if not entry or dmEntries[entry] then return end
    dmEntries[entry] = true
    for _, func in ipairs(dmFuncs) do func(entry) end
end

local OnDamageMeterFrame = ns.ScrollFrameCallback(OnDamageMeterEntry)
local function HookDamageMeterBox(box)
    if not box or dmHooked[box] then return end
    dmHooked[box] = true
    ScrollUtil.AddAcquiredFrameCallback(box, OnDamageMeterFrame, ns, true)
    ScrollUtil.AddInitializedFrameCallback(box, OnDamageMeterFrame, ns, true)
end

local function HookDamageMeterSource(window)
    local source = window.GetSourceWindow and window:GetSourceWindow()
    if not source then return end
    OnDamageMeterWindow(source)
    if source.GetScrollBox then HookDamageMeterBox(source:GetScrollBox()) end
end

local function HookDamageMeterWindow(window)
    if not window or dmHooked[window] then return end
    dmHooked[window] = true
    OnDamageMeterWindow(window)
    if window.GetScrollBox then HookDamageMeterBox(window:GetScrollBox()) end
    -- The pinned player row is not part of the scroll box.
    if window.GetLocalPlayerEntry then OnDamageMeterEntry(window:GetLocalPlayerEntry()) end
    HookDamageMeterSource(window)
    ns.Hook(window, "ShowSourceWindow", HookDamageMeterSource)
end

local function SetupDamageMeter()
    if dmSetup or not ScrollUtil then return end
    dmSetup = true
    for i = 1, 10 do HookDamageMeterWindow(_G["DamageMeterSessionWindow" .. i]) end
    ns.Hook(DamageMeter, "SetupSessionWindow", function(_, index)
        HookDamageMeterWindow(_G["DamageMeterSessionWindow" .. tostring(index)])
    end)
end

-- func(entry): entry.Icon.Icon is the icon, entry.StatusBar the bar.
function ns.OnDamageMeterEntry(func)
    dmFuncs[#dmFuncs + 1] = func
    for entry in pairs(dmEntries) do func(entry) end
    EventUtil.ContinueOnAddOnLoaded("Blizzard_DamageMeter", SetupDamageMeter)
end

-- func(window): session and spell breakdown windows.
function ns.OnDamageMeterWindow(func)
    dmWindowFuncs[#dmWindowFuncs + 1] = func
    for window in pairs(dmWindows) do func(window) end
    EventUtil.ContinueOnAddOnLoaded("Blizzard_DamageMeter", SetupDamageMeter)
end

--------------------------------------------------------------------------------
-- Cooldown Manager registry: each function runs once per item.
--------------------------------------------------------------------------------
local CDM_VIEWERS = { "EssentialCooldownViewer", "UtilityCooldownViewer", "BuffIconCooldownViewer", "BuffBarCooldownViewer" }
local cdmFuncs, cdmItems = {}, {}

local function OnCooldownItem(item)
    if not item or cdmItems[item] then return end
    cdmItems[item] = true
    for _, func in ipairs(cdmFuncs) do func(item) end
end

local function OnAcquireCooldownItem(_, item) OnCooldownItem(item) end

local function SetupCooldownItems()
    for _, name in ipairs(CDM_VIEWERS) do
        local viewer = _G[name]
        if viewer then
            if viewer.GetItemFrames then
                for _, item in ipairs(viewer:GetItemFrames()) do OnCooldownItem(item) end
            end
            ns.Hook(viewer, "OnAcquireItemFrame", OnAcquireCooldownItem)
        end
    end
end

-- func(item): skips the items it doesn't handle.
function ns.OnCooldownItem(func)
    cdmFuncs[#cdmFuncs + 1] = func
    for item in pairs(cdmItems) do func(item) end
    if #cdmFuncs == 1 then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_CooldownViewer", SetupCooldownItems)
    end
end

--------------------------------------------------------------------------------
-- Item level text on item buttons, in the quality color.
--------------------------------------------------------------------------------
function ns.LocationItemLevel(location)
    if not C_Item.DoesItemExist(location) then return end
    local ilvl = C_Item.GetCurrentItemLevel(location)
    if not ilvl or ilvl <= 1 then return end
    return ilvl, ITEM_QUALITY_COLORS[C_Item.GetItemQuality(location)]
end

local ilvlTexts = {}
-- Shows ilvl on the button, or hides it when nil.
function ns.ItemLevelText(button, ilvl, color)
    local text = ilvlTexts[button]
    if not ilvl then
        if text then text:Hide() end
        return
    end
    if not text then
        text = button:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
        text:SetPoint("TOP", 0, -2)
        if ns.textStyle then ns.StyleFont(text) end
        ilvlTexts[button] = text
    end
    text:SetText(ilvl)
    if color then text:SetTextColor(color.r, color.g, color.b) else text:SetTextColor(1, 1, 1) end
    text:Show()
end

--------------------------------------------------------------------------------
-- Calls func(region) for every region of a frame, down to `levels` children
-- (regions and children walked as returned, without temporary tables).
--------------------------------------------------------------------------------
local WalkRegions

local function WalkRegionList(func, ...)
    for i = 1, select("#", ...) do func((select(i, ...))) end
end

local function WalkChildren(func, levels, ...)
    for i = 1, select("#", ...) do WalkRegions((select(i, ...)), levels, func) end
end

function WalkRegions(frame, levels, func)
    if not frame or frame:IsForbidden() then return end
    WalkRegionList(func, frame:GetRegions())
    if levels and levels > 0 then WalkChildren(func, levels - 1, frame:GetChildren()) end
end
ns.WalkRegions = WalkRegions

-- Styles every font string of a frame, down to `levels` children.
local function StyleFontRegion(region)
    if region:GetObjectType() == "FontString" then ns.StyleFont(region) end
end

function ns.StyleAllFonts(frame, levels)
    WalkRegions(frame, levels, StyleFontRegion)
end

--------------------------------------------------------------------------------
-- Calls func for the Player, Target, Focus and Boss cast bars, and the
-- overlay one (eg. "Activating Specialization" over the talents panel).
--------------------------------------------------------------------------------
function ns.ForEachCastBar(func)
    if PlayerCastingBarFrame then func(PlayerCastingBarFrame) end
    if OverlayPlayerCastingBarFrame then func(OverlayPlayerCastingBarFrame) end
    if TargetFrame and TargetFrame.spellbar then func(TargetFrame.spellbar) end
    if FocusFrame and FocusFrame.spellbar then func(FocusFrame.spellbar) end
    for i = 1, 5 do
        local boss = _G["Boss" .. i .. "TargetFrame"]
        if boss and boss.spellbar then func(boss.spellbar) end
    end
end

--------------------------------------------------------------------------------
-- Status bar texts
--------------------------------------------------------------------------------
function ns.StyleBarText(bar)
    if not bar then return end
    ns.StyleFont(bar.TextString)
    ns.StyleFont(bar.LeftText)
    ns.StyleFont(bar.RightText)
end

--------------------------------------------------------------------------------
-- Percentage text: one decimal, "100" when full, empty at 0 (secret values
-- go straight to the text, curves and a twin font string do the rest).
--------------------------------------------------------------------------------
local percentBars = {}
local fullTexts   = {}

local partCurve, fullCurve
if C_CurveUtil and C_CurveUtil.CreateCurve then
    partCurve = C_CurveUtil.CreateCurve()
    partCurve:AddPoint(0,       0)
    partCurve:AddPoint(0.0004,  0)
    partCurve:AddPoint(0.0005,  1)
    partCurve:AddPoint(0.99949, 1)
    partCurve:AddPoint(0.9995,  0)
    partCurve:AddPoint(1,       0)
    fullCurve = C_CurveUtil.CreateCurve()
    fullCurve:AddPoint(0,       0)
    fullCurve:AddPoint(0.99949, 0)
    fullCurve:AddPoint(0.9995,  1)
    fullCurve:AddPoint(1,       1)
end

-- Copies the bar text font to its twin.
function ns.SyncPercentFont(text)
    local twin = text and fullTexts[text]
    if not twin then return end
    local font, size, flags = text:GetFont()
    if not IsSecret(font) and not IsSecret(size) and font then twin:SetFont(font, size, flags) end
end

local function FullText(text)
    local twin = fullTexts[text]
    if twin then return twin end
    twin = text:GetParent():CreateFontString(nil, (text:GetDrawLayer()))
    local base = text:GetFontObject()
    if not IsSecret(base) and base then twin:SetFontObject(base) end
    twin:SetAllPoints(text)
    twin:SetJustifyH(text:GetJustifyH())
    twin:SetJustifyV(text:GetJustifyV())
    twin:SetTextColor(text:GetTextColor())
    twin:SetText("100")
    fullTexts[text] = twin
    ns.SyncPercentFont(text)
    hooksecurefunc(text, "Hide", function() twin:Hide() end)
    return twin
end

-- Sets the color of a percentage text and its twin.
function ns.SetPercentColor(text, r, g, b)
    text:SetTextColor(r, g, b)
    local twin = fullTexts[text]
    if twin then twin:SetTextColor(r, g, b) end
end

-- Hides the twin (status texts, no unit).
function ns.HidePercentFull(text)
    local twin = text and fullTexts[text]
    if twin then twin:Hide() end
end

-- Writes the health or power percentage (no and/or: secrets can't be tested).
function ns.SetPercentText(text, unit, isPower, powerType)
    local curve = CurveConstants.ScaleTo100
    local pct, alpha, full
    if isPower then
        pct = UnitPowerPercent(unit, powerType, false, curve)
        if partCurve then
            alpha = UnitPowerPercent(unit, powerType, false, partCurve)
            full  = UnitPowerPercent(unit, powerType, false, fullCurve)
        end
    else
        pct = UnitHealthPercent(unit, true, curve)
        if partCurve then
            alpha = UnitHealthPercent(unit, true, partCurve)
            full  = UnitHealthPercent(unit, true, fullCurve)
        end
    end
    text:SetFormattedText("%.1f", pct)
    if partCurve then
        text:SetAlpha(alpha)
        local twin = FullText(text)
        twin:SetAlpha(full)
        twin:Show()
    end
end

local function ShowPercent(bar)
    local info, text = percentBars[bar], bar.TextString
    if not (info and text) then return end
    if bar.LeftText  then bar.LeftText:Hide()  end
    if bar.RightText then bar.RightText:Hide() end

    local unit = bar.unit or info.unit
    local exists = unit and UnitExists(unit)
    if not unit or (not IsSecret(exists) and not exists) then
        text:Hide()
        if partCurve then FullText(text):Hide() end
        return
    end
    ns.SetPercentText(text, unit, info.power, bar.powerType)
    text:Show()
end

-- Call after styling the bar text.
function ns.PercentText(bar, isPower, unit)
    if not (bar and CurveConstants and UnitHealthPercent) or percentBars[bar] then return end
    percentBars[bar] = { power = isPower, unit = unit }
    if partCurve and bar.TextString then FullText(bar.TextString):Hide() end
    ns.Hook(bar, "UpdateTextString", ShowPercent)
end

--------------------------------------------------------------------------------
-- Visibility engine: frames faded with alpha, hidden buttons unclickable.
-- Entry: { frames, buttons?, getMode, grid?, flyout?, onRefresh? }
--------------------------------------------------------------------------------
local VIS = { DEFAULT = 0, MOUSEOVER = 1, SKYRIDING = 2, HIDDEN = 3, NO_SKYRIDING = 4 }
ns.VIS = VIS
ns.VISIBILITY_OPTIONS = {
    { VIS.DEFAULT,      "Default",        "Blizzard's default behavior." },
    { VIS.MOUSEOVER,    "Mouseover",      "Shown on mouseover." },
    { VIS.SKYRIDING,    "Skyriding only", "Shown only while Skyriding." },
    { VIS.NO_SKYRIDING, "No Skyriding",   "Hidden while Skyriding." },
    { VIS.HIDDEN,       "Always hidden",  "Never shown. Keybindings still work." },
}

local visEntries   = {}
local visShown     = {}
local forced       = {} -- editMode / grid
local skyriding    = false
local mousePending = false
local visWatcher   = CreateFrame("Frame")
visWatcher:Hide()

local function VisMode(e)
    return e.getMode() or VIS.DEFAULT
end

local function IsForced(e)
    return forced.editMode or (e.grid and forced.grid)
end

local function RestingAlpha(e)
    local mode = VisMode(e)
    if IsForced(e) or mode == VIS.DEFAULT then return 1 end
    if mode == VIS.SKYRIDING then return skyriding and 1 or 0 end
    if mode == VIS.NO_SKYRIDING then return skyriding and 0 or 1 end
    return 0
end

local function SetEntryAlpha(e, alpha)
    for _, f in ipairs(e.frames) do f:SetAlpha(alpha) end
end

local function IsHovered(e)
    for _, f in ipairs(e.frames) do
        if f:IsMouseOver() then return true end
    end
    return e.flyout and SpellFlyout and SpellFlyout:IsShown() and SpellFlyout:IsMouseOver()
end

local elapsed = 0
visWatcher:SetScript("OnUpdate", function(self, dt)
    elapsed = elapsed + dt
    if elapsed < 0.2 then return end
    elapsed = 0
    for e in pairs(visShown) do
        if not IsForced(e) and not IsHovered(e) then
            SetEntryAlpha(e, RestingAlpha(e))
            visShown[e] = nil
        end
    end
    if not next(visShown) then self:Hide() end
end)

local function OnEnterEntry(e)
    if VisMode(e) ~= VIS.MOUSEOVER then return end
    SetEntryAlpha(e, 1)
    visShown[e] = true
    visWatcher:Show()
end

local function HookEntry(e)
    if e.hooked then return end
    e.hooked = true
    local onEnter = function() OnEnterEntry(e) end
    for _, f in ipairs(e.frames) do f:HookScript("OnEnter", onEnter) end
    if e.buttons then
        for _, b in ipairs(e.buttons) do b:HookScript("OnEnter", onEnter) end
    end
end

-- Clicks only where the entry is visible (out of combat).
local function ApplyMouse()
    if InCombatLockdown() then mousePending = true return end
    mousePending = false
    for _, e in ipairs(visEntries) do
        if e.buttons then
            local mode = VisMode(e)
            local enabled = IsForced(e) or mode == VIS.DEFAULT or mode == VIS.MOUSEOVER
                or (mode == VIS.SKYRIDING and skyriding) or (mode == VIS.NO_SKYRIDING and not skyriding)
            if not enabled or e.mouseOff then
                for _, b in ipairs(e.buttons) do b:EnableMouse(enabled) end
                e.mouseOff = not enabled
            end
        end
    end
end

local function RefreshEntry(e)
    local mode = VisMode(e)
    if mode == VIS.MOUSEOVER then HookEntry(e) end
    if mode ~= VIS.DEFAULT or e.alphaTouched then
        if mode ~= VIS.MOUSEOVER or not visShown[e] then SetEntryAlpha(e, RestingAlpha(e)) end
        e.alphaTouched = mode ~= VIS.DEFAULT
    end
    if mode ~= VIS.MOUSEOVER then visShown[e] = nil end
    if e.onRefresh then e.onRefresh(mode) end
end

function ns.RefreshVisibility()
    for _, e in ipairs(visEntries) do RefreshEntry(e) end
    ApplyMouse()
end

local function SetForced(kind, on)
    forced[kind] = on
    ns.RefreshVisibility()
    if not on then
        -- Mouseover entries still under the cursor stay visible.
        for _, e in ipairs(visEntries) do
            if VisMode(e) == VIS.MOUSEOVER and IsHovered(e) then OnEnterEntry(e) end
        end
    end
end

local function ReadSkyriding()
    local _, canGlide = C_PlayerInfo.GetGlidingInfo()
    return not IsSecret(canGlide) and canGlide and true or false
end

local visInitialized = false
local function InitVisibility()
    visInitialized = true
    skyriding = ReadSkyriding()

    -- Everything is shown in Edit Mode, action bars also while dragging a spell.
    EventRegistry:RegisterCallback("EditMode.Enter", function() SetForced("editMode", true) end, ns)
    EventRegistry:RegisterCallback("EditMode.Exit",  function() SetForced("editMode", false) end, ns)

    local events = CreateFrame("Frame")
    events:RegisterEvent("ACTIONBAR_SHOWGRID")
    events:RegisterEvent("ACTIONBAR_HIDEGRID")
    events:RegisterEvent("PLAYER_REGEN_ENABLED")
    events:RegisterEvent("PLAYER_ENTERING_WORLD")
    events:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED")
    pcall(events.RegisterEvent, events, "PLAYER_CAN_GLIDE_CHANGED")
    events:SetScript("OnEvent", function(_, event)
        if event == "ACTIONBAR_SHOWGRID" or event == "ACTIONBAR_HIDEGRID" then
            SetForced("grid", event == "ACTIONBAR_SHOWGRID")
        elseif event == "PLAYER_REGEN_ENABLED" then
            if mousePending then ApplyMouse() end
        else
            local now = ReadSkyriding()
            if now ~= skyriding then
                skyriding = now
                ns.RefreshVisibility()
            end
        end
    end)
end

-- Registers an entry and applies its mode.
function ns.RegisterVisibility(e)
    local frames = {}
    for _, f in pairs(e.frames) do frames[#frames + 1] = f end
    if #frames == 0 then return end
    e.frames = frames
    if not visInitialized then InitVisibility() end
    visEntries[#visEntries + 1] = e
    RefreshEntry(e)
    ApplyMouse()
    return e
end

--------------------------------------------------------------------------------
-- Module registry
--   info = {
--       title    = "Page title",
--       main     = true,                     -- options on the main page
--       defaults = { key = value, ... },
--       options  = {
--           { header = "Section" },
--           { key, label, tooltip, bullets = { ... }, reload = true,
--             slider = { min, max, step, suffix } | dropdown = list or func },
--           { label, tooltip, button = "Text", onClick = func },  -- no saved value
--       },
--   }
--   Sections (by header) and the options inside them are listed
--   alphabetically.
--   Optional methods: module:OnLoad() (saved variables ready, before login),
--                     module:OnEnable(), module:OnOptionChanged(key, value),
--                     module:Migrate(db, saved) (convert old saved values;
--                     saved = every module's table, old modules included).
--------------------------------------------------------------------------------
function ns:RegisterModule(key, info)
    info.key = key
    self.modules[#self.modules + 1] = info
    return info
end

-- Migration helper: newKey takes the value of older options.
function ns.MergeOptions(db, newKey, old, ...)
    if db[newKey] ~= nil or not old then return end
    local value
    for i = 1, select("#", ...) do
        local v = old[(select(i, ...))]
        if type(v) == "boolean" then
            value = value or v
        elseif v ~= nil and value == nil then
            value = v
        end
    end
    if value ~= nil then db[newKey] = value end
end

--------------------------------------------------------------------------------
-- Saved variables: migrations, cleanup and defaults.
--------------------------------------------------------------------------------
local function InitDB()
    PanzaUI_DB = PanzaUI_DB or {}
    local saved = PanzaUI_DB

    local known = {}
    for _, m in ipairs(ns.modules) do
        known[m.key] = true
        saved[m.key] = saved[m.key] or {}
        if m.Migrate then m:Migrate(saved[m.key], saved) end
    end
    for k in pairs(saved) do
        if not known[k] then saved[k] = nil end
    end

    for _, m in ipairs(ns.modules) do
        local db = saved[m.key]
        for k in pairs(db) do
            if m.defaults[k] == nil then db[k] = nil end
        end
        for k, v in pairs(m.defaults) do
            if type(db[k]) ~= type(v) then db[k] = v end
        end
        m.db = db
    end
end

--------------------------------------------------------------------------------
-- Settings panel
--------------------------------------------------------------------------------
-- Reload UI button next to Blizzard's "Defaults", on PanzaUI pages only.
local reloadButton, settingsViewed

local function IsOwnCategory(category)
    if not (category and ns.category) then return false end
    if category == ns.category then return true end
    local parent = category.GetParentCategory and category:GetParentCategory()
    return parent == ns.category
end

local function UpdateReloadButton(_, category)
    local list = SettingsPanel.GetSettingsList and SettingsPanel:GetSettingsList()
    local header = list and list.Header
    local defaults = header and header.DefaultsButton
    if not defaults then return end
    if not reloadButton then
        reloadButton = CreateFrame("Button", nil, header, "UIPanelButtonTemplate")
        reloadButton:SetSize(defaults:GetSize())
        reloadButton:SetPoint("RIGHT", defaults, "LEFT", -8, 0)
        reloadButton:SetText("Reload UI")
        reloadButton:SetScript("OnClick", ReloadUI)
        reloadButton:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            GameTooltip:SetText("Reload the interface to apply changes.")
            GameTooltip:Show()
        end)
        reloadButton:SetScript("OnLeave", GameTooltip_Hide)
    end
    local own = IsOwnCategory(category)
    reloadButton:SetShown(own)
    if own then settingsViewed = true end
end

-- Collects the settings panel's temporary memory when it closes (out of combat).
local function CollectAfterSettings()
    if not settingsViewed or InCombatLockdown() then return end
    settingsViewed = false
    collectgarbage("collect")
end

-- Tooltip: summary, sorted bullets and reload note.
local function ByText(a, b)
    return a:lower() < b:lower()
end

local function BuildTooltip(opt)
    local text = opt.tooltip or ""
    if opt.bullets then
        local bullets = CopyTable(opt.bullets)
        table.sort(bullets, ByText)
        for _, line in ipairs(bullets) do text = text .. "\n• " .. line end
    end
    if opt.reload then text = text .. "\n\n" .. RED_FONT_COLOR:WrapTextInColorCode("Requires Reload UI.") end
    return text
end

-- Checkbox, slider or dropdown; dropdown data is built once per list.
local dropdownData = setmetatable({}, { __mode = "k" })

local function DropdownData(list)
    local data = dropdownData[list]
    if not data then
        local container = Settings.CreateControlTextContainer()
        for _, o in ipairs(list) do container:Add(o[1], o[2], o[3]) end
        data = container:GetData()
        dropdownData[list] = data
    end
    return data
end

local VAR_TYPES

local function AddOption(category, layout, m, opt)
    if opt.button then
        return layout:AddInitializer(CreateSettingsButtonInitializer(opt.label, opt.button, opt.onClick, BuildTooltip(opt), true))
    end
    local key = opt.key
    VAR_TYPES = VAR_TYPES or { boolean = Settings.VarType.Boolean, number = Settings.VarType.Number, string = Settings.VarType.String }
    local varType = VAR_TYPES[type(m.defaults[key])]
    local setting = Settings.RegisterAddOnSetting(category,
        addonName .. "_" .. m.key .. "_" .. key, key, m.db,
        varType, opt.label, m.defaults[key])

    if m.OnOptionChanged then
        setting:SetValueChangedCallback(function(_, value)
            m.db[key] = value
            m:OnOptionChanged(key, value)
        end)
    end

    local tooltip = BuildTooltip(opt)
    if opt.dropdown then
        local function GetOptions()
            return DropdownData(type(opt.dropdown) == "function" and opt.dropdown() or opt.dropdown)
        end
        return Settings.CreateDropdown(category, setting, GetOptions, tooltip)
    end
    if not opt.slider then
        return Settings.CreateCheckbox(category, setting, tooltip)
    end
    local sl = opt.slider
    local sliderOptions = Settings.CreateSliderOptions(sl.min, sl.max, sl.step or 1)
    sliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
        return value .. (sl.suffix or "")
    end)
    return Settings.CreateSlider(category, setting, sliderOptions, tooltip)
end

local function ByLabel(a, b)
    return a.label:lower() < b.label:lower()
end

local function BuildSettings()
    local category, layout = Settings.RegisterVerticalLayoutCategory("|cff00FF98Panza|rUI")
    local version = C_AddOns.GetAddOnMetadata(addonName, "Version") or ""
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer("Version: " .. version))

    -- Sections and options are sorted alphabetically.
    local function AddOptions(cat, lay, m)
        local sections, current = {}, { options = {} }
        sections[1] = current
        for _, opt in ipairs(m.options) do
            if opt.header then
                current = { header = opt.header, label = opt.header, options = {} }
                sections[#sections + 1] = current
            else
                current.options[#current.options + 1] = opt
            end
        end
        local untitled = table.remove(sections, 1)
        table.sort(sections, ByLabel)
        table.insert(sections, 1, untitled)

        for _, section in ipairs(sections) do
            if section.header then
                lay:AddInitializer(CreateSettingsListSectionHeaderInitializer(section.header))
            end
            table.sort(section.options, ByLabel)
            for _, opt in ipairs(section.options) do AddOption(cat, lay, m, opt) end
        end
    end

    -- Main modules on the main page, the others on their own page.
    local sorted = {}
    for _, m in ipairs(ns.modules) do
        if m.main then AddOptions(category, layout, m) else sorted[#sorted + 1] = m end
    end
    table.sort(sorted, function(a, b) return a.title < b.title end)

    for _, m in ipairs(sorted) do
        local sub, subLayout = Settings.RegisterVerticalLayoutSubcategory(category, m.title)
        AddOptions(sub, subLayout, m)
    end

    Settings.RegisterAddOnCategory(category)
    ns.category = category
    if SettingsPanel then
        ns.Hook(SettingsPanel, SettingsPanel.DisplayCategory and "DisplayCategory" or "SelectCategory", UpdateReloadButton)
        SettingsPanel:HookScript("OnHide", CollectAfterSettings)
    end
end

--------------------------------------------------------------------------------
-- Boot
--------------------------------------------------------------------------------
local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:RegisterEvent("PLAYER_LOGIN")
loader:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" then
        if arg1 ~= addonName then return end
        self:UnregisterEvent(event)
        InitDB()
        ns.textStyle = PanzaUI_DB.General.textStyle
        ns.classColors = PanzaUI_DB.General.classColors
        BuildSettings()
        local handler = geterrorhandler()
        for _, m in ipairs(ns.modules) do
            if m.OnLoad then xpcall(m.OnLoad, handler, m) end
        end
    else -- PLAYER_LOGIN, or PLAYER_REGEN_ENABLED after a /reload in combat
        self:UnregisterEvent(event)
        -- After a /reload in combat, modules wait until combat ends.
        if InCombatLockdown() then
            self:RegisterEvent("PLAYER_REGEN_ENABLED")
            return
        end
        local handler = geterrorhandler()
        for _, m in ipairs(ns.modules) do
            if m.OnEnable then
                xpcall(m.OnEnable, handler, m)
            end
        end
    end
end)

-- Memory report: PanzaUI memory before and after a garbage collection.
local function MemoryReport()
    local GetMemory = GetAddOnMemoryUsage or (C_AddOns and C_AddOns.GetAddOnMemoryUsage)
    if not GetMemory then return end
    UpdateAddOnMemoryUsage()
    local before = GetMemory(addonName)
    collectgarbage("collect")
    UpdateAddOnMemoryUsage()
    ns.Print(format("memory %.0f KB, %.0f KB after garbage collection.", before, GetMemory(addonName)))
end

-- /pui: options. /pui mem: memory report.
SLASH_PANZAUI1 = "/pui"
SlashCmdList.PANZAUI = function(msg)
    if msg and msg:lower():find("^%s*mem") then
        MemoryReport()
    else
        Settings.OpenToCategory(ns.category:GetID())
    end
end

-- Shortcuts: /rl Reload UI, /rd ready check, /pl pull timer.
SLASH_PANZAUI_RL1 = "/rl"
SlashCmdList.PANZAUI_RL = ReloadUI

SLASH_PANZAUI_RD1 = "/rd"
SlashCmdList.PANZAUI_RD = function() DoReadyCheck() end

SLASH_PANZAUI_PL1 = "/pl"
SlashCmdList.PANZAUI_PL = function() C_PartyInfo.DoCountdown(10) end
