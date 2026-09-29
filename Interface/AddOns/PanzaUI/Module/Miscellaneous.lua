--[[----------------------------------------------------------------------------
    PanzaUI - Miscellaneous
    Buffs/Debuffs: action bar style, text style, icon zoom.
    Quality of Life: auto-repair.
    Various: hide the Micro Menu and the Bag Bar.
------------------------------------------------------------------------------]]
local _, ns = ...

local Misc = ns:RegisterModule("Miscellaneous", {
    title = "Miscellaneous",
    defaults = {
        auraIconStyle = true,
        auraFontStyle = true,
        auraIconZoom  = 5,
        autoRepair    = true,
        hideMicroMenu = true,
        hideBagBar    = true,
    },
    options = {
        { header = "Buffs/Debuffs" },
        { key = "auraIconStyle", label = "Action bar style",     tooltip = "Give buff and debuff icons the same rounded frame as action buttons. Requires Reload UI." },
        { key = "auraFontStyle", label = "Outline + Slug text",  tooltip = "Apply outline and slug rendering to buff and debuff stacks and duration. Requires Reload UI." },
        { key = "auraIconZoom",  label = "Icon zoom",            tooltip = "Crop the edges of buff and debuff icons (percent per side) to hide the built-in border of older icons. 0 = off.",
          slider = { min = 0, max = 15, step = 1, suffix = "%" } },
        { header = "Quality of Life" },
        { key = "autoRepair",    label = "Auto-repair",          tooltip = "Repair all items with your own gold when opening a merchant that can repair." },
        { header = "Various" },
        { key = "hideMicroMenu", label = "Hide Micro Menu",      tooltip = "Hide the micro menu buttons (character, spellbook, talents, ...). Keybindings still work." },
        { key = "hideBagBar",    label = "Hide Bag Bar",         tooltip = "Hide the backpack and bag slot buttons. Keybindings still work." },
    },
})

--------------------------------------------------------------------------------
-- Buffs/Debuffs. Blizzard creates all aura buttons once at load
-- (BuffFrame/DebuffFrame.auraFrames), so they are styled once: no hooks.
-- Only widget calls on the buttons, no Blizzard fields are written (taint-safe).
--------------------------------------------------------------------------------
local function ForEachAuraButton(func)
    for _, container in ipairs({ BuffFrame, DebuffFrame }) do
        for _, button in ipairs(container.auraFrames or {}) do
            -- Skip private-aura anchors (isAuraAnchor): their Icon is a Frame, not a texture.
            local icon = button.Icon
            if not button.isAuraAnchor and icon and icon.AddMaskTexture then func(button, icon) end
        end
    end
end

local function ZoomAuras()
    local percent = Misc.db.auraIconZoom
    ForEachAuraButton(function(_, icon) ns.ZoomIcon(icon, percent) end)
end

local function SetupAuras(db)
    ForEachAuraButton(function(button, icon)
        if db.auraIconStyle then ns.StyleIcon(icon, button) end
        if db.auraFontStyle then
            ns.StyleFont(button.Count)
            ns.StyleFont(button.Duration)
        end
    end)
    ZoomAuras()
end

--------------------------------------------------------------------------------
-- Quality of Life: auto-repair (personal gold). The event is registered only
-- while the option is on.
--------------------------------------------------------------------------------
local repairEvents = CreateFrame("Frame")
repairEvents:SetScript("OnEvent", function()
    if not CanMerchantRepair() then return end
    local cost, canRepair = GetRepairAllCost()
    if not canRepair or cost <= 0 then return end
    if GetMoney() < cost then
        ns.Print("not enough gold to repair (" .. GetCoinTextureString(cost) .. ").")
        return
    end
    RepairAllItems(false)
    ns.Print("repaired for " .. GetCoinTextureString(cost) .. ".")
end)

local function SetAutoRepair(on)
    if on then repairEvents:RegisterEvent("MERCHANT_SHOW") else repairEvents:UnregisterAllEvents() end
end

--------------------------------------------------------------------------------
-- Various: option key -> global frame name (both are children of UIParent).
-- Reparenting keeps Edit Mode positions (and anything anchored to these
-- frames, like the queue eye) intact, and is reversible without a reload.
--------------------------------------------------------------------------------
local FRAMES = {
    hideMicroMenu = "MicroMenuContainer",
    hideBagBar    = "BagsBar",
}

local function ApplyFrame(key)
    local frame = _G[FRAMES[key]]
    if frame then frame:SetParent(Misc.db[key] and ns.Hider or UIParent) end
end

--------------------------------------------------------------------------------
-- Module API
--------------------------------------------------------------------------------
function Misc:OnEnable()
    local db = self.db
    EventUtil.ContinueOnAddOnLoaded("Blizzard_BuffFrame", function() SetupAuras(db) end)
    SetAutoRepair(db.autoRepair)
    for key in pairs(FRAMES) do
        if db[key] then ApplyFrame(key) end
    end
end

function Misc:OnOptionChanged(key, value)
    if key == "auraIconZoom" then
        ZoomAuras()
    elseif key == "autoRepair" then
        SetAutoRepair(value)
    elseif FRAMES[key] then
        ApplyFrame(key)
    end
end
