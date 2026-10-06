--[[----------------------------------------------------------------------------
    PanzaUI - General (main settings page)
    Text style, class colors, borders, bar textures and profile import.
------------------------------------------------------------------------------]]
local _, ns = ...
local IsSecret = ns.IsSecret

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
    -- Other clients (eg. WoW: Forever) have other interface styles: on an
    -- error the style of another saved layout is used, then none.
    local ok = pcall(C_EditMode.SaveLayouts, saved)
    if not ok then
        for i, layout in ipairs(saved.layouts) do
            if i ~= index and layout.interfaceStyle ~= nil then info.interfaceStyle = layout.interfaceStyle break end
        end
        ok = pcall(C_EditMode.SaveLayouts, saved)
        if not ok then
            info.interfaceStyle = nil
            ok = pcall(C_EditMode.SaveLayouts, saved)
        end
    end
    if not ok then
        ns.Print("The Edit Mode layout can't be imported in this version of the game.")
        return
    end
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

-- Interface bars texture as a file (nil for Default or a Blizzard atlas).
function ns.InterfaceBarTexture()
    if ATLASES[GEN.db.texInterface] then return end
    return TexturePath("texInterface")
end

-- Sets a bar texture, keeping Blizzard's draw layer.
local function SetTexture(bar, path)
    if not (bar and path and bar.SetStatusBarTexture) or bar:IsForbidden() then return end
    local fill = bar:GetStatusBarTexture()
    local layer, sublevel
    if fill then layer, sublevel = fill:GetDrawLayer() end
    if IsSecret(layer) or IsSecret(sublevel) then layer = nil end
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
    if IsSecret(atlas) or type(atlas) ~= "string" then return end
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
        if not mask and not IsSecret(atlas) and type(atlas) == "string" and C_Texture.GetAtlasInfo(atlas) then
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
    if IsSecret(layer) or IsSecret(sublevel) then layer = nil end

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
    local info = bar.overrideInfo or (not IsSecret(token) and token and PowerBarColor[token])
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
        local c = not IsSecret(token) and token and PowerBarColor[token]
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
    if IsSecret(kind) or type(kind) ~= "string" then kind = asset end
    if IsSecret(kind) or type(kind) ~= "string" then
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
    if IsSecret(path) or not path or IsSecret(r) or IsSecret(g) or IsSecret(b) or IsSecret(flags) then return end
    local light = r + g + b >= 1
    local outlined = flags and flags:find("OUTLINE") ~= nil
    if light ~= outlined then region:SetFont(path, size, light and ns.FONT_FLAGS or "") end
end

local function FitFrameOutlines(frame, levels)
    ns.WalkRegions(frame, levels, FitOutline)
end

local function FitQuestInfo()
    FitFrameOutlines(QuestInfoFrame, 2)
    FitFrameOutlines(QuestInfoRewardsFrame, 2)
    FitFrameOutlines(MapQuestInfoRewardsFrame, 2)
end

-- Parchment panels: their dark texts are checked when the panel shows.
local function FitPanelOnShow(panel, levels)
    if not panel then return end
    return ns.OnShowDeferred(panel, function() FitFrameOutlines(panel, levels) end)
end

-- Archaeology: texts colored dark by the panel itself, on every page.
local function SetupArchaeology()
    local Queue = FitPanelOnShow(ArchaeologyFrame, 5)
    if not Queue then return end
    for _, key in ipairs({ "summaryPage", "completedPage", "artifactPage", "helpPage" }) do
        local page = ArchaeologyFrame[key]
        if page then page:HookScript("OnShow", Queue) end
    end
end

-- What's New: dark header on the parchment.
local function SetupSplash()
    FitPanelOnShow(SplashFrame, 3)
end

-- Adventure Guide: dark texts on the parchment (Suggested Content,
-- Tutorials), also checked when the tab or the suggestions change.
local function SetupAdventureGuide()
    local Queue = FitPanelOnShow(EncounterJournal, 5)
    if not Queue then return end
    ns.Hook("EJ_ContentTab_Select", Queue)
    ns.Hook("EJSuggestFrame_RefreshDisplay", Queue)
