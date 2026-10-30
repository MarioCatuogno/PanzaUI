--[[----------------------------------------------------------------------------
    PanzaUI - Flavor
    Game version (Retail or WoW: Forever), read once before everything else.
    Modules, options, dropdown entries and profiles carry a flavor tag:
    "retail", "forever" or "both"; without a tag they follow DEFAULT_FLAVOR.

    Fixing something for one version only:
      - a feature that doesn't exist there: tag its option flavor = "retail";
      - a value that differs (offset, size, label): ns.ForFlavor(retail, forever);
      - a Blizzard frame or API that may be missing: check it before use and
        run the part through ns.Safe (Core), so an error stops only that part.
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

-- Value for the running game version: ns.ForFlavor(retailValue, foreverValue).
-- Safe with false/nil values (unlike `cond and a or b`).
function ns.ForFlavor(retail, forever)
    if ns.FLAVOR == "forever" then return forever end
    return retail
end

-- Import profiles per flavor (Profiles/<Flavor>/*.lua); nil when the running
-- game has none of that kind.
ns.PROFILES = { retail = {}, forever = {} }

function ns.Profile(kind)
    return ns.PROFILES[ns.FLAVOR][kind]
end
