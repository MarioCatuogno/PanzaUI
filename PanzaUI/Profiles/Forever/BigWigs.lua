-- PanzaUI BigWigs profile (WoW: Forever), imported from the Profiles section of the options.
-- BigWigs works the same on Forever, so the Retail profile is used. For a Forever-only
-- profile, export it from BigWigs in Forever and paste the string between the [=[ and ]=]
-- below.
local _, ns = ...

local PROFILE = [=[]=]

ns.PROFILES.forever.bigwigs = PROFILE ~= "" and PROFILE or ns.PROFILES.retail.bigwigs
