--[[----------------------------------------------------------------------------
    PanzaUI - Chat
    Timestamps, Combat Log tab, text style, tab art, side buttons.
------------------------------------------------------------------------------]]
local _, ns = ...

local Chat = ns:RegisterModule("Chat", {
    title = "Chat",
    defaults = {
        timestamps    = true,
        hideCombatLog = true,
        fontStyle     = true,
        hideTabArt    = true,
        hideButtons   = true,
        hideEditBoxArt = true,
    },
    options = {
        { header = "Style" },
        { key = "fontStyle",     label = "Outline + Slug text", tooltip = "Apply outline and slug rendering to chat, tab and input box text. Requires Reload UI." },
        { key = "hideTabArt",    label = "Hide tab art",        tooltip = "Remove the background textures of chat tabs. Requires Reload UI." },
        { key = "hideEditBoxArt", label = "Hide input box border", tooltip = "Remove the border of the chat input box. Requires Reload UI." },
        { header = "Features" },
        { key = "timestamps",    label = "Timestamps (HH:MM)",    tooltip = "Show the time in front of every chat message." },
        { key = "hideCombatLog", label = "Hide Combat Log tab",   tooltip = "Close the Combat Log window and its tab." },
        { key = "hideButtons",   label = "Hide side buttons",   tooltip = "Hide the side buttons (social, channels, emotes, voice, scroll). Requires Reload UI." },
    },
})

local TIMESTAMP_FORMAT = "%H:%M "  -- Blizzard's native HH:MM format (TIMESTAMP_FORMAT_HHMM)

local TAB_TEXTURES = {
    "Left", "Middle", "Right",
    "ActiveLeft", "ActiveMiddle", "ActiveRight",
    "HighlightLeft", "HighlightMiddle", "HighlightRight",
}

-- Chat input box border (normal + focused), as <EditBoxName><suffix> globals.
local EDITBOX_TEXTURES = { "Left", "Mid", "Right", "FocusLeft", "FocusMid", "FocusRight" }

local SIDE_BUTTONS = {
    "QuickJoinToastButton",            -- friends / social
    "ChatFrameChannelButton",
    "ChatFrameMenuButton",             -- emotes / languages
    "ChatFrameToggleVoiceDeafenButton",
    "ChatFrameToggleVoiceMuteButton",
}

--------------------------------------------------------------------------------
-- Timestamps: uses Blizzard's own CVar, no message hooks (zero CPU per message,
-- safe with Midnight secret values).
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
-- Combat Log (ChatFrame2): closed/reopened through Blizzard's own functions,
-- so the dock layout stays consistent and the state is saved by the game.
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
-- Per chat window setup (permanent and temporary/whisper windows)
--------------------------------------------------------------------------------
local processed = {}

-- Messages + input box (typed text and "Say:" header).
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

    local db   = Chat.db
    local name = frame:GetName()
    local tab  = _G[name .. "Tab"]

    if db.fontStyle then
        StyleText(frame)
        if tab then ns.StyleFont(tab.Text or _G[name .. "TabText"]) end
    end

    if db.hideTabArt and tab then
        for _, key in ipairs(TAB_TEXTURES) do
            local tex = tab[key]
            if tex then tex:SetAlpha(0) end
        end
    end

    if db.hideButtons then
        ns.Kill(frame.buttonFrame or _G[name .. "ButtonFrame"])
    end

    if db.hideEditBoxArt then
        -- Clear the textures: Blizzard shows/hides the focus border itself.
        local editName = name .. "EditBox"
        for _, suffix in ipairs(EDITBOX_TEXTURES) do
            local tex = _G[editName .. suffix]
            if tex then tex:SetTexture(nil) end
        end
    end
end

local function SetupAllFrames()
    for _, name in ipairs(CHAT_FRAMES) do
        SetupFrame(_G[name])
    end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function Chat:OnEnable()
    local db = self.db

    if db.timestamps    then SetTimestamps(true) end
    if db.hideCombatLog then SetCombatLog(false) end

    if db.hideButtons then
        for _, name in ipairs(SIDE_BUTTONS) do ns.Kill(_G[name]) end
    end

    if db.fontStyle or db.hideTabArt or db.hideButtons or db.hideEditBoxArt then
        SetupAllFrames()
        ns.Hook("FCF_OpenTemporaryWindow", SetupAllFrames)
    end

    if db.fontStyle then
        -- Changing the font size from the tab menu must keep our flags.
        ns.Hook("FCF_SetChatWindowFontSize", function(_, frame)
            StyleText(frame or FCF_GetCurrentChatFrame())
        end)
    end
end

-- Live options (no reload needed): timestamps and Combat Log.
function Chat:OnOptionChanged(key, value)
    if key == "timestamps" then
        SetTimestamps(value)
    elseif key == "hideCombatLog" then
        SetCombatLog(not value)
    end
end
