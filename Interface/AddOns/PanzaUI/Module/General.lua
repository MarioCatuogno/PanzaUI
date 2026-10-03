--[[----------------------------------------------------------------------------
    PanzaUI - General (main settings page)
    Shared text style and bar textures.
------------------------------------------------------------------------------]]
local _, ns = ...

local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)
local DEFAULT = ""

-- PanzaUI bar textures, also registered in SharedMedia.
local MEDIA = [[Interface\AddOns\PanzaUI\Media\Statusbar\]]
local PANZA = {
    ["PanzaUI - General"] = MEDIA .. "PanzaUI_general.tga",
    ["PanzaUI - Glass"]   = MEDIA .. "PanzaUI_glass.tga",
    ["PanzaUI - Player"]  = MEDIA .. "PanzaUI_player.tga",
    ["PanzaUI - Target"]  = MEDIA .. "PanzaUI_target.tga",
    ["PanzaUI - Focus"]   = MEDIA .. "PanzaUI_focus.tga",
    ["PanzaUI - Party"]   = MEDIA .. "PanzaUI_party.tga",
    ["PanzaUI - Damage Meter"] = MEDIA .. "PanzaUI_damagemeter.tga",
    ["PanzaUI - PRD"]     = MEDIA .. "PanzaUI_prd.tga",
    ["PanzaUI - Absorb"]  = MEDIA .. "PanzaUI_absorb.tga",
    ["PanzaUI - Cast Bar"] = MEDIA .. "PanzaUI_castbar.tga",
    ["PanzaUI - Cast Bar (Full)"] = MEDIA .. "PanzaUI_castbar_full.tga",
}

-- Fallback list without SharedMedia.
local BUILTIN = {
    ["Blizzard"] = [[Interface\TargetingFrame\UI-StatusBar]],
    ["Solid"]    = [[Interface\Buttons\WHITE8X8]],
}
for name, path in pairs(PANZA) do
    BUILTIN[name] = path
    if LSM then LSM:Register("statusbar", name, path) end
end

-- Blizzard atlases usable as bar textures.
local ATLASES = {
    ["Blizzard Cooldown Manager"] = "UI-HUD-CoolDownManager-Bar",
}

-- Texture list shared by every dropdown, rebuilt when SharedMedia changes.
local textureList
if LSM then
    LSM.RegisterCallback("PanzaUI", "LibSharedMedia_Registered", function(_, mediaType)
        if mediaType == "statusbar" then textureList = nil end
    end)
end