end

-- PvP: dark texts of the New Season parchment (Rated tab), or of the whole
-- PvP panel if the parchment isn't found.
local function SetupPvP()
    FitPanelOnShow((PVPQueueFrame and PVPQueueFrame.NewSeasonPopup) or PVPUIFrame, 4)
end

-- Spellbook: spell names, headers and page number, as Blizzard sets them up.
local function SetupSpellBook()
    ns.Hook(SpellBookItemMixin, "UpdateVisuals", function(item)
        FitOutline(item.Name)
        FitOutline(item.SubName)
        FitOutline(item.RequiredLevel)
    end)
    ns.Hook(SpellBookHeaderMixin, "Init", function(header) FitOutline(header.Text) end)
    local book = PlayerSpellsFrame and PlayerSpellsFrame.SpellBookFrame
    local pages = book and book.PagedSpellsFrame
    if pages then ns.OnShowDeferred(book, function() FitFrameOutlines(pages, 4) end) end
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
    if IsSecret(r) or IsSecret(g) or IsSecret(b) or not (r and g and b) then return end
    local dark, flags = math.max(r, g, b) < DARK, removedOutline[text]
    if not dark and not flags then return end -- light text never changed
    if text:IsForbidden() or (dark and OnNamePlate(text)) then return end
    local path, size, current = text:GetFont()
    if IsSecret(path) or not path or IsSecret(current) then return end
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
    EventUtil.ContinueOnAddOnLoaded("Blizzard_EncounterJournal", SetupAdventureGuide)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_PVPUI", SetupPvP)
    if SplashFrame then SetupSplash() else EventUtil.ContinueOnAddOnLoaded("Blizzard_SplashFrame", SetupSplash) end
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

-- Reward icons (quest details and log, Dungeon and Raid Finder): reward
-- buttons (icon plus name frame) found in their panel, styled once.
local styledRewards = setmetatable({}, { __mode = "k" })

local function RewardIcon(button)
    local name = button:GetName()
    return button.Icon or button.IconTexture or (name and _G[name .. "IconTexture"])
end

local function StyleRewardButtons(levels, ...)
    for i = 1, select("#", ...) do
        local button = select(i, ...)
        if not styledRewards[button] and not button:IsForbidden() then
            local name = button:GetName()
            local icon = RewardIcon(button)
            if icon and icon.AddMaskTexture and (button.NameFrame or (name and _G[name .. "NameFrame"])) then
                styledRewards[button] = true
                ns.StyleItemButton(button, icon)
            elseif levels > 0 then
                StyleRewardButtons(levels - 1, button:GetChildren())
            end
        end
    end
end

local function StyleRewards(frame, levels)
    if frame and not frame:IsForbidden() then StyleRewardButtons(levels, frame:GetChildren()) end
end

local function StyleQuestRewards()
    StyleRewards(QuestInfoRewardsFrame, 2)
    StyleRewards(MapQuestInfoRewardsFrame, 2)
end

local function CurrencyIcon(row)
    local content = row.Content or row
    return content.CurrencyIcon or row.CurrencyIcon, content
end

-- The spec icon and its ring stay above the new icon frame.
local function GearSetIcon(row)
    if row.SpecIcon then row.SpecIcon:SetDrawLayer("OVERLAY", 2) end
    if row.SpecRing then row.SpecRing:SetDrawLayer("OVERLAY", 3) end
    return row.icon or row.Icon, row
end

local function SetupCurrencyIcons()
    ns.StyleScrollIcons(TokenFrame and TokenFrame.ScrollBox, CurrencyIcon)
end

local function SetupGearSetIcons()
    local pane = PaperDollFrame and PaperDollFrame.EquipmentManagerPane
    ns.StyleScrollIcons(pane and pane.ScrollBox, GearSetIcon)
