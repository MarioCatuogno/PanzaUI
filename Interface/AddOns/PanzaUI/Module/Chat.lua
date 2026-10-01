--[[----------------------------------------------------------------------------
    PanzaUI - Chat
    Refined style (no tab art, input box border, background or side buttons),
    shared text style, timestamps and the Combat Log tab.
------------------------------------------------------------------------------]]
local _, ns = ...

local Chat = ns:RegisterModule("Chat", {
    title = "Chat",
    defaults = {
        style         = true,
        timestamps    = true,
        hideCombatLog = true,
    },
    options = {
        { key = "style", label = "Refined style", reload = true,
          tooltip = "Polish the look of chat windows.",
          bullets = { "Cleaner tabs and input box", "No background or side buttons" } },
        { key = "timestamps", label = "Timestamps",
          tooltip = "Show the time in front of every message." },
        { key = "hideCombatLog", label = "Hide Combat Log tab",
          tooltip = "Close the Combat Log window and its tab." },
    },
})

function Chat:Migrate(db)
    ns.MergeOptions(db, "style", db, "fontStyle", "hideTabArt", "hideButtons", "hideEditBoxArt", "hideBackground")
end

local TIMESTAMP_FORMAT = "%H:%M "  -- Blizzard's native HH:MM format (TIMESTAMP_FORMAT_HHMM)

local TAB_TEXTURES = {
    "Left", "Middle", "Right",
    "ActiveLeft", "ActiveMiddle", "ActiveRight",
    "HighlightLeft", "HighlightMiddle", "HighlightRight",
}

-- Chat input box border (normal + focused), as <EditBoxName><suffix> globals.
local EDITBOX_TEXTURES = { "Left", "Mid", "Right", "FocusLeft", "FocusMid", "FocusRight" }

-- Chat window background (faded in by Blizzard on mouseover), as
-- <ChatFrameName><suffix> globals. Blizzard's own list is used when available.
local BACKGROUND_TEXTURES = CHAT_FRAME_TEXTURES or {
    "Background", "TopLeftTexture", "BottomLeftTexture", "TopRightTexture", "BottomRightTexture",
    "LeftTexture", "RightTexture", "BottomTexture", "TopTexture",
}

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

-- Tab names: Blizzard sizes the name to the tab with the font it had at that
-- moment (before our outline), so the first tab can show "Gene...". The name
-- simply uses its full width: done now and after every Blizzard tab resize.
local chatTabs = {}
local function FitTabText(tab)
    local text = chatTabs[tab]
    if text then text:SetWidth(text:GetUnboundedStringWidth() + 2) end
end

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

    local name = frame:GetName()
    local tab  = _G[name .. "Tab"]

    -- Text (shared text style): messages, input box and tab name.
    local tabText = tab and (tab.Text or _G[name .. "TabText"])
    if ns.textStyle then
        StyleText(frame)
        ns.StyleFont(tabText)
    end
    if tabText then chatTabs[tab] = tabText end -- name fitted to its full width
    if not Chat.db.style then return end

    -- Tab art hidden (alpha).
    if tab then
        for _, key in ipairs(TAB_TEXTURES) do
            local tex = tab[key]
            if tex then tex:SetAlpha(0) end
        end
    end

    -- Side button column of the window.
    ns.Kill(frame.buttonFrame or _G[name .. "ButtonFrame"])

    -- Input box border: textures cleared, Blizzard shows/hides the focus
    -- border itself.
    local editName = name .. "EditBox"
    for _, suffix in ipairs(EDITBOX_TEXTURES) do
        local tex = _G[editName .. suffix]
        if tex then tex:SetTexture(nil) end
    end

    -- Window background: textures cleared, Blizzard keeps fading their alpha.
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
-- Module API
--------------------------------------------------------------------------------
function Chat:OnEnable()
    local db = self.db

    if db.timestamps    then SetTimestamps(true) end
    if db.hideCombatLog then SetCombatLog(false) end

    if db.style then
        for _, name in ipairs(SIDE_BUTTONS) do ns.Kill(_G[name]) end
    end
    if db.style or ns.textStyle then
        SetupAllFrames()
        ns.Hook("FCF_OpenTemporaryWindow", SetupAllFrames)
        for tab in pairs(chatTabs) do FitTabText(tab) end
        ns.Hook("PanelTemplates_TabResize", FitTabText)
    end
    if ns.textStyle then
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
