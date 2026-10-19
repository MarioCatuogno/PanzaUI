--[[----------------------------------------------------------------------------
    PanzaUI - Flavor
    Game version (Retail or WoW: Forever), read once before everything else.
    Modules, options, dropdown entries and profiles carry a flavor tag:
    "retail", "forever" or "both"; without a tag they follow DEFAULT_FLAVOR.
------------------------------------------------------------------------------]]
local _, ns = ...

-- Forever: Blizzard's project constant when it exists (named "Forever" or
-- "Camelot"), else the interface number (Forever uses 1.x builds).
local function IsForever()
    local project = WOW_PROJECT_ID
    for _, name in ipairs({ "WOW_PROJECT_FOREVER", "WOW_PROJECT_CAMELOT" }) do
        local id = _G[name]
        if id and project == id and id ~= WOW_PROJECT_MAINLINE then return true end
    end
    local interface = select(4, GetBuildInfo())
    return type(interface) == "number" and interface < 20000
end

ns.FLAVOR = IsForever() and "forever" or "retail"
ns.FLAVOR_NAMES = { retail = "Retail", forever = "Forever" }

-- Untagged features are Retail only until they are tested on Forever.
ns.DEFAULT_FLAVOR = "retail"

-- True when a flavor tag applies to the running game.
function ns.IsFlavor(tag)
    tag = tag or ns.DEFAULT_FLAVOR
    return tag == "both" or tag == ns.FLAVOR
end

-- Import profiles per flavor (Profiles/<Flavor>/*.lua); nil when the running
-- game has none of that kind.
ns.PROFILES = { retail = {}, forever = {} }

function ns.Profile(kind)
    return ns.PROFILES[ns.FLAVOR][kind]
end