end

-- Delves Companion abilities: the icon of each ability button, checked when
-- the list shows and when its page or role changes.
local styledAbilities = setmetatable({}, { __mode = "k" })

local function StyleAbilityButtons(levels, ...)
    for i = 1, select("#", ...) do
        local button = select(i, ...)
        if not button:IsForbidden() and not styledAbilities[button] then
            local icon = button.Icon
            if icon and icon.AddMaskTexture and button.Name then
                styledAbilities[button] = true
                ns.StyleIcon(icon, button)
            elseif levels > 0 then
                StyleAbilityButtons(levels - 1, button:GetChildren())
            end
        end
    end
end

local function SetupCompanionAbilities()
    local list = DelvesCompanionAbilityListFrame
    if not list then return end
    local Queue = ns.OnShowDeferred(list, function() StyleAbilityButtons(3, list:GetChildren()) end)
    for _, method in ipairs({ "UpdatePaginatedButtonDisplay", "RefreshPaginatedButtons", "UpdateDisplay" }) do
        ns.Hook(list, method, Queue)
    end
end

-- Delves: the "Chance to receive" rewards, checked when the picker shows
-- and when its rewards change (tier picked).
local function SetupDelveRewards()
    local picker = DelvesDifficultyPickerFrame
    if not picker then return end
    local Queue = ns.OnShowDeferred(picker, function() StyleRewards(picker, 4) end)
    local rewards = picker.DelveRewardsContainerFrame
    if rewards then
        ns.Hook(rewards, "SetRewards", Queue)
        rewards:HookScript("OnShow", Queue)
    end
end

-- Professions: concentration, gear slots, reagents and the Concentrate
-- button (the round recipe icon keeps its own look, slot art is hidden).
local function StyleProfessionButtons(form, levels, ...)
    for i = 1, select("#", ...) do
        local button = select(i, ...)
        if not button:IsForbidden() and button ~= form.OutputIcon then
            local icon = button.Icon or button.icon
            if icon and icon.AddMaskTexture and button.IconBorder then
                ns.StyleItemButton(button, icon, true)
            elseif levels > 0 then
                StyleProfessionButtons(form, levels - 1, button:GetChildren())
            end
        end
    end
end

local function SetupProfessionIcons()
    local page = ProfessionsFrame and ProfessionsFrame.CraftingPage
    if not page then return end
    local form = page.SchematicForm
    local function StylePage()
        local display = page.ConcentrationDisplay
        if display then ns.StyleItemButton(display, display.Icon) end
        StyleProfessionButtons(page, 1, page:GetChildren()) -- gear slots
        if form then
            StyleProfessionButtons(form, 5, form:GetChildren()) -- reagents
            local choices = form.Details and form.Details.CraftingChoicesContainer
            local toggle = choices and choices.ConcentrateContainer and choices.ConcentrateContainer.ConcentrateToggleButton
            if toggle then ns.StyleItemButton(toggle, toggle.Icon, true) end
        end
    end
    local Queue = ns.OnShowDeferred(page, StylePage)
    if form then ns.Hook(form, "Init", Queue) end
end

-- Called at login and when the Group Finder loads: each hook is set once.
local questHooked, lfgHooked
local function SetupRewardIcons()
    if not questHooked then
        questHooked = true
        ns.Hook("QuestInfo_Display", function() ns.Defer(StyleQuestRewards) end)
    end
    if lfgHooked or not LFGRewardsFrame_UpdateFrame then return end
    lfgHooked = true
    hooksecurefunc("LFGRewardsFrame_UpdateFrame", function(parent)
        if parent then ns.Defer(function() StyleRewards(parent, 1) end) end
    end)
end

