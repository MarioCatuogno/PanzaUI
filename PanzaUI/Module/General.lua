--[[----------------------------------------------------------------------------
    PanzaUI - General (main settings page)
    Text style, class colors, borders, bar textures and profile import.
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
    { key = "texCastBar",      label = "Cast Bars",              tooltip = "Texture for the cast bars.",
      bullets = { "Colored by cast type" } },
    { key = "texCdmPRD",       label = "Cooldown Manager & PRD", tooltip = "Texture for the bars of the Cooldown Manager and Personal Resource Display.",
      old = { "texPRD", "texCooldownBars" } },
    { key = "texDamageMeter",  label = "Damage Meter",           tooltip = "Texture for the bars of the Damage Meter." },
    { key = "texInterface",    label = "Interface bars",         tooltip = "Texture for the progress bars of the interface.",
      bullets = { "Achievements", "Experience and reputation bars", "Quest Tracker", "Reputation panel", "Tooltips",
                  "Progress bars of events and NPCs" },
      old = { "texAchievements", "texTracking", "texQuestTracker", "texRepPanel", "texTooltips" } },
}

-- Profiles: the PanzaUI Edit Mode layout, saved as "PanzaUI" (replacing an
-- older copy) and made active.
local function ImportEditMode()
    local info = not InCombatLockdown() and C_EditMode.ConvertStringToLayoutInfo(ns.EDIT_MODE_LAYOUT)
    if not info then
        ns.Print("The Edit Mode layout can't be imported now (in combat or invalid).")
        return
    end
    info.layoutName, info.layoutType = "PanzaUI", Enum.EditModeLayoutType.Account

    -- Blizzard's index: preset layouts first, then the saved ones.
    local saved = C_EditMode.GetLayouts()
    local presets = Enum.EditModePresetLayoutsMeta.NumValues
    local index, lastAccount
    for i, layout in ipairs(saved.layouts) do
        if layout.layoutName == "PanzaUI" then index = i end
        if layout.layoutType == Enum.EditModeLayoutType.Account then lastAccount = i end
    end
    if index then
        saved.layouts[index] = info
    else -- account layouts come before character ones
        index = (lastAccount or 0) + 1
        table.insert(saved.layouts, index, info)
    end
    C_EditMode.SaveLayouts(saved)
    C_EditMode.SetActiveLayout(presets + index)
    ns.Print("Edit Mode layout imported: type /rl to finish.")
end

-- Platynator: imported with its own API, saved as "PanzaUI" and made active.
local function ImportPlatynator()
    local api = Platynator and Platynator.API
    if InCombatLockdown() or not (api and api.ImportString) then
        ns.Print("The Platynator profile can't be imported now (in combat or Platynator not loaded).")
        return
    end
    if pcall(api.ImportString, ns.PLATYNATOR_PROFILE, "PanzaUI") then
        ns.Print("Platynator profile imported.")
    else
        ns.Print("The Platynator profile can't be read.")
    end
end

-- BigWigs: handed to its own import, which asks for confirmation.
local function ImportBigWigs()
    local api = BigWigsAPI
    if InCombatLockdown() or not (api and api.RegisterProfile) then
        ns.Print("The BigWigs profile can't be imported now (in combat or BigWigs not loaded).")
        return
    end
    if not pcall(api.RegisterProfile, "PanzaUI", ns.BIGWIGS_PROFILE, "PanzaUI") then
        ns.Print("The BigWigs profile can't be read.")
    end
end

-- Confirmation before an import; data is the import function.
StaticPopupDialogs["PANZAUI_IMPORT_PROFILE"] = {
    text = "Import the PanzaUI profile for %s?\nAn older PanzaUI profile will be replaced.",
    button1 = YES, button2 = NO,
    OnAccept = function(_, import) import() end,
    timeout = 0, whileDead = true, hideOnEscape = true,
}
local function ConfirmImport(target, import)
    return function() StaticPopup_Show("PANZAUI_IMPORT_PROFILE", target, nil, import) end
end

local defaults = { textStyle = true, classColors = true, refinedBorders = true }
local options  = {
    { header = "Profiles" },
    { label = "Blizzard Edit Mode", button = "Import", onClick = ConfirmImport("Edit Mode", ImportEditMode),
      tooltip = "Import the PanzaUI layout of the interface frames.",
      bullets = { "Saved as PanzaUI and made active" } },
    { label = "Platynator", button = "Import", onClick = ConfirmImport("Platynator", ImportPlatynator),
      tooltip = "Import the PanzaUI profile of the Platynator nameplates.",
      bullets = { "Saved as PanzaUI and made active" } },
    { label = "BigWigs", button = "Import", onClick = ImportBigWigs,
      tooltip = "Import the PanzaUI profile of the BigWigs boss alerts.",
      bullets = { "Confirmed in a BigWigs window" } },
    { header = "Style" },
    { key = "classColors", label = "Class colors", reload = true,
      tooltip = "Color the health bars by class or reaction." },
    { key = "refinedBorders", label = "Refined borders", reload = true,
      tooltip = "Polish the look of borders across the whole UI." },
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

-- Texture file of the Cooldown Manager bars, for other addons' bars (nil for
-- Blizzard's own textures).
function ns.CooldownBarTexture()
    if ATLASES[GEN.db.texCdmPRD] then return end
    return TexturePath("texCdmPRD")
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

-- Widget progress bars (events, NPCs): interface texture, set up with each
-- bar (Blizzard sets the color after the fill, so the fill color goes back).
local widgetTexture -- set in OnEnable
if UIWidgetTemplateStatusBarMixin then
    hooksecurefunc(UIWidgetTemplateStatusBarMixin, "Setup", function(widget)
        local bar = widgetTexture and not widget:IsForbidden() and widget.Bar
        if not bar then return end
        TrackTexture(bar, widgetTexture)
        local c = AtlasColor(bar.lastFillAtlas)
        if c then bar:SetStatusBarColor(c[2], c[3], c[4]) end
    end)
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

-- Health bars not class colored: Blizzard's green is baked in its atlas, so
-- the new texture is tinted green (again when Blizzard sets the atlas).
local HEALTH_GREEN = { 0.00, 0.70, 0.20 }
local function TintHealth(bar)
    bar:SetStatusBarColor(HEALTH_GREEN[1], HEALTH_GREEN[2], HEALTH_GREEN[3])
end

local function SkinBars(health, power, path, tint)
    if not path then return end
    SetTexture(health, path)
    KeepTexture(health, path)
    local fill = tint and health and health:GetStatusBarTexture()
    if fill then
        TintHealth(health)
        hooksecurefunc(fill, "SetAtlas", function() TintHealth(health) end)
    end
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
local function SkinFrame(frame, path, tint)
    if not (frame and path) then return end
    local health, power = UnitFrameBars(frame)
    SkinBars(health, power, path, tint)
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
-- Text style for Blizzard texts: every shared font object gets the outlined
-- style, so all texts using it follow (panels, tooltips, menus, lists).
-- Dark and parchment fonts and thick outlines keep their own flags; fonts of
-- load-on-demand addons are styled when they load.
--------------------------------------------------------------------------------
local seenFonts, keptFonts = {}, {}

-- Parchment fonts: Blizzard colors their texts dark at runtime (quest details,
-- mail, books), so they are kept by name.
local PARCHMENT_FONTS = { "^QuestFont", "^QuestTitleFont", "^MailTextFont", "^InvoiceTextFont", "^ItemTextFont" }

-- Fonts of other addons keep their own style: only Blizzard's fonts (secure
-- globals) are styled. Nameplate addons are also excluded by name.
local OTHER_FONTS = { "^Platynator" }

local function MatchAny(name, patterns)
    for _, pattern in ipairs(patterns) do
        if name:find(pattern) then return true end
    end
    return false
end

local function IsParchment(name)
    return type(name) == "string" and MatchAny(name, PARCHMENT_FONTS)
end

local function StyleSharedFonts()
    -- New fonts: kept ones remember their own flags (read before any change
    -- in this pass; our flags left by a styled parent count as none).
    local styled = {}
    for _, name in ipairs(GetFonts()) do
        local font = type(name) == "string" and _G[name] or name
        if type(font) == "table" and font.GetFont and not seenFonts[font] then
            seenFonts[font] = true
            local other = type(name) == "string"
                and (MatchAny(name, OTHER_FONTS) or (issecurevariable and not issecurevariable(name)))
            local path, _, flags = font:GetFont()
            local r, g, b = font:GetTextColor()
            if path and not other then
                flags = flags or ""
                if IsParchment(name) or (r and r + g + b < 1) or flags:find("THICK") then
                    keptFonts[font] = flags:find("SLUG") and "" or flags
                else
                    styled[#styled + 1] = font
                end
            end
        end
    end
    for _, font in ipairs(styled) do
        local path, size = font:GetFont()
        font:SetFont(path, size, ns.FONT_FLAGS)
    end
    -- Inherited fonts follow their parent, so kept fonts get their flags back.
    for font, flags in pairs(keptFonts) do
        local path, size, current = font:GetFont()
        if current ~= flags then font:SetFont(path, size, flags) end
    end
end

-- Texts colored dark on parchment by Blizzard (quest details, spellbook):
-- each one is outlined only while it is light.
local function FitOutline(region)
    if not region or region:GetObjectType() ~= "FontString" then return end
    local path, size, flags = region:GetFont()
    local r, g, b = region:GetTextColor()
    if ns.IsSecret(path) or not path or ns.IsSecret(r) or ns.IsSecret(g) or ns.IsSecret(b) or ns.IsSecret(flags) then return end
    local light = r + g + b >= 1
    local outlined = flags and flags:find("OUTLINE") ~= nil
    if light ~= outlined then region:SetFont(path, size, light and ns.FONT_FLAGS or "") end
end

local function FitFrameOutlines(frame, levels)
    if not frame then return end
    for _, region in ipairs({ frame:GetRegions() }) do FitOutline(region) end
    if levels > 0 then
        for _, child in ipairs({ frame:GetChildren() }) do FitFrameOutlines(child, levels - 1) end
    end
end

local function FitQuestInfo()
    FitFrameOutlines(QuestInfoFrame, 2)
    FitFrameOutlines(QuestInfoRewardsFrame, 2)
    FitFrameOutlines(MapQuestInfoRewardsFrame, 2)
end

-- Spellbook: spell names, headers and page number, as Blizzard sets them up.
-- Archaeology: parchment texts colored dark by the panel itself; each page
-- is checked when it shows.
local function SetupArchaeology()
    local panel = ArchaeologyFrame
    if not panel then return end
    local function FitPanel() FitFrameOutlines(panel, 5) end
    local function Queue() ns.Defer(FitPanel) end
    panel:HookScript("OnShow", Queue)
    for _, key in ipairs({ "summaryPage", "completedPage", "artifactPage", "helpPage" }) do
        local page = panel[key]
        if page then page:HookScript("OnShow", Queue) end
    end
    if panel:IsShown() then Queue() end
end

local function SetupSpellBook()
    ns.Hook(SpellBookItemMixin, "UpdateVisuals", function(item)
        FitOutline(item.Name)
        FitOutline(item.SubName)
        FitOutline(item.RequiredLevel)
    end)
    ns.Hook(SpellBookHeaderMixin, "Init", function(header) FitOutline(header.Text) end)
    local book = PlayerSpellsFrame and PlayerSpellsFrame.SpellBookFrame
    local pages = book and book.PagedSpellsFrame
    if not pages then return end
    local function FitPages() FitFrameOutlines(pages, 4) end
    book:HookScript("OnShow", function() ns.Defer(FitPages) end)
end

-- Texts colored dark at runtime (achievements, parchment pages): the outline
-- is removed while they are dark and put back when they turn light again.
-- Nameplates are left to their own addons.
local DARK = 0.4 -- brightest channel of a dark color
local removedOutline = setmetatable({}, { __mode = "k" }) -- text -> its flags

local function OnNamePlate(region)
    local parent = region:GetParent()
    for _ = 1, 10 do
        if not parent then return false end
        if parent:IsForbidden() then return true end
        if parent.namePlateUnitToken or parent.UnitFrame then return true end
        local name = parent:GetName()
        if type(name) == "string" and name:find("^NamePlate") then return true end
        parent = parent:GetParent()
    end
    return false
end

local function FitTextColor(text, r, g, b)
    if ns.IsSecret(r) or ns.IsSecret(g) or ns.IsSecret(b) or not (r and g and b) then return end
    local dark, flags = math.max(r, g, b) < DARK, removedOutline[text]
    if not dark and not flags then return end -- light text never changed
    if text:IsForbidden() or (dark and OnNamePlate(text)) then return end
    local path, size, current = text:GetFont()
    if ns.IsSecret(path) or not path or ns.IsSecret(current) then return end
    local outlined = current and current:find("OUTLINE") ~= nil
    if dark then
        if outlined then
            removedOutline[text] = current
            text:SetFont(path, size, "")
        end
    else
        removedOutline[text] = nil
        if not outlined then text:SetFont(path, size, flags) end
    end
end

local function StyleBlizzardTexts()
    if not GetFonts then return end
    StyleSharedFonts()
    local fontString = UIParent:CreateFontString()
    hooksecurefunc(getmetatable(fontString).__index, "SetTextColor", FitTextColor)
    local loader = CreateFrame("Frame")
    loader:RegisterEvent("ADDON_LOADED")
    loader:SetScript("OnEvent", function() ns.Defer(StyleSharedFonts) end)
    ns.Hook("QuestInfo_Display", function() ns.Defer(FitQuestInfo) end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_PlayerSpells", SetupSpellBook)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_ArchaeologyUI", SetupArchaeology)
end

--------------------------------------------------------------------------------
-- Refined borders: Blizzard panel icons in the action bar style.
--------------------------------------------------------------------------------
local PROFESSION_BUTTONS = {
    PrimaryProfession1 = { "SpellButtonTop", "SpellButtonBottom" },
    PrimaryProfession2 = { "SpellButtonTop", "SpellButtonBottom" },
    SecondaryProfession1 = { "SpellButtonLeft", "SpellButtonRight" },
    SecondaryProfession2 = { "SpellButtonLeft", "SpellButtonRight" },
    SecondaryProfession3 = { "SpellButtonLeft", "SpellButtonRight" },
}

local function StyleProfessionIcons()
    for frame, buttons in pairs(PROFESSION_BUTTONS) do
        for _, suffix in ipairs(buttons) do
            local button = _G[frame .. suffix]
            if button then ns.StyleIcon(button.IconTexture, button) end
        end
    end
end

-- Tooltips: the PanzaUI border instead of Blizzard's frame, scaled down to
-- the icon frame size. The background is inset to stay inside the corners;
-- both are set again when Blizzard changes the tooltip style.
local NINESLICE_PIECES = { "TopLeftCorner", "TopRightCorner", "BottomLeftCorner", "BottomRightCorner",
    "TopEdge", "BottomEdge", "LeftEdge", "RightEdge" }
local TOOLTIP_SCALE, TOOLTIP_INSET = 0.2, 3
-- Tooltips styled once at login too: some (eg. the options and AddOns list
-- ones) set their look only when created.
local TOOLTIPS = { "GameTooltip", "ItemRefTooltip", "ShoppingTooltip1", "ShoppingTooltip2",
    "ItemRefShoppingTooltip1", "ItemRefShoppingTooltip2", "SettingsTooltip", "AddonTooltip" }
local tooltipBorders = {}

local function TooltipBorder(nineSlice)
    local border = nineSlice:CreateTexture(nil, "BORDER", nil, 7)
    local m, pad = ns.BORDER.margin, ns.BORDER.padding
    border:SetTexture(ns.BORDER.file)
    border:SetTextureSliceMargins(m, m, m, m)
    border:SetTextureSliceMode(Enum.UITextureSliceMode.Stretched)
    border:SetScale(TOOLTIP_SCALE)
    border:SetPoint("TOPLEFT", -pad, pad)
    border:SetPoint("BOTTOMRIGHT", pad, -pad)
    tooltipBorders[nineSlice] = border
end

local function StyleTooltipBorder(tooltip)
    local nineSlice = tooltip and not tooltip:IsForbidden() and tooltip.NineSlice
    if not nineSlice or nineSlice:IsForbidden() then return end
    for _, key in ipairs(NINESLICE_PIECES) do
        local piece = nineSlice[key]
        if piece then piece:SetAlpha(0) end
    end
    local center = nineSlice.Center
    if center then
        center:ClearAllPoints()
        center:SetPoint("TOPLEFT", TOOLTIP_INSET, -TOOLTIP_INSET)
        center:SetPoint("BOTTOMRIGHT", -TOOLTIP_INSET, TOOLTIP_INSET)
    end
    if not tooltipBorders[nineSlice] then TooltipBorder(nineSlice) end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function GEN:OnEnable()
    if ns.textStyle then StyleBlizzardTexts() end
    if self.db.refinedBorders then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_ProfessionsBook", StyleProfessionIcons)
        ns.Hook("SharedTooltip_SetBackdropStyle", StyleTooltipBorder)
        for _, name in ipairs(TOOLTIPS) do StyleTooltipBorder(_G[name]) end
    end
    local player, target, focus = TexturePath("texPlayerPet"), TexturePath("texTargetBoss"), TexturePath("texFocus")
    local group, interface = TexturePath("texGroup"), TexturePath("texInterface")
    widgetTexture = interface

    -- Unit frames: Player & Pet, Target & Boss (and every Target of Target), Focus.
    -- Green health when not class colored (the Pet frame never is).
    local tint = not ns.classColors
    SkinBars(PlayerFrame_GetHealthBar(), PlayerFrame_GetManaBar(), player, tint)
    SkinBars(PetFrameHealthBar, PetFrameManaBar, player, true)
    SkinFrame(TargetFrame, target, tint)
    SkinFrame(FocusFrame, focus, tint)
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
