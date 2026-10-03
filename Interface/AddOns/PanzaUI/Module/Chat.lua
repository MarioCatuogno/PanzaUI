--[[----------------------------------------------------------------------------
    PanzaUI - Chat
    Window style, timestamps, Combat Log tab and message filters.
------------------------------------------------------------------------------]]
local _, ns = ...

local Chat = ns:RegisterModule("Chat", {
    title = "Chat",
    defaults = {
        style         = true,
        timestamps    = true,
        hideCombatLog = true,
        hideClutter   = true,
    },
    options = {
        { key = "style", label = "Refined style", reload = true,
          tooltip = "Polish the look of the chat windows.",
          bullets = { "Cleaner tabs and input box", "No background or side buttons", "No status icons by player names",
                      "Short channel names", "Clickable web links" } },
        { key = "timestamps", label = "Timestamps",
          tooltip = "Show the time before every message." },
        { key = "hideCombatLog", label = "Hide Combat Log tab",
          tooltip = "Hide the Combat Log tab." },
        { key = "hideClutter", label = "Hide clutter",
          tooltip = "Hide minor messages in the chat.",
          bullets = { "Guild message of the day", "Loot specialization changes", "Crafting and loot of other players",
                      "Online and offline notices", "Channel and group join and leave notices",
                      "Not in a group warnings" } },
    },
})

-- Converts the saved values of older versions.
function Chat:Migrate(db)
    ns.MergeOptions(db, "style", db, "fontStyle", "hideTabArt", "hideButtons", "hideEditBoxArt", "hideBackground")
end

local TIMESTAMP_FORMAT = "%H:%M " -- Blizzard's HH:MM format

-- Tab art, input box border, window background and side buttons.
local TAB_TEXTURES = {
    "Left", "Middle", "Right",
    "ActiveLeft", "ActiveMiddle", "ActiveRight",
    "HighlightLeft", "HighlightMiddle", "HighlightRight",
}

local EDITBOX_TEXTURES = { "Left", "Mid", "Right", "FocusLeft", "FocusMid", "FocusRight" }

local BACKGROUND_TEXTURES = CHAT_FRAME_TEXTURES or {
    "Background", "TopLeftTexture", "BottomLeftTexture", "TopRightTexture", "BottomRightTexture",
    "LeftTexture", "RightTexture", "BottomTexture", "TopTexture",
}

local SIDE_BUTTONS = {
    "QuickJoinToastButton",
    "ChatFrameChannelButton",
    "ChatFrameMenuButton",
    "ChatFrameToggleVoiceDeafenButton",
    "ChatFrameToggleVoiceMuteButton",
}

--------------------------------------------------------------------------------
-- Timestamps through Blizzard's own CVar.
--------------------------------------------------------------------------------
local function SetTimestamps(on)
    local current = C_CVar.GetCVar("showTimestamps")
    if on then
        if current ~= TIMESTAMP_FORMAT then C_CVar.SetCVar("showTimestamps", TIMESTAMP_FORMAT) end
    elseif current == TIMESTAMP_FORMAT then
        C_CVar.SetCVar("showTimestamps", "none")
    end
end