-- PanzaUI border instead of Blizzard's frame, scaled down to the icon frame
-- size. Tooltips: the background is inset to stay inside the corners; both
-- are set again when Blizzard changes the tooltip style.
local TOOLTIP_INSET = 3
local DIALOG_BG = { 0.08, 0.07, 0.06, 0.95 } -- dark, like Blizzard's dialogs
local DIALOG_OVERLAP = 2 -- framed dialogs: border outside the background (2 of its 4 units cover the edge)
-- Dialogs with Blizzard's dialog frame (Border with edges and a Bg).
local FRAMED_DIALOGS = { "LFGDungeonReadyDialog", "LFGDungeonReadyStatus", "LFDRoleCheckPopup",
    "LFGInvitePopup", "LFGListInviteDialog", "LFGListApplicationDialog", "PVPReadyDialog",
    "ReadyCheckListenerFrame" }
-- Edit Mode windows: styled once at login, without hooks (Edit Mode is
-- sensitive to taint); Blizzard doesn't redraw their frame.
local EDIT_MODE_BG = { 0.06, 0.05, 0.04, 0.85 } -- dark and see-through, like Blizzard's
local EDIT_MODE_DIALOGS = { "EditModeManagerFrame", "EditModeSystemSettingsDialog",
    "EditModeUnsavedChangesDialog", "EditModeNewLayoutDialog", "EditModeImportLayoutDialog" }
-- Tooltips styled once at login too: some (eg. the options and AddOns list
-- ones) set their look only when created.
local TOOLTIPS = { "GameTooltip", "ItemRefTooltip", "ShoppingTooltip1", "ShoppingTooltip2",
    "ItemRefShoppingTooltip1", "ItemRefShoppingTooltip2", "SettingsTooltip", "AddonTooltip",
    "AutoCompleteBox" } -- name suggestions (mail, whispers, invites)
local HidePieces, PanelBorder = ns.HideFramePieces, ns.PanelBorder

local function StyleTooltipBorder(tooltip)
    local nineSlice = tooltip and not tooltip:IsForbidden() and tooltip.NineSlice
    if not nineSlice or nineSlice:IsForbidden() then return end
    HidePieces(nineSlice)
    local center = nineSlice.Center
    if center then
        center:ClearAllPoints()
        center:SetPoint("TOPLEFT", TOOLTIP_INSET, -TOOLTIP_INSET)
        center:SetPoint("BOTTOMRIGHT", -TOOLTIP_INSET, TOOLTIP_INSET)
    end
    PanelBorder(nineSlice, nineSlice, 0)
end

-- Dialogs (eg. "Do you want to destroy...?"): Blizzard's frame (BG, drawn
-- as whole textures) hidden on every show, replaced by a plain background
-- and the border.
local dialogBgs = {}

local function StyleDialogBorder(dialog)
    local frame = dialog and not dialog:IsForbidden() and dialog.BG
    if not frame or frame:IsForbidden() then return end
    frame:SetAlpha(0)
    if dialogBgs[dialog] then return end
    local bg = dialog:CreateTexture(nil, "BACKGROUND")
    bg:SetColorTexture(unpack(DIALOG_BG))
    bg:SetPoint("TOPLEFT", frame, "TOPLEFT", TOOLTIP_INSET, -TOOLTIP_INSET)
    bg:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -TOOLTIP_INSET, TOOLTIP_INSET)
    dialogBgs[dialog] = bg
    PanelBorder(dialog, frame, 0)
end

-- Framed dialogs (eg. "A group has been formed"): edges hidden on every
-- show, the border drawn around their background.
-- flatBg: Blizzard's background (lines at the top and bottom edges) is
-- replaced by a plain one.
local flatBgs = {}

local function StyleFramedDialog(dialog, flatBg)
    local frame = dialog and not dialog:IsForbidden() and (dialog.Border or dialog.NineSlice)
    if not frame or frame:IsForbidden() then return end
    HidePieces(frame)
    local bg = frame.Bg
    if not bg then
        PanelBorder(frame, frame, 0)
        return
    end
    PanelBorder(frame, bg, DIALOG_OVERLAP)
    if flatBg == true and not flatBgs[frame] then
        local plain = frame:CreateTexture(nil, "BACKGROUND")
        plain:SetColorTexture(unpack(EDIT_MODE_BG))
        plain:SetAllPoints(bg)
        bg:SetAlpha(0)
        flatBgs[frame] = plain
    end