local function TextureList()
    if textureList then return textureList end
    local names = {}
    if LSM then
        for _, name in ipairs(LSM:List("statusbar")) do names[#names + 1] = name end
    else
        for name in pairs(BUILTIN) do names[#names + 1] = name end
    end
    for name, atlas in pairs(ATLASES) do
        if C_Texture.GetAtlasInfo(atlas) then names[#names + 1] = name end
    end
    table.sort(names)

    local list = { { DEFAULT, "Blizzard UI (unchanged)" } }
    for _, name in ipairs(names) do list[#list + 1] = { name, name } end
    textureList = list
    return list
end

--------------------------------------------------------------------------------
-- Options
--------------------------------------------------------------------------------
-- old: option keys merged into this one (see Migrate).
local UNIT_BARS = {
    { key = "texFocus",      label = "Focus",        tooltip = "Texture for the bars of the Focus frame." },
    { key = "texGroup",      label = "Party/Raid",   tooltip = "Texture for the bars of the party and raid frames." },
    { key = "texPlayerPet",  label = "Player & Pet", tooltip = "Texture for the bars of the Player and Pet frames.",
      old = { "texPlayer", "texPet" } },
    { key = "texTargetBoss", label = "Target & Boss", tooltip = "Texture for the bars of the Target, Target of Target and Boss frames.",
      old = { "texTarget", "texBoss" } },
}

local OTHER_BARS = {
    { key = "texCastBar",      label = "Cast Bars",              tooltip = "Texture for the cast bars, in Blizzard's cast colors." },
    { key = "texCdmPRD",       label = "Cooldown Manager & PRD", tooltip = "Texture for the bars of the Cooldown Manager and Personal Resource Display.",
      old = { "texPRD", "texCooldownBars" } },
    { key = "texDamageMeter",  label = "Damage Meter",           tooltip = "Texture for the bars of the Damage Meter." },
    { key = "texInterface",    label = "Interface bars",         tooltip = "Texture for the progress bars of the interface.",
      bullets = { "Achievements", "Experience and reputation bars", "Quest Tracker", "Reputation panel", "Tooltips" },
      old = { "texAchievements", "texTracking", "texQuestTracker", "texRepPanel", "texTooltips" } },
}

local defaults = { textStyle = true, classColors = true }
local options  = {
    { header = "Style" },
    { key = "classColors", label = "Class colors", reload = true,
      tooltip = "Color the health bars by class or reaction." },
    { key = "textStyle", label = "Refined text", reload = true,
      tooltip = "Polish the look of text across the whole UI." },
}
local function AddTextureOptions(header, list)
    options[#options + 1] = { header = header }
    for _, o in ipairs(list) do
        defaults[o.key] = DEFAULT
        options[#options + 1] = { key = o.key, label = o.label, tooltip = o.tooltip, bullets = o.bullets,
            dropdown = TextureList, reload = true }
    end
end
AddTextureOptions("Textures - Unit Frames", UNIT_BARS)
AddTextureOptions("Textures - Other Bars", OTHER_BARS)

local GEN = ns:RegisterModule("General", { title = "General", main = true, defaults = defaults, options = options })

-- Converts the saved values of older versions.
function GEN:Migrate(db, saved)
    if type(db.barTexture) == "string" then
        for _, g in ipairs(UNIT_BARS) do
            if db[g.key] == nil then db[g.key] = db.barTexture end
        end
    end
    for k, v in pairs(db) do
        if v == "PanzaUI" then db[k] = "PanzaUI - Glass" end
    end
    for _, list in ipairs({ UNIT_BARS, OTHER_BARS }) do
        for _, g in ipairs(list) do
            if g.old and db[g.key] == nil then
                for _, oldKey in ipairs(g.old) do
                    local v = db[oldKey]
                    if type(v) == "string" and (db[g.key] == nil or db[g.key] == DEFAULT) then db[g.key] = v end
                end
            end
        end
    end
    local combat = saved and saved.PersonalResource
    if db.texCastBar == nil and combat and combat.castStyle ~= nil then
        db.texCastBar = combat.castStyle and "PanzaUI - Cast Bar" or DEFAULT
    end
    if db.textStyle == nil and saved then
        local found, on = false, false
        for name, t in pairs(saved) do
            if name ~= "General" and type(t) == "table" then
                for k, v in pairs(t) do
                    if type(v) == "boolean" and type(k) == "string" and k:lower():find("style$") then
                        found, on = true, on or v
                    end
                end
            end
        end
        if found then db.textStyle = on end
    end
    -- Up to 2.0.241 Class colors was an option of each unit frame.
    local uf = saved and saved.UnitFrames
    if db.classColors == nil and uf then
        local found, on = false, false
        for _, k in ipairs({ "playerClassColor", "targetClassColor", "focusClassColor" }) do
            if type(uf[k]) == "boolean" then found, on = true, on or uf[k] end
        end
        if found then db.classColors = on end
    end
end

--------------------------------------------------------------------------------
-- Textures (widget calls only, no Blizzard fields written)
--------------------------------------------------------------------------------
local powerBars = {}

local function TexturePath(key)
    local name = GEN.db[key]
    if name == DEFAULT then return end
    return ATLASES[name] or (LSM and LSM:Fetch("statusbar", name, true)) or BUILTIN[name]
end

-- Sets a bar texture, keeping Blizzard's draw layer.
local function SetTexture(bar, path)
    if not (bar and path and bar.SetStatusBarTexture) or bar:IsForbidden() then return end
    local fill = bar:GetStatusBarTexture()
    local layer, sublevel
    if fill then layer, sublevel = fill:GetDrawLayer() end
    if ns.IsSecret(layer) or ns.IsSecret(sublevel) then layer = nil end
    bar:SetStatusBarTexture(path)
    fill = bar:GetStatusBarTexture()
    if fill and layer then fill:SetDrawLayer(layer, sublevel) end
end

-- Puts the texture back when Blizzard sets its atlas again.
local keptTextures = {}
local function KeepTexture(bar, path)
    local texture = bar and path and bar.GetStatusBarTexture and bar:GetStatusBarTexture()
    if not texture or keptTextures[texture] then return end
    keptTextures[texture] = true
    hooksecurefunc(texture, "SetAtlas", function() SetTexture(bar, path) end)
end

-- Power spend/gain flash: same texture, tinted like the bar.
local function KeepFeedback(bar, path)
    local feedback = bar and path and bar.FeedbackFrame
    local texture = feedback and feedback.BarTexture
    if not texture or keptTextures[texture] then return end
    keptTextures[texture] = true
    local busy
    local function Reapply()
        if busy then return end
        busy = true
        if ATLASES[GEN.db.texCdmPRD] then texture:SetAtlas(path) else texture:SetTexture(path) end
        texture:SetVertexColor(bar:GetStatusBarColor())
        busy = false
    end
    hooksecurefunc(texture, "SetAtlas", Reapply)
    hooksecurefunc(texture, "SetTexture", Reapply)
    hooksecurefunc(texture, "SetVertexColor", Reapply)
    Reapply()
end

--------------------------------------------------------------------------------
-- Atlas-colored bars: texture replaced, tinted by the atlas color.
--------------------------------------------------------------------------------
local ATLAS_COLORS = { -- first match wins
    { "rested",   0.00, 0.39, 0.88 },
    { "renown",   0.00, 0.55, 0.90 },
    { "red",      0.80, 0.13, 0.13 },
    { "orange",   0.93, 0.45, 0.10 },
    { "yellow",   0.95, 0.80, 0.10 },
    { "green",    0.00, 0.70, 0.20 },
    { "blue",     0.20, 0.50, 0.95 },
    { "purple",   0.60, 0.30, 0.90 },
    { "honor",    1.00, 0.24, 0.00 },
    { "artifact", 0.90, 0.80, 0.50 },
    { "azerite",  0.90, 0.80, 0.50 },
    { "xp",       0.58, 0.00, 0.55 },
    { "experience", 0.58, 0.00, 0.55 },
}

local atlasColors = {}
local function AtlasColor(atlas)
    -- Secret names are never used as cache keys.
    if ns.IsSecret(atlas) or type(atlas) ~= "string" then return end
    local cached = atlasColors[atlas]
    if cached ~= nil then return cached or nil end
    local name = atlas:lower()
    name = name:match("fill%-(.+)") or name
    local found = false
    for _, c in ipairs(ATLAS_COLORS) do
        if name:find(c[1], 1, true) then found = c break end
    end
    atlasColors[atlas] = found
    return found or nil
end

-- The original atlas is kept as a mask (or a square inset mask).
local trackedBars = {}
local function TrackTexture(bar, path, inset)
    if not (bar and path and bar.SetStatusBarTexture) or trackedBars[bar] then return end
    trackedBars[bar] = true

    local mask, masked = nil, {}
    if inset then
        mask = bar:CreateMaskTexture()
        mask:SetTexture([[Interface\Buttons\WHITE8X8]], "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
        mask:SetPoint("TOPLEFT", inset, -inset)
        mask:SetPoint("BOTTOMRIGHT", -inset, inset)
        if bar.Background then bar.Background:AddMaskTexture(mask) end
    end
    local function EnsureMask(atlas)
        if not mask and not ns.IsSecret(atlas) and type(atlas) == "string" and C_Texture.GetAtlasInfo(atlas) then
            mask = bar:CreateMaskTexture()
            mask:SetAtlas(atlas)
            mask:SetAllPoints(bar)
        end
        local fill = bar:GetStatusBarTexture()
        if mask and fill and not masked[fill] then
            fill:AddMaskTexture(mask)
            masked[fill] = true
        end
    end

    local original = bar:GetStatusBarTexture()
    local layer, sublevel
    if original then layer, sublevel = original:GetDrawLayer() end
    if ns.IsSecret(layer) or ns.IsSecret(sublevel) then layer = nil end

    local busy
    local function Reapply(atlas)
        if busy then return end
        busy = true
        EnsureMask(atlas)
        bar:SetStatusBarTexture(path)
        local fill = bar:GetStatusBarTexture()
        if fill and layer then fill:SetDrawLayer(layer, sublevel) end
        EnsureMask()
        local c = AtlasColor(atlas)
        if c then bar:SetStatusBarColor(c[2], c[3], c[4]) end
        busy = false
    end

    local texture = bar:GetStatusBarTexture()
    Reapply(texture and texture.GetAtlas and texture:GetAtlas())
    hooksecurefunc(bar, "SetStatusBarTexture", function(_, asset) Reapply(asset) end)
    if texture then hooksecurefunc(texture, "SetAtlas", function(_, atlas) Reapply(atlas) end) end
end

-- Unit frame power bars: texture and power color after Blizzard's update.
local function UpdatePowerBar(bar)
    local path = powerBars[bar]
    if not path then return end
    SetTexture(bar, path)
    local token = bar.powerToken
    local info = bar.overrideInfo or (not ns.IsSecret(token) and token and PowerBarColor[token])
    if info and info.r then bar:SetStatusBarColor(info.r, info.g, info.b) end
end

local function UnitFrameBars(frame)
    local main = frame.TargetFrameContent and frame.TargetFrameContent.TargetFrameContentMain
    if main then return main.HealthBarsContainer.HealthBar, main.ManaBar end
    local container = frame.HealthBarContainer or frame.HealthBarsContainer
    local health = container and (container.HealthBar or container.healthBar) or frame.healthbar or frame.HealthBar
    return health, frame.ManaBar or frame.manabar
end

local function SkinBars(health, power, path)
    if not path then return end
    SetTexture(health, path)
    KeepTexture(health, path)
    if power then
        powerBars[power] = path
        UpdatePowerBar(power)
    end
end

-- Target of Target bars: texture kept, power color set by power type.
local totPower = {} -- { bar, unit } pairs
local totColor = {} -- power bar -> PowerBarColor entry

local function ColorToTPower()
    for i = 1, #totPower, 2 do
        local bar, unit = totPower[i], ns.GroupUnit(totPower[i + 1])
        local _, token = UnitPowerType(unit)
        local c = not ns.IsSecret(token) and token and PowerBarColor[token]
        if c then
            totColor[bar] = c
            bar:SetStatusBarColor(c.r, c.g, c.b)
        end
    end
end

-- Keeps the texture and power color through Blizzard's updates.
local function KeepToTPower(bar, path)
    local busy
    local function Recolor()
        local c = totColor[bar]
        if c then bar:SetStatusBarColor(c.r, c.g, c.b) end
    end
    local function Reapply()
        if busy then return end
        busy = true
        SetTexture(bar, path)
        Recolor()
        busy = false
    end
    Reapply()
    hooksecurefunc(bar, "SetStatusBarTexture", Reapply)
    hooksecurefunc(bar, "SetStatusBarColor", function()
        if busy then return end
        busy = true
        Recolor()
        busy = false
    end)
    local texture = bar:GetStatusBarTexture()
    if texture then hooksecurefunc(texture, "SetAtlas", Reapply) end
end

local totEvents = CreateFrame("Frame")
totEvents:SetScript("OnEvent", function() ns.Defer(ColorToTPower) end)

local function SkinToT(frame, path, unit)
    local tot = frame and path and (frame.totFrame or _G[frame:GetName() .. "ToT"])
    if not tot then return end
    local health = tot.HealthBar or tot.healthbar or tot.healthBar
    if health then
        SetTexture(health, path)
        KeepTexture(health, path)
    end
    local power = tot.ManaBar or tot.manabar or tot.manaBar
    if power then
        KeepToTPower(power, path)
        totPower[#totPower + 1] = power
        totPower[#totPower + 1] = unit
        totEvents:RegisterEvent("PLAYER_TARGET_CHANGED")
        totEvents:RegisterEvent("PLAYER_FOCUS_CHANGED")
        totEvents:RegisterUnitEvent("UNIT_TARGET", "target", "focus")
    end
end

-- Health and power bars of a unit frame.
local function SkinFrame(frame, path)
    if not (frame and path) then return end
    local health, power = UnitFrameBars(frame)
    SkinBars(health, power, path)
end

--------------------------------------------------------------------------------
-- Cast bars: texture kept, tinted by cast type.
--------------------------------------------------------------------------------
local CAST_COLORS = { -- first match wins
    { "uninterrupt", 0.60, 0.60, 0.60 },
    { "interrupt",   0.85, 0.15, 0.15 },
    { "channel",     0.25, 0.80, 0.35 },
    { "empower",     0.30, 0.60, 1.00 },
    { "craft",       0.95, 0.55, 0.10 },
    { "",            1.00, 0.72, 0.10 }, -- standard cast
}
local castColors = {}

local function CastColor(asset)
    local color = castColors[asset]
    if color then return color end
    local name = asset:lower()
    for _, c in ipairs(CAST_COLORS) do
        if name:find(c[1], 1, true) then color = c break end
    end
    castColors[asset] = color
    return color
end

local castTexture, castBusy
local castBarColor = {}

local function KeepCastColor(bar)
    local c = castBarColor[bar]
    if castBusy or not c then return end
    castBusy = true
    bar:SetStatusBarColor(c[2], c[3], c[4])
    castBusy = false
end

-- Cast type from the bar type or the atlas name (secrets keep Blizzard's).
local function KeepCastTexture(bar, asset)
    if castBusy then return end
    local kind = bar.barType
    if ns.IsSecret(kind) or type(kind) ~= "string" then kind = asset end
    if ns.IsSecret(kind) or type(kind) ~= "string" then
        castBarColor[bar] = nil
        return
    end
    castBusy = true
    SetTexture(bar, castTexture)
    castBusy = false
    castBarColor[bar] = CastColor(kind)
    KeepCastColor(bar)
end

local function SkinCastBar(bar)
    hooksecurefunc(bar, "SetStatusBarTexture", KeepCastTexture)
    hooksecurefunc(bar, "SetStatusBarColor", KeepCastColor)
end

--------------------------------------------------------------------------------
-- Text style for other Blizzard texts (panels, counters, waypoint).
--------------------------------------------------------------------------------

-- Scrolling lists of a panel: each row styled when Blizzard sets it up.
local function StyleListRow(row) ns.StyleAllFonts(row, 2, true) end

local function HookScrollBoxes(levels, ...)
    for i = 1, select("#", ...) do
        local child = select(i, ...)
        if child.ScrollTarget and child.GetView then
            pcall(ScrollUtil.AddInitializedFrameCallback, child, ns.ScrollFrameCallback(StyleListRow), ns, false)
        elseif levels > 0 then
            HookScrollBoxes(levels - 1, child:GetChildren())
        end
    end
end

-- Buttons swap font on hover or when selected, so every font of the button
-- gets an outlined copy (once per button).
local BUTTON_FONTS = { "Normal", "Highlight", "Disabled" }
local styledButtons = {}

local function StyleButtonFonts(button)
    if not button or styledButtons[button] then return end
    styledButtons[button] = true
    for _, kind in ipairs(BUTTON_FONTS) do
        local font = button["Get" .. kind .. "FontObject"] and button["Get" .. kind .. "FontObject"](button)
        local copy = ns.OutlinedFont(font)
        if copy then button["Set" .. kind .. "FontObject"](button, copy) end
    end
    ns.StyleFont(button.Text or (button.GetFontString and button:GetFontString()))
end

local function StyleTabs(panel)
    if panel.Tabs then
        for _, tab in ipairs(panel.Tabs) do StyleButtonFonts(tab) end
        return
    end
    local name = panel:GetName()
    local i = 1
    while name and _G[name .. "Tab" .. i] do
        StyleButtonFonts(_G[name .. "Tab" .. i])
        i = i + 1
    end
end

-- Path of a child frame ("Container.ScrollBox").
local function ChildAt(root, path)
    for key in path:gmatch("[^.]+") do root = root and root[key] end
    return root
end

-- Blizzard panels: restyled on the next frame after they open or change page
-- (methods of the panel, { child path, method } or global functions); dark
-- texts are skipped.
-- Load-on-demand panels are set up when their addon loads.
local function StylePanel(addon, name, levels, pageHooks, scrollLists)
    local function Setup()
        local panel = _G[name]
        if not panel then return end
        local function Restyle()
            if panel:IsShown() then ns.StyleAllFonts(panel, levels, true) end
        end
        local function Queue() ns.Defer(Restyle) end
        panel:HookScript("OnShow", Queue)
        for _, func in ipairs(pageHooks) do
            if type(func) == "table" then
                ns.Hook(ChildAt(panel, func[1]), func[2], Queue)
            elseif panel[func] then
                ns.Hook(panel, func, Queue)
            else
                ns.Hook(func, Queue)
            end
        end
        if scrollLists and ScrollUtil then HookScrollBoxes(levels, panel:GetChildren()) end
        StyleTabs(panel)
        if panel:IsShown() then Queue() end
    end
    if _G[name] then Setup() else EventUtil.ContinueOnAddOnLoaded(addon, Setup) end
end

local function StyleBlizzardTexts()
    local fps = FramerateFrame
    if fps then
        ns.StyleFont(fps.Label)
        ns.StyleFont(fps.FramerateText)
    end
    ns.StyleFont(FramerateLabel) -- older global names
    ns.StyleFont(FramerateText)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_QuestNavigation", function()
        local nav = SuperTrackedFrame
        if nav then ns.StyleFont(nav.DistanceText) end
    end)

    -- Game Menu: title and buttons (made from a pool when the menu opens).
    local menu = GameMenuFrame
    if menu then
        ns.StyleFont(menu.Header and menu.Header.Text)
        local function StyleMenuButtons()
            if not menu.buttonPool then return end
            for button in menu.buttonPool:EnumerateActive() do StyleButtonFonts(button) end
        end
        menu:HookScript("OnShow", StyleMenuButtons)
        ns.Hook(menu, "InitButtons", StyleMenuButtons)
    end

    -- Bag titles.
    local bags = { ContainerFrameCombinedBags }
    for i = 1, NUM_CONTAINER_FRAMES or 13 do bags[#bags + 1] = _G["ContainerFrame" .. i] end
    for _, bag in pairs(bags) do
        local titles = bag.TitleContainer
        ns.StyleFont(titles and titles.TitleText or _G[bag:GetName() .. "Name"])
    end

    -- Tooltips: shared font objects, so every tooltip line follows them.
    for _, font in ipairs({ GameTooltipHeaderText, GameTooltipText, GameTooltipTextSmall }) do
        local path, size = font:GetFont()
        if path then font:SetFont(path, size, ns.FONT_FLAGS) end
    end

    local title = CharacterFrame and CharacterFrame.TitleContainer and CharacterFrame.TitleContainer.TitleText
    ns.StyleFont(title or CharacterFrameTitleText)
    ns.StyleFont(CharacterLevelText)
    if CharacterFrame then StyleTabs(CharacterFrame) end

    -- Reputation and Currency tabs: scrolling lists, each row styled when
    -- Blizzard sets it up (texts already styled are skipped).
    local function StyleRow(row) ns.StyleAllFonts(row, 2) end
    for _, panel in ipairs({ ReputationFrame, TokenFrame }) do
        local box = panel and panel.ScrollBox
        if box and ScrollUtil then
            ScrollUtil.AddInitializedFrameCallback(box, ns.ScrollFrameCallback(StyleRow), ns, true)
        end
        if panel then ns.StyleAllFonts(panel, 1) end
    end

    -- Character stats: rows are made and updated by Blizzard's stats update.
    local stats = CharacterStatsPane
    if stats then
        local function RestyleStats() ns.StyleAllFonts(stats, 3) end
        ns.Hook("PaperDollFrame_UpdateStats", function() ns.Defer(RestyleStats) end)
    end

    -- Inspect, Talents / specialization, Professions, Adventure Guide, Mail,
    -- World Map (title and zone bar, not the map pins), Quest Log and Options
    -- (post-hooks only, no Blizzard callbacks: the Options panel stays taint-free).
    StylePanel("Blizzard_InspectUI", "InspectFrame", 4, { "InspectSwitchTabs" })
    StylePanel("Blizzard_PlayerSpells", "PlayerSpellsFrame", 4, { "SetTab" })
    StylePanel("Blizzard_ProfessionsBook", "ProfessionsBookFrame", 5, {})
    StylePanel("Blizzard_EncounterJournal", "EncounterJournal", 6, { "EJ_ContentTab_Select",
        "EncounterJournal_ListInstances", "EncounterJournal_DisplayInstance", "EncounterJournal_DisplayEncounter" }, true)
    StylePanel("Blizzard_MailFrame", "MailFrame", 4, { "InboxFrame_Update", "MailFrameTab_OnClick" })
    StylePanel("Blizzard_MailFrame", "OpenMailFrame", 4, { "OpenMail_Update" })
    StylePanel("Blizzard_WorldMap", "WorldMapFrame", 3, { "OnMapChanged", "NavBar_AddButton" })
    StylePanel("Blizzard_WorldMap", "QuestMapFrame", 6, { "QuestLogQuests_Update" })
    StylePanel("Blizzard_Settings", "SettingsPanel", 7, { "DisplayCategory",
        { "Container.SettingsList.ScrollBox", "SetScrollPercentage" },
        { "CategoryList.ScrollBox", "SetScrollPercentage" } })
    local settings = SettingsPanel
    if settings then
        StyleButtonFonts(settings.GameTab)
        StyleButtonFonts(settings.AddOnsTab)
        StyleButtonFonts(settings.CloseButton)
        StyleButtonFonts(ChildAt(settings, "Container.SettingsList.Header.DefaultsButton"))
    end

    -- Social panel: Contacts, Who, Raid and Quick Join, with the Friends /
    -- Recent Allies / Recruit A Friend tabs and the bottom buttons.
    StylePanel("Blizzard_FriendsFrame", "FriendsFrame", 6, { "FriendsFrame_Update", "FriendsList_Update" }, true)
    if FriendsTabHeader then StyleTabs(FriendsTabHeader) end
    StyleButtonFonts(FriendsFrameAddFriendButton)
    StyleButtonFonts(FriendsFrameSendMessageButton)
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function GEN:OnEnable()
    if ns.textStyle then StyleBlizzardTexts() end
    local player, target, focus = TexturePath("texPlayerPet"), TexturePath("texTargetBoss"), TexturePath("texFocus")
    local group, interface = TexturePath("texGroup"), TexturePath("texInterface")

    -- Unit frames: Player & Pet, Target & Boss (and every Target of Target), Focus.
    SkinBars(PlayerFrame_GetHealthBar(), PlayerFrame_GetManaBar(), player)
    SkinBars(PetFrameHealthBar, PetFrameManaBar, player)
    SkinFrame(TargetFrame, target)
    SkinFrame(FocusFrame, focus)
    SkinToT(TargetFrame, target, "targettarget")
    SkinToT(FocusFrame, target, "focustarget")
    if target then
        for i = 1, 5 do SkinFrame(_G["Boss" .. i .. "TargetFrame"], target) end
    end
    if next(powerBars) then ns.Hook("UnitFrameManaBar_UpdateType", UpdatePowerBar) end

    castTexture = TexturePath("texCastBar")
    if castTexture then ns.ForEachCastBar(SkinCastBar) end

    local prd = TexturePath("texCdmPRD")
    if prd then
        local function SkinPRD()
            local frame = PersonalResourceDisplayFrame
            if not frame then return end
            local container = frame.HealthBarsContainer
            local health = container and (container.healthBar or container.HealthBar)
            SetTexture(health, prd)
            KeepTexture(health, prd)
            SetTexture(frame.PowerBar, prd)
            KeepTexture(frame.PowerBar, prd)
            KeepFeedback(frame.PowerBar, prd)
            -- Alternate power bar, set up again on spec changes.
            local function SkinAlt(f) TrackTexture(f.AlternatePowerBar, prd) end
            SkinAlt(frame)
            ns.Hook(frame, "SetupAlternatePowerBar", SkinAlt)
        end
        if PersonalResourceDisplayFrame then
            SkinPRD()
        else
            EventUtil.ContinueOnAddOnLoaded("Blizzard_PersonalResourceDisplay", SkinPRD)
        end
    end

    -- Reputation panel.
    local scrollBox = ReputationFrame and ReputationFrame.ScrollBox
    if interface and scrollBox and ScrollUtil then
        ScrollUtil.AddInitializedFrameCallback(scrollBox, ns.ScrollFrameCallback(function(entry)
            local content = entry.Content or entry
            TrackTexture(content.ReputationBar or entry.ReputationBar, interface, 2)
        end), self, true)
    end

    -- Achievement window and criteria bars (children walked as varargs).
    if interface then
        local Scan
        local function ScanChildren(...)
            for i = 1, select("#", ...) do
                local child = select(i, ...)
                if child:IsObjectType("StatusBar") then TrackTexture(child, interface, 2) end
                Scan(child)
            end
        end
        function Scan(frame) ScanChildren(frame:GetChildren()) end
        EventUtil.ContinueOnAddOnLoaded("Blizzard_AchievementUI", function()
            AchievementFrame:HookScript("OnShow", Scan)
            ns.Hook(AchievementFrameAchievementsObjectives, "GetProgressBar", function(objectives)
                local bars = objectives.progressBars
                if not bars then return end
                for _, bar in pairs(bars) do
                    if type(bar) == "table" and bar.IsObjectType and bar:IsObjectType("StatusBar") then
                        TrackTexture(bar, interface, 2)
                    end
                end
            end)
            if AchievementFrame:IsShown() then Scan(AchievementFrame) end
        end)
    end

    -- Quest Tracker progress and timer bars.
    if interface then
        local function TrackPool(pool)
            if not pool then return end
            for _, bar in pairs(pool) do
                if type(bar) == "table" then TrackTexture(bar.Bar or bar, interface) end
            end
        end
        EventUtil.ContinueOnAddOnLoaded("Blizzard_ObjectiveTracker", function()
            for _, name in ipairs({
                "ScenarioObjectiveTracker", "UIWidgetObjectiveTracker", "CampaignQuestObjectiveTracker",
                "QuestObjectiveTracker", "AdventureObjectiveTracker", "AchievementObjectiveTracker",
                "MonthlyActivitiesObjectiveTracker", "InitiativeTasksObjectiveTracker",
                "ProfessionsRecipeTracker", "BonusObjectiveTracker", "WorldQuestObjectiveTracker",
            }) do
                local module = _G[name]
                if module then
                    TrackPool(module.usedProgressBars)
                    TrackPool(module.usedTimerBars)
                    ns.Hook(module, "GetProgressBar", function(m) TrackPool(m.usedProgressBars) end)
                    ns.Hook(module, "GetTimerBar",    function(m) TrackPool(m.usedTimerBars) end)
                end
            end
        end)
    end

    -- Tooltip progress and status bars.
    if interface then
        local function TrackTooltipPool(tooltip, poolKey)
            local pool = tooltip and tooltip[poolKey]
            if not pool then return end
            local active = pool.activeObjects
            if active then
                for bar in pairs(active) do TrackTexture(bar.Bar or bar, interface, 1) end
            elseif pool.EnumerateActive then
                for bar in pool:EnumerateActive() do TrackTexture(bar.Bar or bar, interface, 1) end
            end
        end
        ns.Hook("GameTooltip_ShowProgressBar", function(tooltip) TrackTooltipPool(tooltip, "progressBarPool") end)
        ns.Hook("GameTooltip_ShowStatusBar",   function(tooltip) TrackTooltipPool(tooltip, "statusBarPool") end)
    end

    -- Cooldown Manager bars.
    if prd then
        ns.OnCooldownItem(function(item) TrackTexture(item.Bar, prd) end)
    end

    -- Damage Meter bars.
    local damageMeter = TexturePath("texDamageMeter")
    if damageMeter then
        ns.OnDamageMeterEntry(function(entry) TrackTexture(entry.StatusBar, damageMeter) end)
    end

    -- Experience, reputation and honor bars.
    if interface then
        local containers = { MainStatusTrackingBarContainer, SecondaryStatusTrackingBarContainer }
        local function ScanTracking()
            for _, container in ipairs(containers) do
                local bars = container.bars
                if bars then
                    for _, bar in pairs(bars) do
                        if type(bar) == "table" then TrackTexture(bar.StatusBar, interface) end
                    end
                end
            end
        end
        ScanTracking()
        for _, container in ipairs(containers) do
            ns.Hook(container, "UpdateBarsShown", ScanTracking)
        end
    end

    if group then
        -- Party frames (classic and compact).
        for i = 1, 4 do
            local frame = PartyFrame and PartyFrame["MemberFrame" .. i]
            if frame then SkinFrame(frame, group) end
        end
        local function SkinCompact(frame)
            if frame:IsForbidden() then return end
            SetTexture(frame.healthBar, group)
            SetTexture(frame.powerBar, group)
        end
        ns.ForEachCompactFrame(SkinCompact)
        ns.Hook("DefaultCompactUnitFrameSetup", SkinCompact)
        ns.Hook("DefaultCompactMiniFrameSetup", SkinCompact)
    end
end
