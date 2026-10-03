--[[----------------------------------------------------------------------------
    PanzaUI - Chat
    Window style, timestamps and Combat Log tab.
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
          bullets = { "Cleaner tabs and input box", "No background or side buttons", "No status icons by player names" } },
        { key = "timestamps", label = "Timestamps",
          tooltip = "Show the time before every message." },
        { key = "hideCombatLog", label = "Hide Combat Log tab",
          tooltip = "Hide the Combat Log tab." },
        { key = "hideClutter", label = "Hide clutter",
          tooltip = "Hide minor messages in the chat.",
          bullets = { "Guild message of the day", "Loot specialization changes" } },
    },
})

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
-- Status icons before player names (chat flag, e.g. guide or newcomer):
-- removed by a message filter. AFK, DND and Blizzard staff flags are kept.
--------------------------------------------------------------------------------
local KEEP_FLAGS = { [""] = true, AFK = true, DND = true, GM = true, DEV = true }
local FLAG_EVENTS = {
    "CHAT_MSG_SAY", "CHAT_MSG_YELL", "CHAT_MSG_EMOTE", "CHAT_MSG_WHISPER",
    "CHAT_MSG_GUILD", "CHAT_MSG_OFFICER", "CHAT_MSG_PARTY", "CHAT_MSG_PARTY_LEADER",
    "CHAT_MSG_RAID", "CHAT_MSG_RAID_LEADER", "CHAT_MSG_RAID_WARNING",
    "CHAT_MSG_INSTANCE_CHAT", "CHAT_MSG_INSTANCE_CHAT_LEADER", "CHAT_MSG_CHANNEL",
}

local function StripFlag(_, _, msg, author, lang, channel, target, flag, ...)
    if flag == nil or ns.IsSecret(flag) or KEEP_FLAGS[flag] then return false end
    return false, msg, author, lang, channel, target, "", ...
end

local function SetupFlagFilter()
    local AddFilter = ChatFrame_AddMessageEventFilter or (ChatFrameUtil and ChatFrameUtil.AddMessageEventFilter)
    if not AddFilter then return end
    for _, event in ipairs(FLAG_EVENTS) do AddFilter(event, StripFlag) end
end

--------------------------------------------------------------------------------
-- Hide clutter: lines starting like these Blizzard messages are removed right
-- after a chat window adds them (post-hook, same frame: never drawn).
-- Hooked at load, before the login messages; the option is read live.
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