end

-- Framed dialogs of load-on-demand addons, styled when they load.
local LOD_DIALOGS = {
    Blizzard_DelvesDifficultyPicker = "DelvesDifficultyPickerFrame",
    Blizzard_DelvesCompanionConfiguration = "DelvesCompanionConfigurationFrame",
}

local function HookFramedDialog(name)
    local dialog = _G[name]
    if not dialog then return end
    StyleFramedDialog(dialog)
    dialog:HookScript("OnShow", StyleFramedDialog)
end

local function StyleDialogs()
    for i = 1, STATICPOPUP_NUMDIALOGS or 4 do
        local dialog = _G["StaticPopup" .. i]
        if dialog then
            StyleDialogBorder(dialog)
            dialog:HookScript("OnShow", StyleDialogBorder)
        end
    end
    for _, name in ipairs(FRAMED_DIALOGS) do HookFramedDialog(name) end
    for addon, name in pairs(LOD_DIALOGS) do
        EventUtil.ContinueOnAddOnLoaded(addon, function() HookFramedDialog(name) end)
    end
    for _, name in ipairs(EDIT_MODE_DIALOGS) do StyleFramedDialog(_G[name], true) end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function GEN:OnEnable()
    if ns.textStyle then StyleBlizzardTexts() end
    if self.db.refinedBorders then
        EventUtil.ContinueOnAddOnLoaded("Blizzard_ProfessionsBook", StyleProfessionIcons)
        SetupRewardIcons()
        if TokenFrame then SetupCurrencyIcons() else EventUtil.ContinueOnAddOnLoaded("Blizzard_TokenUI", SetupCurrencyIcons) end
        SetupGearSetIcons()
        EventUtil.ContinueOnAddOnLoaded("Blizzard_DelvesDifficultyPicker", SetupDelveRewards)
        EventUtil.ContinueOnAddOnLoaded("Blizzard_DelvesCompanionConfiguration", SetupCompanionAbilities)
        EventUtil.ContinueOnAddOnLoaded("Blizzard_Professions", SetupProfessionIcons)
        EventUtil.ContinueOnAddOnLoaded("Blizzard_GroupFinder", SetupRewardIcons)
        ns.Hook("SharedTooltip_SetBackdropStyle", StyleTooltipBorder)
        for _, name in ipairs(TOOLTIPS) do StyleTooltipBorder(_G[name]) end
        StyleDialogs()
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
    -- Their texts sit a bit high on the flat texture: moved down once.
    if interface then
        local ACHIEVEMENT_TEXT_OFFSET = 2
        local loweredTexts = {}
        local function LowerText(region)
            if loweredTexts[region] or region:GetObjectType() ~= "FontString" then return end
            loweredTexts[region] = true
            for i = 1, region:GetNumPoints() do
                local point, relative, relativePoint, x, y = region:GetPoint(i)
                region:SetPoint(point, relative, relativePoint, x, (y or 0) - ACHIEVEMENT_TEXT_OFFSET)
            end
        end
        local function TrackAchievementBar(bar)
            TrackTexture(bar, interface, 2)
            ns.WalkRegions(bar, 0, LowerText)
        end
        local Scan
        local function ScanChildren(...)
            for i = 1, select("#", ...) do
                local child = select(i, ...)
                if child:IsObjectType("StatusBar") then TrackAchievementBar(child) end
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
                        TrackAchievementBar(bar)
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
        local function TrackTooltipBar(bar) TrackTexture(bar.Bar or bar, interface, 1) end
        local function TrackTooltipPool(tooltip, poolKey)
            ns.ForEachActive(tooltip and tooltip[poolKey], TrackTooltipBar)
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