--------------------------------------------------------------------------------
-- Combat Log tab, closed and reopened with Blizzard's own functions.
--------------------------------------------------------------------------------
local function SetCombatLog(show)
    local frame = ChatFrame2
    if not frame or frame == DEFAULT_CHAT_FRAME then return end

    if show then
        if not frame.isDocked and FCF_DockFrame then
            SetChatWindowShown(frame:GetID(), true)
            FCF_DockFrame(frame, #FCFDock_GetChatFrames(GENERAL_CHAT_DOCK) + 1, false)
        end
    elseif (frame.isDocked or frame:IsShown()) and FCF_Close then
        FCF_Close(frame)
    end
end

--------------------------------------------------------------------------------
-- Chat windows: text style and refined style, once per window.
--------------------------------------------------------------------------------
local processed = {}
local chatTabs = {}
local function FitTabText(tab)
    local text = chatTabs[tab]
    if text then text:SetWidth(text:GetUnboundedStringWidth() + 2) end
end

local function StyleText(frame)
    local editName = frame:GetName() .. "EditBox"
    ns.StyleFont(frame)
    ns.StyleFont(_G[editName])
    ns.StyleFont(_G[editName .. "Header"])
    ns.StyleFont(_G[editName .. "HeaderSuffix"])
end

local function SetupFrame(frame)
    if not frame or processed[frame] then return end
    processed[frame] = true

    local name = frame:GetName()
    local tab  = _G[name .. "Tab"]

    local tabText = tab and (tab.Text or _G[name .. "TabText"])
    if ns.textStyle then
        StyleText(frame)
        ns.StyleFont(tabText)
    end
    if tabText then chatTabs[tab] = tabText end
    if not Chat.db.style then return end

    if tab then
        for _, key in ipairs(TAB_TEXTURES) do
            local tex = tab[key]
            if tex then tex:SetAlpha(0) end
        end
    end

    ns.Kill(frame.buttonFrame or _G[name .. "ButtonFrame"])

    local editName = name .. "EditBox"
    for _, suffix in ipairs(EDITBOX_TEXTURES) do
        local tex = _G[editName .. suffix]
        if tex then tex:SetTexture(nil) end
    end

    for _, suffix in ipairs(BACKGROUND_TEXTURES) do
        local tex = _G[name .. suffix]
        if tex and tex.SetTexture then tex:SetTexture(nil) end
    end
end

local function SetupAllFrames()
    for _, name in ipairs(CHAT_FRAMES) do
        SetupFrame(_G[name])
    end
end

--------------------------------------------------------------------------------
-- Status icons before player names (AFK, DND and Blizzard staff kept).
--------------------------------------------------------------------------------
local KEEP_FLAGS = { [""] = true, AFK = true, DND = true, GM = true, DEV = true }
local FLAG_EVENTS = {
    "CHAT_MSG_SAY", "CHAT_MSG_YELL", "CHAT_MSG_EMOTE", "CHAT_MSG_WHISPER",
    "CHAT_MSG_GUILD", "CHAT_MSG_OFFICER", "CHAT_MSG_PARTY", "CHAT_MSG_PARTY_LEADER",
    "CHAT_MSG_RAID", "CHAT_MSG_RAID_LEADER", "CHAT_MSG_RAID_WARNING",
    "CHAT_MSG_INSTANCE_CHAT", "CHAT_MSG_INSTANCE_CHAT_LEADER", "CHAT_MSG_CHANNEL",
}

local function StripFlag(_, _, msg, author, lang, channel, target, flag, ...)
    if ns.IsSecret(flag) or flag == nil or KEEP_FLAGS[flag] then return false end
    return false, msg, author, lang, channel, target, "", ...
end

--------------------------------------------------------------------------------
-- Short channel names: built-in channels as initials ("2. T"), custom ones
-- without the zone suffix. Each name is built once and cached.
--------------------------------------------------------------------------------
local shortNames = {}

local function ShortName(channel, zoneChannel)
    local short = shortNames[channel]
    if short then return short end
    local number, name = channel:match("^(%d+)%.%s*(.-)$")
    if not number then return channel end
    name = name:gsub("%s+%-%s+.*$", "") -- zone suffix
    if zoneChannel then
        local initials = name:gsub("(%a)[%l']*%s*", function(c) return c:upper() end)
        name = initials ~= "" and initials or name
    end
    short = number .. ". " .. name
    shortNames[channel] = short
    return short
end

local function ShortenChannel(_, _, msg, author, lang, channel, target, flag, zoneID, ...)
    if type(channel) ~= "string" or ns.IsSecret(channel) or ns.IsSecret(zoneID) then return false end
    local zoneChannel = type(zoneID) == "number" and zoneID > 0
    return false, msg, author, lang, ShortName(channel, zoneChannel), target, flag, zoneID, ...
end

--------------------------------------------------------------------------------
-- Clickable links: web addresses in player messages open a box to copy them
-- (messages with other links are left alone).
--------------------------------------------------------------------------------
local URL_PATTERNS = { "(%a[%w+.-]*://[^%s|]+)", "(www%.[%w-]+%.[^%s|]+)" }
local URL_LINK = "|cff4fc3f7|Haddon:PanzaUI:url|h[%1]|h|r"

local function LinkURLs(_, _, msg, ...)
    if type(msg) ~= "string" or ns.IsSecret(msg) or msg:find("|H", 1, true) then return false end
    if not (msg:find("://", 1, true) or msg:find("www.", 1, true)) then return false end
    local linked, count = msg:gsub(URL_PATTERNS[1], URL_LINK)
    if count == 0 then linked, count = msg:gsub(URL_PATTERNS[2], URL_LINK) end
    if count == 0 then return false end
    return false, linked, ...
end

StaticPopupDialogs.PANZAUI_COPY_URL = {
    text = "Press Ctrl+C to copy the link.",
    button1 = CLOSE,
    hasEditBox = true,
    editBoxWidth = 320,
    OnShow = function(self, data)
        local box = (self.GetEditBox and self:GetEditBox()) or self.editBox
        box:SetText(data or self.data or "")
        box:HighlightText()
        box:SetFocus()
    end,
    EditBoxOnEnterPressed = function(self) self:GetParent():Hide() end,
    EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
}

-- The address is the link text: "[url]" inside the clicked link.
local function OnLinkClick(link, text)
    if type(link) ~= "string" or not link:find("^addon:PanzaUI:url") then return end
    local url = type(text) == "string" and text:match("%[(.-)%]")
    if url then StaticPopup_Show("PANZAUI_COPY_URL", nil, nil, url) end
end

local function SetupFlagFilter()
    local AddFilter = ChatFrame_AddMessageEventFilter or (ChatFrameUtil and ChatFrameUtil.AddMessageEventFilter)
    if not AddFilter then return end
    for _, event in ipairs(FLAG_EVENTS) do
        AddFilter(event, StripFlag)
        AddFilter(event, LinkURLs)
    end
    AddFilter("CHAT_MSG_BN_WHISPER", LinkURLs)
    AddFilter("CHAT_MSG_CHANNEL", ShortenChannel)
    if EventRegistry then
        EventRegistry:RegisterCallback("SetItemRef", function(_, link, text) OnLinkClick(link, text) end, ns)
    end
    ns.Hook("SetItemRef", OnLinkClick)
end

--------------------------------------------------------------------------------
-- Hide clutter: minor Blizzard messages removed or filtered before they are
-- drawn (hooked at load, before the login messages; option read live).
--------------------------------------------------------------------------------
local CLUTTER = {} -- plain text before the first %s of each message
for _, fmt in ipairs({ ERR_LOOT_SPEC_CHANGED_S, GUILD_MOTD_TEMPLATE }) do
    local prefix = type(fmt) == "string" and fmt:match("^(.-)%%s")
    if prefix and prefix ~= "" then CLUTTER[#CLUTTER + 1] = prefix end
end

local function IsClutter(text)
    if type(text) ~= "string" or ns.IsSecret(text) then return false end
    for i = 1, #CLUTTER do
        if text:find(CLUTTER[i], 1, true) then return true end
    end
    return false
end

local function RemoveClutter(frame, text)
    local db = Chat.db
    if not (db and db.hideClutter) or not IsClutter(text) then return end
    pcall(frame.RemoveMessagesByPredicate, frame, IsClutter)
end

for _, name in ipairs(CHAT_FRAMES) do
    local frame = _G[name]
    if frame and frame.RemoveMessagesByPredicate then hooksecurefunc(frame, "AddMessage", RemoveClutter) end
end

-- Crafting by other players ("X creates Y."); your own crafts are kept.
local OWN_CRAFT = type(TRADESKILL_LOG_FIRSTPERSON) == "string" and TRADESKILL_LOG_FIRSTPERSON:match("^(.-)%%s")

local function HideOthersCrafts(_, _, msg)
    local db = Chat.db
    if not (db and db.hideClutter) or type(msg) ~= "string" or ns.IsSecret(msg) then return false end
    return not (OWN_CRAFT and OWN_CRAFT ~= "" and msg:find(OWN_CRAFT, 1, true) == 1)
end

-- Longest plain part of a Blizzard format string (between its %s/%d).
local function KeyText(fmt)
    if type(fmt) ~= "string" then return end
    local best = ""
    for part in (fmt:gsub("%%%d?%$?[sd]", "\0") .. "\0"):gmatch("([^%z]*)%z") do
        if #part > #best then best = part end
    end
    return #best >= 4 and best or nil
end

local function KeyTexts(...)
    local list = {}
    for i = 1, select("#", ...) do list[#list + 1] = KeyText((select(i, ...))) end
    return list
end

local function HasAny(msg, list)
    for i = 1, #list do
        if msg:find(list[i], 1, true) then return true end
    end
    return false
end

-- System notices (online / offline, group join / leave, not in a group),
-- loot of other players.
local NOTICES = KeyTexts(ERR_FRIEND_ONLINE_SS, ERR_FRIEND_OFFLINE_S,
    ERR_JOINED_GROUP_S, ERR_LEFT_GROUP_S, ERR_RAID_MEMBER_ADDED_S, ERR_RAID_MEMBER_REMOVED_S,
    ERR_INSTANCE_GROUP_ADDED_S, ERR_INSTANCE_GROUP_REMOVED_S,
    ERR_NOT_IN_GROUP, ERR_NOT_IN_RAID, ERR_NOT_IN_INSTANCE_GROUP)
local OTHERS_LOOT = KeyTexts(LOOT_ITEM, LOOT_ITEM_MULTIPLE, LOOT_ITEM_PUSHED, LOOT_ITEM_PUSHED_MULTIPLE)

local function Hiding(msg)
    local db = Chat.db
    return db and db.hideClutter and type(msg) == "string" and not ns.IsSecret(msg)
end

local function HideNotices(_, _, msg) return Hiding(msg) and HasAny(msg, NOTICES) end
local function HideOthersLoot(_, _, msg) return Hiding(msg) and HasAny(msg, OTHERS_LOOT) end
local function HideChannelNotice() local db = Chat.db return db and db.hideClutter or false end

local AddFilter = ChatFrame_AddMessageEventFilter or (ChatFrameUtil and ChatFrameUtil.AddMessageEventFilter)
if AddFilter then
    AddFilter("CHAT_MSG_TRADESKILLS", HideOthersCrafts)
    AddFilter("CHAT_MSG_SYSTEM", HideNotices)
    AddFilter("CHAT_MSG_LOOT", HideOthersLoot)
    for _, event in ipairs({ "CHAT_MSG_CHANNEL_NOTICE", "CHAT_MSG_CHANNEL_NOTICE_USER", "CHAT_MSG_CHANNEL_JOIN", "CHAT_MSG_CHANNEL_LEAVE" }) do
        AddFilter(event, HideChannelNotice)
    end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function Chat:OnEnable()
    local db = self.db

    if db.timestamps    then SetTimestamps(true) end
    if db.hideCombatLog then SetCombatLog(false) end

    if db.style then
        for _, name in ipairs(SIDE_BUTTONS) do ns.Kill(_G[name]) end
        SetupFlagFilter()
    end
    if db.style or ns.textStyle then
        SetupAllFrames()
        ns.Hook("FCF_OpenTemporaryWindow", SetupAllFrames)
        for tab in pairs(chatTabs) do FitTabText(tab) end
        ns.Hook("PanelTemplates_TabResize", FitTabText)
    end
    if ns.textStyle then
        ns.Hook("FCF_SetChatWindowFontSize", function(_, frame)
            StyleText(frame or FCF_GetCurrentChatFrame())
        end)
    end
end

-- Live options.
function Chat:OnOptionChanged(key, value)
    if key == "timestamps" then
        SetTimestamps(value)
    elseif key == "hideCombatLog" then
        SetCombatLog(not value)
    end
end
