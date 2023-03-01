
WeakAurasSaved = {
	["dynamicIconCache"] = {
	},
	["editor_tab_spaces"] = 4,
	["displays"] = {
		["Left Arrow"] = {
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["custom"] = "function()\n    local region = aura_env.region\n    local plate = C_NamePlate.GetNamePlateForUnit(\"target\")\n    if plate then\n        region:ClearAllPoints()\n        region:SetPoint(\"CENTER\", plate, \"CENTER\", -90, -5)\n        region:Show()\n    else\n        region:Hide()\n    end\n    return true\nend\n\n\n\n",
						["unit"] = "player",
						["check"] = "update",
						["names"] = {
						},
						["custom_type"] = "status",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["rotation"] = 90,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 65,
			["rotate"] = true,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\targeting-mark.tga",
			["anchorFrameType"] = "SCREEN",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["id"] = "Left Arrow",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["width"] = 90,
			["uid"] = "Rxj30WUK(LO",
			["config"] = {
			},
			["discrete_rotation"] = 0,
			["xOffset"] = 0,
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["parent"] = "Target Highlight",
		},
		["Monk - Buffs"] = {
			["grow"] = "RIGHT",
			["controlledChildren"] = {
				"Stagger", -- [1]
				"Chi", -- [2]
				"Monk - Haste Buff", -- [3]
				"Touch of Death", -- [4]
				"Whirling Dragon Punch", -- [5]
				"Ancient Teachings", -- [6]
				"Awekened Faeline", -- [7]
				"Renewing Mist Count", -- [8]
				"Expel Harm", -- [9]
				"Vivacious Vivification", -- [10]
				"Blackout Kick!", -- [11]
				"Dance of Chi-Ji", -- [12]
				"Celestial Flame", -- [13]
				"Zen Meditation", -- [14]
				"Touch of Karma", -- [15]
				"Hit Combo", -- [16]
				"Enveloping Mist (Chi)", -- [17]
				"Teaching of the Monastery", -- [18]
				"Sheilun's Gift Clouds", -- [19]
				"Thunderfist", -- [20]
				"Celestial Brew", -- [21]
				"Fortifying Brew", -- [22]
				"Mana Tea", -- [23]
				"Thunder Focus Tea", -- [24]
				"Weapons of Order", -- [25]
				"Storm, Earth and Fire", -- [26]
				"Serenity", -- [27]
				"Dampen Harm", -- [28]
				"Diffuse Magic", -- [29]
				"Charred Passion", -- [30]
				"Blackout Combo", -- [31]
				"Rushing Jade Wind", -- [32]
				"Bonedust Brew", -- [33]
				"Exploding Keg ", -- [34]
				"Invoker's Delight", -- [35]
				"Secret Infusion", -- [36]
				"Invoke Niuzao, the Black Ox", -- [37]
				"Invoke Niuzao by Call to Arms", -- [38]
				"Invoke Chi-Ji, the Red Crane", -- [39]
				"Invoke Chi-Ji by Gift of the Celestials", -- [40]
				"Invoke Yu'lon, the Jade Serpent", -- [41]
				"Invoke Xuen, the White Tiger", -- [42]
				"Summon White Tiger Statue", -- [43]
				"Shuffle", -- [44]
				"Elusive Brawler", -- [45]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = -125,
			["yOffset"] = -107,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["space"] = 2,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["names"] = {
						},
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["radius"] = 200,
			["selfPoint"] = "LEFT",
			["align"] = "CENTER",
			["stagger"] = 0,
			["subRegions"] = {
			},
			["borderInset"] = 1,
			["rotation"] = 0,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["useLimit"] = true,
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["groupIcon"] = 135769,
			["animate"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["scale"] = 1,
			["centerType"] = "LR",
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "dynamicgroup",
			["borderSize"] = 2,
			["sort"] = "none",
			["uid"] = "xxcyzNeXAQr",
			["parent"] = "PanzaUI - Monk",
			["constantFactor"] = "RADIUS",
			["limit"] = 6,
			["borderOffset"] = 4,
			["gridType"] = "RD",
			["gridWidth"] = 5,
			["id"] = "Monk - Buffs",
			["fullCircle"] = true,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["rowSpace"] = 1,
			["config"] = {
			},
			["internalVersion"] = 64,
			["arcLength"] = 360,
			["conditions"] = {
			},
			["information"] = {
			},
			["authorOptions"] = {
			},
		},
		["Spiritwalker's Grace"] = {
			["iconSource"] = 0,
			["parent"] = "Shaman - Movement",
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["url"] = "",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["init"] = {
				},
				["finish"] = {
					["do_glow"] = false,
					["glow_frame_type"] = "UNITFRAME",
					["glow_action"] = "show",
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"152173", -- [1]
						},
						["ownOnly"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["spellName"] = 79206,
						["charges_operator"] = "<",
						["useName"] = true,
						["debuffType"] = "HELPFUL",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["use_genericShowOn"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 79206,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["charges"] = "1",
						["use_charges"] = true,
						["type"] = "spell",
						["use_track"] = true,
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_visible"] = true,
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["anchorXOffset"] = 0,
					["text_anchorYOffset"] = 10,
					["text_text_format_p_time_mod_rate"] = true,
					["text_shadowXOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_anchorPoint"] = "CENTER",
					["text_text"] = "%p",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_color"] = true,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_abbreviate"] = false,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["type"] = "subborder",
					["border_size"] = 18,
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["border_offset"] = 4,
				}, -- [4]
			},
			["height"] = 40,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_never"] = true,
				["use_class"] = true,
				["use_spellknown"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = false,
				["use_class_and_spec"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["spellknown"] = 79206,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["xOffset"] = -10,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["cooldownEdge"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["cooldown"] = true,
			["displayIcon"] = 451170,
			["uid"] = "m3HSmzG)8KB",
			["cooldownTextDisabled"] = true,
			["zoom"] = 0.1,
			["width"] = 40,
			["tocversion"] = 100002,
			["id"] = "Spiritwalker's Grace",
			["alpha"] = 1,
			["useCooldownModRate"] = true,
			["anchorFrameType"] = "SELECTFRAME",
			["frameStrata"] = 1,
			["config"] = {
			},
			["inverse"] = true,
			["icon"] = true,
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["authorOptions"] = {
			},
		},
		["Dragonriding"] = {
			["controlledChildren"] = {
				"Dragonriding UI Speed", -- [1]
				"Momentum High", -- [2]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = 0,
			["yOffset"] = -5,
			["anchorPoint"] = "TOP",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["names"] = {
						},
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 64,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["subRegions"] = {
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["scale"] = 1,
			["border"] = false,
			["anchorFrameFrame"] = "EncounterBar",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["config"] = {
			},
			["borderInset"] = 1,
			["id"] = "Dragonriding",
			["parent"] = "PanzaUI - Utilities",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["selfPoint"] = "CENTER",
			["uid"] = "EkrJogiYU)g",
			["borderEdge"] = "Square Full White",
			["groupIcon"] = 4640486,
			["conditions"] = {
			},
			["information"] = {
			},
			["authorOptions"] = {
			},
		},
		["Shaman - Movement"] = {
			["arcLength"] = 360,
			["controlledChildren"] = {
				"Spiritwalker's Grace", -- [1]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["parent"] = "PanzaUI - Shaman",
			["yOffset"] = -20,
			["anchorPoint"] = "LEFT",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["rowSpace"] = 1,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["names"] = {
						},
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["internalVersion"] = 64,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["align"] = "CENTER",
			["stagger"] = 0,
			["uid"] = "aultwt(EAes",
			["subRegions"] = {
			},
			["selfPoint"] = "BOTTOM",
			["radius"] = 200,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fullCircle"] = true,
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["xOffset"] = -15,
			["animate"] = false,
			["grow"] = "UP",
			["scale"] = 1,
			["centerType"] = "LR",
			["border"] = false,
			["anchorFrameFrame"] = "SUFUnitplayer",
			["regionType"] = "dynamicgroup",
			["borderSize"] = 2,
			["sort"] = "none",
			["authorOptions"] = {
			},
			["config"] = {
			},
			["anchorFrameParent"] = false,
			["constantFactor"] = "RADIUS",
			["limit"] = 5,
			["borderOffset"] = 4,
			["frameStrata"] = 1,
			["gridType"] = "RD",
			["id"] = "Shaman - Movement",
			["rotation"] = 0,
			["gridWidth"] = 5,
			["anchorFrameType"] = "SELECTFRAME",
			["space"] = 2,
			["borderInset"] = 1,
			["borderEdge"] = "Square Full White",
			["useLimit"] = false,
			["conditions"] = {
			},
			["information"] = {
			},
			["groupIcon"] = 135788,
		},
		["PanzaUI - Shaman"] = {
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["controlledChildren"] = {
				"Shaman - Buffs", -- [1]
				"Shaman - Healer", -- [2]
				"Shaman - Movement", -- [3]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["scale"] = 1,
			["xOffset"] = 0,
			["border"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderSize"] = 2,
			["config"] = {
			},
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["borderEdge"] = "Square Full White",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["names"] = {
						},
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["regionType"] = "group",
			["borderOffset"] = 4,
			["authorOptions"] = {
			},
			["selfPoint"] = "CENTER",
			["id"] = "PanzaUI - Shaman",
			["groupIcon"] = "interface/icons/classicon_shaman.blp",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["internalVersion"] = 64,
			["borderInset"] = 1,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["subRegions"] = {
			},
			["uid"] = "NQLI0nZOkMV",
			["conditions"] = {
			},
			["information"] = {
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
		},
		["Totem #5"] = {
			["iconSource"] = -1,
			["wagoID"] = "RfkIi6uSZ",
			["parent"] = "Shaman - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "\n\n",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "--- OPTIONS ---\naura_env.icon_crop = 0.15  -- The abound of Icon zoom (crop of its borders) Can me any value from 0 to 1 but more than 0.3 hardly makes much sence.\naura_env.icon_offset_X = 0.5  -- Horizontal position of the shown texture (0 - shows the leftmost part, 1 shows the rightmost part)\naura_env.icon_offset_Y = 0.5  -- Vertical position of the shown texture (0 - shows the topmost part, 1 shows the bottommost part)\n--- DON'T EDIT BELOW ---\n\naura_env.set_coord = function()\n    -- Подготовка и промежуточные расчеты\n    local X = aura_env.region.width -- находим ширину иконки\n    local Y = aura_env.region.height -- находим высоту иконки\n    local length_X = (1 - aura_env.icon_crop) * (X / math.max(X,Y)) -- Ширина области после преобразования \n    local length_Y = (1 - aura_env.icon_crop) * (Y / math.max(X,Y)) -- Высота области после преобразоания \n    local axis_X = (aura_env.icon_crop + length_X) * 0.5 + aura_env.icon_offset_X * (1 - aura_env.icon_crop - length_X)  -- Положение центральной оси по ширине (с учетом статичного кропа)\n    local axis_Y = (aura_env.icon_crop + length_Y) * 0.5 + aura_env.icon_offset_Y * (1 - aura_env.icon_crop - length_Y) -- Положение центральной оси по высоте (с учетом статичного кропа)\n    -- Основные расчеты\n    local X1 = axis_X - length_X * 0.5 -- Находим позицию №1 по ширине\n    local X2 = axis_X + length_X * 0.5 -- Находим позицию №2 по ширине\n    local Y1 = axis_Y - length_Y * 0.5 -- Находим позицию №1 по высоте\n    local Y2 = axis_Y + length_Y * 0.5 -- Находим позицию №2 по высоте\n    -- Вывод результатов\n    aura_env.region.icon.SetTexCoord = nil\n    aura_env.region.icon:SetTexCoord(X1, X2, Y1, Y2) -- Назначение границ текстуры\nend\n\naura_env.set_coord ()",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"Dampen Harm", -- [1]
						},
						["duration"] = "1",
						["unit"] = "player",
						["use_totemType"] = true,
						["debuffType"] = "HELPFUL",
						["type"] = "spell",
						["auraspellids"] = {
							"260895", -- [1]
						},
						["unevent"] = "auto",
						["use_absorbMode"] = true,
						["event"] = "Totem",
						["totemType"] = 5,
						["names"] = {
							"Shield of the Righteous", -- [1]
						},
						["useExactSpellId"] = true,
						["spellIds"] = {
							132403, -- [1]
						},
						["useName"] = false,
						["buffShowOn"] = "showOnActive",
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["alphaType"] = "custom",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "\n\n",
					["use_alpha"] = true,
					["scaleType"] = "straightScale",
					["easeType"] = "none",
					["colorA"] = 1,
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 0,
					["easeStrength"] = 3,
					["use_scale"] = false,
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["rotate"] = 0,
					["type"] = "none",
					["duration"] = "1",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["desaturate"] = false,
			["version"] = 6,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_text_format_p_time_format"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 262,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_petbattle"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_dragonriding"] = false,
				["role"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["use_combat"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "SHAMAN",
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["selfPoint"] = "TOPLEFT",
			["uid"] = "dyMghZFVIIS",
			["authorOptions"] = {
			},
			["alpha"] = 1,
			["regionType"] = "icon",
			["cooldown"] = false,
			["icon"] = true,
			["auto"] = true,
			["zoom"] = 0.3,
			["width"] = 40,
			["frameStrata"] = 1,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.5",
			["tocversion"] = 90005,
			["id"] = "Totem #5",
			["xOffset"] = 0,
			["useCooldownModRate"] = true,
			["anchorFrameType"] = "SCREEN",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["inverse"] = false,
			["url"] = "",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["iconInset"] = 0,
		},
		["Summon White Tiger Statue"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "388686",
						["useGroup_count"] = false,
						["duration"] = "30",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_tooltip"] = false,
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["auranames"] = {
							"120954", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["unevent"] = "timed",
						["type"] = "combatlog",
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["debuffType"] = "HELPFUL",
						["name"] = "Fortifying Brew",
						["event"] = "Combat Log",
						["custom_hide"] = "timed",
						["auraspellids"] = {
							"392883", -- [1]
						},
						["use_spellId"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_sourceUnit"] = true,
						["useExactSpellId"] = true,
						["combineMatches"] = "showLowest",
						["sourceUnit"] = "player",
						["matchesShowOn"] = "showOnActive",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
						[270] = true,
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[9] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 2,
					["multi"] = {
						[2] = true,
						[3] = true,
					},
				},
				["use_class_and_spec"] = false,
				["use_vehicleUi"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_exact_spellknown"] = false,
				["spellknown"] = 388686,
				["role"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 0,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["url"] = "",
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["parent"] = "Monk - Buffs",
			["authorOptions"] = {
			},
			["uid"] = "V40jZ4s)c0g",
			["alpha"] = 1,
			["auto"] = false,
			["cooldownTextDisabled"] = false,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Summon White Tiger Statue",
			["zoom"] = 0.3,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["frameStrata"] = 4,
			["config"] = {
			},
			["inverse"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["displayIcon"] = 4667418,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["stickyDuration"] = false,
		},
		["Celestial Brew"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Celestial Brew", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["fetchTooltip"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["remaining_operator"] = ">",
						["useGroup_count"] = false,
						["useExactSpellId"] = false,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["custom_hide"] = "timed",
						["use_tooltip"] = false,
						["matchesShowOn"] = "showOnActive",
						["use_totemNamePattern"] = false,
						["ownOnly"] = true,
						["useName"] = true,
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["type"] = "aura2",
						["unevent"] = "timed",
						["auraspellids"] = {
							"386963", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_totemName"] = false,
						["use_unit"] = true,
						["sourceUnit"] = "player",
						["use_debuffClass"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [2]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%1.tooltip1",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowXOffset"] = 0,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_format"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["anchorYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "BOTTOM",
					["text_shadowYOffset"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 12,
					["text_text_format_1.tooltip1_format"] = "none",
					["text_text_format_p_format"] = "timed",
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 322507,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["cooldownTextDisabled"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["url"] = "",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 1360979,
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["auto"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Celestial Brew",
			["authorOptions"] = {
			},
			["frameStrata"] = 4,
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["uid"] = "3jcpZl38KyN",
			["inverse"] = false,
			["parent"] = "Monk - Buffs",
			["conditions"] = {
			},
			["cooldown"] = false,
			["selfPoint"] = "CENTER",
		},
		["Heal - Essence Font 2"] = {
			["iconSource"] = -1,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = true,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnReady",
						["names"] = {
						},
						["spellName"] = 191837,
						["charges_operator"] = ">",
						["type"] = "spell",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 191837,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_charges"] = false,
						["subeventPrefix"] = "SPELL",
						["charges"] = "0",
						["use_track"] = true,
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "TOPLEFT",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["type"] = "subtext",
					["text_anchorXOffset"] = 2,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["text_text_format_p_format"] = "timed",
					["text_visible"] = true,
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 270,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 17,
					["multi"] = {
						[191837] = true,
					},
				},
				["use_vehicle"] = false,
				["use_class_and_spec"] = true,
				["use_talent"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_never"] = true,
				["use_spec"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[2] = true,
					},
				},
				["use_combat"] = true,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["xOffset"] = 0,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "bounceDecay",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["regionType"] = "icon",
			["parent"] = "Shaman - Healer",
			["authorOptions"] = {
			},
			["cooldown"] = false,
			["displayIcon"] = 1360978,
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["zoom"] = 0.1,
			["anchorFrameType"] = "SCREEN",
			["tocversion"] = 100002,
			["id"] = "Heal - Essence Font 2",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["width"] = 30,
			["cooldownTextDisabled"] = true,
			["uid"] = "Jz39Py8ncy5",
			["inverse"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["init"] = {
				},
				["finish"] = {
					["glow_frame_type"] = "UNITFRAME",
					["do_glow"] = false,
					["glow_action"] = "show",
				},
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["url"] = "",
		},
		["Sheilun's Gift Clouds"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"116645", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["custom_type"] = "status",
						["event"] = "Cooldown Progress (Spell)",
						["remaining_operator"] = ">",
						["useExactSpellId"] = false,
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["check"] = "update",
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["custom_hide"] = "timed",
						["matchesShowOn"] = "showOnActive",
						["custom"] = "function()\n   return true \nend",
						["useStacks"] = true,
						["useGroup_count"] = false,
						["use_tooltip"] = false,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["customDuration"] = "function()\n    local cur_stacks = GetSpellCount(\"Sheilun's Gift\") \n    local max_stacks = 10\n    \n    return cur_stacks, max_stacks, true\n    \nend",
						["stacks"] = "1",
						["totemType"] = 1,
						["ownOnly"] = true,
						["use_totemName"] = false,
						["use_unit"] = true,
						["unevent"] = "timed",
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["useName"] = true,
						["type"] = "custom",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_totemNamePattern"] = false,
						["stacksOperator"] = ">=",
						["sourceUnit"] = "player",
						["use_absorbHealMode"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["spellCount"] = "1",
						["direction"] = "CHANGED",
						["spellId"] = "132578",
						["auranames"] = {
							"116645", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_direction"] = true,
						["use_totemType"] = true,
						["spellName"] = 399491,
						["custom_hide"] = "timed",
						["use_debuffClass"] = false,
						["stacksOperator"] = ">=",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["useExactSpellId"] = false,
						["matchesShowOn"] = "showOnActive",
						["event"] = "Cooldown Progress (Spell)",
						["use_track"] = true,
						["use_absorbMode"] = true,
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["check"] = "update",
						["combineMatches"] = "showLowest",
						["spellCount_operator"] = ">=",
						["use_totemNamePattern"] = false,
						["use_charges"] = false,
						["totemName"] = "123904",
						["useStacks"] = true,
						["useGroup_count"] = false,
						["subeventPrefix"] = "SPELL",
						["use_totemName"] = false,
						["genericShowOn"] = "showAlways",
						["use_unit"] = true,
						["use_tooltip"] = false,
						["stacks"] = "1",
						["duration"] = "",
						["unevent"] = "timed",
						["useName"] = true,
						["use_remaining"] = false,
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HELPFUL",
						["charges_operator"] = ">=",
						["type"] = "spell",
						["charges"] = "1",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["use_spellCount"] = true,
						["unit"] = "player",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["totemType"] = 1,
						["realSpellName"] = "Sheilun's Gift",
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_genericShowOn"] = true,
						["use_absorbHealMode"] = true,
						["custom_type"] = "status",
						["sourceUnit"] = "player",
						["remaining_operator"] = ">",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_format"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "BOTTOM",
					["anchorYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = true,
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["spellknown"] = 399491,
				["role"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["width"] = 40,
			["alpha"] = 1,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 1242282,
			["parent"] = "Monk - Buffs",
			["icon"] = true,
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["zoom"] = 0.3,
			["cooldownTextDisabled"] = false,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Sheilun's Gift Clouds",
			["auto"] = false,
			["frameStrata"] = 4,
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["uid"] = "lw7CIHqvJiF",
			["inverse"] = false,
			["url"] = "",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "charges",
						["value"] = "10",
						["op"] = "==",
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.glow",
						}, -- [1]
					},
				}, -- [1]
			},
			["cooldown"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Momentum High"] = {
			["sparkWidth"] = 10,
			["sparkOffsetX"] = 0,
			["wagoID"] = "oXqLOc7a-",
			["parent"] = "Dragonriding",
			["preferToUpdate"] = false,
			["yOffset"] = -90,
			["anchorPoint"] = "TOP",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["triggers"] = {
				{
					["trigger"] = {
						["useName"] = true,
						["subeventSuffix"] = "_CAST_START",
						["ownOnly"] = true,
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["type"] = "aura2",
						["auranames"] = {
							"Thrill of the Skies", -- [1]
						},
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "event",
						["spellId"] = "372610",
						["debuffType"] = "HELPFUL",
						["duration"] = "2.7",
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["realSpellName"] = 0,
						["use_spellId"] = true,
						["unit"] = "player",
						["event"] = "Spell Cast Succeeded",
						["use_spellName"] = true,
						["use_genericShowOn"] = true,
						["use_track"] = true,
						["spellName"] = 0,
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["type"] = "aura2",
						["use_alwaystrue"] = true,
						["useExactSpellId"] = true,
						["use_absorbMode"] = true,
						["event"] = "Conditions",
						["use_unit"] = true,
						["unit"] = "player",
						["use_absorbHealMode"] = true,
						["auraspellids"] = {
							"360954", -- [1]
							"368901", -- [2]
							"368896", -- [3]
							"368899", -- [4]
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [3]
				["disjunctive"] = "all",
				["activeTriggerMode"] = 2,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["sparkHidden"] = "NEVER",
			["selfPoint"] = "BOTTOM",
			["iconSource"] = -1,
			["barColor"] = {
				1, -- [1]
				0.023529414087534, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["information"] = {
				["forceEvents"] = true,
			},
			["internalVersion"] = 64,
			["version"] = 8,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["border_size"] = 10,
					["border_anchor"] = "bar",
					["border_offset"] = 2,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Drop Shadow",
					["type"] = "subborder",
				}, -- [3]
				{
					["border_size"] = 13,
					["border_anchor"] = "bar",
					["border_offset"] = 2,
					["border_color"] = {
						1, -- [1]
						0.83921575546265, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["type"] = "subborder",
				}, -- [4]
			},
			["height"] = 15,
			["authorOptions"] = {
			},
			["load"] = {
				["use_namerealm"] = false,
				["use_petbattle"] = false,
				["use_zoneIds"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_dragonriding"] = true,
				["zoneIds"] = "g1978, 1978, 2112, 2093, 2025, 2024, 2023, 2022",
				["use_never"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["namerealm"] = "zfe",
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["source"] = "import",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["uid"] = "h0IbTB6i8TU",
			["xOffset"] = 0,
			["smoothProgress"] = true,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["anchorFrameType"] = "SELECTFRAME",
			["alpha"] = 1,
			["icon_side"] = "RIGHT",
			["gradientOrientation"] = "HORIZONTAL",
			["sparkHeight"] = 30,
			["texture"] = "ToxiUI Clean",
			["semver"] = "1.0.7",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["spark"] = false,
			["tocversion"] = 100002,
			["id"] = "Momentum High",
			["zoom"] = 0,
			["frameStrata"] = 1,
			["width"] = 240,
			["config"] = {
			},
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["sparkOffsetY"] = 0,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "OR",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "show",
								["value"] = 0,
							}, -- [1]
						},
					},
					["changes"] = {
						{
							["value"] = false,
						}, -- [1]
						{
							["value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								0, -- [4]
							},
							["property"] = "barColor",
						}, -- [2]
					},
				}, -- [1]
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["icon"] = false,
		},
		["Shaman - Missing Windfury Weapon"] = {
			["iconSource"] = 0,
			["parent"] = "Alerts",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
					["glow_frame_type"] = "UNITFRAME",
					["do_glow"] = false,
					["glow_action"] = "show",
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["enchant"] = "Windfury",
						["auranames"] = {
							"33757", -- [1]
						},
						["matchesShowOn"] = "showOnMissing",
						["use_weapon"] = true,
						["spellName"] = 58875,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_showOn"] = true,
						["event"] = "Weapon Enchant",
						["use_exact_spellName"] = true,
						["check"] = "event",
						["use_track"] = true,
						["itemName"] = 0,
						["use_charges"] = false,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["use_absorbMode"] = true,
						["custom_type"] = "event",
						["names"] = {
						},
						["use_enchant"] = true,
						["use_HasPet"] = false,
						["debuffType"] = "HELPFUL",
						["charges_operator"] = "<",
						["type"] = "item",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["custom_hide"] = "custom",
						["useName"] = true,
						["use_itemName"] = true,
						["charges"] = "1",
						["realSpellName"] = 58875,
						["use_spellName"] = true,
						["events"] = "PLAYER_DEAD,UPDATE_INVENTORY_DURABILITY,PLAYER_ENTERING_WORLD",
						["unit"] = "player",
						["showOn"] = "showOnMissing",
						["use_genericShowOn"] = true,
						["ownOnly"] = true,
						["weapon"] = "main",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 18,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "LEFT",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_text_format_p_abbreviate_max"] = 8,
					["type"] = "subtext",
					["text_anchorXOffset"] = 10,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["text_text_format_c_format"] = "none",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_color"] = true,
					["text_text_format_p_gcd_cast"] = false,
					["text_text"] = "Missing Windfury Weapon",
					["text_anchorPoint"] = "OUTER_RIGHT",
					["text_shadowXOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["border_offset"] = 4,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["border_size"] = 18,
				}, -- [4]
			},
			["height"] = 30,
			["load"] = {
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["use_spellknown"] = true,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[262] = true,
						[264] = true,
					},
				},
				["use_vehicleUi"] = false,
				["use_spec"] = false,
				["use_exact_spellknown"] = true,
				["spellknown"] = 33757,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon"] = true,
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["url"] = "",
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["frameStrata"] = 1,
			["zoom"] = 0.1,
			["anchorFrameType"] = "SELECTFRAME",
			["tocversion"] = 100002,
			["id"] = "Shaman - Missing Windfury Weapon",
			["useCooldownModRate"] = true,
			["alpha"] = 1,
			["width"] = 30,
			["cooldownTextDisabled"] = true,
			["uid"] = ")wu9FKK8747",
			["inverse"] = false,
			["authorOptions"] = {
			},
			["displayIcon"] = 462329,
			["cooldown"] = false,
			["xOffset"] = 0,
		},
		["Ascendance"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"114050", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_totemNamePattern"] = false,
						["useGroup_count"] = false,
						["use_debuffClass"] = false,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["ownOnly"] = true,
						["use_tooltip"] = false,
						["use_remaining"] = true,
						["use_absorbMode"] = true,
						["unit"] = "player",
						["matchesShowOn"] = "showOnActive",
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["useName"] = true,
						["subeventPrefix"] = "SPELL",
						["unevent"] = "timed",
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["remaining_operator"] = ">",
						["use_unit"] = true,
						["custom_hide"] = "timed",
						["sourceUnit"] = "player",
						["useExactSpellId"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_fontType"] = "OUTLINE",
					["text_shadowXOffset"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = true,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["use_vehicleUi"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 108271,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["cooldownEdge"] = false,
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["icon"] = true,
			["desaturate"] = false,
			["uid"] = "HLrT1LFlYfX",
			["alpha"] = 1,
			["auto"] = false,
			["cooldownTextDisabled"] = false,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Ascendance",
			["zoom"] = 0.3,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["frameStrata"] = 4,
			["config"] = {
			},
			["inverse"] = false,
			["parent"] = "Shaman - Buffs",
			["displayIcon"] = 135791,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Enveloping Mist (Chi)"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"343820", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["remaining_operator"] = ">",
						["use_debuffClass"] = false,
						["custom_hide"] = "timed",
						["useStacks"] = true,
						["useGroup_count"] = false,
						["matchesShowOn"] = "showOnActive",
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["use_totemNamePattern"] = false,
						["use_tooltip"] = false,
						["use_totemName"] = false,
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["ownOnly"] = true,
						["totemType"] = 1,
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HELPFUL",
						["duration"] = "25",
						["type"] = "aura2",
						["unevent"] = "timed",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["subeventPrefix"] = "SPELL",
						["use_remaining"] = true,
						["useName"] = true,
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["stacks"] = "1",
						["unit"] = "player",
						["useExactSpellId"] = false,
						["sourceUnit"] = "player",
						["stacksOperator"] = ">=",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [2]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_format"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowXOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "BOTTOM",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["use_dragonriding"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 325197,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["width"] = 40,
			["cooldownTextDisabled"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["url"] = "",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 977169,
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["auto"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Enveloping Mist (Chi)",
			["authorOptions"] = {
			},
			["frameStrata"] = 4,
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["uid"] = "JEdr5DFT5m(",
			["inverse"] = false,
			["parent"] = "Monk - Buffs",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "stacks",
						["value"] = "3",
						["op"] = "==",
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.4.glow",
						}, -- [1]
					},
				}, -- [1]
			},
			["cooldown"] = false,
			["selfPoint"] = "CENTER",
		},
		["Stable"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "vVnrs5WY3",
			["parent"] = "Valdrakken Map Labels",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = -194.50354003906,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["duration"] = "1",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Conditions",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["spellIds"] = {
						},
						["events"] = "OPEN_WORLD_MAP, WORLD_MAP_UPDATE, QUEST_LOG_UPDATE",
						["custom"] = "function()\n    local mapID = WorldMapFrame:GetMapID()\n    if mapID == 2112 then -- Valdrakken\n        return true\n    else\n        return false\n    end\nend\n\n\n--2112 = Valdrakken\n--2112 = Valdrakken",
						["check"] = "update",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["font"] = "Expressway",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "2112",
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["xOffset"] = -151.96319580078,
			["anchorFrameFrame"] = "WorldMapFrame",
			["regionType"] = "text",
			["url"] = "",
			["authorOptions"] = {
			},
			["fixedWidth"] = 200,
			["displayText_format_p_time_precision"] = 1,
			["displayText"] = "Stable",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "Stable",
			["wordWrap"] = "WordWrap",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["shadowYOffset"] = -1,
			["uid"] = "wJT6CLFKg1P",
			["justify"] = "CENTER",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 135,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["easeStrength"] = 3,
					["preset"] = "spiralandpulse",
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Hide/Collapse Objectives"] = {
			["iconSource"] = -1,
			["wagoID"] = "WHMWWJawe",
			["xOffset"] = 822.53607177734,
			["preferToUpdate"] = false,
			["yOffset"] = 219.3427734375,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "-- CONSTANTS\naura_env.INSTANCE_CATEGORY = {\n    [\"raid\"] = {\n        3, -- 10 Player\n        4, -- 25 Player\n        5, -- 10 Player (Heroic)\n        6, -- 25 Player (Heroic)\n        -- 7, -- LFR (Legacy)\n        9, -- 40 Player\n        14, -- Raid (Normal)\n        15, -- Raid (Heroic)\n        16, -- Raid (Mythic)\n        17, -- LFR\n        -- 18, -- Event\n        33, -- Timewalking\n        151 -- LFR Timewalking\n    },\n    [\"party\"] = {\n        1, -- Normal\n        2, -- Heroic\n        8, -- Mythic Keystone\n        -- 19, -- Event\n        23, -- Mythic M0\n        24 -- Timewalking\n        -- 150 -- Normal\n    },\n    [\"pvp\"] = {\n        29, -- PvEvP Scenario\n        34 -- PvP\n        -- 45 -- PvP Scenario\n    },\n    [\"torghast\"] = 167\n}\n\naura_env.HIDE_OBJECTIVES = 1\naura_env.COLLAPSE_ALL_OBJECTIVES = 2\naura_env.SHOW_AND_EXPAND_OBJECTIVES = 3\naura_env.COLLAPSE_ALL_BUT_INSTANCE = 4\n\n--[[\n  https://github.com/tomrus88/BlizzardInterfaceCode/blob/master/Interface/AddOns/Blizzard_ObjectiveTracker/Blizzard_ObjectiveTracker.lua#L794\n  \n  ACHIEVEMENT_TRACKER_MODULE\n  BONUS_OBJECTIVE_TRACKER_MODULE\n  CAMPAIGN_QUEST_TRACKER_MODULE\n  QUEST_TRACKER_MODULE\n  SCENARIO_CONTENT_TRACKER_MODULE -- Show in Dungeons\n  UI_WIDGET_TRACKER_MODULE\n  WORLD_QUEST_TRACKER_MODULE\n\n]]\n\n-- UTIL\naura_env.hideObjectives = function() aura_env.OBJECTIVE_TRACKER:Hide() end\n\naura_env.setCollapsed = function(module, shouldCollapse)\n    local isCollapsed = module:IsCollapsed() and true or false -- is `nil` onLoad\n\n    if (shouldCollapse ~= isCollapsed) then\n        module.Header.MinimizeButton:Click()\n    end\nend\n\naura_env.collapseAllObjectives = function()\n    aura_env.OBJECTIVE_TRACKER:Show()\n    ObjectiveTracker_Collapse()\nend\n\naura_env.showAndExpandObjectives = function()\n    aura_env.OBJECTIVE_TRACKER:Show()\n    ObjectiveTracker_Expand()\n\n    aura_env.setCollapsed(ACHIEVEMENT_TRACKER_MODULE, false)\n    aura_env.setCollapsed(BONUS_OBJECTIVE_TRACKER_MODULE, false)\n    aura_env.setCollapsed(CAMPAIGN_QUEST_TRACKER_MODULE, false)\n    aura_env.setCollapsed(QUEST_TRACKER_MODULE, false)\n    aura_env.setCollapsed(WORLD_QUEST_TRACKER_MODULE, false)\nend\n\naura_env.collapseAllButInstance = function()\n    aura_env.showAndExpandObjectives()\n\n    aura_env.setCollapsed(ACHIEVEMENT_TRACKER_MODULE, true)\n    aura_env.setCollapsed(BONUS_OBJECTIVE_TRACKER_MODULE, true)\n    aura_env.setCollapsed(CAMPAIGN_QUEST_TRACKER_MODULE, true)\n    aura_env.setCollapsed(QUEST_TRACKER_MODULE, true)\n    aura_env.setCollapsed(WORLD_QUEST_TRACKER_MODULE, true)\nend\n\naura_env.handleVisibilitySetting = function(setting)\n    if (setting == aura_env.HIDE_OBJECTIVES) then\n        aura_env.hideObjectives()\n        return aura_env.config.shouldShowIconOnHide\n    elseif (setting == aura_env.COLLAPSE_ALL_OBJECTIVES) then\n        aura_env.collapseAllObjectives()\n        return aura_env.config.shouldShowIconOnCollapse\n    elseif (setting == aura_env.SHOW_AND_EXPAND_OBJECTIVES) then\n        aura_env.showAndExpandObjectives()\n        return false\n    elseif (setting == aura_env.COLLAPSE_ALL_BUT_INSTANCE) then\n        aura_env.collapseAllButInstance()\n        return aura_env.config.shouldShowIconOnCollapse\n    end\nend\n\naura_env.getInstanceSettings = function(instanceType, maxPlayers)\n    local instanceSettings = {}\n\n    if (instanceType == \"party\" and maxPlayers > 1) then\n        for _, v in pairs(aura_env.INSTANCE_CATEGORY.party) do\n            instanceSettings[v] = aura_env.config.settingsDungeons\n        end\n    end\n\n    if (instanceType == \"raid\") then\n        for _, v in pairs(aura_env.INSTANCE_CATEGORY.raid) do\n            instanceSettings[v] = aura_env.config.settingsRaid\n        end\n    end\n\n    if (instanceType == \"pvp\" or instanceType == \"arena\") then\n        for _, v in pairs(aura_env.INSTANCE_CATEGORY.pvp) do\n            instanceSettings[v] = aura_env.config.settingsPvP\n        end\n    end\n\n    instanceSettings[aura_env.INSTANCE_CATEGORY.torghast] = aura_env.config\n                                                                .settingsTorghast\n\n    return instanceSettings\nend\n\n-- INIT\naura_env.OBJECTIVE_TRACKER = (IsAddOnLoaded(\"!KalielsTracker\") and\n                                 _G[\"!KalielsTrackerFrame\"]) or\n                                 ObjectiveTrackerFrame\n",
					["do_custom"] = true,
				},
				["finish"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["itemName"] = 0,
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["dynamicDuration"] = true,
						["use_absorbMode"] = true,
						["spellName"] = 0,
						["custom_hide"] = "custom",
						["debuffType"] = "HELPFUL",
						["custom"] = "function (event, ...)\n    aura_env.OBJECTIVE_TRACKER = (IsAddOnLoaded(\"!KalielsTracker\") and\n                                     _G[\"!KalielsTrackerFrame\"]) or\n                                     ObjectiveTrackerFrame\n\n    local _, instanceType, difficultyIndex, _, maxPlayers = GetInstanceInfo()\n\n    local settings = aura_env.getInstanceSettings(instanceType, maxPlayers)\n\n    local instanceSetting = settings[difficultyIndex]\n\n    local visibilitySetting = instanceSetting or\n                                  aura_env.config.settingsEverywhereElse\n\n    return aura_env.handleVisibilitySetting(visibilitySetting)\nend\n",
						["type"] = "custom",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["use_itemName"] = true,
						["event"] = "Combat Log",
						["events"] = "CHALLENGE_MODE_COMPLETED, CHALLENGE_MODE_START, PLAYER_ENTERING_WORLD, WORLD_MAP_UPDATE, ZONE_CHANGED_NEW_AREA",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["custom_type"] = "event",
						["check"] = "event",
						["use_unit"] = true,
						["use_track"] = true,
						["customVariables"] = "\n\n",
					},
					["untrigger"] = {
						["custom"] = "",
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 19,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glowScale"] = 1,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 64,
			["load"] = {
				["difficulty"] = {
				},
				["use_size"] = false,
				["use_never"] = false,
				["instance_type"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["flexible"] = true,
						["ten"] = true,
						["twentyfive"] = true,
						["twenty"] = true,
						["fortyman"] = true,
					},
				},
			},
			["source"] = "import",
			["frameStrata"] = 1,
			["uid"] = "APLXIbti)g6",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon"] = true,
			["regionType"] = "icon",
			["information"] = {
				["forceEvents"] = true,
			},
			["displayIcon"] = 134332,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desc"] = "Hide/Collapse Objective Tracker while in Dungeons, Raid, PvP, and/or Torghast.",
			["width"] = 64,
			["useCooldownModRate"] = true,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.18",
			["tocversion"] = 90205,
			["id"] = "Hide/Collapse Objectives",
			["zoom"] = 0,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["cooldownEdge"] = false,
			["config"] = {
				["settingsTorghast"] = 4,
				["settingsRaid"] = 2,
				["settingsEverywhereElse"] = 3,
				["settingsPvP"] = 2,
				["settingsDungeons"] = 4,
				["shouldShowIconOnHide"] = false,
				["shouldShowIconOnCollapse"] = false,
			},
			["inverse"] = false,
			["parent"] = "Quests",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "show",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = 0.5,
							["property"] = "alpha",
						}, -- [1]
						{
							["value"] = {
								1, -- [1]
								0.015686274509804, -- [2]
								0.015686274509804, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [2]
						{
							["value"] = 0.3,
							["property"] = "zoom",
						}, -- [3]
					},
				}, -- [1]
			},
			["cooldown"] = true,
			["authorOptions"] = {
				{
					["type"] = "space",
					["variableWidth"] = true,
					["height"] = 1,
					["width"] = 2,
					["useHeight"] = false,
				}, -- [1]
				{
					["type"] = "description",
					["text"] = "Hide/Collapse Objectives In:",
					["fontSize"] = "large",
					["width"] = 2,
				}, -- [2]
				{
					["type"] = "space",
					["variableWidth"] = true,
					["height"] = 1,
					["width"] = 2,
					["useHeight"] = false,
				}, -- [3]
				{
					["type"] = "select",
					["default"] = 1,
					["values"] = {
						"Hide", -- [1]
						"Collapse All", -- [2]
						"Show & Expand", -- [3]
						"Collapse All But Instance", -- [4]
					},
					["key"] = "settingsDungeons",
					["useDesc"] = false,
					["name"] = "Dungeons",
					["width"] = 0.8,
				}, -- [4]
				{
					["useName"] = false,
					["type"] = "header",
					["text"] = "",
					["noMerge"] = false,
					["width"] = 0.75,
				}, -- [5]
				{
					["type"] = "select",
					["default"] = 1,
					["values"] = {
						"Hide", -- [1]
						"Collapse All", -- [2]
						"Show & Expand", -- [3]
						"Collapse All But Instance", -- [4]
					},
					["key"] = "settingsRaid",
					["useDesc"] = false,
					["name"] = "Raid",
					["width"] = 0.8,
				}, -- [6]
				{
					["useName"] = false,
					["type"] = "header",
					["text"] = "",
					["noMerge"] = false,
					["width"] = 0.75,
				}, -- [7]
				{
					["type"] = "select",
					["default"] = 1,
					["values"] = {
						"Hide", -- [1]
						"Collapse All", -- [2]
						"Show & Expand", -- [3]
					},
					["key"] = "settingsPvP",
					["useDesc"] = false,
					["name"] = "PvP",
					["width"] = 0.8,
				}, -- [8]
				{
					["useName"] = false,
					["type"] = "header",
					["text"] = "",
					["noMerge"] = false,
					["width"] = 0.75,
				}, -- [9]
				{
					["type"] = "select",
					["default"] = 4,
					["values"] = {
						"Hide", -- [1]
						"Collapse All", -- [2]
						"Show & Expand", -- [3]
						"Collapse All But Instance", -- [4]
					},
					["key"] = "settingsTorghast",
					["useDesc"] = false,
					["name"] = "Torghast",
					["width"] = 0.8,
				}, -- [10]
				{
					["useName"] = false,
					["type"] = "header",
					["text"] = "",
					["noMerge"] = false,
					["width"] = 0.75,
				}, -- [11]
				{
					["type"] = "select",
					["default"] = 3,
					["values"] = {
						"Hide", -- [1]
						"Collapse", -- [2]
						"Show & Expand", -- [3]
						"Collapse All But Instance", -- [4]
					},
					["key"] = "settingsEverywhereElse",
					["useDesc"] = false,
					["name"] = "Everywhere Else",
					["width"] = 0.8,
				}, -- [12]
				{
					["useName"] = false,
					["type"] = "header",
					["text"] = "",
					["noMerge"] = false,
					["width"] = 0.75,
				}, -- [13]
				{
					["type"] = "description",
					["text"] = "Show Icon When:",
					["fontSize"] = "large",
					["width"] = 1,
				}, -- [14]
				{
					["type"] = "space",
					["variableWidth"] = true,
					["height"] = 1,
					["width"] = 2,
					["useHeight"] = false,
				}, -- [15]
				{
					["type"] = "toggle",
					["default"] = false,
					["desc"] = "Show an icon when objectives are hidden",
					["key"] = "shouldShowIconOnHide",
					["useDesc"] = true,
					["name"] = "Objectives Hidden",
					["width"] = 1,
				}, -- [16]
				{
					["type"] = "toggle",
					["default"] = false,
					["desc"] = "Show an icon when objectives are collapsed",
					["key"] = "shouldShowIconOnCollapse",
					["useDesc"] = true,
					["name"] = "Objectives Collapsed",
					["width"] = 1,
				}, -- [17]
			},
		},
		["Astral Shift"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Shaman - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"343196", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_debuffClass"] = false,
						["useExactSpellId"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["useGroup_count"] = false,
						["use_absorbHealMode"] = true,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["spellName"] = 0,
						["use_tooltip"] = false,
						["remaining_operator"] = ">",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_unit"] = true,
						["use_genericShowOn"] = true,
						["useName"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["type"] = "aura2",
						["unevent"] = "timed",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_absorbMode"] = true,
						["use_remaining"] = true,
						["ownOnly"] = true,
						["sourceUnit"] = "player",
						["use_totemNamePattern"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_format"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_format"] = "timed",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 108271,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["useCooldownModRate"] = true,
			["desaturate"] = false,
			["xOffset"] = 0,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 538565,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["config"] = {
			},
			["frameStrata"] = 4,
			["cooldownTextDisabled"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Astral Shift",
			["auto"] = false,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["uid"] = "3oGEmno6c2r",
			["inverse"] = false,
			["icon"] = true,
			["conditions"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
		},
		["Shaman - Haste Buff"] = {
			["iconSource"] = -1,
			["wagoID"] = "zGkglqspc",
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"Bloodlust", -- [1]
							"Time Warp", -- [2]
							"Heroism", -- [3]
							"Primal Rage", -- [4]
							"Drums of the Mountain", -- [5]
							"Drums of Fury", -- [6]
						},
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnReady",
						["subeventPrefix"] = "SPELL",
						["spellName"] = 327104,
						["charges_operator"] = ">",
						["charges"] = "0",
						["debuffType"] = "HELPFUL",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["useName"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 327104,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_charges"] = true,
						["type"] = "aura2",
						["unit"] = "player",
						["use_track"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["stickyDuration"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowXOffset"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_format"] = "timed",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_format"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = true,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[152173] = true,
						[391370] = true,
						[386965] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_vehicleUi"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["use_spec"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["use_class_and_spec"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["desaturate"] = false,
			["uid"] = "o)48)GHHfj9",
			["parent"] = "Shaman - Buffs",
			["cooldownEdge"] = false,
			["regionType"] = "icon",
			["cooldown"] = false,
			["displayIcon"] = "",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["init"] = {
				},
				["finish"] = {
					["do_glow"] = false,
					["glow_frame_type"] = "UNITFRAME",
					["glow_action"] = "show",
				},
			},
			["authorOptions"] = {
			},
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 4,
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Shaman - Haste Buff",
			["useCooldownModRate"] = true,
			["alpha"] = 1,
			["width"] = 40,
			["zoom"] = 0.3,
			["config"] = {
			},
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["City Portals"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "vVnrs5WY3",
			["parent"] = "Valdrakken Map Labels",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = 11.244689941406,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["duration"] = "1",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Conditions",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["spellIds"] = {
						},
						["events"] = "OPEN_WORLD_MAP, WORLD_MAP_UPDATE, QUEST_LOG_UPDATE",
						["custom"] = "function()\n    local mapID = WorldMapFrame:GetMapID()\n    if mapID == 2112 then -- Valdrakken\n        return true\n    else\n        return false\n    end\nend\n\n\n--2112 = Valdrakken\n--2112 = Valdrakken",
						["check"] = "update",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["font"] = "Expressway",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "2112",
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["xOffset"] = -93.178039550781,
			["anchorFrameFrame"] = "WorldMapFrame",
			["regionType"] = "text",
			["url"] = "",
			["authorOptions"] = {
			},
			["fixedWidth"] = 200,
			["displayText_format_p_time_precision"] = 1,
			["displayText"] = "City\nPortals\n",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "City Portals",
			["wordWrap"] = "WordWrap",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["shadowYOffset"] = -1,
			["uid"] = "SCe4Vt4gvmC",
			["justify"] = "CENTER",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 135,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["easeStrength"] = 3,
					["preset"] = "spiralandpulse",
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Totem #1"] = {
			["iconSource"] = -1,
			["wagoID"] = "RfkIi6uSZ",
			["parent"] = "Shaman - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "\n\n",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "--- OPTIONS ---\naura_env.icon_crop = 0.15  -- The abound of Icon zoom (crop of its borders) Can me any value from 0 to 1 but more than 0.3 hardly makes much sence.\naura_env.icon_offset_X = 0.5  -- Horizontal position of the shown texture (0 - shows the leftmost part, 1 shows the rightmost part)\naura_env.icon_offset_Y = 0.5  -- Vertical position of the shown texture (0 - shows the topmost part, 1 shows the bottommost part)\n--- DON'T EDIT BELOW ---\n\naura_env.set_coord = function()\n    -- Подготовка и промежуточные расчеты\n    local X = aura_env.region.width -- находим ширину иконки\n    local Y = aura_env.region.height -- находим высоту иконки\n    local length_X = (1 - aura_env.icon_crop) * (X / math.max(X,Y)) -- Ширина области после преобразования \n    local length_Y = (1 - aura_env.icon_crop) * (Y / math.max(X,Y)) -- Высота области после преобразоания \n    local axis_X = (aura_env.icon_crop + length_X) * 0.5 + aura_env.icon_offset_X * (1 - aura_env.icon_crop - length_X)  -- Положение центральной оси по ширине (с учетом статичного кропа)\n    local axis_Y = (aura_env.icon_crop + length_Y) * 0.5 + aura_env.icon_offset_Y * (1 - aura_env.icon_crop - length_Y) -- Положение центральной оси по высоте (с учетом статичного кропа)\n    -- Основные расчеты\n    local X1 = axis_X - length_X * 0.5 -- Находим позицию №1 по ширине\n    local X2 = axis_X + length_X * 0.5 -- Находим позицию №2 по ширине\n    local Y1 = axis_Y - length_Y * 0.5 -- Находим позицию №1 по высоте\n    local Y2 = axis_Y + length_Y * 0.5 -- Находим позицию №2 по высоте\n    -- Вывод результатов\n    aura_env.region.icon.SetTexCoord = nil\n    aura_env.region.icon:SetTexCoord(X1, X2, Y1, Y2) -- Назначение границ текстуры\nend\n\naura_env.set_coord ()",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"Dampen Harm", -- [1]
						},
						["duration"] = "1",
						["unit"] = "player",
						["use_totemType"] = true,
						["debuffType"] = "HELPFUL",
						["type"] = "spell",
						["auraspellids"] = {
							"260895", -- [1]
						},
						["unevent"] = "auto",
						["use_absorbMode"] = true,
						["event"] = "Totem",
						["totemType"] = 1,
						["names"] = {
							"Shield of the Righteous", -- [1]
						},
						["useExactSpellId"] = true,
						["spellIds"] = {
							132403, -- [1]
						},
						["useName"] = false,
						["buffShowOn"] = "showOnActive",
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["alphaType"] = "custom",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "\n\n",
					["use_alpha"] = true,
					["scaleType"] = "straightScale",
					["easeType"] = "none",
					["colorA"] = 1,
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 0,
					["easeStrength"] = 3,
					["use_scale"] = false,
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["rotate"] = 0,
					["type"] = "none",
					["duration"] = "1",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["desaturate"] = false,
			["version"] = 6,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_text_format_p_time_format"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 262,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_petbattle"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_dragonriding"] = false,
				["role"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["use_combat"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "SHAMAN",
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["selfPoint"] = "TOPLEFT",
			["uid"] = "xAjwrnGhYtc",
			["authorOptions"] = {
			},
			["alpha"] = 1,
			["regionType"] = "icon",
			["cooldown"] = false,
			["icon"] = true,
			["auto"] = true,
			["zoom"] = 0.3,
			["width"] = 40,
			["frameStrata"] = 1,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.5",
			["tocversion"] = 90005,
			["id"] = "Totem #1",
			["xOffset"] = 0,
			["useCooldownModRate"] = true,
			["anchorFrameType"] = "SCREEN",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["inverse"] = false,
			["url"] = "",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["iconInset"] = 0,
		},
		["Whirling Dragon Punch"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Dance of Chi-Ji", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 152175,
						["use_debuffClass"] = false,
						["useExactSpellId"] = false,
						["event"] = "Action Usable",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_totemNamePattern"] = false,
						["useGroup_count"] = false,
						["use_absorbHealMode"] = true,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["matchesShowOn"] = "showOnActive",
						["use_tooltip"] = false,
						["use_totemName"] = false,
						["use_unit"] = true,
						["ownOnly"] = true,
						["use_remaining"] = true,
						["type"] = "spell",
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["useName"] = true,
						["subeventPrefix"] = "SPELL",
						["unevent"] = "timed",
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["totemType"] = 1,
						["realSpellName"] = "Whirling Dragon Punch",
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["remaining_operator"] = ">",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["custom_hide"] = "timed",
						["sourceUnit"] = "player",
						["subeventSuffix"] = "_CAST_SUCCESS",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%c",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_format"] = 0,
					["type"] = "subtext",
					["anchorYOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_c_format"] = "none",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = true,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["use_vehicleUi"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 152175,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["url"] = "",
			["icon"] = true,
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["parent"] = "Monk - Buffs",
			["xOffset"] = 0,
			["uid"] = "cqwLc0qV3sr",
			["frameStrata"] = 4,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Whirling Dragon Punch",
			["semver"] = "7.0.2",
			["useCooldownModRate"] = true,
			["width"] = 40,
			["zoom"] = 0.3,
			["config"] = {
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 988194,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["desaturate"] = false,
		},
		["Flight Master"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "vVnrs5WY3",
			["parent"] = "Valdrakken Map Labels",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = -113.67401123047,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["duration"] = "1",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Conditions",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["spellIds"] = {
						},
						["events"] = "OPEN_WORLD_MAP, WORLD_MAP_UPDATE, QUEST_LOG_UPDATE",
						["custom"] = "function()\n    local mapID = WorldMapFrame:GetMapID()\n    if mapID == 2112 then -- Valdrakken\n        return true\n    else\n        return false\n    end\nend\n\n\n--2112 = Valdrakken\n--2112 = Valdrakken",
						["check"] = "update",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["font"] = "Expressway",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "2112",
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["xOffset"] = -180.65191650391,
			["anchorFrameFrame"] = "WorldMapFrame",
			["regionType"] = "text",
			["url"] = "",
			["authorOptions"] = {
			},
			["fixedWidth"] = 200,
			["displayText_format_p_time_precision"] = 1,
			["displayText"] = "Flight",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "Flight Master",
			["wordWrap"] = "WordWrap",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["shadowYOffset"] = -1,
			["uid"] = "VqZAAvSPpIf",
			["justify"] = "CENTER",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 135,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["easeStrength"] = 3,
					["preset"] = "spiralandpulse",
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Battle Res"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "BJLAo8a-M",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayText"] = "%c",
			["customText"] = "function()\n    local ts = GetTime()\n    if not aura_env.ts or aura_env.ts < ts - 1 then    \n        aura_env.ts = ts   \n        local charges, _, started, duration = GetSpellCharges(20484)\n        local time = \"0:00\"\n        if started then\n            local timer = duration - (GetTime() - started)\n            time = (\"%d:%02d\"):format(floor(timer / 60), mod(timer, 60))\n        end\n        if charges == nil then \n            charges = 0    \n        end\n        local color = \"|cFFFFFFFF\"\n        if charges < 1 then\n            color = \"|cFFFF0000\"\n        elseif charges > 1 then\n            color = \"|cFF00FF00\"\n        end\n        aura_env.content = \"|cFFAAAAAACR:|r \" .. color .. charges .. \"|r |cFFAAAAAA/|r \" .. time\n    end\n    return aura_env.content\nend",
			["shadowYOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["duration"] = "1",
						["genericShowOn"] = "showOnActive",
						["subeventPrefix"] = "SPELL",
						["customTexture"] = "\n\n",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["debuffType"] = "HELPFUL",
						["custom_hide"] = "custom",
						["use_eventtype"] = true,
						["type"] = "custom",
						["custom_type"] = "event",
						["unevent"] = "timed",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Combat Log",
						["customStacks"] = "\n\n",
						["customDuration"] = "\n\n",
						["customName"] = "\n\n",
						["custom"] = "function(event)\n    return event == \"ENCOUNTER_START\"\nend",
						["events"] = "ENCOUNTER_START ENCOUNTER_END",
						["check"] = "event",
						["use_unit"] = true,
						["names"] = {
						},
						["customIcon"] = "\n\n",
					},
					["untrigger"] = {
						["custom"] = "function(event)\n    return event == \"ENCOUNTER_END\"\nend",
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["duration"] = "0.2",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = false,
					["use_alpha"] = true,
					["type"] = "none",
					["easeType"] = "none",
					["scaley"] = 1,
					["alpha"] = 0.2,
					["y"] = 0,
					["x"] = 0,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["easeStrength"] = 3,
					["colorB"] = 1,
					["scalex"] = 1,
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["easeType"] = "none",
					["scaley"] = 1,
					["alpha"] = 0,
					["use_color"] = false,
					["y"] = 0,
					["x"] = 0,
					["colorType"] = "custom",
					["rotate"] = 0,
					["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\n    end\n  ",
					["easeStrength"] = 3,
					["scalex"] = 1,
					["colorB"] = 1,
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["alphaType"] = "straight",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_alpha"] = true,
					["type"] = "none",
					["easeType"] = "none",
					["scaley"] = 1,
					["alpha"] = 0.2,
					["y"] = 0,
					["x"] = 0,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["easeStrength"] = 3,
					["duration"] = "0.2",
					["colorA"] = 1,
				},
			},
			["font"] = "Expressway",
			["version"] = 4,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 19.999996185303,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["party"] = true,
						["flexible"] = true,
						["ten"] = true,
						["twentyfive"] = true,
						["twenty"] = true,
						["fortyman"] = true,
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_size"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["use_dragonriding"] = false,
				["use_petbattle"] = false,
			},
			["fontSize"] = 18,
			["source"] = "import",
			["shadowXOffset"] = 0,
			["displayText_format_c_format"] = "none",
			["preferToUpdate"] = false,
			["regionType"] = "text",
			["xOffset"] = 0,
			["url"] = "",
			["conditions"] = {
			},
			["authorOptions"] = {
			},
			["config"] = {
			},
			["selfPoint"] = "CENTER",
			["semver"] = "1.0.3",
			["tocversion"] = 100005,
			["id"] = "Battle Res",
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["width"] = 23.999828338623,
			["justify"] = "CENTER",
			["uid"] = "OM(BlgQ38La",
			["yOffset"] = 0,
			["parent"] = "Alerts",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["fixedWidth"] = 200,
			["information"] = {
				["forceEvents"] = false,
				["ignoreOptionsEventErrors"] = false,
			},
			["wordWrap"] = "WordWrap",
		},
		["Shaman - Missing Flametongue Weapon"] = {
			["iconSource"] = 0,
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["init"] = {
				},
				["finish"] = {
					["do_glow"] = false,
					["glow_frame_type"] = "UNITFRAME",
					["glow_action"] = "show",
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["enchant"] = "Flametongue",
						["auranames"] = {
							"318038", -- [1]
						},
						["ownOnly"] = true,
						["use_weapon"] = true,
						["custom_hide"] = "custom",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_showOn"] = true,
						["event"] = "Weapon Enchant",
						["use_exact_spellName"] = true,
						["check"] = "event",
						["use_track"] = true,
						["itemName"] = 0,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["names"] = {
						},
						["matchesShowOn"] = "showOnMissing",
						["custom_type"] = "event",
						["use_itemName"] = true,
						["use_HasPet"] = false,
						["debuffType"] = "HELPFUL",
						["charges_operator"] = "<",
						["type"] = "item",
						["useName"] = true,
						["events"] = "PLAYER_DEAD,UPDATE_INVENTORY_DURABILITY,PLAYER_ENTERING_WORLD",
						["use_genericShowOn"] = true,
						["spellName"] = 58875,
						["use_enchant"] = true,
						["charges"] = "1",
						["realSpellName"] = 58875,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_unit"] = true,
						["showOn"] = "showOnMissing",
						["use_charges"] = false,
						["subeventPrefix"] = "SPELL",
						["weapon"] = "off",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 18,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "LEFT",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_fontType"] = "OUTLINE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 10,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["anchorXOffset"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_format"] = 0,
					["text_shadowXOffset"] = 0,
					["text_text"] = "Missing Flametongue Weapon",
					["text_anchorPoint"] = "OUTER_RIGHT",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_color"] = true,
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["type"] = "subborder",
					["border_size"] = 18,
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["border_offset"] = 4,
				}, -- [4]
			},
			["height"] = 30,
			["load"] = {
				["use_class_and_spec"] = false,
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[263] = true,
					},
				},
				["use_vehicleUi"] = false,
				["use_spec"] = false,
				["use_exact_spellknown"] = true,
				["spellknown"] = 318038,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["authorOptions"] = {
			},
			["selfPoint"] = "CENTER",
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["url"] = "",
			["icon"] = true,
			["cooldown"] = false,
			["displayIcon"] = 462326,
			["uid"] = "WxwTVWFWQ4l",
			["alpha"] = 1,
			["cooldownTextDisabled"] = true,
			["width"] = 30,
			["tocversion"] = 100002,
			["id"] = "Shaman - Missing Flametongue Weapon",
			["frameStrata"] = 1,
			["useCooldownModRate"] = true,
			["anchorFrameType"] = "SELECTFRAME",
			["zoom"] = 0.1,
			["config"] = {
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["parent"] = "Alerts",
		},
		["Exploding Keg "] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"325153", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["useExactSpellId"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["useGroup_count"] = false,
						["use_absorbHealMode"] = true,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_tooltip"] = false,
						["use_absorbMode"] = true,
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["useName"] = true,
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["use_remaining"] = true,
						["subeventPrefix"] = "SPELL",
						["unevent"] = "timed",
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["auraspellids"] = {
							"386276", -- [1]
						},
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_totemNamePattern"] = false,
						["matchesShowOn"] = "showOnActive",
						["custom_hide"] = "timed",
						["sourceUnit"] = "player",
						["remaining_operator"] = ">",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["use_vehicleUi"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 325153,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["desaturate"] = false,
			["parent"] = "Monk - Buffs",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["xOffset"] = 0,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["uid"] = "OSk0z0lJ4Dh",
			["alpha"] = 1,
			["auto"] = false,
			["cooldownTextDisabled"] = false,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Exploding Keg ",
			["zoom"] = 0.3,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["frameStrata"] = 4,
			["config"] = {
			},
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["displayIcon"] = 644378,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["url"] = "",
		},
		["Auction House"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "vVnrs5WY3",
			["parent"] = "Valdrakken Map Labels",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = -71.014770507813,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["duration"] = "1",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Conditions",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["spellIds"] = {
						},
						["events"] = "OPEN_WORLD_MAP, WORLD_MAP_UPDATE, QUEST_LOG_UPDATE",
						["custom"] = "function()\n    local mapID = WorldMapFrame:GetMapID()\n    if mapID == 2112 then -- Valdrakken\n        return true\n    else\n        return false\n    end\nend\n\n\n--2112 = Valdrakken\n--2112 = Valdrakken",
						["check"] = "update",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["font"] = "Expressway",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "2112",
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["xOffset"] = -186.03729248047,
			["anchorFrameFrame"] = "WorldMapFrame",
			["regionType"] = "text",
			["url"] = "",
			["authorOptions"] = {
			},
			["fixedWidth"] = 200,
			["displayText_format_p_time_precision"] = 1,
			["displayText"] = "Auction\nHouse",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "Auction House",
			["wordWrap"] = "WordWrap",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["shadowYOffset"] = -1,
			["uid"] = "4oX3PJbvcMF",
			["justify"] = "CENTER",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 135,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["easeStrength"] = 3,
					["preset"] = "spiralandpulse",
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Shaman - Healer"] = {
			["arcLength"] = 360,
			["controlledChildren"] = {
				"Heal - Renewing Mist 2", -- [1]
				"Heal - Rising Sun Kick 2", -- [2]
				"Heal - Essence Font 2", -- [3]
				"Heal - Vivacious Vivification 2", -- [4]
				"Heal - Faeline Stomp 2", -- [5]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = 30,
			["groupIcon"] = 135887,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["space"] = 2,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["radius"] = 200,
			["useLimit"] = false,
			["align"] = "CENTER",
			["stagger"] = 0,
			["subRegions"] = {
			},
			["borderInset"] = 1,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["selfPoint"] = "LEFT",
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["yOffset"] = -30,
			["animate"] = false,
			["grow"] = "RIGHT",
			["scale"] = 1,
			["centerType"] = "LR",
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "dynamicgroup",
			["borderSize"] = 2,
			["sort"] = "none",
			["parent"] = "PanzaUI - Shaman",
			["rotation"] = 0,
			["constantFactor"] = "RADIUS",
			["limit"] = 5,
			["borderOffset"] = 4,
			["gridType"] = "RD",
			["gridWidth"] = 5,
			["id"] = "Shaman - Healer",
			["fullCircle"] = true,
			["frameStrata"] = 1,
			["anchorFrameType"] = "MOUSE",
			["rowSpace"] = 1,
			["config"] = {
			},
			["authorOptions"] = {
			},
			["internalVersion"] = 64,
			["conditions"] = {
			},
			["information"] = {
			},
			["uid"] = "x6wCBF1WtLF",
		},
		["Charred Passion"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"120954", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_debuffClass"] = false,
						["useGroup_count"] = false,
						["spellName"] = 0,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_unit"] = true,
						["use_tooltip"] = false,
						["use_totemName"] = false,
						["unit"] = "player",
						["matchesShowOn"] = "showOnActive",
						["type"] = "aura2",
						["useName"] = false,
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["use_remaining"] = true,
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"386963", -- [1]
						},
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["unevent"] = "timed",
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["useExactSpellId"] = true,
						["use_totemNamePattern"] = false,
						["remaining_operator"] = ">",
						["sourceUnit"] = "player",
						["use_genericShowOn"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_shadowXOffset"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["zoneIds"] = "",
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["use_vehicleUi"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 387184,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["url"] = "",
			["authorOptions"] = {
			},
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["uid"] = "A0j5THpV0gt",
			["alpha"] = 1,
			["semver"] = "7.0.2",
			["zoom"] = 0.3,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Charred Passion",
			["cooldownTextDisabled"] = false,
			["frameStrata"] = 4,
			["width"] = 40,
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 1381297,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
		},
		["Valdrakken Map Labels"] = {
			["controlledChildren"] = {
				"Professions", -- [1]
				"Auction House", -- [2]
				"PVP Vendors", -- [3]
				"Transmog", -- [4]
				"Barber", -- [5]
				"MM+ Portals", -- [6]
				"Bank", -- [7]
				"Flight Master", -- [8]
				"Dragon", -- [9]
				"Inn", -- [10]
				"Stable", -- [11]
				"City Portals", -- [12]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["wagoID"] = "vVnrs5WY3",
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["event"] = "Health",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 64,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["version"] = 2,
			["subRegions"] = {
			},
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "Valdrakken Map Labels",
			["uid"] = "GTb7vNjcRq9",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["borderInset"] = 1,
			["config"] = {
			},
			["selfPoint"] = "BOTTOMLEFT",
			["conditions"] = {
			},
			["information"] = {
				["groupOffset"] = true,
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["parent"] = "Map",
		},
		["Magma Chamber"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"381933", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["stacksOperator"] = ">=",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["remaining_operator"] = ">",
						["use_absorbHealMode"] = true,
						["custom_hide"] = "timed",
						["useStacks"] = true,
						["useGroup_count"] = false,
						["useExactSpellId"] = false,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["stacks"] = "1",
						["use_tooltip"] = false,
						["subeventPrefix"] = "SPELL",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["ownOnly"] = true,
						["totemType"] = 1,
						["matchesShowOn"] = "showOnActive",
						["debuffType"] = "HELPFUL",
						["useName"] = true,
						["type"] = "aura2",
						["unevent"] = "timed",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["use_remaining"] = true,
						["duration"] = "25",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_totemNamePattern"] = false,
						["use_unit"] = true,
						["use_absorbMode"] = true,
						["sourceUnit"] = "player",
						["use_debuffClass"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [2]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_format"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowXOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "BOTTOM",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_talent"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
						[381932] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["use_petbattle"] = false,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["cooldownTextDisabled"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["url"] = "",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 524796,
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["auto"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Magma Chamber",
			["authorOptions"] = {
			},
			["frameStrata"] = 4,
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["uid"] = "LzdkOniGYZ5",
			["inverse"] = false,
			["parent"] = "Shaman - Buffs",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "stacks",
						["value"] = "14",
						["op"] = ">",
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.4.glow",
						}, -- [1]
					},
				}, -- [1]
			},
			["cooldown"] = false,
			["selfPoint"] = "CENTER",
		},
		["Renewing Mist Count"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["sound"] = " custom",
					["do_sound"] = false,
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["useMatch_count"] = false,
						["auranames"] = {
							"115151", -- [1]
						},
						["ownOnly"] = true,
						["group_count"] = "0",
						["spellName"] = 228260,
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_START",
						["power_operator"] = ">",
						["fetchTooltip"] = false,
						["event"] = "Power",
						["combineMatches"] = "showLowest",
						["use_alwaystrue"] = true,
						["useGroup_count"] = true,
						["subeventPrefix"] = "SPELL",
						["powertype"] = 12,
						["matchesShowOn"] = "showAlways",
						["use_powertype"] = true,
						["debuffType"] = "HELPFUL",
						["use_power"] = false,
						["type"] = "aura2",
						["names"] = {
							"Heavy Stagger", -- [1]
							"Light Stagger", -- [2]
							"Moderate Stagger", -- [3]
						},
						["unevent"] = "auto",
						["use_tooltip"] = false,
						["unit"] = "group",
						["group_countOperator"] = ">",
						["useName"] = true,
						["realSpellName"] = "Void Eruption",
						["use_spellName"] = true,
						["spellIds"] = {
							124273, -- [1]
							124275, -- [2]
							124274, -- [3]
						},
						["power"] = "0",
						["use_showOn"] = true,
						["custom_hide"] = "timed",
						["buffShowOn"] = "showOnActive",
						["use_unit"] = true,
					},
					["untrigger"] = {
						["showOn"] = "showAlways",
						["spellName"] = 228260,
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 26,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%matchCount",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_text_format_3.tooltip1_format"] = "none",
					["rotateText"] = "NONE",
					["text_text_format_tooltip1_format"] = "none",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_2.tooltip1_format"] = "none",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_text_format_1.tooltip1_decimal_precision"] = 0,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontType"] = "OUTLINE",
					["text_text_format_1.unitCount_format"] = "none",
					["type"] = "subtext",
					["text_text_format_unitCount_format"] = "none",
					["text_text_format_1.tooltip3_format"] = "none",
					["text_font"] = "Expressway",
					["text_text_format_p_time_format"] = 0,
					["text_anchorYOffset"] = 0,
					["text_text_format_1.tooltip1_round_type"] = "round",
					["text_text_format_1.tooltip2_format"] = "none",
					["text_shadowXOffset"] = 0,
					["text_anchorPoint"] = "TOP",
					["text_text_format_c_format"] = "none",
					["text_text_format_1.tooltip1_format"] = "Number",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_matchCount_format"] = "none",
					["anchorXOffset"] = 0,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_class_and_spec"] = true,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["talent"] = {
					["multi"] = {
						[115069] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_dragonriding"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
						["PRIEST"] = true,
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class_and_spec"] = {
					["single"] = 270,
				},
				["zoneIds"] = "",
			},
			["source"] = "import",
			["width"] = 40,
			["frameStrata"] = 4,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["url"] = "https://wago.io/r1CzQ6azX/26",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 627487,
			["icon"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["xOffset"] = 0,
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100005,
			["id"] = "Renewing Mist Count",
			["semver"] = "3.1.1",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0.3,
			["uid"] = "bfL2BMJ9Vxj",
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["cooldown"] = false,
			["desaturate"] = false,
		},
		["Dragonbane Keep"] = {
			["sparkWidth"] = 10,
			["iconSource"] = -1,
			["wagoID"] = "fTuRJ__jk",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["use_absorbMode"] = true,
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["use_absorbHealMode"] = true,
						["custom_type"] = "stateupdate",
						["event"] = "Conditions",
						["names"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["events"] = "DRAGONFLIGHT_EVENT_TRACKER",
						["custom"] = "function(allstates, event, id)\n    if event == \"DRAGONFLIGHT_EVENT_TRACKER\" and id == aura_env.id\n    or event == \"STATUS\" or event == \"OPTIONS\"\n    then\n        local regionTimers = {\n            [1] = 1670338860, -- NA\n            [2] = 1670698860, -- KR\n            [3] = 1670342460, -- EU\n            [4] = 1670698860, -- TW\n            [5] = 1670677260 -- CN\n        }\n        \n        local firstKeepEpochTime = regionTimers[GetCurrentRegion()]\n        local interval = 7200\n        local duration = 600\n        local time_to_next_keep = interval - ((GetServerTime() - firstKeepEpochTime) % interval)\n        local active = interval - time_to_next_keep < duration\n        local remaining = duration - (interval - time_to_next_keep)\n        \n        allstates[\"\"] = {\n            changed = true,\n            show = true,\n            progressType = \"timed\",\n            autoHide = true,\n            duration = active and duration or interval-duration,\n            expirationTime = GetTime() + (active and remaining or time_to_next_keep),\n            icon = 236469,\n            active = active\n        }\n        \n        return true\n    end\nend\n\n\n\n\n\n\n",
						["spellIds"] = {
						},
						["check"] = "event",
						["use_unit"] = true,
						["unit"] = "player",
						["customVariables"] = "{\n    active = {\n        display = \"Dragonbane Keep Active\", \n        type = \"bool\",\n    },\n    expirationTime = true,\n}\n\n\n\n\n",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["sparkOffsetX"] = 0,
			["barColor"] = {
				0.42352944612503, -- [1]
				0.035294119268656, -- [2]
				0.035294119268656, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["information"] = {
			},
			["displayIcon"] = 236469,
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["text_text_format_p_time_format"] = 2,
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["anchorXOffset"] = 0,
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_format"] = "timed",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorYOffset"] = 0,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_decimal_precision"] = 1,
					["type"] = "subtext",
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_visible"] = true,
					["text_shadowYOffset"] = -1,
					["text_text"] = "%p",
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_1.formattedTime_format"] = "none",
					["text_fontSize"] = 14,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_shadowXOffset"] = 1,
				}, -- [3]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "Dragonbane Keep",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_precision"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_n_format"] = "none",
					["text_shadowYOffset"] = -1,
					["text_text_format_p_time_format"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_LEFT",
					["text_visible"] = true,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 14,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["anchorYOffset"] = 0,
				}, -- [4]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "Dragonbane Keep Up!",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_precision"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_n_format"] = "none",
					["text_shadowYOffset"] = -1,
					["text_text_format_p_time_format"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_LEFT",
					["text_visible"] = false,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 14,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["anchorYOffset"] = 0,
				}, -- [5]
				{
					["border_offset"] = 2,
					["border_anchor"] = "bar",
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Drop Shadow",
					["border_size"] = 10,
				}, -- [6]
				{
					["border_offset"] = 2,
					["border_anchor"] = "bar",
					["type"] = "subborder",
					["border_color"] = {
						1, -- [1]
						0.8666667342185974, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["border_size"] = 13,
				}, -- [7]
			},
			["gradientOrientation"] = "HORIZONTAL",
			["version"] = 16,
			["load"] = {
				["use_size"] = true,
				["use_encounter"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["level_operator"] = "==",
				["use_level"] = true,
				["level"] = "70",
				["use_zone"] = true,
				["use_petbattle"] = false,
				["use_vehicleUi"] = false,
				["zone"] = "The Waking Shores",
				["use_combat"] = false,
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "none",
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["selfPoint"] = "CENTER",
			["source"] = "import",
			["parent"] = "Alerts",
			["config"] = {
			},
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
				["finish"] = {
					["custom"] = "C_Timer.After(0, function() WeakAuras.ScanEvents(\"DRAGONFLIGHT_EVENT_TRACKER\", aura_env.id) end)\n    \n    ",
					["do_custom"] = true,
				},
			},
			["anchorFrameType"] = "SCREEN",
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["frameStrata"] = 1,
			["xOffset"] = 0,
			["icon_side"] = "LEFT",
			["id"] = "Dragonbane Keep",
			["sparkHeight"] = 30,
			["texture"] = "ToxiUI Clean",
			["spark"] = false,
			["zoom"] = 0,
			["semver"] = "2.0.0",
			["tocversion"] = 100005,
			["sparkHidden"] = "NEVER",
			["uid"] = "fn)(c6dux3I",
			["alpha"] = 1,
			["width"] = 240,
			["height"] = 25,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["internalVersion"] = 64,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["variable"] = "active",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								1, -- [2]
								0.027450982481241, -- [3]
								1, -- [4]
							},
							["property"] = "barColor",
						}, -- [1]
						{
							["property"] = "sub.4.text_visible",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "sub.5.text_visible",
						}, -- [3]
					},
				}, -- [1]
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["icon"] = true,
		},
		["Rushing Jade Wind"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Rushing Jade Wind", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["remaining_operator"] = ">",
						["useGroup_count"] = false,
						["useExactSpellId"] = false,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["custom_hide"] = "timed",
						["use_tooltip"] = false,
						["matchesShowOn"] = "showOnActive",
						["use_totemNamePattern"] = false,
						["ownOnly"] = true,
						["useName"] = true,
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["type"] = "aura2",
						["unevent"] = "timed",
						["auraspellids"] = {
							"386963", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_totemName"] = false,
						["use_unit"] = true,
						["sourceUnit"] = "player",
						["use_debuffClass"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowXOffset"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_format"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
						[270] = true,
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 196725,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["useCooldownModRate"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 606549,
			["parent"] = "Monk - Buffs",
			["url"] = "",
			["config"] = {
			},
			["frameStrata"] = 4,
			["cooldownTextDisabled"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Rushing Jade Wind",
			["auto"] = false,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 0,
			["uid"] = "18iYp(aE8gb",
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["cooldown"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
		},
		["Monk - Haste Buff"] = {
			["iconSource"] = -1,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"Bloodlust", -- [1]
							"Time Warp", -- [2]
							"Heroism", -- [3]
							"Primal Rage", -- [4]
							"Drums of the Mountain", -- [5]
							"Drums of Fury", -- [6]
						},
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnReady",
						["names"] = {
						},
						["spellName"] = 327104,
						["charges_operator"] = ">",
						["useName"] = true,
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 327104,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["type"] = "aura2",
						["use_charges"] = true,
						["charges"] = "0",
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_shadowXOffset"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = true,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
						[270] = true,
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[152173] = true,
						[391370] = true,
						[386965] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_never"] = false,
				["use_spec"] = false,
				["use_class_and_spec"] = false,
				["use_combat"] = true,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["cooldownTextDisabled"] = false,
			["config"] = {
			},
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["regionType"] = "icon",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
					["glow_frame_type"] = "UNITFRAME",
					["do_glow"] = false,
					["glow_action"] = "show",
				},
				["init"] = {
				},
			},
			["parent"] = "Monk - Buffs",
			["width"] = 40,
			["alpha"] = 1,
			["zoom"] = 0.3,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Monk - Haste Buff",
			["useCooldownModRate"] = true,
			["frameStrata"] = 4,
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 0,
			["uid"] = "V1gpMnAP42N",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = "",
			["cooldown"] = false,
			["url"] = "",
		},
		["Fortifying Brew"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"120954", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_debuffClass"] = false,
						["useGroup_count"] = false,
						["spellName"] = 0,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_unit"] = true,
						["use_tooltip"] = false,
						["use_totemName"] = false,
						["unit"] = "player",
						["matchesShowOn"] = "showOnActive",
						["type"] = "aura2",
						["useName"] = false,
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["use_remaining"] = true,
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"120954", -- [1]
						},
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["unevent"] = "timed",
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["useExactSpellId"] = true,
						["use_totemNamePattern"] = false,
						["remaining_operator"] = ">",
						["sourceUnit"] = "player",
						["use_genericShowOn"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_shadowXOffset"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["zoneIds"] = "",
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
						[270] = true,
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["use_vehicleUi"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 120954,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["url"] = "",
			["authorOptions"] = {
			},
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["uid"] = "PzkhunqPv1W",
			["alpha"] = 1,
			["semver"] = "7.0.2",
			["zoom"] = 0.3,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Fortifying Brew",
			["cooldownTextDisabled"] = false,
			["frameStrata"] = 4,
			["width"] = 40,
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 615341,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
		},
		["Raid Ability Timeline Backdrop ElvUI"] = {
			["sparkWidth"] = 10,
			["iconSource"] = -1,
			["user_x"] = 0,
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = 15,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkRotation"] = 0,
			["sameTexture"] = true,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "aura_env.timers={}\nlocal bar = aura_env.region.bar\nlocal j = 1\nwhile bar[\"spark\"..j] do\n    bar[\"spark\"..j]:Hide()\n    j = j + 1\nend\nj = 1\nwhile bar[\"sparktext\"..j] do\n    bar[\"sparktext\"..j]:Hide()\n    j = j + 1\nend\n\nif aura_env.config.ticks then\n    if bar then \n        local widthPerSegment = bar:GetHeight() / aura_env.config.maxDur\n        local tickAmount = floor((aura_env.config.maxDur-0.1)/5) \n        \n        local region = WeakAuras.GetRegion(aura_env.id)\n        --[[local textsubtract = 0\n        if aura_env.config.BigIcon.EnableBigIcon == true then \n            textsubtract = 5\n        end\n        ]]\n        \n        \n        for i = 1, tickAmount do\n            if not bar[\"spark\"..i] then\n                local spark = bar:CreateTexture(nil, \"ARTWORK\");\n                spark:SetDrawLayer(\"ARTWORK\", 3);\n                bar[\"spark\"..i] = spark\n            end \n            if not bar[\"sparktext\"..i] then \n                local sparktext = bar:CreateFontString(nil,\"ARTWORK\")\n                sparktext:SetDrawLayer(\"ARTWORK\", 3);\n                bar[\"sparktext\"..i] = sparktext\n                \n            end\n            \n            bar[\"spark\"..i]:SetTexture(\"Interface\\\\AddOns\\\\WeakAuras\\\\Media\\\\Textures\\\\Square_White.tga\")\n            bar[\"spark\"..i]:SetWidth(bar:GetWidth());\n            bar[\"spark\"..i]:SetHeight(1);\n            bar[\"spark\"..i]:SetBlendMode(\"ALPHAKEY\");\n            bar[\"spark\"..i]:SetVertexColor(\n                1,\n                1,\n                1,\n                1\n            )\n            bar[\"spark\"..i]:ClearAllPoints()\n            local offset = widthPerSegment*(5*i)\n            bar[\"spark\"..i]:SetPoint(\"BOTTOM\", bar, \"BOTTOM\", 0, offset+0.1)\n            bar[\"spark\"..i]:Show()\n            \n            bar[\"sparktext\"..i]:SetFont(\"Interface\\\\AddOns\\\\WeakAuras\\\\Media\\\\Fonts\\\\FiraMono-Medium.ttf\",12)\n            if aura_env.config.BigIcon.EnableBigIcon == true then\n                bar[\"sparktext\"..i]:SetText((i*5)+5)\n            else\n                bar[\"sparktext\"..i]:SetText((i*5))\n            end\n            bar[\"sparktext\"..i]:ClearAllPoints()\n            bar[\"sparktext\"..i]:SetPoint(\"BOTTOM\", bar, \"BOTTOM\", 25, offset-5)\n            bar[\"sparktext\"..i]:Show()\n            \n        end\n    end\n    \nend\n\n\n\n",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["selfPoint"] = "TOP",
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["desc"] = "BigWigs Bar Replacement",
			["rotation"] = 90,
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["crop_y"] = 0.41,
			["textureWrapMode"] = "CLAMP",
			["startAngle"] = 0,
			["useAdjustededMin"] = false,
			["crop"] = 0.41,
			["blendMode"] = "ADD",
			["texture"] = "ToxiUI Clean",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = true,
			["tocversion"] = 100002,
			["alpha"] = 1,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["backgroundOffset"] = 2,
			["sparkOffsetX"] = 0,
			["wagoID"] = "NyseKq1Xo",
			["parent"] = "Raid Ability Timeline",
			["desaturateBackground"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.771618694067, -- [4]
			},
			["customTextUpdate"] = "update",
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnActive",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "addons",
						["custom_type"] = "status",
						["unit"] = "player",
						["event"] = "DBM Timer",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "timed",
						["spellIds"] = {
						},
						["events"] = "PHOGUILD_RAT,PHOGUILD_RAT_EXP",
						["subeventPrefix"] = "SPELL",
						["check"] = "event",
						["use_unit"] = true,
						["unevent"] = "auto",
						["customVariables"] = "{\n    expirationTime = true,\n    duration = true,\n    \n    shouldGlow = {\n        display = \"Should Glow\",\n        type = \"bool\",\n        test = function(state, needle)\n            if not aura_env then return end\n            return (aura_env.options[state.spellId] and aura_env.options[state.spellId].glow) == (needle == 1)\n        end,\n        events = {\n            \n        },\n    }\n}",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "addons",
						["unit"] = "player",
						["use_spellId"] = false,
						["event"] = "BigWigs Timer",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 64,
			["useAdjustedMin"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["backdropInFront"] = false,
			["conditions"] = {
			},
			["compress"] = false,
			["stickyDuration"] = false,
			["discrete_rotation"] = 0,
			["backgroundColor"] = {
				0.058823529411765, -- [1]
				0.058823529411765, -- [2]
				0.058823529411765, -- [3]
				0.80000001192093, -- [4]
			},
			["version"] = 55,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["border_size"] = 1,
					["border_anchor"] = "bar",
					["border_offset"] = 1,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["type"] = "subborder",
				}, -- [3]
			},
			["height"] = 228,
			["rotate"] = true,
			["desaturate"] = true,
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Textures\\SpellActivationOverlays\\Eclipse_Sun",
			["source"] = "import",
			["foregroundTexture"] = "Textures\\SpellActivationOverlays\\Eclipse_Sun",
			["authorOptions"] = {
				{
					["min"] = 0,
					["type"] = "number",
					["default"] = 10,
					["desc"] = "How long should it take to travel from top to bottom",
					["key"] = "maxDur",
					["name"] = "Travel Duration",
					["useDesc"] = true,
					["width"] = 0.6,
				}, -- [1]
				{
					["type"] = "toggle",
					["default"] = false,
					["desc"] = "If you want to show ticks on the bar",
					["key"] = "ticks",
					["useDesc"] = true,
					["name"] = "Ticks",
					["width"] = 1,
				}, -- [2]
				{
					["subOptions"] = {
						{
							["type"] = "toggle",
							["default"] = false,
							["desc"] = "Controls if you want to adjust the Timeline for the Big Icon  hightlighting",
							["key"] = "EnableBigIcon",
							["useDesc"] = true,
							["name"] = "Enable Ability Timeline Adjust for BigIcon",
							["width"] = 2,
						}, -- [1]
					},
					["hideReorder"] = true,
					["useDesc"] = false,
					["nameSource"] = 0,
					["width"] = 1,
					["useCollapse"] = true,
					["collapse"] = false,
					["name"] = "BigIcon",
					["key"] = "BigIcon",
					["limitType"] = "none",
					["groupType"] = "simple",
					["type"] = "group",
					["size"] = 10,
				}, -- [3]
			},
			["useAdjustedMax"] = false,
			["mirror"] = false,
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0,
			["borderInFront"] = true,
			["regionType"] = "aurabar",
			["icon_side"] = "RIGHT",
			["id"] = "Raid Ability Timeline Backdrop ElvUI",
			["icon"] = false,
			["sparkHeight"] = 30,
			["backdropColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.64000001549721, -- [4]
			},
			["uid"] = "NrlegamJ0Ux",
			["config"] = {
				["ticks"] = true,
				["BigIcon"] = {
					["EnableBigIcon"] = false,
				},
				["maxDur"] = 10,
			},
			["semver"] = "1.0.54",
			["sparkRotationMode"] = "AUTO",
			["sparkHidden"] = "NEVER",
			["borderBackdrop"] = "None",
			["frameStrata"] = 3,
			["width"] = 32,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["affixes"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["talent2"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["user_y"] = 0,
			["inverse"] = false,
			["anchorPoint"] = "CENTER",
			["orientation"] = "VERTICAL",
			["crop_x"] = 0.41,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["spark"] = false,
		},
		["Expel Harm"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Dance of Chi-Ji", -- [1]
						},
						["remaining_operator"] = ">",
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Action Usable",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["useExactSpellId"] = false,
						["use_totemNamePattern"] = false,
						["use_debuffClass"] = false,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["spellName"] = 322101,
						["use_tooltip"] = false,
						["ownOnly"] = true,
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_remaining"] = true,
						["useName"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["type"] = "spell",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["unevent"] = "timed",
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = "Expel Harm",
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_unit"] = true,
						["use_totemName"] = false,
						["matchesShowOn"] = "showOnActive",
						["sourceUnit"] = "player",
						["useGroup_count"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["use_absorbMode"] = true,
						["event"] = "Health",
						["unit"] = "player",
						["percenthealth"] = "40",
						["use_unit"] = true,
						["use_percenthealth"] = true,
						["percenthealth_operator"] = "<",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_precision"] = 1,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
					["type"] = "subtext",
					["text_shadowXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_anchorYOffset"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_c_format"] = "none",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = true,
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
						[270] = true,
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["spellknown"] = 322101,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["zoom"] = 0.3,
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 627486,
			["authorOptions"] = {
			},
			["xOffset"] = 0,
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["semver"] = "7.0.2",
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Expel Harm",
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 4,
			["uid"] = "gCNZRgtaBfF",
			["inverse"] = false,
			["desaturate"] = false,
			["conditions"] = {
			},
			["cooldown"] = false,
			["parent"] = "Monk - Buffs",
		},
		["Aylaag Camp"] = {
			["sparkWidth"] = 10,
			["iconSource"] = -1,
			["wagoID"] = "fTuRJ__jk",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["use_absorbMode"] = true,
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["use_absorbHealMode"] = true,
						["custom_type"] = "stateupdate",
						["event"] = "Conditions",
						["names"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["events"] = "DRAGONFLIGHT_EVENT_TRACKER",
						["custom"] = "function(allstates, event, id)\n    if event == \"DRAGONFLIGHT_EVENT_TRACKER\" and id == aura_env.id\n    or event == \"STATUS\" or event == \"OPTIONS\"\n    then\n        local regionTimers = {\n            [1] = 1675576800, -- NA\n            [2] = nil, -- KR\n            [3] = 1675612800, -- EU\n            [4] = nil, -- TW\n            [5] = nil -- CN\n        }\n        \n        local firstEvent = regionTimers[GetCurrentRegion()]\n        --Return early if we don't have data on the specific region\n        if(firstEvent == nil) then\n            return\n        end\n        \n        local interval = 270000\n        local duration = 900\n        local time_to_next = interval - ((GetServerTime() - firstEvent) % interval)\n        local active = interval - time_to_next < duration\n        local remaining = duration - (interval - time_to_next)\n        \n        \n        allstates[\"\"] = {\n            changed = true,\n            show = true,\n            progressType = \"timed\",\n            autoHide = true,\n            duration = active and duration or interval-duration,\n            expirationTime = GetTime() + (active and remaining or time_to_next),\n            icon = 237385,\n            active = active\n        }\n        \n        return true\n    end\nend\n\n\n\n\n\n\n",
						["spellIds"] = {
						},
						["check"] = "event",
						["use_unit"] = true,
						["unit"] = "player",
						["customVariables"] = "{\n    active = {\n        display = \"Camp Moving Active\", \n        type = \"bool\",\n    },\n    expirationTime = true,\n}\n\n\n\n\n",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["sparkOffsetX"] = 0,
			["barColor"] = {
				0.66666668653488, -- [1]
				0.82745105028152, -- [2]
				0.44705885648727, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["information"] = {
			},
			["displayIcon"] = "237385",
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["text_text_format_p_time_format"] = 2,
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["anchorXOffset"] = 0,
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_format"] = "timed",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorYOffset"] = 0,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_decimal_precision"] = 1,
					["type"] = "subtext",
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_visible"] = true,
					["text_shadowYOffset"] = -1,
					["text_text"] = "%p",
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_1.formattedTime_format"] = "none",
					["text_fontSize"] = 14,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_shadowXOffset"] = 1,
				}, -- [3]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "Aylaag Camp",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_precision"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_n_format"] = "none",
					["text_shadowYOffset"] = -1,
					["text_text_format_p_time_format"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_LEFT",
					["text_visible"] = true,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 14,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["anchorYOffset"] = 0,
				}, -- [4]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "Camp Moving",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_precision"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_n_format"] = "none",
					["text_shadowYOffset"] = -1,
					["text_text_format_p_time_format"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_LEFT",
					["text_visible"] = false,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 14,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["anchorYOffset"] = 0,
				}, -- [5]
				{
					["border_offset"] = 2,
					["border_anchor"] = "bar",
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Drop Shadow",
					["border_size"] = 10,
				}, -- [6]
				{
					["border_offset"] = 2,
					["border_anchor"] = "bar",
					["type"] = "subborder",
					["border_color"] = {
						1, -- [1]
						0.8666667342185974, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["border_size"] = 13,
				}, -- [7]
			},
			["gradientOrientation"] = "HORIZONTAL",
			["version"] = 16,
			["load"] = {
				["use_size"] = true,
				["use_level"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["class"] = {
					["multi"] = {
					},
				},
				["use_encounter"] = false,
				["use_petbattle"] = false,
				["use_combat"] = false,
				["use_zone"] = true,
				["zone"] = "Ohn'ahran Plains",
				["use_vehicleUi"] = false,
				["level_operator"] = "==",
				["level"] = "70",
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "none",
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["selfPoint"] = "CENTER",
			["source"] = "import",
			["xOffset"] = 0,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
				["finish"] = {
					["custom"] = "C_Timer.After(0, function() WeakAuras.ScanEvents(\"DRAGONFLIGHT_EVENT_TRACKER\", aura_env.id) end)\n    \n    ",
					["do_custom"] = true,
				},
			},
			["width"] = 240,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["alpha"] = 1,
			["parent"] = "Alerts",
			["icon_side"] = "LEFT",
			["id"] = "Aylaag Camp",
			["sparkHeight"] = 30,
			["texture"] = "ToxiUI Clean",
			["spark"] = false,
			["zoom"] = 0,
			["semver"] = "2.0.0",
			["tocversion"] = 100005,
			["sparkHidden"] = "NEVER",
			["uid"] = "31RZI2DE7a8",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["height"] = 25,
			["config"] = {
			},
			["inverse"] = false,
			["internalVersion"] = 64,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["variable"] = "active",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								1, -- [2]
								0.027450982481241, -- [3]
								1, -- [4]
							},
							["property"] = "barColor",
						}, -- [1]
						{
							["property"] = "sub.4.text_visible",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "sub.5.text_visible",
						}, -- [3]
					},
				}, -- [1]
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["icon"] = true,
		},
		["AFK"] = {
			["iconSource"] = 0,
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["init"] = {
				},
				["finish"] = {
					["do_glow"] = false,
					["glow_frame_type"] = "UNITFRAME",
					["glow_action"] = "show",
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_afk"] = true,
						["auranames"] = {
							"152173", -- [1]
						},
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["use_charges"] = false,
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["ownOnly"] = true,
						["charges"] = "1",
						["spellIds"] = {
						},
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["charges_operator"] = "<",
						["useName"] = true,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["spellName"] = 58875,
						["type"] = "unit",
						["event"] = "Conditions",
						["use_exact_spellName"] = true,
						["realSpellName"] = 58875,
						["use_spellName"] = true,
						["events"] = "PLAYER_DEAD,UPDATE_INVENTORY_DURABILITY,PLAYER_ENTERING_WORLD",
						["custom_hide"] = "custom",
						["check"] = "event",
						["use_unit"] = true,
						["use_track"] = true,
						["use_absorbMode"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 18,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "LEFT",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_fontType"] = "OUTLINE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 10,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["anchorXOffset"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
					["text_shadowXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "AFK",
					["text_anchorPoint"] = "OUTER_RIGHT",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_color"] = true,
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["border_offset"] = 4,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["border_size"] = 18,
				}, -- [4]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_spellknown"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = false,
				["use_vehicleUi"] = false,
				["use_never"] = false,
				["use_exact_spellknown"] = false,
				["spellknown"] = 58875,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["authorOptions"] = {
			},
			["selfPoint"] = "CENTER",
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["url"] = "",
			["icon"] = true,
			["cooldown"] = false,
			["displayIcon"] = 136090,
			["uid"] = "NuaX7yo(z4N",
			["frameStrata"] = 1,
			["cooldownTextDisabled"] = true,
			["width"] = 30,
			["tocversion"] = 100002,
			["id"] = "AFK",
			["useCooldownModRate"] = true,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["zoom"] = 0.1,
			["config"] = {
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["parent"] = "Alerts",
		},
		["Raid Ability Timeline BigIcon"] = {
			["sparkWidth"] = 10,
			["text2Point"] = "CENTER",
			["iconSource"] = -1,
			["text1FontSize"] = 22,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 40,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["url"] = "",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.50296559929848, -- [4]
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text2Font"] = "Friz Quadrata TT",
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0, -- [1]
				0.53333333333333, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Containment"] = "INSIDE",
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1Point"] = "BOTTOMRIGHT",
			["sparkOffsetY"] = 0,
			["text2FontFlags"] = "OUTLINE",
			["load"] = {
				["difficulty"] = {
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_never"] = true,
				["instance_type"] = {
					["single"] = 8,
					["multi"] = {
						[8] = true,
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["size"] = {
					["single"] = "party",
					["multi"] = {
						["party"] = true,
					},
				},
			},
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 4,
			["useAdjustededMin"] = false,
			["regionType"] = "icon",
			["text2FontSize"] = 24,
			["texture"] = "Minimalist",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = true,
			["glowScale"] = 1,
			["text2Enabled"] = false,
			["glowYOffset"] = 0,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["cooldownTextDisabled"] = false,
			["sparkOffsetX"] = 0,
			["wagoID"] = "NyseKq1Xo",
			["glowLength"] = 10,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["customText"] = "function()\n    if aura_env.state and aura_env.state.barName then\n        if aura_env.state.count and aura_env.state.count > 0 then\n            return aura_env.state.barName..\" (\"..aura_env.state.count..\")\"\n        else\n            return aura_env.state.barName\n        end\n    end\nend",
			["parent"] = "Bigicon",
			["text1FontFlags"] = "OUTLINE",
			["tocversion"] = 100002,
			["cooldownSwipe"] = true,
			["desaturate"] = false,
			["sparkRotationMode"] = "AUTO",
			["cooldownEdge"] = false,
			["text2"] = "%p",
			["useglowColor"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 64,
			["glowXOffset"] = 0,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["alphaType"] = "custom",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    \n    aura_env.sortAndOffset()\n    return start\nend",
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["scaley"] = 1,
					["alpha"] = 0,
					["y"] = 0,
					["x"] = 0,
					["colorA"] = 1,
					["duration"] = "5",
					["rotate"] = 0,
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["backdropInFront"] = false,
			["anchorFrameType"] = "SCREEN",
			["useCooldownModRate"] = true,
			["stickyDuration"] = false,
			["uid"] = "P0PU(rEWZHT",
			["sparkHidden"] = "NEVER",
			["version"] = 55,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_format"] = 0,
					["type"] = "subtext",
					["anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = -1,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = false,
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_format"] = "timed",
				}, -- [2]
				{
					["text_text_format_n_format"] = "string",
					["text_text"] = "%n",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = -1,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_shadowXOffset"] = 1,
					["text_text_format_n_abbreviate_max"] = 11,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_n_abbreviate"] = true,
				}, -- [3]
				{
					["text_shadowXOffset"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "ICON_CENTER",
					["text_visible"] = false,
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_text_format_c2_format"] = "none",
				}, -- [4]
			},
			["height"] = 50,
			["triggers"] = {
				{
					["trigger"] = {
						["remaining_operator"] = "<",
						["message_operator"] = "find('%s')",
						["subeventPrefix"] = "SPELL",
						["remaining"] = "2",
						["use_cloneId"] = true,
						["spellName"] = 0,
						["use_genericShowOn"] = true,
						["use_remaining"] = true,
						["unit"] = "player",
						["unevent"] = "auto",
						["genericShowOn"] = "showOnCooldown",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "DBM Timer",
						["type"] = "addons",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["names"] = {
						},
						["use_message"] = false,
						["duration"] = "1",
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["use_remaining"] = true,
						["use_track"] = true,
						["unevent"] = "auto",
						["use_genericShowOn"] = true,
						["duration"] = "1",
						["event"] = "BigWigs Timer",
						["unit"] = "player",
						["realSpellName"] = 0,
						["remaining"] = "2",
						["type"] = "addons",
						["remaining_operator"] = "<",
						["use_spellName"] = true,
						["genericShowOn"] = "showOnCooldown",
						["use_cloneId"] = true,
						["spellName"] = 0,
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(t)\n    return t[1] \nend\n\n\n",
				["activeTriggerMode"] = -10,
			},
			["glowLines"] = 8,
			["sparkBlendMode"] = "ADD",
			["glowFrequency"] = 0.25,
			["source"] = "import",
			["text2Containment"] = "INSIDE",
			["borderBackdrop"] = "Blizzard Tooltip",
			["text1Font"] = "Expressway",
			["icon"] = true,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "\n-----------------------------------------\n--            USER SETTINGS            --\n-----------------------------------------\nlocal spacing = 4 -- adjust to preference\nlocal perRow = 0 -- use 0 for no wrapping\nlocal horzontal_growth = \"RIGHT\" -- or \"LEFT\"\nlocal vertical_growth = \"UP\" -- or \"DOWN\"\n\nlocal do_sort = true -- or false\nlocal sort_by = \"expirationTime\" -- should be a valid aura_env.state child\nlocal sort_direction = \"DESC\" -- or \"ASC\"\n\n-----------------------------------------\n--             DO NOT TOUCH            --\n-----------------------------------------\n\nlocal aura_env = aura_env\naura_env.sortAndOffset = function()\n    local baseX = WeakAuras.regions[aura_env.id].region.xOffset\n    local baseY = WeakAuras.regions[aura_env.id].region.yOffset\n    local count = 0\n    local t = {}\n    for k, v in pairs(WeakAuras.clones[aura_env.id]) do\n        table.insert(t, v)\n    end\n    if do_sort then\n        if sort_direction == \"DESC\" then\n            table.sort(t, function(a,b) return a.state[sort_by] < b.state[sort_by] end)\n        else\n            table.sort(t, function(a,b) return a.state[sort_by] > b.state[sort_by] end)\n        end\n    end\n    for i, region in ipairs(t) do\n        if region.toShow then\n            local column = perRow > 0 and count % perRow or count\n            local xOff = (region.width + spacing) * column\n            xOff = horzontal_growth == \"LEFT\" and 0-xOff or xOff\n            local row = perRow > 0 and math.floor(count / perRow) or 0\n            local yOff = - row * (region.height + spacing)\n            yOff = vertical_growth == \"UP\" and 0-yOff or yOff\n            region:SetOffset(baseX + xOff, baseY + yOff)\n            count = count + 1\n        end\n    end\nend",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["text2Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["text1"] = "%count",
			["borderInFront"] = true,
			["config"] = {
			},
			["icon_side"] = "LEFT",
			["glow"] = false,
			["spark"] = false,
			["sparkHeight"] = 30,
			["text1Enabled"] = true,
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["text1Color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["semver"] = "1.0.54",
			["useAdjustededMax"] = false,
			["id"] = "Raid Ability Timeline BigIcon",
			["customTextUpdate"] = "event",
			["frameStrata"] = 1,
			["width"] = 50,
			["alpha"] = 1,
			["xOffset"] = 0,
			["inverse"] = false,
			["zoom"] = 0.3,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["cooldown"] = true,
			["glowBorder"] = false,
		},
		["Shaman - Buffs"] = {
			["grow"] = "RIGHT",
			["controlledChildren"] = {
				"Maelstrom", -- [1]
				"Shaman - Haste Buff", -- [2]
				"Lava Surge", -- [3]
				"Master of the Elements", -- [4]
				"Primordial Wave", -- [5]
				"Ascendance", -- [6]
				"Magma Chamber", -- [7]
				"Astral Shift", -- [8]
				"Power of the Maelstrom", -- [9]
				"Earth Elemental", -- [10]
				"Fire Elemental", -- [11]
				"Totem #1", -- [12]
				"Totem #2", -- [13]
				"Totem #3", -- [14]
				"Totem #4", -- [15]
				"Totem #5", -- [16]
				"Earth Shield", -- [17]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["authorOptions"] = {
			},
			["yOffset"] = -107,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["space"] = 2,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["names"] = {
						},
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["internalVersion"] = 64,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["align"] = "CENTER",
			["stagger"] = 0,
			["subRegions"] = {
			},
			["config"] = {
			},
			["useLimit"] = true,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["selfPoint"] = "LEFT",
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["radius"] = 200,
			["animate"] = false,
			["xOffset"] = -125,
			["scale"] = 1,
			["centerType"] = "LR",
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "dynamicgroup",
			["borderSize"] = 2,
			["sort"] = "none",
			["groupIcon"] = 135769,
			["arcLength"] = 360,
			["constantFactor"] = "RADIUS",
			["rowSpace"] = 1,
			["borderOffset"] = 4,
			["gridType"] = "RD",
			["frameStrata"] = 1,
			["id"] = "Shaman - Buffs",
			["fullCircle"] = true,
			["gridWidth"] = 5,
			["anchorFrameType"] = "SCREEN",
			["limit"] = 6,
			["borderInset"] = 1,
			["parent"] = "PanzaUI - Shaman",
			["uid"] = "xkbAk7Jzd9S",
			["conditions"] = {
			},
			["information"] = {
			},
			["rotation"] = 0,
		},
		["Health Percentage"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "0VblN8B3s",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayText"] = "%percenthealth%",
			["customText"] = "",
			["shadowYOffset"] = -1,
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_absorbMode"] = true,
						["unit"] = "nameplate",
						["debuffType"] = "HELPFUL",
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["nameplateType"] = "hostile",
						["subeventPrefix"] = "SPELL",
						["percenthealth"] = "100",
						["event"] = "Health",
						["subeventSuffix"] = "_CAST_START",
						["unevent"] = "auto",
						["names"] = {
						},
						["spellIds"] = {
						},
						["duration"] = "1",
						["use_nameplateType"] = true,
						["use_percenthealth"] = false,
						["percenthealth_operator"] = "<",
						["use_unit"] = true,
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				}, -- [1]
				{
					["trigger"] = {
						["use_unitisunit"] = true,
						["use_hostility"] = true,
						["custom_type"] = "status",
						["use_absorbMode"] = true,
						["event"] = "Unit Characteristics",
						["use_unit"] = true,
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["hostility"] = "hostile",
						["unitisunit"] = "target",
						["check"] = "update",
						["unit"] = "target",
						["use_attackable"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["wordWrap"] = "WordWrap",
			["desc"] = "Displays the current HP percentage on enemy nameplates",
			["font"] = "Expressway",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["displayText_format_percenthealth_round_type"] = "round",
			["load"] = {
				["zoneIds"] = "",
				["use_petbattle"] = false,
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 7,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["displayText_format_percenthealth_format"] = "Number",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["url"] = "",
			["regionType"] = "text",
			["parent"] = "Target Highlight",
			["preferToUpdate"] = false,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["variable"] = "percenthealth",
						["value"] = "30",
					},
					["changes"] = {
						{
							["value"] = {
								1, -- [1]
								0, -- [2]
								0.031372549019608, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [1]
			},
			["xOffset"] = 0,
			["config"] = {
			},
			["displayText_format_percenthealth_decimal_precision"] = 0,
			["semver"] = "1.0.1",
			["tocversion"] = 100000,
			["id"] = "Health Percentage",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 5,
			["anchorFrameType"] = "NAMEPLATE",
			["justify"] = "CENTER",
			["uid"] = "NlzIgg4JZGj",
			["yOffset"] = 0,
			["displayText_format_c_format"] = "none",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["fixedWidth"] = 200,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["authorOptions"] = {
			},
		},
		["Hunter - Missing Pet"] = {
			["iconSource"] = 0,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = true,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"152173", -- [1]
						},
						["use_genericShowOn"] = true,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["names"] = {
						},
						["use_unit"] = true,
						["subeventPrefix"] = "SPELL",
						["charges"] = "1",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["use_HasPet"] = false,
						["custom_hide"] = "custom",
						["charges_operator"] = "<",
						["useName"] = true,
						["use_absorbHealMode"] = true,
						["custom_type"] = "event",
						["spellName"] = 58875,
						["type"] = "unit",
						["event"] = "Conditions",
						["use_exact_spellName"] = true,
						["realSpellName"] = 58875,
						["use_spellName"] = true,
						["events"] = "PLAYER_DEAD,UPDATE_INVENTORY_DURABILITY,PLAYER_ENTERING_WORLD",
						["debuffType"] = "HELPFUL",
						["check"] = "event",
						["ownOnly"] = true,
						["use_track"] = true,
						["use_charges"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 18,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "LEFT",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_justify"] = "CENTER",
					["type"] = "subtext",
					["text_anchorXOffset"] = 10,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["text_text_format_p_time_legacy_floor"] = true,
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_color"] = true,
					["text_text_format_p_gcd_cast"] = false,
					["text_text"] = "Missing Pet",
					["text_anchorPoint"] = "OUTER_RIGHT",
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_time_mod_rate"] = true,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["type"] = "subborder",
					["border_size"] = 18,
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["border_offset"] = 4,
				}, -- [4]
			},
			["height"] = 30,
			["load"] = {
				["use_class_and_spec"] = false,
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[253] = true,
						[255] = true,
					},
				},
				["use_vehicleUi"] = false,
				["use_spec"] = false,
				["use_exact_spellknown"] = false,
				["spellknown"] = 58875,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["xOffset"] = 0,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
					["glow_frame_type"] = "UNITFRAME",
					["do_glow"] = false,
					["glow_action"] = "show",
				},
				["init"] = {
				},
			},
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["url"] = "",
			["selfPoint"] = "CENTER",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["alpha"] = 1,
			["zoom"] = 0.1,
			["anchorFrameType"] = "SELECTFRAME",
			["tocversion"] = 100002,
			["id"] = "Hunter - Missing Pet",
			["frameStrata"] = 1,
			["useCooldownModRate"] = true,
			["width"] = 30,
			["cooldownTextDisabled"] = true,
			["uid"] = "swRdu4BwVKz",
			["inverse"] = false,
			["parent"] = "Alerts",
			["displayIcon"] = 236192,
			["cooldown"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Flying Serpent Kick (CD)"] = {
			["iconSource"] = 0,
			["xOffset"] = -10,
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = true,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"152173", -- [1]
						},
						["ownOnly"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["spellName"] = 101545,
						["charges_operator"] = "<",
						["type"] = "spell",
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["useName"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 101545,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_charges"] = false,
						["charges"] = "1",
						["use_genericShowOn"] = true,
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%p",
					["text_text_format_p_gcd_cast"] = false,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_justify"] = "CENTER",
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["text_text_format_p_abbreviate"] = false,
					["text_anchorYOffset"] = 10,
					["text_text_format_p_color"] = true,
					["text_text_format_p_realm_name"] = "never",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_anchorPoint"] = "CENTER",
					["text_shadowXOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["type"] = "subborder",
					["border_size"] = 18,
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["border_offset"] = 4,
				}, -- [4]
			},
			["height"] = 40,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[269] = true,
					},
				},
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_spellknown"] = true,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_class_and_spec"] = false,
				["use_spec"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_exact_spellknown"] = true,
				["spellknown"] = 101545,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
					["glow_frame_type"] = "UNITFRAME",
					["do_glow"] = false,
					["glow_action"] = "show",
				},
				["init"] = {
				},
			},
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["authorOptions"] = {
			},
			["parent"] = "Monk - Movement",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["alpha"] = 1,
			["cooldownTextDisabled"] = true,
			["anchorFrameType"] = "SELECTFRAME",
			["tocversion"] = 100002,
			["id"] = "Flying Serpent Kick (CD)",
			["useCooldownModRate"] = true,
			["frameStrata"] = 1,
			["width"] = 40,
			["zoom"] = 0.1,
			["uid"] = "0UPSTZNS5Ja",
			["inverse"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
			},
			["displayIcon"] = 606545,
			["cooldown"] = true,
			["url"] = "",
		},
		["Vivacious Vivification"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"392883", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Action Usable",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["useGroup_count"] = false,
						["use_totemNamePattern"] = false,
						["use_absorbHealMode"] = true,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["unit"] = "player",
						["use_tooltip"] = false,
						["use_genericShowOn"] = true,
						["use_absorbMode"] = true,
						["remaining_operator"] = ">",
						["useName"] = true,
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["use_remaining"] = true,
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["unevent"] = "timed",
						["totemType"] = 1,
						["realSpellName"] = "Expel Harm",
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["ownOnly"] = true,
						["spellName"] = 322101,
						["sourceUnit"] = "player",
						["useExactSpellId"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["use_absorbMode"] = true,
						["event"] = "Health",
						["unit"] = "player",
						["percenthealth"] = "60",
						["use_unit"] = true,
						["use_percenthealth"] = true,
						["percenthealth_operator"] = "<",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%c",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["type"] = "subtext",
					["anchorYOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_shadowXOffset"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_c_format"] = "none",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = true,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["zoneIds"] = "",
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
						[270] = true,
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["use_vehicleUi"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 392883,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 4,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["cooldownEdge"] = false,
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["desaturate"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["uid"] = "onyoIcUwO11",
			["alpha"] = 1,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Vivacious Vivification",
			["auto"] = false,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["cooldownTextDisabled"] = false,
			["config"] = {
			},
			["inverse"] = false,
			["authorOptions"] = {
			},
			["displayIcon"] = 1360980,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["xOffset"] = 0,
		},
		["Global Cooldown Tracker"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["xOffset"] = 13,
			["yOffset"] = -11,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturateBackground"] = false,
			["sameTexture"] = true,
			["url"] = "",
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "spell",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["use_genericShowOn"] = true,
						["event"] = "Global Cooldown",
						["names"] = {
						},
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["unit"] = "player",
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "SPELL",
						["use_track"] = true,
						["spellName"] = 0,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["parent"] = "Mouse",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 70,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_vehicleUi"] = false,
				["use_vehicle"] = false,
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["useAdjustededMax"] = false,
			["textureWrapMode"] = "CLAMP",
			["crop_y"] = 0.41,
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_20px.tga",
			["conditions"] = {
			},
			["authorOptions"] = {
			},
			["mirror"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "progresstexture",
			["startAngle"] = 0,
			["blendMode"] = "BLEND",
			["backgroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_20px.tga",
			["uid"] = "ZY1734RlSQg",
			["slantMode"] = "INSIDE",
			["anchorFrameType"] = "MOUSE",
			["alpha"] = 1,
			["fontSize"] = 12,
			["anchorPoint"] = "CENTER",
			["compress"] = false,
			["id"] = "Global Cooldown Tracker",
			["backgroundColor"] = {
				0.501960813999176, -- [1]
				0.501960813999176, -- [2]
				0.501960813999176, -- [3]
				0, -- [4]
			},
			["frameStrata"] = 9,
			["width"] = 70,
			["auraRotation"] = 0,
			["config"] = {
			},
			["inverse"] = false,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["orientation"] = "ANTICLOCKWISE",
			["crop_x"] = 0.41,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["backgroundOffset"] = 0,
		},
		["Community Feast"] = {
			["sparkWidth"] = 10,
			["sparkOffsetX"] = 0,
			["wagoID"] = "fTuRJ__jk",
			["parent"] = "Alerts",
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
				["finish"] = {
					["custom"] = "C_Timer.After(0, function() WeakAuras.ScanEvents(\"DRAGONFLIGHT_EVENT_TRACKER\", aura_env.id) end)\n    \n    ",
					["do_custom"] = true,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["use_absorbMode"] = true,
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["use_absorbHealMode"] = true,
						["custom_type"] = "stateupdate",
						["event"] = "Conditions",
						["names"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["events"] = "DRAGONFLIGHT_EVENT_TRACKER",
						["custom"] = "function(allstates, event, id)\n    if event == \"DRAGONFLIGHT_EVENT_TRACKER\" and id == aura_env.id\n    or event == \"STATUS\" or event == \"OPTIONS\"\n    then\n        local regionTimers = {\n            [1] = 1670333460, -- NA\n            [2] = 1670702460, -- KR\n            [3] = 1670331660, -- EU\n            [4] = 1670702460, -- TW\n            [5] = 1670677260  -- CN\n        }\n        \n        local firstFeastEpochTime = regionTimers[GetCurrentRegion()]\n        local interval = 5400\n        local duration = 900\n        local time_to_next_feast = interval - ((GetServerTime() - firstFeastEpochTime) % interval)\n        local active = interval - time_to_next_feast < duration\n        local remaining = duration - (interval - time_to_next_feast)\n        \n        allstates[\"\"] = {\n            changed = true,\n            show = true,\n            progressType = \"timed\",\n            autoHide = true,\n            duration = active and duration or interval-duration,\n            expirationTime = GetTime() + (active and remaining or time_to_next_feast),\n            icon = 4687629,\n            active = active\n        }\n        \n        return true\n    end\nend\n\n\n\n\n",
						["spellIds"] = {
						},
						["check"] = "event",
						["use_unit"] = true,
						["unit"] = "player",
						["customVariables"] = "{\n    active = {\n        display = \"Feast Active\",\n        type = \"bool\",\n    },\n    expirationTime = true,\n}",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 64,
			["zoom"] = 0,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["iconSource"] = -1,
			["barColor"] = {
				0, -- [1]
				0.63921570777893, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["information"] = {
			},
			["displayIcon"] = 4687629,
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["text_text_format_p_time_format"] = 2,
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["anchorXOffset"] = 0,
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_format"] = "timed",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorYOffset"] = 0,
					["text_text_format_p_gcd_channel"] = false,
					["text_text_format_p_decimal_precision"] = 1,
					["type"] = "subtext",
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_visible"] = true,
					["text_shadowYOffset"] = -1,
					["text_text"] = "%p",
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_1.formattedTime_format"] = "none",
					["text_fontSize"] = 14,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_shadowXOffset"] = 1,
				}, -- [3]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "Community Feast",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_precision"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_n_format"] = "none",
					["text_shadowYOffset"] = -1,
					["text_text_format_p_time_format"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_LEFT",
					["text_visible"] = true,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 14,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["anchorYOffset"] = 0,
				}, -- [4]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "Community Feast Up!",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_precision"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_n_format"] = "none",
					["text_shadowYOffset"] = -1,
					["text_text_format_p_time_format"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_LEFT",
					["text_visible"] = false,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 14,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["anchorYOffset"] = 0,
				}, -- [5]
				{
					["border_offset"] = 2,
					["border_anchor"] = "bar",
					["type"] = "subborder",
					["border_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Drop Shadow",
					["border_size"] = 10,
				}, -- [6]
				{
					["border_offset"] = 2,
					["border_anchor"] = "bar",
					["type"] = "subborder",
					["border_color"] = {
						1, -- [1]
						0.8666667342185974, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["border_size"] = 13,
				}, -- [7]
			},
			["height"] = 25,
			["enableGradient"] = false,
			["load"] = {
				["use_size"] = true,
				["use_encounter"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["level_operator"] = "==",
				["use_level"] = true,
				["level"] = "70",
				["use_zone"] = true,
				["use_petbattle"] = false,
				["use_vehicleUi"] = false,
				["zone"] = "The Azure Span",
				["use_combat"] = false,
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "none",
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["selfPoint"] = "CENTER",
			["source"] = "import",
			["gradientOrientation"] = "HORIZONTAL",
			["config"] = {
			},
			["icon"] = true,
			["anchorFrameType"] = "SCREEN",
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["alpha"] = 1,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["icon_side"] = "LEFT",
			["sparkHidden"] = "NEVER",
			["sparkHeight"] = 30,
			["texture"] = "ToxiUI Clean",
			["semver"] = "2.0.0",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["spark"] = false,
			["tocversion"] = 100005,
			["id"] = "Community Feast",
			["uid"] = "zKBpnRZOgWb",
			["frameStrata"] = 1,
			["width"] = 240,
			["version"] = 16,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["xOffset"] = 0,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["variable"] = "active",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								1, -- [2]
								0.027450982481241, -- [3]
								1, -- [4]
							},
							["property"] = "barColor",
						}, -- [1]
						{
							["property"] = "sub.4.text_visible",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "sub.5.text_visible",
						}, -- [3]
					},
				}, -- [1]
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["authorOptions"] = {
			},
		},
		["Dragon"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "vVnrs5WY3",
			["parent"] = "Valdrakken Map Labels",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = -31.422058105469,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["duration"] = "1",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Conditions",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["spellIds"] = {
						},
						["events"] = "OPEN_WORLD_MAP, WORLD_MAP_UPDATE, QUEST_LOG_UPDATE",
						["custom"] = "function()\n    local mapID = WorldMapFrame:GetMapID()\n    if mapID == 2112 then -- Valdrakken\n        return true\n    else\n        return false\n    end\nend\n\n\n--2112 = Valdrakken\n--2112 = Valdrakken",
						["check"] = "update",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["font"] = "Expressway",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "2112",
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["xOffset"] = -320.9778137207,
			["anchorFrameFrame"] = "WorldMapFrame",
			["regionType"] = "text",
			["url"] = "",
			["authorOptions"] = {
			},
			["fixedWidth"] = 200,
			["displayText_format_p_time_precision"] = 1,
			["displayText"] = "Dragon",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "Dragon",
			["wordWrap"] = "WordWrap",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["shadowYOffset"] = -1,
			["uid"] = "C7tkcSNnFst",
			["justify"] = "CENTER",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 135,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["easeStrength"] = 3,
					["preset"] = "spiralandpulse",
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Mana Tea"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Mana Tea", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["remaining_operator"] = ">",
						["useGroup_count"] = false,
						["useExactSpellId"] = false,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["custom_hide"] = "timed",
						["use_tooltip"] = false,
						["matchesShowOn"] = "showOnActive",
						["use_totemNamePattern"] = false,
						["ownOnly"] = true,
						["useName"] = true,
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["type"] = "aura2",
						["unevent"] = "timed",
						["auraspellids"] = {
							"120954", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_totemName"] = false,
						["use_unit"] = true,
						["sourceUnit"] = "player",
						["use_debuffClass"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowXOffset"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_format"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 197908,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["useCooldownModRate"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 608949,
			["parent"] = "Monk - Buffs",
			["url"] = "",
			["config"] = {
			},
			["frameStrata"] = 4,
			["cooldownTextDisabled"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Mana Tea",
			["auto"] = false,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 0,
			["uid"] = "qcqeoPggjyo",
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["cooldown"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
		},
		["Monk - Healer"] = {
			["grow"] = "RIGHT",
			["controlledChildren"] = {
				"Heal - Renewing Mist", -- [1]
				"Heal - Rising Sun Kick", -- [2]
				"Heal - Essence Font", -- [3]
				"Heal - Vivacious Vivification", -- [4]
				"Heal - Faeline Stomp", -- [5]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = 30,
			["yOffset"] = -30,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["space"] = 2,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["subeventPrefix"] = "SPELL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["names"] = {
						},
						["event"] = "Health",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["radius"] = 200,
			["selfPoint"] = "LEFT",
			["align"] = "CENTER",
			["stagger"] = 0,
			["subRegions"] = {
			},
			["config"] = {
			},
			["uid"] = "FYxoddLzErT",
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["parent"] = "PanzaUI - Monk",
			["animate"] = false,
			["useLimit"] = false,
			["scale"] = 1,
			["centerType"] = "LR",
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "dynamicgroup",
			["borderSize"] = 2,
			["sort"] = "none",
			["internalVersion"] = 64,
			["authorOptions"] = {
			},
			["constantFactor"] = "RADIUS",
			["rowSpace"] = 1,
			["borderOffset"] = 4,
			["gridType"] = "RD",
			["frameStrata"] = 1,
			["id"] = "Monk - Healer",
			["fullCircle"] = true,
			["gridWidth"] = 5,
			["anchorFrameType"] = "MOUSE",
			["limit"] = 5,
			["borderInset"] = 1,
			["groupIcon"] = 135887,
			["rotation"] = 0,
			["conditions"] = {
			},
			["information"] = {
			},
			["arcLength"] = 360,
		},
		["Heal - Renewing Mist 2"] = {
			["iconSource"] = -1,
			["parent"] = "Shaman - Healer",
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
					["do_glow"] = false,
					["glow_frame_type"] = "UNITFRAME",
					["glow_action"] = "show",
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_charges"] = true,
						["genericShowOn"] = "showAlways",
						["names"] = {
						},
						["spellName"] = 115151,
						["charges_operator"] = ">",
						["charges"] = "0",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 115151,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_genericShowOn"] = true,
						["subeventPrefix"] = "SPELL",
						["type"] = "spell",
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%1.charges",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorYOffset"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = 2,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_1.charges_format"] = "none",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 270,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 17,
					["multi"] = {
						[115151] = true,
					},
				},
				["use_vehicle"] = false,
				["use_class_and_spec"] = true,
				["use_talent"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_never"] = true,
				["use_spec"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[2] = true,
					},
				},
				["use_combat"] = true,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "bounceDecay",
					["easeStrength"] = 3,
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["icon"] = true,
			["regionType"] = "icon",
			["xOffset"] = 0,
			["authorOptions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["uid"] = "fRvtJduiJWO",
			["zoom"] = 0.1,
			["cooldownTextDisabled"] = true,
			["width"] = 30,
			["tocversion"] = 100002,
			["id"] = "Heal - Renewing Mist 2",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 627487,
			["cooldown"] = false,
			["url"] = "",
		},
		["Heal - Faeline Stomp"] = {
			["iconSource"] = -1,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["url"] = "",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnReady",
						["unit"] = "player",
						["spellName"] = 388193,
						["charges_operator"] = ">",
						["type"] = "spell",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 388193,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_charges"] = false,
						["charges"] = "0",
						["subeventPrefix"] = "SPELL",
						["use_track"] = true,
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "bounceDecay",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "TOPLEFT",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_1.charges_format"] = "none",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["type"] = "subtext",
					["text_anchorXOffset"] = 2,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["text_text_format_p_format"] = "timed",
					["text_visible"] = true,
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_text_format_c_format"] = "none",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 270,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 17,
					["multi"] = {
						[191837] = true,
					},
				},
				["use_vehicle"] = false,
				["use_class_and_spec"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[2] = true,
					},
				},
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spellknown"] = true,
				["use_spec"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 388193,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["init"] = {
				},
				["finish"] = {
					["glow_frame_type"] = "UNITFRAME",
					["do_glow"] = false,
					["glow_action"] = "show",
				},
			},
			["parent"] = "Monk - Healer",
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["xOffset"] = 0,
			["cooldown"] = false,
			["displayIcon"] = 1360978,
			["config"] = {
			},
			["frameStrata"] = 1,
			["cooldownTextDisabled"] = true,
			["anchorFrameType"] = "SCREEN",
			["tocversion"] = 100002,
			["id"] = "Heal - Faeline Stomp",
			["alpha"] = 1,
			["useCooldownModRate"] = true,
			["width"] = 30,
			["zoom"] = 0.1,
			["uid"] = "sDXxZUDOn4O",
			["inverse"] = true,
			["cooldownEdge"] = true,
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Shaman - Missing Lightning Shield"] = {
			["iconSource"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = true,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["auranames"] = {
							"192106", -- [1]
						},
						["matchesShowOn"] = "showOnMissing",
						["use_charges"] = false,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["use_absorbMode"] = true,
						["use_unit"] = true,
						["custom_hide"] = "custom",
						["spellIds"] = {
						},
						["charges"] = "1",
						["custom_type"] = "event",
						["use_HasPet"] = false,
						["debuffType"] = "HELPFUL",
						["charges_operator"] = "<",
						["useName"] = true,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["spellName"] = 58875,
						["type"] = "aura2",
						["event"] = "Conditions",
						["use_exact_spellName"] = true,
						["realSpellName"] = 58875,
						["use_spellName"] = true,
						["events"] = "PLAYER_DEAD,UPDATE_INVENTORY_DURABILITY,PLAYER_ENTERING_WORLD",
						["subeventPrefix"] = "SPELL",
						["check"] = "event",
						["unit"] = "player",
						["use_track"] = true,
						["ownOnly"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 18,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "LEFT",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_visible"] = true,
					["type"] = "subtext",
					["text_anchorXOffset"] = 10,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["anchorXOffset"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "Missing Lightning Shield",
					["text_anchorPoint"] = "OUTER_RIGHT",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_color"] = true,
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_c_format"] = "none",
					["text_text_format_p_abbreviate_max"] = 8,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["border_size"] = 18,
					["border_offset"] = 4,
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["type"] = "subborder",
				}, -- [4]
			},
			["height"] = 30,
			["load"] = {
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["use_class_and_spec"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_spellknown"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[262] = true,
						[264] = true,
					},
				},
				["use_vehicleUi"] = false,
				["use_spec"] = false,
				["use_exact_spellknown"] = false,
				["spellknown"] = 58875,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["authorOptions"] = {
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["url"] = "",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["init"] = {
				},
				["finish"] = {
					["do_glow"] = false,
					["glow_frame_type"] = "UNITFRAME",
					["glow_action"] = "show",
				},
			},
			["cooldown"] = false,
			["displayIcon"] = 136051,
			["uid"] = "sjJeLJpx7Cd",
			["useCooldownModRate"] = true,
			["cooldownTextDisabled"] = true,
			["width"] = 30,
			["tocversion"] = 100002,
			["id"] = "Shaman - Missing Lightning Shield",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["zoom"] = 0.1,
			["config"] = {
			},
			["inverse"] = false,
			["xOffset"] = 0,
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["parent"] = "Alerts",
		},
		["Invoke Niuzao, the Black Ox"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"120954", -- [1]
						},
						["duration"] = "25",
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Combat Log",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["useGroup_count"] = false,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["use_tooltip"] = false,
						["custom_hide"] = "timed",
						["matchesShowOn"] = "showOnActive",
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
						["buffShowOn"] = "showOnActive",
						["use_remaining"] = true,
						["type"] = "aura2",
						["unevent"] = "timed",
						["auraspellids"] = {
							"132578", -- [1]
						},
						["remaining_operator"] = ">",
						["use_totemNamePattern"] = false,
						["totemName"] = "123904",
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = false,
						["spellIds"] = {
							120954, -- [1]
						},
						["useExactSpellId"] = true,
						["use_genericShowOn"] = true,
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["sourceUnit"] = "player",
						["ownOnly"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_time_precision"] = 1,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_class_and_spec"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["use_vehicleUi"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 132578,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 0,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["url"] = "",
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["parent"] = "Monk - Buffs",
			["authorOptions"] = {
			},
			["uid"] = "(UrLSB67Ceo",
			["alpha"] = 1,
			["auto"] = false,
			["cooldownTextDisabled"] = false,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Invoke Niuzao, the Black Ox",
			["zoom"] = 0.3,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["frameStrata"] = 4,
			["config"] = {
			},
			["inverse"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["displayIcon"] = 608951,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["stickyDuration"] = false,
		},
		["Heal - Vivacious Vivification"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"392883", -- [1]
						},
						["remaining_operator"] = ">",
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Action Usable",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["useExactSpellId"] = false,
						["useGroup_count"] = false,
						["use_debuffClass"] = false,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["spellName"] = 322101,
						["use_tooltip"] = false,
						["ownOnly"] = true,
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["useName"] = true,
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["type"] = "aura2",
						["unevent"] = "timed",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = "Expel Harm",
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_unit"] = true,
						["use_totemName"] = false,
						["use_genericShowOn"] = true,
						["sourceUnit"] = "player",
						["use_totemNamePattern"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%c",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_c_format"] = "none",
					["anchorXOffset"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowXOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_shadowYOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["anchorYOffset"] = 0,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = true,
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_talent"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
						[388812] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 392883,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 30,
			["cooldownTextDisabled"] = false,
			["cooldownEdge"] = false,
			["icon"] = true,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 1360980,
			["authorOptions"] = {
			},
			["xOffset"] = 0,
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["auto"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Heal - Vivacious Vivification",
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["frameStrata"] = 4,
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["uid"] = "PGEjGpTimMa",
			["inverse"] = false,
			["parent"] = "Monk - Healer",
			["conditions"] = {
			},
			["cooldown"] = false,
			["desaturate"] = false,
		},
		["Healthstone up!"] = {
			["iconSource"] = 0,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["init"] = {
				},
				["finish"] = {
					["do_glow"] = false,
					["glow_frame_type"] = "UNITFRAME",
					["glow_action"] = "show",
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["names"] = {
						},
						["duration"] = "5",
						["use_afk"] = true,
						["auranames"] = {
							"152173", -- [1]
						},
						["subeventPrefix"] = "SPELL",
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["ownOnly"] = true,
						["custom_hide"] = "custom",
						["spellIds"] = {
						},
						["use_spellName"] = false,
						["debuffType"] = "HELPFUL",
						["useName"] = true,
						["custom_type"] = "event",
						["spellName"] = 58875,
						["charges_operator"] = "<",
						["type"] = "combatlog",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["unit"] = "player",
						["spellId"] = "29893",
						["event"] = "Combat Log",
						["use_exact_spellName"] = true,
						["realSpellName"] = 58875,
						["use_spellId"] = true,
						["events"] = "PLAYER_DEAD,UPDATE_INVENTORY_DURABILITY,PLAYER_ENTERING_WORLD",
						["charges"] = "1",
						["check"] = "event",
						["use_charges"] = false,
						["use_track"] = true,
						["use_genericShowOn"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 18,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "LEFT",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_visible"] = true,
					["type"] = "subtext",
					["text_anchorXOffset"] = 10,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["anchorXOffset"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "Healthstone up!",
					["text_anchorPoint"] = "OUTER_RIGHT",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_color"] = true,
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_c_format"] = "none",
					["text_text_format_p_abbreviate_max"] = 8,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["type"] = "subborder",
					["border_size"] = 18,
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["border_offset"] = 4,
				}, -- [4]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_spellknown"] = false,
				["use_vehicleUi"] = false,
				["use_ingroup"] = false,
				["use_exact_spellknown"] = false,
				["spellknown"] = 58875,
				["ingroup"] = {
					["multi"] = {
						["group"] = true,
						["raid"] = true,
					},
				},
			},
			["source"] = "import",
			["parent"] = "Alerts",
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
				["main"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "alphaPulse",
					["easeStrength"] = 3,
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["url"] = "",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["cooldown"] = false,
			["displayIcon"] = 538745,
			["uid"] = "yWRNeGBniAP",
			["useCooldownModRate"] = true,
			["cooldownTextDisabled"] = true,
			["width"] = 30,
			["tocversion"] = 100002,
			["id"] = "Healthstone up!",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["zoom"] = 0.1,
			["config"] = {
			},
			["inverse"] = false,
			["icon"] = true,
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["xOffset"] = 0,
		},
		["Totem #2"] = {
			["iconSource"] = -1,
			["wagoID"] = "RfkIi6uSZ",
			["parent"] = "Shaman - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "\n\n",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "--- OPTIONS ---\naura_env.icon_crop = 0.15  -- The abound of Icon zoom (crop of its borders) Can me any value from 0 to 1 but more than 0.3 hardly makes much sence.\naura_env.icon_offset_X = 0.5  -- Horizontal position of the shown texture (0 - shows the leftmost part, 1 shows the rightmost part)\naura_env.icon_offset_Y = 0.5  -- Vertical position of the shown texture (0 - shows the topmost part, 1 shows the bottommost part)\n--- DON'T EDIT BELOW ---\n\naura_env.set_coord = function()\n    -- Подготовка и промежуточные расчеты\n    local X = aura_env.region.width -- находим ширину иконки\n    local Y = aura_env.region.height -- находим высоту иконки\n    local length_X = (1 - aura_env.icon_crop) * (X / math.max(X,Y)) -- Ширина области после преобразования \n    local length_Y = (1 - aura_env.icon_crop) * (Y / math.max(X,Y)) -- Высота области после преобразоания \n    local axis_X = (aura_env.icon_crop + length_X) * 0.5 + aura_env.icon_offset_X * (1 - aura_env.icon_crop - length_X)  -- Положение центральной оси по ширине (с учетом статичного кропа)\n    local axis_Y = (aura_env.icon_crop + length_Y) * 0.5 + aura_env.icon_offset_Y * (1 - aura_env.icon_crop - length_Y) -- Положение центральной оси по высоте (с учетом статичного кропа)\n    -- Основные расчеты\n    local X1 = axis_X - length_X * 0.5 -- Находим позицию №1 по ширине\n    local X2 = axis_X + length_X * 0.5 -- Находим позицию №2 по ширине\n    local Y1 = axis_Y - length_Y * 0.5 -- Находим позицию №1 по высоте\n    local Y2 = axis_Y + length_Y * 0.5 -- Находим позицию №2 по высоте\n    -- Вывод результатов\n    aura_env.region.icon.SetTexCoord = nil\n    aura_env.region.icon:SetTexCoord(X1, X2, Y1, Y2) -- Назначение границ текстуры\nend\n\naura_env.set_coord ()",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"Dampen Harm", -- [1]
						},
						["duration"] = "1",
						["unit"] = "player",
						["use_totemType"] = true,
						["debuffType"] = "HELPFUL",
						["type"] = "spell",
						["auraspellids"] = {
							"260895", -- [1]
						},
						["unevent"] = "auto",
						["use_absorbMode"] = true,
						["event"] = "Totem",
						["totemType"] = 2,
						["names"] = {
							"Shield of the Righteous", -- [1]
						},
						["useExactSpellId"] = true,
						["spellIds"] = {
							132403, -- [1]
						},
						["useName"] = false,
						["buffShowOn"] = "showOnActive",
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["alphaType"] = "custom",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "\n\n",
					["use_alpha"] = true,
					["scaleType"] = "straightScale",
					["easeType"] = "none",
					["colorA"] = 1,
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 0,
					["easeStrength"] = 3,
					["use_scale"] = false,
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["rotate"] = 0,
					["type"] = "none",
					["duration"] = "1",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["desaturate"] = false,
			["version"] = 6,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_text_format_p_time_format"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 262,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_petbattle"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_dragonriding"] = false,
				["role"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["use_combat"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "SHAMAN",
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["selfPoint"] = "TOPLEFT",
			["uid"] = "K8AeMSjOZQp",
			["authorOptions"] = {
			},
			["alpha"] = 1,
			["regionType"] = "icon",
			["cooldown"] = false,
			["icon"] = true,
			["auto"] = true,
			["zoom"] = 0.3,
			["width"] = 40,
			["frameStrata"] = 1,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.5",
			["tocversion"] = 90005,
			["id"] = "Totem #2",
			["xOffset"] = 0,
			["useCooldownModRate"] = true,
			["anchorFrameType"] = "SCREEN",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["inverse"] = false,
			["url"] = "",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["iconInset"] = 0,
		},
		["Hit Combo"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Hit Combo", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_debuffClass"] = false,
						["use_genericShowOn"] = true,
						["use_totemName"] = false,
						["useStacks"] = true,
						["useGroup_count"] = false,
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["use_totemNamePattern"] = false,
						["use_tooltip"] = false,
						["useExactSpellId"] = false,
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["duration"] = "25",
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["use_remaining"] = true,
						["buffShowOn"] = "showOnActive",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["unevent"] = "timed",
						["useName"] = true,
						["matchesShowOn"] = "showOnActive",
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["stacks"] = "1",
						["remaining_operator"] = ">",
						["spellName"] = 0,
						["sourceUnit"] = "player",
						["stacksOperator"] = ">=",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowXOffset"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_format"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [2]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "BOTTOM",
					["text_visible"] = true,
					["text_shadowXOffset"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["use_dragonriding"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["use_class_and_spec"] = false,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["url"] = "",
			["authorOptions"] = {
			},
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["uid"] = "5JIlGzUc9Ul",
			["alpha"] = 1,
			["semver"] = "7.0.2",
			["zoom"] = 0.3,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Hit Combo",
			["cooldownTextDisabled"] = false,
			["frameStrata"] = 4,
			["width"] = 40,
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 574573,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
		},
		["Raid Ability Timeline Icon"] = {
			["outline"] = "OUTLINE",
			["iconSource"] = -1,
			["wagoID"] = "NyseKq1Xo",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayText"] = "%p",
			["customText"] = "function()\n    if not aura_env.state then return end\n    \n    local text = aura_env.state.name\n    if not text then return end\n    text = strtrim(text) -- Trim\n    local inlineIconAdjust = string.len(string.match(text,\"|T.-|t\") or \"\")\n    \n    \n    if inlineIconAdjust > 0 then inlineIconAdjust = inlineIconAdjust - 2 end -- Make icons take 2 characters.\n    \n    if (aura_env.config.textMaxLength or 0)>=5 and text:len()-inlineIconAdjust>aura_env.config.textMaxLength then\n        text = WA_Utf8Sub(text,aura_env.config.textMaxLength+inlineIconAdjust)..\"..\" -- Truncate\n        \n    end\n    \n    \n    if aura_env.state.paused and aura_env.config.textPausedOptions == 1 then   \n        text = \"Paused\"\n    elseif aura_env.state.paused and aura_env.config.textPausedOptions == 2 then\n        text = text..\"Paused\"\n    elseif aura_env.state.paused and aura_env.config.textPausedOptions == 3 then\n        text = WA_Utf8Sub(text,text:len()-8)..\"..\"\n        text = text..\"Paused\"\n    end \n    \n    if aura_env.IDoptions and aura_env.IDoptions[aura_env.state.spellID] and aura_env.IDoptions[aura_env.state.spellID].replaceTextColor then\n        local r,g,b,a = unpack(aura_env.IDoptions[aura_env.state.spellID].textColor)\n        text = string.format(\"\\124c%02x%02x%02x%02x%s\\124r\",255*a,255*r,255*g,255*b,text)\n        \n        \n    elseif aura_env.options and aura_env.options[aura_env.state.message] and aura_env.options[aura_env.state.message].replaceTextColor then\n        local r,g,b,a = unpack(aura_env.options[aura_env.state.message].textColor)\n        text = string.format(\"\\124c%02x%02x%02x%02x%s\\124r\",255*a,255*r,255*g,255*b,text)\n        \n    elseif aura_env.options and aura_env.options[aura_env.state.submsg] and aura_env.options[aura_env.state.submsg].replaceTextColor and aura_env.options[aura_env.state.submsg].IgnoreAlertNumber then\n        local r,g,b,a = unpack(aura_env.options[aura_env.state.submsg].textColor)\n        text = string.format(\"\\124c%02x%02x%02x%02x%s\\124r\",255*a,255*r,255*g,255*b,text)\n        \n    elseif aura_env.options and aura_env.options[aura_env.state.cutmsg] and aura_env.options[aura_env.state.cutmsg].replaceTextColor and aura_env.options[aura_env.state.cutmsg].IgnoreAlertNumber then\n        local r,g,b,a = unpack(aura_env.options[aura_env.state.cutmsg].textColor)\n        text = string.format(\"\\124c%02x%02x%02x%02x%s\\124r\",255*a,255*r,255*g,255*b,text)\n        \n        \n    elseif aura_env.state.colorTable then\n        local r,g,b = unpack(aura_env.state.colorTable)\n        text = string.format(\"\\124c%02x%02x%02x%02x%s\\124r\",255,255*r,255*g,255*b,text)\n    end\n    \n    return text\nend\n\n\n",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = false,
			["customTextUpdate"] = "event",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "----- Don't Edit Anything Below -----\n\n\nWeakAuras.RegisterBigWigsTimer()\nWeakAuras.RegisterDBMCallback(\"DBM_TimerStart\")\nWeakAuras.RegisterDBMCallback(\"DBM_TimerStop\")\nWeakAuras.RegisterDBMCallback(\"DBM_TimerUpdate\")\nWeakAuras.RegisterDBMCallback(\"DBM_TimerPause\")\nWeakAuras.RegisterDBMCallback(\"DBM_TimerResume\")\naura_env.TextAnchor = WeakAuras.GetData(aura_env.id).subRegions[2].text_anchorPoint\naura_env.AuraWidth = aura_env.region:GetWidth()\n\n\n\nif DBT and aura_env.config.hideDBMBars then\n    if not DBT:GetSkins().Jods_Raid_Ability_Timeline_Skin then\n        local skin = DBT:RegisterSkin(\"Jods_Raid_Ability_Timeline_Skin\")\n        skin.Options = {\n            HugeAlpha = 0.0001,\n            Alpha = 0.0001,\n            IconLeft = false,\n            IconRight = false,\n            InlineIcons = false,\n            Bar7CustomInline = false\n        }\n        if DBT:GetSkins().Jods_Raid_Ability_Timeline_Skin then\n            DBT:SetSkin(\"Jods_Raid_Ability_Timeline_Skin\")\n            DBT:Rearrange()\n        end\n        if AddOnSkins and AddOnSkins[1]:CheckOption('DBM-Core') == true then\n            print(\"Hiding DBM bars while AddonSkins skinning is turned on doesn't work pls either disable the DBM-Core option or the addon and try again\")\n        end\n        \n    end\n    \nelseif DBT and not aura_env.config.hideDBMBars then\n    if DBT:GetSkins().Jods_Raid_Ability_Timeline_Skin then\n        DBT:ResetSkin()\n        DBT:Rearrange()\n    end\nend\n\n\n\naura_env.HideBw = function() \n    if BigWigsLoader and aura_env.config.hideBWBars then\n        \n        if BigWigsAnchor then\n            \n            C_Timer.After(15, function()\n                    \n                    BigWigsAnchor:ClearAllPoints()\n                    BigWigsAnchor:SetClampedToScreen(false)\n                    BigWigsAnchor:SetPoint(\"TOPLEFT\", 9999,9999)\n                    BigWigsEmphasizeAnchor:ClearAllPoints()\n                    BigWigsEmphasizeAnchor:SetClampedToScreen(false)\n                    BigWigsEmphasizeAnchor:SetPoint(\"TOPLEFT\", 9999,9999)\n            end)  \n        elseif not IsAddOnLoaded(\"BigWigs_Options\") then \n            \n            EnableAddOn(\"BigWigs_Core\")\n            LoadAddOn(\"BigWigs_Core\")\n            EnableAddOn(\"BigWigs_Options\")\n            LoadAddOn(\"BigWigs_Options\")\n            BigWigsLoader.RegisterMessage({}, \"BigWigs_CoreEnabled\", function()\n                    C_Timer.After(0.5, function()\n                            \n                            BigWigsAnchor:ClearAllPoints()\n                            BigWigsAnchor:SetClampedToScreen(false)\n                            BigWigsAnchor:SetPoint(\"TOPLEFT\", 9999,9999)\n                            BigWigsEmphasizeAnchor:ClearAllPoints()\n                            BigWigsEmphasizeAnchor:SetClampedToScreen(false)\n                            BigWigsEmphasizeAnchor:SetPoint(\"TOPLEFT\", 9999,9999)\n                    end)            \n            end)\n        end\n        \n        \n        \n        \n        local JODS_WA_RAT_BWCallbackObj = {}\n        local f = function(event,addon,bar,...) \n            bar:SetAlpha(0)\n            bar:EnableMouse(false)\n            -- For some reason the first ever icon after game launch won't be hidden because it hasn't been initialized properly? Set a short timer to hide it again to work around this.\n            local JODS_BW_BAR_TO_HIDE = bar\n            C_Timer.After(2, function() if (JODS_BW_BAR_TO_HIDE~=nil and JODS_BW_BAR_TO_HIDE:GetAlpha() > 0) then JODS_BW_BAR_TO_HIDE:SetAlpha(0) JODS_BW_BAR_TO_HIDE:EnableMouse(false) end end)\n        end\n        BigWigsLoader.RegisterMessage(JODS_WA_RAT_BWCallbackObj, \"BigWigs_BarCreated\", f);\n        BigWigsLoader.RegisterMessage(JODS_WA_RAT_BWCallbackObj, \"BigWigs_BarEmphasized\", f);\n        \n    end\nend\n\naura_env.ShortenNameAndGlow = function(msg,spellId,state)\n    local submsg = strtrim(msg:gsub(\"~\", \"\")) -- cut ~\n    local cutmsg = strtrim(msg:gsub(\"^~ ?\", \"\"):gsub(\"%s+%(%d+%)\",\"\"))  -- cut number and ~\n    local nbmsg = strtrim(msg:gsub(\"%s+%(%d+%)\",\"\")) -- cut number\n    \n    if aura_env.options and aura_env.options[msg] and aura_env.options[msg].replaceSpellName and aura_env.options[msg].spellName  then\n        state.name = aura_env.options[msg].spellName\n        --spell Name\n    elseif spellId and aura_env.IDoptions and aura_env.IDoptions[spellId] and aura_env.IDoptions[spellId].replaceSpellName and aura_env.IDoptions[spellId].spellName then\n        state.name = aura_env.IDoptions[spellId].spellName\n        --spell ID\n    elseif aura_env.options and aura_env.options[submsg] and aura_env.options[submsg].replaceSpellName and aura_env.options[submsg].spellName then\n        state.name = aura_env.options[submsg].spellName\n        --spell Name ignore ~\n    elseif aura_env.options and aura_env.options[cutmsg] and aura_env.options[cutmsg].replaceSpellName and aura_env.options[cutmsg].spellName and aura_env.options[cutmsg].IgnoreAlertNumber then\n        state.name = aura_env.options[cutmsg].spellName\n        --spell Name ignore Spellcount\n    elseif aura_env.config.NameOption == 1 then\n        state.name = msg\n        --default\n    elseif aura_env.config.NameOption == 2 then\n        state.name = submsg\n        -- hide ~ \n    elseif aura_env.config.NameOption == 3 then\n        state.name = nbmsg\n        -- hide number\n    elseif aura_env.config.NameOption == 4 then\n        state.name = cutmsg\n        -- hide number and ~\n    else   \n        state.name = msg\n    end\n    if aura_env.options and aura_env.options[msg] and aura_env.options[msg].glow then\n        state.shouldGlow = true\n    elseif spellId and aura_env.IDoptions and aura_env.IDoptions[spellId] and aura_env.IDoptions[spellId].glow then\n        state.shouldGlow = true\n    elseif aura_env.options and aura_env.options[submsg] and aura_env.options[submsg].glow then\n        state.shouldGlow = true\n    elseif aura_env.options and aura_env.options[cutmsg] and aura_env.options[cutmsg].glow and aura_env.options[cutmsg].IgnoreAlertNumber then\n        state.shouldGlow = true\n    else\n        state.shouldGlow = false\n    end\n    state.message = msg\n    state.submsg = submsg\n    state.cutmsg = cutmsg\n    state.nbmsg = nbmsg\nend\n\naura_env.RefreshAndRecalculateOffset = function(allstates)\n    local queuedEvents={}\n    local PausedQueuedEvents={}\n    local events={}\n    local PausedEvents={}\n    -- Sort everything by exp\n    for id,state in pairs(allstates) do\n        if state.c_queued and not state.paused then\n            table.insert(queuedEvents,{id=id,exp=state.expirationTime})\n        elseif state.c_queued and state.paused then\n            table.insert(PausedQueuedEvents,{id=id,exp=state.remaining}) \n        elseif state.paused then\n            table.insert(PausedEvents,{id=id,exp=state.remaininge})  \n        else\n            table.insert(events,{id=id,exp=state.expirationTime})\n        end\n    end\n    \n    \n    table.sort(queuedEvents,function(a,b) return (a.exp or 0)<(b.exp or 0) end)\n    table.sort(events,function(a,b) return (a.exp or 0)<(b.exp or 0) end)\n    table.sort(PausedQueuedEvents,function(a,b) return (a.exp or 0)<(b.exp or 0) end)\n    table.sort(PausedEvents,function(a,b) return (a.exp or 0)<(b.exp or 0) end)\n    \n    -- Calculate offset for queued events\n    for i,event in ipairs(queuedEvents) do\n        allstates[event.id].c_offset=i*(aura_env.region:GetHeight()+aura_env.config.IconSpacing)\n        \n    end\n    -- calculate offset for queued paused events\n    for i,event in ipairs(PausedQueuedEvents) do\n        allstates[event.id].c_offset=i*(aura_env.region:GetHeight()+aura_env.config.IconSpacing)\n        \n    end\n    -- calculate offset for paused events\n    \n    for i=#PausedEvents,1,-1 do\n        local event=PausedEvents[i]\n        local lastEvent = PausedEvents[i+1]\n        if lastEvent then\n            allstates[event.id].c_offset = (aura_env.region:GetHeight()+aura_env.config.IconSpacing) - \n            (((allstates[lastEvent.id].remaining or 0)-(allstates[event.id].remaining or 0)) *\n                aura_env.config.travelDist / aura_env.config.maxDur - (allstates[lastEvent.id].c_offset or 0))\n            -- offset must be positive\n            if allstates[event.id].c_offset < 0 then allstates[event.id].c_offset = 0 end\n        end\n    end\n    \n    \n    \n    -- Calculate offset for the regluar events to prevent icon collision\n    for i=#events,1,-1 do\n        local event=events[i]\n        local lastEvent = events[i+1]\n        if lastEvent then\n            allstates[event.id].c_offset = (aura_env.region:GetHeight()+aura_env.config.IconSpacing) - \n            (((allstates[lastEvent.id].expirationTime or 0)-(allstates[event.id].expirationTime or 0)) *\n                aura_env.config.travelDist / aura_env.config.maxDur - (allstates[lastEvent.id].c_offset or 0))\n            -- offset must be positive\n            if allstates[event.id].c_offset < 0 then allstates[event.id].c_offset = 0 end\n        end\n    end\nend\n\n\naura_env.options = {}\nfor _,option in pairs(aura_env.config.spellOptions) do\n    aura_env.options[option.message] = option\nend\naura_env.IDoptions = {}\nfor _,option in pairs(aura_env.config.spellOptions) do\n    aura_env.IDoptions[option.spellid] = option\nend",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["custom_hide"] = "timed",
						["type"] = "custom",
						["customVariables"] = "{\n    expirationTime = true,\n    duration = true,  \n    paused = \"bool\",\n    shouldGlow = \"bool\",\n    remaining = \"number\"\n    \n}",
						["custom_type"] = "stateupdate",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["genericShowOn"] = "showOnActive",
						["names"] = {
						},
						["unevent"] = "auto",
						["custom"] = "function(allstates,event,bar)\n    if event == \"DBM_TimerStart\" or event == \"BigWigs_StartBar\" then\n        if not bar then return end\n        \n        if not aura_env.BwHidden then -- for some Reason the first ever bw icon forces the anchor to come back to the screen in instanced content\n            aura_env.HideBw()\n            aura_env.BwHidden = true\n        end\n        \n        local msg = nil\n        local duration = nil\n        local icon = nil\n        local exp = nil\n        local colorTable = nil\n        local spellId = nil\n        local count = nil\n        if event == \"BigWigs_StartBar\" then\n            local b = WeakAuras.GetBigWigsTimerById(bar)\n            if b then\n                msg = b.text\n                duration = b.duration\n                icon = b.icon\n                exp = b.expirationTime\n                colorTable = b.bwTextColor\n                spellId = b.spellId\n                count = b.count\n            end\n        else \n            local b = WeakAuras.GetDBMTimerById(bar)\n            if b then\n                msg = b.message\n                duration = b.duration\n                icon = b.icon\n                exp = b.expirationTime\n                colorTable = b.dbmColor\n                spellId = b.spellId\n                count = b.count\n                \n            end\n        end\n        \n        if aura_env.config.BigIcon.EnableBigIcon == true then\n            exp = exp-5\n        end\n        \n        allstates[bar] = allstates[bar] or {}\n        local state = allstates[bar]\n        aura_env.ShortenNameAndGlow(msg,spellId,state)\n        state.icon = icon\n        state.progressType = \"timed\"\n        state.expirationTime = exp\n        state.duration = exp-GetTime()\n        state.colorTable = colorTable\n        state.c_offset = 0\n        state.autoHide = true\n        state.changed = true\n        state.show = true \n        state.paused = false\n        if  spellId then\n            state.spellID  = spellId\n        end\n        local now = GetTime()\n        if exp < now + aura_env.config.maxDur then\n            state.c_queued=false\n            \n        elseif exp-now-aura_env.config.maxDur > 0 then\n            state.c_queued=true\n            C_Timer.After(exp-now-aura_env.config.maxDur, function() WeakAuras.ScanEvents(\"Jods_Raid_Ability_Timeline_Refresh\",bar) end)\n        end\n        \n        \n    elseif event==\"DBM_TimerStop\" or event == \"BigWigs_StopBar\" then\n        if not bar then return end\n        allstates[bar] = allstates[bar] or {}\n        local state = allstates[bar]\n        state.show=false\n        state.changed=true\n        \n    elseif event==\"DBM_TimerUpdate\" then\n        if not bar then return end\n        local state = allstates[bar]\n        if state then\n            local b = WeakAuras.GetDBMTimerById(bar)\n            if b then\n                local exp = b.expirationTime\n                \n                if aura_env.config.BigIcon.EnableBigIcon == true then\n                    exp = exp-5\n                end\n                \n                local now = GetTime()\n                state.duration = exp-now\n                state.expirationTime = exp\n                \n                if exp < now + aura_env.config.maxDur then\n                    state.c_queued=false\n                else\n                    state.c_queued=true\n                    C_Timer.After(exp-now-aura_env.config.maxDur, function() WeakAuras.ScanEvents(\"Jods_Raid_Ability_Timeline_Refresh\",bar) end)\n                end\n                state.changed = true\n            end\n        end\n    elseif event == \"BigWigs_OnBossDisable\" then\n        for _,state in pairs(allstates) do\n            state.show=false\n            state.changed=true\n            \n        end\n        return true \n    elseif event==\"Jods_Raid_Ability_Timeline_Refresh\" then\n        if not allstates[bar] then return end\n        -- For performance reasons, we are not canceling the REFRESH callbacks when events are canceled. \n        -- Therefore we need to disregard the ones that are leaked from the previous pull.\n        if not allstates[bar].paused then\n            local timeLeft = (allstates[bar].expirationTime or 0) - GetTime()\n            if (aura_env.config.maxDur or 0)-timeLeft > 0.5 or (aura_env.config.maxDur or 0)-timeLeft < -0.1 then return end\n            allstates[bar].c_offset=0\n            allstates[bar].c_queued=false\n            allstates[bar].changed=true\n        end\n        \n    elseif event == \"BigWigs_PauseBar\" or event == \"DBM_TimerPause\" then\n        \n        local state = allstates[bar] \n        if state then\n            if state.expirationTime - GetTime() >0 then\n                state.remaining = state.expirationTime - GetTime()\n                state.changed = true\n                state.paused = true\n                state.c_offset = 0\n            else\n                state.show = false\n                state.changed = true\n            end\n        end  \n    elseif event == \"DBM_TimerResume\" or event == \"BigWigs_ResumeBar\" then\n        \n        local state = allstates[bar]\n        if state then\n            state.paused = false\n            state.expirationTime = GetTime() + (state.remaining or 0)\n            state.changed = true\n            state.c_offset = 0\n            \n            if state.c_queued == true then\n                if state.remaining and state.remaining-aura_env.config.maxDur > 0 then\n                    C_Timer.After(state.remaining-aura_env.config.maxDur, function() WeakAuras.ScanEvents(\"Jods_Raid_Ability_Timeline_Refresh\",bar) end)\n                else \n                    state.c_queued=false\n                end  \n            end\n        end\n    elseif event == \"Jods_Raid_Ability_Timeline_Options_Event\" then\n        -- purely cosmetic restarting timers after closing /wa options\n        local dbm = WeakAuras.GetAllDBMTimers()\n        for k, v in pairs(dbm) do\n            WeakAuras.ScanEvents(\"DBM_TimerStart\",k)\n        end\n        local bw = WeakAuras.GetAllBigWigsTimers()\n        for k, v in pairs(bw) do\n            WeakAuras.ScanEvents(\"BigWigs_StartBar\",k)\n        end\n        \n    end\n    aura_env.RefreshAndRecalculateOffset(allstates)\n    return true\nend",
						["events"] = "DBM_TimerStart, DBM_TimerStop,  DBM_TimerUpdate, DBM_TimerPause, DBM_TimerResume, BigWigs_StartBar, BigWigs_StopBar, BigWigs_StopBars, BigWigs_OnBossDisable, BigWigs_PauseBar, BigWigs_ResumeBar, Jods_Raid_Ability_Timeline_Refresh, Jods_Raid_Ability_Timeline_Options_Event, OPTIONS",
						["spellIds"] = {
						},
						["check"] = "event",
						["event"] = "Chat Message",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["font"] = "Friz Quadrata TT",
			["version"] = 55,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%c",
					["text_text_format_c.2_format"] = "none",
					["text_text_format_1_format"] = "none",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "ArchivoNarrow-Bold",
					["text_wordWrap"] = "WordWrap",
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_text_format_c2_format"] = "none",
					["text_visible"] = true,
					["text_text_format_c1_format"] = "none",
					["text_anchorPoint"] = "OUTER_LEFT",
					["anchorYOffset"] = 0,
					["text_fontSize"] = 15,
					["anchorXOffset"] = 0,
					["text_text_format_c.1_format"] = "none",
				}, -- [2]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_gcd_cast"] = false,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 0,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 13,
					["anchorXOffset"] = 0,
					["text_text_format_p_round_type"] = "ceil",
					["text_text_format_c.2_format"] = "none",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["type"] = "subtext",
					["text_font"] = "PT Sans Narrow",
					["text_visible"] = true,
					["text_anchorPoint"] = "CENTER",
					["text_shadowXOffset"] = 0,
					["text_text_format_p_time_dynamic_threshold"] = 1,
					["text_text_format_c2_format"] = "none",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_precision"] = 1,
				}, -- [3]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%c",
					["text_text_format_c.2_format"] = "none",
					["text_text_format_1_format"] = "none",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "ArchivoNarrow-Bold",
					["text_wordWrap"] = "WordWrap",
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_text_format_c2_format"] = "none",
					["text_visible"] = false,
					["text_text_format_c1_format"] = "none",
					["text_anchorPoint"] = "OUTER_RIGHT",
					["anchorYOffset"] = 0,
					["text_fontSize"] = 15,
					["anchorXOffset"] = 0,
					["text_text_format_c.1_format"] = "none",
				}, -- [4]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = true,
					["glowScale"] = 1,
					["glow"] = false,
					["glowThickness"] = 2,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [5]
			},
			["height"] = 32,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["affixes"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["talent2"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["icon"] = true,
			["useCooldownModRate"] = true,
			["fontSize"] = 12,
			["source"] = "import",
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["cooldown"] = true,
			["alpha"] = 1,
			["desc"] = "BigWigs Bar Replacement",
			["regionType"] = "icon",
			["parent"] = "Raid Ability Timeline",
			["config"] = {
				["travelDist"] = 198,
				["textPausedOptions"] = 1,
				["IconSpacing"] = 0,
				["maxDur"] = 10,
				["totalDur"] = 0,
				["reverse"] = false,
				["NameOption"] = 1,
				["spellOptions"] = {
					{
						["glow"] = true,
						["NameField"] = "Pause",
						["glowColor"] = {
							1, -- [1]
							0, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["IgnoreAlertNumber"] = false,
						["replaceTextColor"] = true,
						["textColor"] = {
							0, -- [1]
							1, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["message"] = "Pause!",
						["replaceSpellName"] = true,
						["spellid"] = 0,
						["spellName"] = "Partytimer!",
					}, -- [1]
				},
				["hideDBMBars"] = true,
				["BigIcon"] = {
					["EnableBigIcon"] = false,
				},
				["hideBWBars"] = true,
				["textMaxLength"] = 20,
			},
			["desaturate"] = false,
			["anchorFrameType"] = "SCREEN",
			["cooldownTextDisabled"] = true,
			["justify"] = "LEFT",
			["zoom"] = 0,
			["auto"] = true,
			["tocversion"] = 100002,
			["id"] = "Raid Ability Timeline Icon",
			["semver"] = "1.0.54",
			["frameStrata"] = 1,
			["width"] = 32,
			["url"] = "",
			["uid"] = "AHz3O3GTd3Z",
			["inverse"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["colorA"] = 1,
					["colorG"] = 1,
					["use_translate"] = true,
					["type"] = "custom",
					["scaley"] = 1,
					["easeType"] = "none",
					["translateFunc"] = "function(progress, startX, startY, deltaX, deltaY)\n    \n    local endX,endY\n    if not aura_env.state then\n        endX = startX\n        endY = startY \n    elseif (aura_env.config.totalDur or 0)>0 and aura_env.state.expirationTime-GetTime()>aura_env.config.totalDur then\n        endX = startX\n        endY = startY+GetScreenHeight()\n        \n    elseif aura_env.state.paused and not aura_env.state.c_queued then\n        local prog=1\n        if aura_env.state.remaining then\n            prog = aura_env.state.remaining/aura_env.config.maxDur\n        end\n        if prog>1 then prog=1\n        elseif prog<0 then prog=0 end\n        if aura_env.TextAnchor == \"OUTER_LEFT\" then\n            endX = startX + aura_env.AuraWidth\n        elseif aura_env.TextAnchor == \"OUTER_RIGHT\" then\n            endX = startX - aura_env.AuraWidth\n        else  \n            print(\"RaidAbilityTimeline -- This Anchor is currently not supported\")\n        end\n        endY = startY - ((1-prog) * aura_env.config.travelDist) - (aura_env.state.c_offset or 0)\n    elseif aura_env.state.paused and aura_env.state.c_queued then\n        if aura_env.TextAnchor == \"OUTER_LEFT\" then\n            endX = startX + aura_env.AuraWidth\n        elseif aura_env.TextAnchor == \"OUTER_RIGHT\" then\n            endX = startX - aura_env.AuraWidth\n        else  \n            print(\"RaidAbilityTimeline -- This Anchor is currently not supported\")    \n        end\n        endY = startY + (aura_env.state.c_offset or 0)\n    elseif aura_env.state.c_queued and not aura_env.state.paused then\n        endX = startX\n        endY = startY + (aura_env.state.c_offset or 0)    \n    else\n        \n        local prog=1\n        if aura_env.state.expirationTime then\n            prog = (aura_env.state.expirationTime - GetTime())/aura_env.config.maxDur\n        end\n        if prog>1 then prog=1\n        elseif prog<0 then prog=0 end\n        endX = startX\n        endY = startY - ((1-prog) * aura_env.config.travelDist) - (aura_env.state.c_offset or 0)\n    end\n    if aura_env.config.reverse then endY = -aura_env.config.travelDist-endY end\n    return endX,endY\nend",
					["use_color"] = false,
					["alpha"] = 0,
					["x"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["easeStrength"] = 3,
					["translateType"] = "custom",
					["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\n    end\n  ",
					["rotate"] = 0,
					["colorB"] = 1,
					["scalex"] = 1,
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "shouldGlow",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.5.glow",
						}, -- [1]
						{
							["value"] = {
								["custom"] = "if aura_env.IDoptions and aura_env.IDoptions[aura_env.state.spellID] and aura_env.IDoptions[aura_env.state.spellID].glowColor then\n    local r,g,b,a = unpack(aura_env.IDoptions[aura_env.state.spellID].glowColor)\n    if r and g and b and a then\n        \n        for k,v in pairs(aura_env.region.subRegions) do\n            if v.type == \"subglow\" then\n                v:SetGlowColor(r,g,b,a)\n            end\n        end\n        \n    end\nelseif aura_env.options and aura_env.options[aura_env.state.submsg] and aura_env.options[aura_env.state.submsg].glowColor and aura_env.options[aura_env.state.submsg].IgnoreAlertNumber then\n    local r,g,b,a = unpack(aura_env.options[aura_env.state.submsg].glowColor)\n    if r and g and b and a then\n        for k,v in pairs(aura_env.region.subRegions) do\n            if v.type == \"subglow\" then\n                v:SetGlowColor(r,g,b,a)\n            end\n        end\n    end\n    \nelseif aura_env.options and aura_env.options[aura_env.state.cutmsg] and aura_env.options[aura_env.state.cutmsg].glowColor and aura_env.options[aura_env.state.cutmsg].IgnoreAlertNumber then\n    local r,g,b,a = unpack(aura_env.options[aura_env.state.cutmsg].glowColor)\n    if r and g and b and a then\n        for k,v in pairs(aura_env.region.subRegions) do\n            if v.type == \"subglow\" then\n                v:SetGlowColor(r,g,b,a)\n            end\n        end    \n    end\n    \nelseif  aura_env.options and aura_env.options[aura_env.state.message] and aura_env.options[aura_env.state.message].glowColor then\n    local r,g,b,a = unpack(aura_env.options[aura_env.state.message].glowColor)\n    if r and g and b and a then\n        for k,v in pairs(aura_env.region.subRegions) do\n            if v.type == \"subglow\" then\n                v:SetGlowColor(r,g,b,a)\n            end\n        end    \n    end\n    \nend\n\n\n\n",
							},
							["property"] = "customcode",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "paused",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = 0.3,
							["property"] = "alpha",
						}, -- [1]
						{
							["property"] = "sub.2.text_visible",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "sub.4.text_visible",
						}, -- [3]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = -2,
						["op"] = "<",
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["op"] = "<",
								["variable"] = "expirationTime",
								["value"] = "1",
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "paused",
								["value"] = 0,
							}, -- [2]
						},
					},
					["linked"] = false,
					["changes"] = {
						{
							["value"] = {
								1, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["property"] = "sub.3.text_color",
						}, -- [1]
						{
							["value"] = 24,
							["property"] = "sub.3.text_fontSize",
						}, -- [2]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = -2,
						["op"] = "<",
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["op"] = "<",
								["variable"] = "expirationTime",
								["value"] = "6",
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "paused",
								["value"] = 0,
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								1, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["property"] = "sub.3.text_color",
						}, -- [1]
						{
							["value"] = 30,
							["property"] = "sub.3.text_fontSize",
						}, -- [2]
					},
				}, -- [4]
				{
					["check"] = {
						["trigger"] = -2,
						["op"] = "<",
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["op"] = "<=",
								["variable"] = "expirationTime",
								["value"] = "10",
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "paused",
								["value"] = 0,
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = 24,
							["property"] = "sub.3.text_fontSize",
						}, -- [1]
					},
				}, -- [5]
				{
					["check"] = {
						["trigger"] = -2,
						["op"] = "<",
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["op"] = "<=",
								["variable"] = "expirationTime",
								["value"] = "60",
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "paused",
								["value"] = 0,
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = 18,
							["property"] = "sub.3.text_fontSize",
						}, -- [1]
					},
				}, -- [6]
				{
					["check"] = {
						["trigger"] = -2,
						["op"] = "<",
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["op"] = "<",
								["variable"] = "expirationTime",
								["value"] = "600",
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "paused",
								["value"] = 0,
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = 15,
							["property"] = "sub.3.text_fontSize",
						}, -- [1]
					},
				}, -- [7]
				{
					["check"] = {
						["trigger"] = -2,
						["op"] = "<",
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["op"] = "<",
								["variable"] = "remaining",
								["value"] = "1",
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "paused",
								["value"] = 1,
							}, -- [2]
						},
					},
					["linked"] = false,
					["changes"] = {
						{
							["value"] = {
								1, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["property"] = "sub.3.text_color",
						}, -- [1]
						{
							["value"] = 24,
							["property"] = "sub.3.text_fontSize",
						}, -- [2]
					},
				}, -- [8]
				{
					["check"] = {
						["trigger"] = -2,
						["op"] = "<",
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["op"] = "<",
								["variable"] = "remaining",
								["value"] = "6",
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "paused",
								["value"] = 1,
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								1, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["property"] = "sub.3.text_color",
						}, -- [1]
						{
							["value"] = 30,
							["property"] = "sub.3.text_fontSize",
						}, -- [2]
					},
				}, -- [9]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "paused",
								["value"] = 1,
							}, -- [1]
							{
								["trigger"] = 1,
								["op"] = "<=",
								["variable"] = "remaining",
								["value"] = "10",
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = 24,
							["property"] = "sub.3.text_fontSize",
						}, -- [1]
					},
				}, -- [10]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "paused",
								["value"] = 1,
							}, -- [1]
							{
								["trigger"] = 1,
								["op"] = "<=",
								["variable"] = "remaining",
								["value"] = "60",
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = 18,
							["property"] = "sub.3.text_fontSize",
						}, -- [1]
					},
				}, -- [11]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "paused",
								["value"] = 1,
							}, -- [1]
							{
								["trigger"] = 1,
								["op"] = "<",
								["variable"] = "remaining",
								["value"] = "600",
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = 20,
							["property"] = "sub.3.text_fontSize",
						}, -- [1]
					},
				}, -- [12]
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["authorOptions"] = {
				{
					["subOptions"] = {
						{
							["type"] = "input",
							["useDesc"] = true,
							["width"] = 1,
							["name"] = "Name this Entry",
							["default"] = "Name this Entry",
							["desc"] = "Name this Entry",
							["key"] = "NameField",
							["length"] = 10,
							["multiline"] = false,
							["useLength"] = false,
						}, -- [1]
						{
							["type"] = "space",
							["variableWidth"] = true,
							["height"] = 1,
							["width"] = 1,
							["useHeight"] = false,
						}, -- [2]
						{
							["useName"] = false,
							["type"] = "header",
							["text"] = "",
							["noMerge"] = false,
							["width"] = 1,
						}, -- [3]
						{
							["type"] = "input",
							["useDesc"] = true,
							["width"] = 1,
							["name"] = "Message",
							["default"] = "",
							["desc"] = "DBM/BW Message to be filtered for",
							["key"] = "message",
							["length"] = 10,
							["multiline"] = false,
							["useLength"] = false,
						}, -- [4]
						{
							["type"] = "toggle",
							["default"] = true,
							["desc"] = "Tick this if you want to ignore the Alert Number e.g. TestBar (4) and replace info for all TestBar's",
							["key"] = "IgnoreAlertNumber",
							["useDesc"] = true,
							["name"] = "Ignore Alert Number",
							["width"] = 1,
						}, -- [5]
						{
							["type"] = "number",
							["useDesc"] = true,
							["max"] = 99999999,
							["step"] = 1,
							["width"] = 1,
							["min"] = 0,
							["key"] = "spellid",
							["desc"] = "Spellid of the BW message to be filtered for",
							["name"] = "Spellid",
							["default"] = 0,
						}, -- [6]
						{
							["type"] = "description",
							["text"] = "Message or spellid are optional and only one has to be set to work",
							["fontSize"] = "medium",
							["width"] = 2,
						}, -- [7]
						{
							["type"] = "toggle",
							["default"] = false,
							["desc"] = "Use \"Name\" as replacement text",
							["key"] = "replaceSpellName",
							["useDesc"] = true,
							["name"] = "Replace Spell Name",
							["width"] = 1,
						}, -- [8]
						{
							["type"] = "input",
							["useDesc"] = false,
							["width"] = 1,
							["key"] = "spellName",
							["name"] = "Name",
							["multiline"] = false,
							["length"] = 10,
							["default"] = "",
							["useLength"] = false,
						}, -- [9]
						{
							["type"] = "toggle",
							["default"] = false,
							["desc"] = "Replace the Text color",
							["key"] = "replaceTextColor",
							["useDesc"] = true,
							["name"] = "Replace Text Color",
							["width"] = 1,
						}, -- [10]
						{
							["type"] = "color",
							["default"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["desc"] = "Colors the text if \"Replace\" is checked",
							["key"] = "textColor",
							["useDesc"] = true,
							["name"] = "Text Color",
							["width"] = 1,
						}, -- [11]
						{
							["type"] = "toggle",
							["default"] = false,
							["desc"] = "Enables glow for the given Spell",
							["key"] = "glow",
							["useDesc"] = true,
							["name"] = "Enable Glow",
							["width"] = 1,
						}, -- [12]
						{
							["type"] = "color",
							["default"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["key"] = "glowColor",
							["useDesc"] = false,
							["name"] = "Glow Color",
							["width"] = 1,
						}, -- [13]
					},
					["hideReorder"] = true,
					["useDesc"] = false,
					["nameSource"] = 1,
					["width"] = 2,
					["useCollapse"] = true,
					["collapse"] = false,
					["name"] = "Spell Options",
					["key"] = "spellOptions",
					["limitType"] = "none",
					["groupType"] = "array",
					["type"] = "group",
					["size"] = 10,
				}, -- [1]
				{
					["type"] = "space",
					["variableWidth"] = true,
					["height"] = 6,
					["width"] = 2,
					["useHeight"] = true,
				}, -- [2]
				{
					["useName"] = false,
					["type"] = "header",
					["text"] = "",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [3]
				{
					["type"] = "description",
					["text"] = "\n",
					["fontSize"] = "medium",
					["width"] = 2,
				}, -- [4]
				{
					["desc"] = "Set up how you wanna display Bar Names by default it will show everything like DBM/BW does HideNumber hides the spell number behind certain casts while DbmHide~ hides the ~ infront of some spells",
					["type"] = "select",
					["values"] = {
						"default", -- [1]
						"DbmHide~", -- [2]
						"HideNumber", -- [3]
						"DBMonlyName", -- [4]
					},
					["default"] = 1,
					["key"] = "NameOption",
					["useDesc"] = true,
					["name"] = "NameOption",
					["width"] = 1,
				}, -- [5]
				{
					["type"] = "space",
					["variableWidth"] = true,
					["height"] = 1,
					["width"] = 1,
					["useHeight"] = false,
				}, -- [6]
				{
					["min"] = 0,
					["type"] = "number",
					["default"] = 0,
					["desc"] = "Show the timers only if the remaining cooldown is less than this value, Set to 0 to always show all timers",
					["key"] = "totalDur",
					["name"] = "Only show timers if less than",
					["useDesc"] = true,
					["width"] = 1,
				}, -- [7]
				{
					["type"] = "toggle",
					["default"] = false,
					["desc"] = "Because I was inverted...",
					["key"] = "reverse",
					["useDesc"] = true,
					["name"] = "Inverse Travel Direction",
					["width"] = 0.8,
				}, -- [8]
				{
					["type"] = "space",
					["variableWidth"] = false,
					["width"] = 1,
				}, -- [9]
				{
					["min"] = 0,
					["type"] = "number",
					["default"] = 10,
					["desc"] = "How long should it take to travel from top to bottom",
					["key"] = "maxDur",
					["name"] = "Travel Duration",
					["useDesc"] = true,
					["width"] = 0.6,
				}, -- [10]
				{
					["type"] = "number",
					["useDesc"] = true,
					["max"] = 99999,
					["step"] = 1,
					["width"] = 0.6,
					["min"] = 0,
					["key"] = "IconSpacing",
					["desc"] = "if you want additional spacing between the icons set the value here",
					["name"] = "Icon Spacing",
					["default"] = 0,
				}, -- [11]
				{
					["min"] = 0,
					["type"] = "number",
					["default"] = 200,
					["desc"] = "The total travel distance of the icons. You will also need to manually change the length of the line in the background.",
					["key"] = "travelDist",
					["name"] = "Travel Distance",
					["useDesc"] = true,
					["width"] = 0.6,
				}, -- [12]
				{
					["type"] = "space",
					["variableWidth"] = false,
					["width"] = 1,
				}, -- [13]
				{
					["type"] = "number",
					["useDesc"] = true,
					["step"] = 1,
					["width"] = 1,
					["min"] = 0,
					["key"] = "textMaxLength",
					["desc"] = "Max length of the text by the icon. Text longer than this will be truncated and followed by \"..\". Set to 0 to disable truncating text.",
					["name"] = "Text Max Length",
					["default"] = 20,
				}, -- [14]
				{
					["desc"] = "Select how you want to display Paused timers",
					["type"] = "select",
					["values"] = {
						"replace name with paused", -- [1]
						"add paused to name", -- [2]
						"add paused but shorten", -- [3]
						"don't change", -- [4]
					},
					["default"] = 1,
					["key"] = "textPausedOptions",
					["useDesc"] = true,
					["name"] = "Text Options - Paused",
					["width"] = 1,
				}, -- [15]
				{
					["type"] = "space",
					["variableWidth"] = false,
					["width"] = 1,
				}, -- [16]
				{
					["type"] = "description",
					["text"] = "\n\nThese options control the default boss mod bars visibility. Changing these options requires a game reload.\n",
					["fontSize"] = "large",
					["width"] = 2,
				}, -- [17]
				{
					["type"] = "toggle",
					["default"] = true,
					["key"] = "hideBWBars",
					["name"] = "Hide Default BigWigs Bars",
					["width"] = 1,
				}, -- [18]
				{
					["type"] = "toggle",
					["default"] = true,
					["key"] = "hideDBMBars",
					["useDesc"] = false,
					["name"] = "Hide Default DBM Bars",
					["width"] = 1,
				}, -- [19]
				{
					["type"] = "description",
					["text"] = "\n\n",
					["fontSize"] = "medium",
					["width"] = 2,
				}, -- [20]
				{
					["type"] = "space",
					["variableWidth"] = false,
					["width"] = 1,
				}, -- [21]
				{
					["useName"] = false,
					["type"] = "header",
					["text"] = "",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [22]
				{
					["subOptions"] = {
						{
							["type"] = "toggle",
							["default"] = false,
							["desc"] = "Controls if you want to adjust the Timeline for the Big Icon  hightlighting",
							["key"] = "EnableBigIcon",
							["useDesc"] = true,
							["name"] = "Enable Ability Timeline Adjust for BigIcon",
							["width"] = 2,
						}, -- [1]
					},
					["hideReorder"] = true,
					["useDesc"] = false,
					["nameSource"] = 0,
					["width"] = 1,
					["useCollapse"] = true,
					["collapse"] = false,
					["name"] = "BigIcon",
					["key"] = "BigIcon",
					["limitType"] = "none",
					["groupType"] = "simple",
					["type"] = "group",
					["size"] = 10,
				}, -- [23]
			},
		},
		["PVP Vendors"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "vVnrs5WY3",
			["parent"] = "Valdrakken Map Labels",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = -6.770263671875,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["duration"] = "1",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Conditions",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["spellIds"] = {
						},
						["events"] = "OPEN_WORLD_MAP, WORLD_MAP_UPDATE, QUEST_LOG_UPDATE",
						["custom"] = "function()\n    local mapID = WorldMapFrame:GetMapID()\n    if mapID == 2112 then -- Valdrakken\n        return true\n    else\n        return false\n    end\nend\n\n\n--2112 = Valdrakken\n--2112 = Valdrakken",
						["check"] = "update",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["font"] = "Expressway",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "2112",
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["xOffset"] = -177.48889160156,
			["anchorFrameFrame"] = "WorldMapFrame",
			["regionType"] = "text",
			["url"] = "",
			["authorOptions"] = {
			},
			["fixedWidth"] = 200,
			["displayText_format_p_time_precision"] = 1,
			["displayText"] = "PVP\nVendors",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "PVP Vendors",
			["wordWrap"] = "WordWrap",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["shadowYOffset"] = -1,
			["uid"] = "PqB5dAxFrbB",
			["justify"] = "CENTER",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 135,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["easeStrength"] = 3,
					["preset"] = "spiralandpulse",
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Professions"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "vVnrs5WY3",
			["parent"] = "Valdrakken Map Labels",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = -92.90380859375,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["duration"] = "1",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Conditions",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["spellIds"] = {
						},
						["events"] = "OPEN_WORLD_MAP, WORLD_MAP_UPDATE, QUEST_LOG_UPDATE",
						["custom"] = "function()\n    local mapID = WorldMapFrame:GetMapID()\n    if mapID == 2112 then -- Valdrakken\n        return true\n    else\n        return false\n    end\nend\n\n\n--2112 = Valdrakken\n--2112 = Valdrakken",
						["check"] = "update",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["font"] = "Expressway",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "2112",
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["xOffset"] = -246.91119384766,
			["anchorFrameFrame"] = "WorldMapFrame",
			["regionType"] = "text",
			["url"] = "",
			["authorOptions"] = {
			},
			["fixedWidth"] = 200,
			["displayText_format_p_time_precision"] = 1,
			["displayText"] = "Professions",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "Professions",
			["wordWrap"] = "WordWrap",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["shadowYOffset"] = -1,
			["uid"] = "X1cQuROKMq7",
			["justify"] = "CENTER",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 135,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["easeStrength"] = 3,
					["preset"] = "spiralandpulse",
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Ancient Teachings"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"120954", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_debuffClass"] = false,
						["useGroup_count"] = false,
						["spellName"] = 0,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_unit"] = true,
						["use_tooltip"] = false,
						["use_totemName"] = false,
						["unit"] = "player",
						["matchesShowOn"] = "showOnActive",
						["type"] = "aura2",
						["useName"] = false,
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["use_remaining"] = true,
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"388026", -- [1]
						},
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["unevent"] = "timed",
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["useExactSpellId"] = true,
						["use_totemNamePattern"] = false,
						["remaining_operator"] = ">",
						["sourceUnit"] = "player",
						["use_genericShowOn"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_shadowXOffset"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = true,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["zoneIds"] = "",
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["use_vehicleUi"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 388023,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["url"] = "",
			["authorOptions"] = {
			},
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["uid"] = "HNzyOizL8Mw",
			["alpha"] = 1,
			["semver"] = "7.0.2",
			["zoom"] = 0.3,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Ancient Teachings",
			["cooldownTextDisabled"] = false,
			["frameStrata"] = 4,
			["width"] = 40,
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 133739,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
		},
		["Celestial Flame"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"325190", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_totemNamePattern"] = false,
						["useGroup_count"] = false,
						["custom_hide"] = "timed",
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_genericShowOn"] = true,
						["use_tooltip"] = false,
						["use_absorbMode"] = true,
						["use_unit"] = true,
						["ownOnly"] = true,
						["useName"] = true,
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["use_remaining"] = true,
						["subeventPrefix"] = "SPELL",
						["unevent"] = "timed",
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["unit"] = "player",
						["remaining_operator"] = ">",
						["useExactSpellId"] = false,
						["sourceUnit"] = "player",
						["use_debuffClass"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = true,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["use_vehicleUi"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 325190,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["icon"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["parent"] = "Monk - Buffs",
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["xOffset"] = 0,
			["desaturate"] = false,
			["uid"] = "ePbLB9yMTkQ",
			["alpha"] = 1,
			["auto"] = false,
			["cooldownTextDisabled"] = false,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Celestial Flame",
			["zoom"] = 0.3,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["frameStrata"] = 4,
			["config"] = {
			},
			["inverse"] = false,
			["authorOptions"] = {
			},
			["displayIcon"] = 463567,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["url"] = "",
		},
		["PanzaUI - Monk"] = {
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["controlledChildren"] = {
				"Monk - Buffs", -- [1]
				"Monk - Healer", -- [2]
				"Monk - Movement", -- [3]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["scale"] = 1,
			["xOffset"] = 0,
			["border"] = false,
			["groupIcon"] = "interface/icons/classicon_monk.blp",
			["regionType"] = "group",
			["borderSize"] = 2,
			["config"] = {
			},
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["yOffset"] = 0,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["names"] = {
						},
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["anchorPoint"] = "CENTER",
			["internalVersion"] = 64,
			["authorOptions"] = {
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["id"] = "PanzaUI - Monk",
			["borderEdge"] = "Square Full White",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["borderOffset"] = 4,
			["uid"] = "MfN48GPSKO9",
			["selfPoint"] = "CENTER",
			["subRegions"] = {
			},
			["borderInset"] = 1,
			["conditions"] = {
			},
			["information"] = {
			},
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
		},
		["Heal - Rising Sun Kick"] = {
			["iconSource"] = -1,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["url"] = "",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnReady",
						["unit"] = "player",
						["spellName"] = 107428,
						["charges_operator"] = ">",
						["type"] = "spell",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 107428,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_charges"] = false,
						["charges"] = "0",
						["subeventPrefix"] = "SPELL",
						["use_track"] = true,
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "bounceDecay",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "TOPLEFT",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_1.charges_format"] = "none",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["type"] = "subtext",
					["text_anchorXOffset"] = 2,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["text_text_format_p_format"] = "timed",
					["text_visible"] = true,
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_text_format_c_format"] = "none",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 270,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 17,
					["multi"] = {
						[191837] = true,
					},
				},
				["use_vehicle"] = false,
				["use_class_and_spec"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[2] = true,
					},
				},
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spellknown"] = true,
				["use_spec"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 107428,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["init"] = {
				},
				["finish"] = {
					["glow_frame_type"] = "UNITFRAME",
					["do_glow"] = false,
					["glow_action"] = "show",
				},
			},
			["selfPoint"] = "CENTER",
			["regionType"] = "icon",
			["cooldownEdge"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["cooldown"] = false,
			["displayIcon"] = 1360978,
			["config"] = {
			},
			["zoom"] = 0.1,
			["cooldownTextDisabled"] = true,
			["anchorFrameType"] = "SCREEN",
			["tocversion"] = 100002,
			["id"] = "Heal - Rising Sun Kick",
			["alpha"] = 1,
			["useCooldownModRate"] = true,
			["width"] = 30,
			["frameStrata"] = 1,
			["uid"] = "s36pv(6vk7p",
			["inverse"] = true,
			["parent"] = "Monk - Healer",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["xOffset"] = 0,
		},
		["Invoke Niuzao by Call to Arms"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "358520",
						["ownOnly"] = true,
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "SPELL",
						["use_absorbMode"] = true,
						["use_track"] = true,
						["use_unit"] = true,
						["use_genericShowOn"] = true,
						["spellName"] = 0,
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["useExactSpellId"] = true,
						["use_spellName"] = true,
						["event"] = "Health",
						["auraspellids"] = {
							"358520", -- [1]
						},
						["realSpellName"] = 0,
						["use_spellId"] = true,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["unit"] = "player",
						["names"] = {
						},
						["sourceUnit"] = "player",
						["duration"] = "12",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_precision"] = 1,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_format"] = "timed",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_talent"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[397251] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["spellknown"] = 387184,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["frameStrata"] = 4,
			["desaturate"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 608951,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["zoom"] = 0.3,
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Invoke Niuzao by Call to Arms",
			["semver"] = "7.0.2",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["uid"] = "TAlVZ5EDGqP",
			["inverse"] = false,
			["url"] = "",
			["conditions"] = {
			},
			["cooldown"] = false,
			["xOffset"] = 0,
		},
		["Touch of Karma"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Touch of Karma", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_debuffClass"] = false,
						["useExactSpellId"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["use_totemNamePattern"] = false,
						["use_absorbHealMode"] = true,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["spellName"] = 0,
						["use_tooltip"] = false,
						["use_unit"] = true,
						["remaining_operator"] = ">",
						["matchesShowOn"] = "showOnActive",
						["type"] = "aura2",
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["useName"] = true,
						["auraspellids"] = {
							"387184", -- [1]
						},
						["unevent"] = "timed",
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_absorbMode"] = true,
						["use_genericShowOn"] = true,
						["sourceUnit"] = "player",
						["useGroup_count"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_format"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["spellknown"] = 122470,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["frameStrata"] = 4,
			["cooldownEdge"] = false,
			["xOffset"] = 0,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 651728,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["zoom"] = 0.3,
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Touch of Karma",
			["semver"] = "7.0.2",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["desaturate"] = false,
			["uid"] = "EbPGjB9hsMO",
			["inverse"] = false,
			["parent"] = "Monk - Buffs",
			["conditions"] = {
			},
			["cooldown"] = false,
			["icon"] = true,
		},
		["Zen Meditation"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Zen Meditation", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_debuffClass"] = false,
						["useExactSpellId"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["use_totemNamePattern"] = false,
						["use_absorbHealMode"] = true,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["spellName"] = 0,
						["use_tooltip"] = false,
						["remaining_operator"] = ">",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["type"] = "aura2",
						["useName"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["use_remaining"] = true,
						["auraspellids"] = {
							"387184", -- [1]
						},
						["unevent"] = "timed",
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_unit"] = true,
						["use_absorbMode"] = true,
						["use_genericShowOn"] = true,
						["sourceUnit"] = "player",
						["useGroup_count"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_format"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["spellknown"] = 115176,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["frameStrata"] = 4,
			["xOffset"] = 0,
			["selfPoint"] = "CENTER",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 642417,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["parent"] = "Monk - Buffs",
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["zoom"] = 0.3,
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Zen Meditation",
			["semver"] = "7.0.2",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["desaturate"] = false,
			["uid"] = "tNO6axZ66v2",
			["inverse"] = false,
			["url"] = "",
			["conditions"] = {
			},
			["cooldown"] = false,
			["icon"] = true,
		},
		["PanzaUI - Utilities"] = {
			["controlledChildren"] = {
				"Alerts", -- [1]
				"Dragonriding", -- [2]
				"Info Displays", -- [3]
				"Map", -- [4]
				"Mouse", -- [5]
				"Quests", -- [6]
				"Target Highlight", -- [7]
				"Raid Ability Timeline", -- [8]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["subRegions"] = {
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["tocversion"] = 100002,
			["id"] = "PanzaUI - Utilities",
			["config"] = {
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["uid"] = "Q7Afpq82O4X",
			["borderInset"] = 1,
			["groupIcon"] = 132996,
			["conditions"] = {
			},
			["information"] = {
			},
			["xOffset"] = 0,
		},
		["Monk - Movement"] = {
			["grow"] = "UP",
			["controlledChildren"] = {
				"Chi Torpedo (CD)", -- [1]
				"Tiger's Lust (CD)", -- [2]
				"Flying Serpent Kick (CD)", -- [3]
				"Transcendence (CD)", -- [4]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = -15,
			["yOffset"] = -20,
			["anchorPoint"] = "LEFT",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["space"] = 2,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["names"] = {
						},
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["radius"] = 200,
			["selfPoint"] = "BOTTOM",
			["align"] = "CENTER",
			["stagger"] = 0,
			["anchorFrameFrame"] = "SUFUnitplayer",
			["subRegions"] = {
			},
			["groupIcon"] = 135788,
			["fullCircle"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["arcLength"] = 360,
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["rowSpace"] = 1,
			["animate"] = false,
			["useLimit"] = false,
			["scale"] = 1,
			["centerType"] = "LR",
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "dynamicgroup",
			["borderSize"] = 2,
			["sort"] = "none",
			["parent"] = "PanzaUI - Monk",
			["borderInset"] = 1,
			["anchorFrameParent"] = false,
			["constantFactor"] = "RADIUS",
			["limit"] = 5,
			["borderOffset"] = 4,
			["gridWidth"] = 5,
			["rotation"] = 0,
			["id"] = "Monk - Movement",
			["gridType"] = "RD",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["uid"] = "CFHZDVOiGg0",
			["config"] = {
			},
			["authorOptions"] = {
			},
			["internalVersion"] = 64,
			["conditions"] = {
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
		},
		["Serenity"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"152173", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["remaining_operator"] = ">",
						["useGroup_count"] = false,
						["useExactSpellId"] = false,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["custom_hide"] = "timed",
						["use_tooltip"] = false,
						["matchesShowOn"] = "showOnActive",
						["use_totemNamePattern"] = false,
						["ownOnly"] = true,
						["useName"] = true,
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["type"] = "aura2",
						["unevent"] = "timed",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_totemName"] = false,
						["use_unit"] = true,
						["sourceUnit"] = "player",
						["use_debuffClass"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowXOffset"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_format"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 152173,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["cooldownTextDisabled"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["url"] = "",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 988197,
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["auto"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Serenity",
			["authorOptions"] = {
			},
			["frameStrata"] = 4,
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["uid"] = "Nj2HJf2Aqlc",
			["inverse"] = false,
			["parent"] = "Monk - Buffs",
			["conditions"] = {
			},
			["cooldown"] = false,
			["selfPoint"] = "CENTER",
		},
		["Chi Torpedo (CD)"] = {
			["iconSource"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
					["glow_frame_type"] = "UNITFRAME",
					["do_glow"] = false,
					["glow_action"] = "show",
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"152173", -- [1]
						},
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["spellName"] = 115008,
						["charges_operator"] = "<",
						["useName"] = true,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["type"] = "spell",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 115008,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_charges"] = true,
						["charges"] = "1",
						["ownOnly"] = true,
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_text_format_p_abbreviate"] = false,
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["text_text_format_p_abbreviate_max"] = 8,
					["text_anchorYOffset"] = 10,
					["text_text_format_p_color"] = true,
					["text_text_format_p_gcd_cast"] = false,
					["text_text"] = "%p",
					["text_anchorPoint"] = "CENTER",
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_time_mod_rate"] = true,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["border_size"] = 18,
					["border_offset"] = 4,
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["type"] = "subborder",
				}, -- [4]
			},
			["height"] = 40,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[269] = true,
						[270] = true,
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_class"] = true,
				["use_spellknown"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["spellknown"] = 115008,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["icon"] = true,
			["xOffset"] = -10,
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["parent"] = "Monk - Movement",
			["authorOptions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["cooldownTextDisabled"] = true,
			["anchorFrameType"] = "SELECTFRAME",
			["tocversion"] = 100002,
			["id"] = "Chi Torpedo (CD)",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["width"] = 40,
			["zoom"] = 0.1,
			["uid"] = "GuzLDJ9S5Xh",
			["inverse"] = true,
			["selfPoint"] = "CENTER",
			["displayIcon"] = 607849,
			["cooldown"] = true,
			["url"] = "",
		},
		["Chi"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["sound"] = " custom",
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"124275", -- [1]
						},
						["use_alwaystrue"] = true,
						["useGroup_count"] = false,
						["matchesShowOn"] = "showAlways",
						["ownOnly"] = true,
						["use_unit"] = true,
						["names"] = {
							"Heavy Stagger", -- [1]
							"Light Stagger", -- [2]
							"Moderate Stagger", -- [3]
						},
						["powertype"] = 12,
						["use_tooltip"] = false,
						["subeventPrefix"] = "SPELL",
						["buffShowOn"] = "showOnActive",
						["type"] = "unit",
						["unevent"] = "auto",
						["use_powertype"] = true,
						["spellName"] = 228260,
						["power"] = "0",
						["useName"] = true,
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_START",
						["power_operator"] = ">",
						["fetchTooltip"] = true,
						["event"] = "Power",
						["use_showOn"] = true,
						["realSpellName"] = "Void Eruption",
						["use_spellName"] = true,
						["spellIds"] = {
							124273, -- [1]
							124275, -- [2]
							124274, -- [3]
						},
						["debuffType"] = "HARMFUL",
						["custom_hide"] = "timed",
						["combineMatches"] = "showLowest",
						["unit"] = "player",
						["use_power"] = false,
					},
					["untrigger"] = {
						["showOn"] = "showAlways",
						["spellName"] = 228260,
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 26,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_text_format_3.tooltip1_format"] = "none",
					["rotateText"] = "NONE",
					["text_text_format_tooltip1_format"] = "none",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_2.tooltip1_format"] = "none",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_text_format_1.tooltip1_decimal_precision"] = 0,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["type"] = "subtext",
					["text_fontType"] = "OUTLINE",
					["text_font"] = "Expressway",
					["anchorXOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_text_format_1.tooltip1_round_type"] = "round",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_1.tooltip1_format"] = "Number",
					["text_anchorPoint"] = "TOP",
					["text_text_format_c_format"] = "none",
					["text_shadowXOffset"] = 0,
					["text_text_format_1.tooltip2_format"] = "none",
					["text_text_format_p_time_format"] = 0,
					["text_text_format_1.tooltip3_format"] = "none",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
						["PRIEST"] = true,
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["talent"] = {
					["multi"] = {
						[115069] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["class_and_spec"] = {
					["single"] = 269,
				},
				["use_class_and_spec"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["use_dragonriding"] = false,
				["use_petbattle"] = false,
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["cooldownTextDisabled"] = false,
			["desaturate"] = false,
			["parent"] = "Monk - Buffs",
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "power",
						["value"] = "1",
						["op"] = "<",
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "power",
						["value"] = "6",
						["op"] = "==",
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.glow",
						}, -- [1]
					},
				}, -- [2]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["url"] = "https://wago.io/r1CzQ6azX/26",
			["uid"] = "laUvoDbXRga",
			["alpha"] = 1,
			["auto"] = false,
			["zoom"] = 0.3,
			["semver"] = "3.1.1",
			["tocversion"] = 100005,
			["id"] = "Chi",
			["xOffset"] = 0,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["frameStrata"] = 4,
			["config"] = {
			},
			["inverse"] = false,
			["icon"] = true,
			["displayIcon"] = 606551,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
		},
		["Dampen Harm"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"120954", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_debuffClass"] = false,
						["useGroup_count"] = false,
						["spellName"] = 0,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_unit"] = true,
						["use_tooltip"] = false,
						["use_totemName"] = false,
						["unit"] = "player",
						["matchesShowOn"] = "showOnActive",
						["type"] = "aura2",
						["useName"] = false,
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["use_remaining"] = true,
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"122278", -- [1]
						},
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["unevent"] = "timed",
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["useExactSpellId"] = true,
						["use_totemNamePattern"] = false,
						["remaining_operator"] = ">",
						["sourceUnit"] = "player",
						["use_genericShowOn"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_shadowXOffset"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["zoneIds"] = "",
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
						[270] = true,
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["use_vehicleUi"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 122278,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["url"] = "",
			["authorOptions"] = {
			},
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["uid"] = "Za6qTFwQIKC",
			["alpha"] = 1,
			["semver"] = "7.0.2",
			["zoom"] = 0.3,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Dampen Harm",
			["cooldownTextDisabled"] = false,
			["frameStrata"] = 4,
			["width"] = 40,
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 620827,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
		},
		["Totem #3"] = {
			["iconSource"] = -1,
			["wagoID"] = "RfkIi6uSZ",
			["parent"] = "Shaman - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "\n\n",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "--- OPTIONS ---\naura_env.icon_crop = 0.15  -- The abound of Icon zoom (crop of its borders) Can me any value from 0 to 1 but more than 0.3 hardly makes much sence.\naura_env.icon_offset_X = 0.5  -- Horizontal position of the shown texture (0 - shows the leftmost part, 1 shows the rightmost part)\naura_env.icon_offset_Y = 0.5  -- Vertical position of the shown texture (0 - shows the topmost part, 1 shows the bottommost part)\n--- DON'T EDIT BELOW ---\n\naura_env.set_coord = function()\n    -- Подготовка и промежуточные расчеты\n    local X = aura_env.region.width -- находим ширину иконки\n    local Y = aura_env.region.height -- находим высоту иконки\n    local length_X = (1 - aura_env.icon_crop) * (X / math.max(X,Y)) -- Ширина области после преобразования \n    local length_Y = (1 - aura_env.icon_crop) * (Y / math.max(X,Y)) -- Высота области после преобразоания \n    local axis_X = (aura_env.icon_crop + length_X) * 0.5 + aura_env.icon_offset_X * (1 - aura_env.icon_crop - length_X)  -- Положение центральной оси по ширине (с учетом статичного кропа)\n    local axis_Y = (aura_env.icon_crop + length_Y) * 0.5 + aura_env.icon_offset_Y * (1 - aura_env.icon_crop - length_Y) -- Положение центральной оси по высоте (с учетом статичного кропа)\n    -- Основные расчеты\n    local X1 = axis_X - length_X * 0.5 -- Находим позицию №1 по ширине\n    local X2 = axis_X + length_X * 0.5 -- Находим позицию №2 по ширине\n    local Y1 = axis_Y - length_Y * 0.5 -- Находим позицию №1 по высоте\n    local Y2 = axis_Y + length_Y * 0.5 -- Находим позицию №2 по высоте\n    -- Вывод результатов\n    aura_env.region.icon.SetTexCoord = nil\n    aura_env.region.icon:SetTexCoord(X1, X2, Y1, Y2) -- Назначение границ текстуры\nend\n\naura_env.set_coord ()",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"Dampen Harm", -- [1]
						},
						["duration"] = "1",
						["unit"] = "player",
						["use_totemType"] = true,
						["debuffType"] = "HELPFUL",
						["type"] = "spell",
						["auraspellids"] = {
							"260895", -- [1]
						},
						["unevent"] = "auto",
						["use_absorbMode"] = true,
						["event"] = "Totem",
						["totemType"] = 3,
						["names"] = {
							"Shield of the Righteous", -- [1]
						},
						["useExactSpellId"] = true,
						["spellIds"] = {
							132403, -- [1]
						},
						["useName"] = false,
						["buffShowOn"] = "showOnActive",
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["alphaType"] = "custom",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "\n\n",
					["use_alpha"] = true,
					["scaleType"] = "straightScale",
					["easeType"] = "none",
					["colorA"] = 1,
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 0,
					["easeStrength"] = 3,
					["use_scale"] = false,
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["rotate"] = 0,
					["type"] = "none",
					["duration"] = "1",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["desaturate"] = false,
			["version"] = 6,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_text_format_p_time_format"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 262,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_petbattle"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_dragonriding"] = false,
				["role"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["use_combat"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "SHAMAN",
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["selfPoint"] = "TOPLEFT",
			["uid"] = "oLv7DpC5wh5",
			["authorOptions"] = {
			},
			["alpha"] = 1,
			["regionType"] = "icon",
			["cooldown"] = false,
			["icon"] = true,
			["auto"] = true,
			["zoom"] = 0.3,
			["width"] = 40,
			["frameStrata"] = 1,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.5",
			["tocversion"] = 90005,
			["id"] = "Totem #3",
			["xOffset"] = 0,
			["useCooldownModRate"] = true,
			["anchorFrameType"] = "SCREEN",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["inverse"] = false,
			["url"] = "",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["iconInset"] = 0,
		},
		["Elusive Brawler"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"195630", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["useExactSpellId"] = false,
						["fetchTooltip"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["useGroup_count"] = false,
						["use_absorbHealMode"] = true,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_tooltip"] = false,
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_absorbMode"] = true,
						["useName"] = true,
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["use_remaining"] = true,
						["subeventPrefix"] = "SPELL",
						["unevent"] = "timed",
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["auraspellids"] = {
							"386963", -- [1]
						},
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_totemNamePattern"] = false,
						["matchesShowOn"] = "showOnActive",
						["custom_hide"] = "timed",
						["sourceUnit"] = "player",
						["remaining_operator"] = ">",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_format"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_format"] = "timed",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [2]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%1.tooltip1",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_1.tooltip1_format"] = "none",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "BOTTOM",
					["anchorYOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["use_vehicleUi"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 195630,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["xOffset"] = 0,
			["icon"] = true,
			["uid"] = "d4STjF2()R1",
			["frameStrata"] = 4,
			["url"] = "",
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Elusive Brawler",
			["semver"] = "7.0.2",
			["useCooldownModRate"] = true,
			["width"] = 40,
			["zoom"] = 0.3,
			["config"] = {
			},
			["inverse"] = false,
			["authorOptions"] = {
			},
			["displayIcon"] = 611417,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["stickyDuration"] = false,
		},
		["Quests"] = {
			["controlledChildren"] = {
				"Hide/Collapse Objectives", -- [1]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = 0,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["names"] = {
						},
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["subRegions"] = {
			},
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["borderInset"] = 1,
			["id"] = "Quests",
			["uid"] = "5QgTzO5feOB",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["parent"] = "PanzaUI - Utilities",
			["config"] = {
			},
			["authorOptions"] = {
			},
			["groupIcon"] = 236670,
			["conditions"] = {
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
		},
		["Transmog"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "vVnrs5WY3",
			["parent"] = "Valdrakken Map Labels",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = -79.851867675781,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["duration"] = "1",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Conditions",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["spellIds"] = {
						},
						["events"] = "OPEN_WORLD_MAP, WORLD_MAP_UPDATE, QUEST_LOG_UPDATE",
						["custom"] = "function()\n    local mapID = WorldMapFrame:GetMapID()\n    if mapID == 2112 then -- Valdrakken\n        return true\n    else\n        return false\n    end\nend\n\n\n--2112 = Valdrakken\n--2112 = Valdrakken",
						["check"] = "update",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["font"] = "Expressway",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "2112",
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["xOffset"] = 36.8369140625,
			["anchorFrameFrame"] = "WorldMapFrame",
			["regionType"] = "text",
			["url"] = "",
			["authorOptions"] = {
			},
			["fixedWidth"] = 200,
			["displayText_format_p_time_precision"] = 1,
			["displayText"] = "Transmog",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "Transmog",
			["wordWrap"] = "WordWrap",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["shadowYOffset"] = -1,
			["uid"] = "2ZxnbvYfibq",
			["justify"] = "CENTER",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 135,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["easeStrength"] = 3,
					["preset"] = "spiralandpulse",
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Transcendence (CD)"] = {
			["iconSource"] = 0,
			["parent"] = "Monk - Movement",
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["init"] = {
				},
				["finish"] = {
					["do_glow"] = false,
					["glow_frame_type"] = "UNITFRAME",
					["glow_action"] = "show",
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"152173", -- [1]
						},
						["ownOnly"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["spellName"] = 119996,
						["charges_operator"] = "<",
						["useName"] = true,
						["debuffType"] = "HELPFUL",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["use_genericShowOn"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 119996,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["charges"] = "1",
						["use_charges"] = false,
						["type"] = "spell",
						["use_track"] = true,
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%p",
					["text_text_format_p_gcd_cast"] = false,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontType"] = "OUTLINE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["anchorXOffset"] = 0,
					["text_anchorYOffset"] = 10,
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_format"] = 0,
					["text_shadowXOffset"] = 0,
					["text_anchorPoint"] = "CENTER",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_text_format_p_color"] = true,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_abbreviate"] = false,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["border_size"] = 18,
					["border_offset"] = 4,
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["type"] = "subborder",
				}, -- [4]
			},
			["height"] = 40,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[269] = true,
						[270] = true,
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_dragonriding"] = false,
				["use_class"] = true,
				["use_spellknown"] = true,
				["use_class_and_spec"] = false,
				["use_spec"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_exact_spellknown"] = true,
				["spellknown"] = 119996,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["icon"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["authorOptions"] = {
			},
			["url"] = "",
			["cooldown"] = true,
			["displayIcon"] = 237585,
			["uid"] = "5Qn38f1B2(V",
			["zoom"] = 0.1,
			["cooldownTextDisabled"] = true,
			["width"] = 40,
			["tocversion"] = 100002,
			["id"] = "Transcendence (CD)",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = true,
			["xOffset"] = -10,
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Heal - Rising Sun Kick 2"] = {
			["iconSource"] = -1,
			["parent"] = "Shaman - Healer",
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["url"] = "",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["use_charges"] = false,
						["genericShowOn"] = "showOnReady",
						["names"] = {
						},
						["spellName"] = 107428,
						["charges_operator"] = ">",
						["charges"] = "0",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 107428,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_genericShowOn"] = true,
						["subeventPrefix"] = "SPELL",
						["type"] = "spell",
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "bounceDecay",
					["easeStrength"] = 3,
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "TOPLEFT",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorYOffset"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = 2,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 12,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 270,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 17,
					["multi"] = {
						[191837] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[2] = true,
					},
				},
				["use_never"] = true,
				["use_class_and_spec"] = true,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spellknown"] = true,
				["use_spec"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 107428,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["authorOptions"] = {
			},
			["regionType"] = "icon",
			["cooldownEdge"] = true,
			["xOffset"] = 0,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["uid"] = "6X1nS8IN)72",
			["frameStrata"] = 1,
			["zoom"] = 0.1,
			["width"] = 30,
			["tocversion"] = 100002,
			["id"] = "Heal - Rising Sun Kick 2",
			["useCooldownModRate"] = true,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["cooldownTextDisabled"] = true,
			["config"] = {
			},
			["inverse"] = true,
			["selfPoint"] = "CENTER",
			["displayIcon"] = 1360978,
			["cooldown"] = false,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
					["do_glow"] = false,
					["glow_frame_type"] = "UNITFRAME",
					["glow_action"] = "show",
				},
				["init"] = {
				},
			},
		},
		["Durability <60%"] = {
			["iconSource"] = 0,
			["parent"] = "Alerts",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
					["glow_frame_type"] = "UNITFRAME",
					["do_glow"] = false,
					["glow_action"] = "show",
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"152173", -- [1]
						},
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["ownOnly"] = true,
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
						["charges"] = "1",
						["custom_type"] = "event",
						["spellName"] = 58875,
						["charges_operator"] = "<",
						["useName"] = true,
						["events"] = "PLAYER_DEAD,UPDATE_INVENTORY_DURABILITY,PLAYER_ENTERING_WORLD",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["type"] = "custom",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 58875,
						["use_spellName"] = true,
						["custom"] = "function() local i,cur,max, durab, counter;\n    durab = 100;\n    counter = 1;\n    for i=1,18 do\n        cur,max=GetInventoryItemDurability(i);\n        if cur then\n            durab = durab + cur;\n            counter = counter  + 1;\n        end\n    end\n    return  (durab/counter) <  60;\nend",
						["spellIds"] = {
						},
						["check"] = "event",
						["custom_hide"] = "custom",
						["use_track"] = true,
						["use_charges"] = false,
					},
					["untrigger"] = {
						["custom"] = "function() local i,cur,max, durab, counter;\n    durab = 100;\n    counter = 1;\n    for i=1,18 do\n        cur,max=GetInventoryItemDurability(i);\n        if cur then\n            durab = durab + cur;\n            counter = counter  + 1;\n        end\n    end\n    return  (durab/counter) >= 60;\nend",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 18,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "LEFT",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_text_format_c_format"] = "none",
					["type"] = "subtext",
					["text_anchorXOffset"] = 10,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["text_text_format_p_abbreviate_max"] = 8,
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_color"] = true,
					["text_text_format_p_gcd_cast"] = false,
					["text_text"] = "Durability <60%",
					["text_anchorPoint"] = "OUTER_RIGHT",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowXOffset"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["border_size"] = 18,
					["border_offset"] = 4,
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["type"] = "subborder",
				}, -- [4]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["use_spellknown"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = false,
				["use_vehicleUi"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_exact_spellknown"] = false,
				["spellknown"] = 58875,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon"] = true,
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["url"] = "",
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["zoom"] = 0.1,
			["anchorFrameType"] = "SELECTFRAME",
			["tocversion"] = 100002,
			["id"] = "Durability <60%",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["width"] = 30,
			["cooldownTextDisabled"] = true,
			["uid"] = "PdO)OBzzUEj",
			["inverse"] = false,
			["authorOptions"] = {
			},
			["displayIcon"] = 132358,
			["cooldown"] = false,
			["xOffset"] = 0,
		},
		["Cursor"] = {
			["wagoID"] = "nXIzgRP9B",
			["parent"] = "Mouse",
			["preferToUpdate"] = false,
			["yOffset"] = -11,
			["anchorPoint"] = "BOTTOMLEFT",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["use_alwaystrue"] = true,
						["unevent"] = "auto",
						["duration"] = "1",
						["event"] = "Conditions",
						["names"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["spellIds"] = {
						},
						["unit"] = "player",
						["use_unit"] = true,
						["genericShowOn"] = "showOnActive",
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["translateType"] = "custom",
					["duration_type"] = "seconds",
					["colorA"] = 1,
					["colorG"] = 1,
					["use_translate"] = false,
					["colorB"] = 1,
					["type"] = "none",
					["duration"] = "1",
					["easeType"] = "none",
					["translateFunc"] = "\n\n",
					["scaley"] = 1,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["use_scale"] = false,
					["scaleType"] = "straightScale",
					["scaleFunc"] = "function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["rotate"] = 0,
					["scalex"] = 1,
					["colorR"] = 1,
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 270,
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 80,
			["rotate"] = true,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_combat"] = true,
				["use_vehicleUi"] = false,
				["zoneIds"] = "",
			},
			["textureWrapMode"] = "CLAMP",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["frameStrata"] = 9,
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Ring_20px.tga",
			["selfPoint"] = "CENTER",
			["discrete_rotation"] = 0,
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "Cursor",
			["authorOptions"] = {
			},
			["alpha"] = 1,
			["anchorFrameType"] = "MOUSE",
			["uid"] = "byjZMY54uga",
			["config"] = {
			},
			["width"] = 80,
			["color"] = {
				1, -- [1]
				0.9960784912109375, -- [2]
				0.9803922176361084, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["xOffset"] = 13,
		},
		["Weapons of Order"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"120954", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_genericShowOn"] = true,
						["useGroup_count"] = false,
						["use_absorbHealMode"] = true,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["remaining_operator"] = ">",
						["use_tooltip"] = false,
						["use_totemNamePattern"] = false,
						["useExactSpellId"] = true,
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["type"] = "aura2",
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["useName"] = false,
						["auraspellids"] = {
							"387184", -- [1]
						},
						["unevent"] = "timed",
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["custom_hide"] = "timed",
						["use_unit"] = true,
						["use_absorbMode"] = true,
						["sourceUnit"] = "player",
						["ownOnly"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_precision"] = 1,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_format"] = "timed",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["spellknown"] = 387184,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["frameStrata"] = 4,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["icon"] = true,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 3565447,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["parent"] = "Monk - Buffs",
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["zoom"] = 0.3,
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Weapons of Order",
			["semver"] = "7.0.2",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["stickyDuration"] = false,
			["uid"] = "550lVM)(FV0",
			["inverse"] = false,
			["url"] = "",
			["conditions"] = {
			},
			["cooldown"] = false,
			["xOffset"] = 0,
		},
		["Heal - Faeline Stomp 2"] = {
			["iconSource"] = -1,
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = true,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["use_charges"] = false,
						["genericShowOn"] = "showOnReady",
						["names"] = {
						},
						["spellName"] = 388193,
						["charges_operator"] = ">",
						["charges"] = "0",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 388193,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_genericShowOn"] = true,
						["subeventPrefix"] = "SPELL",
						["type"] = "spell",
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "bounceDecay",
					["easeStrength"] = 3,
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "TOPLEFT",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorYOffset"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = 2,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 12,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 270,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 17,
					["multi"] = {
						[191837] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[2] = true,
					},
				},
				["use_never"] = true,
				["use_class_and_spec"] = true,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spellknown"] = true,
				["use_spec"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 388193,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["selfPoint"] = "CENTER",
			["url"] = "",
			["regionType"] = "icon",
			["parent"] = "Shaman - Healer",
			["authorOptions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["uid"] = "p2k8ZwtA35B",
			["cooldownTextDisabled"] = true,
			["zoom"] = 0.1,
			["width"] = 30,
			["tocversion"] = 100002,
			["id"] = "Heal - Faeline Stomp 2",
			["useCooldownModRate"] = true,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["config"] = {
			},
			["inverse"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
					["do_glow"] = false,
					["glow_frame_type"] = "UNITFRAME",
					["glow_action"] = "show",
				},
				["init"] = {
				},
			},
			["displayIcon"] = 1360978,
			["cooldown"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Teaching of the Monastery"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"116645", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["stacksOperator"] = ">=",
						["useExactSpellId"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["use_absorbHealMode"] = true,
						["useStacks"] = true,
						["useGroup_count"] = false,
						["use_totemName"] = false,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["stacks"] = "1",
						["use_tooltip"] = false,
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["totemName"] = "123904",
						["useName"] = true,
						["buffShowOn"] = "showOnActive",
						["use_remaining"] = true,
						["type"] = "aura2",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "timed",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["duration"] = "25",
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_totemNamePattern"] = false,
						["matchesShowOn"] = "showOnActive",
						["custom_hide"] = "timed",
						["sourceUnit"] = "player",
						["remaining_operator"] = ">",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_format"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_format"] = "timed",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [2]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_precision"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "BOTTOM",
					["text_fontType"] = "OUTLINE",
					["text_shadowXOffset"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["use_vehicleUi"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 116645,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "stacks",
						["op"] = "==",
						["value"] = "3",
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.4.glow",
						}, -- [1]
					},
				}, -- [1]
			},
			["xOffset"] = 0,
			["icon"] = true,
			["uid"] = ")Rp(iVbfAcC",
			["frameStrata"] = 4,
			["url"] = "",
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Teaching of the Monastery",
			["semver"] = "7.0.2",
			["useCooldownModRate"] = true,
			["width"] = 40,
			["zoom"] = 0.3,
			["config"] = {
			},
			["inverse"] = false,
			["authorOptions"] = {
			},
			["displayIcon"] = 611422,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["stickyDuration"] = false,
		},
		["Diffuse Magic"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"120954", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["remaining_operator"] = ">",
						["useGroup_count"] = false,
						["useExactSpellId"] = true,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["custom_hide"] = "timed",
						["use_tooltip"] = false,
						["matchesShowOn"] = "showOnActive",
						["use_totemNamePattern"] = false,
						["ownOnly"] = true,
						["useName"] = false,
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["type"] = "aura2",
						["unevent"] = "timed",
						["auraspellids"] = {
							"122783", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_totemName"] = false,
						["use_unit"] = true,
						["sourceUnit"] = "player",
						["use_debuffClass"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowXOffset"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_format"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
						[270] = true,
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 122783,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["cooldownTextDisabled"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["url"] = "",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 775460,
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["auto"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Diffuse Magic",
			["authorOptions"] = {
			},
			["frameStrata"] = 4,
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["uid"] = "1uv55LkN6eK",
			["inverse"] = false,
			["parent"] = "Monk - Buffs",
			["conditions"] = {
			},
			["cooldown"] = false,
			["selfPoint"] = "CENTER",
		},
		["Totem #4"] = {
			["iconSource"] = -1,
			["wagoID"] = "RfkIi6uSZ",
			["parent"] = "Shaman - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "\n\n",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "--- OPTIONS ---\naura_env.icon_crop = 0.15  -- The abound of Icon zoom (crop of its borders) Can me any value from 0 to 1 but more than 0.3 hardly makes much sence.\naura_env.icon_offset_X = 0.5  -- Horizontal position of the shown texture (0 - shows the leftmost part, 1 shows the rightmost part)\naura_env.icon_offset_Y = 0.5  -- Vertical position of the shown texture (0 - shows the topmost part, 1 shows the bottommost part)\n--- DON'T EDIT BELOW ---\n\naura_env.set_coord = function()\n    -- Подготовка и промежуточные расчеты\n    local X = aura_env.region.width -- находим ширину иконки\n    local Y = aura_env.region.height -- находим высоту иконки\n    local length_X = (1 - aura_env.icon_crop) * (X / math.max(X,Y)) -- Ширина области после преобразования \n    local length_Y = (1 - aura_env.icon_crop) * (Y / math.max(X,Y)) -- Высота области после преобразоания \n    local axis_X = (aura_env.icon_crop + length_X) * 0.5 + aura_env.icon_offset_X * (1 - aura_env.icon_crop - length_X)  -- Положение центральной оси по ширине (с учетом статичного кропа)\n    local axis_Y = (aura_env.icon_crop + length_Y) * 0.5 + aura_env.icon_offset_Y * (1 - aura_env.icon_crop - length_Y) -- Положение центральной оси по высоте (с учетом статичного кропа)\n    -- Основные расчеты\n    local X1 = axis_X - length_X * 0.5 -- Находим позицию №1 по ширине\n    local X2 = axis_X + length_X * 0.5 -- Находим позицию №2 по ширине\n    local Y1 = axis_Y - length_Y * 0.5 -- Находим позицию №1 по высоте\n    local Y2 = axis_Y + length_Y * 0.5 -- Находим позицию №2 по высоте\n    -- Вывод результатов\n    aura_env.region.icon.SetTexCoord = nil\n    aura_env.region.icon:SetTexCoord(X1, X2, Y1, Y2) -- Назначение границ текстуры\nend\n\naura_env.set_coord ()",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"Dampen Harm", -- [1]
						},
						["duration"] = "1",
						["unit"] = "player",
						["use_totemType"] = true,
						["debuffType"] = "HELPFUL",
						["type"] = "spell",
						["auraspellids"] = {
							"260895", -- [1]
						},
						["unevent"] = "auto",
						["use_absorbMode"] = true,
						["event"] = "Totem",
						["totemType"] = 4,
						["names"] = {
							"Shield of the Righteous", -- [1]
						},
						["useExactSpellId"] = true,
						["spellIds"] = {
							132403, -- [1]
						},
						["useName"] = false,
						["buffShowOn"] = "showOnActive",
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["alphaType"] = "custom",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "\n\n",
					["use_alpha"] = true,
					["scaleType"] = "straightScale",
					["easeType"] = "none",
					["colorA"] = 1,
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 0,
					["easeStrength"] = 3,
					["use_scale"] = false,
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["rotate"] = 0,
					["type"] = "none",
					["duration"] = "1",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["desaturate"] = false,
			["version"] = 6,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_text_format_p_time_format"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["anchorYOffset"] = 0,
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 262,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_petbattle"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_dragonriding"] = false,
				["role"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["use_combat"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "SHAMAN",
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["selfPoint"] = "TOPLEFT",
			["uid"] = "HgbYuA(MzJa",
			["authorOptions"] = {
			},
			["alpha"] = 1,
			["regionType"] = "icon",
			["cooldown"] = false,
			["icon"] = true,
			["auto"] = true,
			["zoom"] = 0.3,
			["width"] = 40,
			["frameStrata"] = 1,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.5",
			["tocversion"] = 90005,
			["id"] = "Totem #4",
			["xOffset"] = 0,
			["useCooldownModRate"] = true,
			["anchorFrameType"] = "SCREEN",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["inverse"] = false,
			["url"] = "",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["iconInset"] = 0,
		},
		["FPS/MS"] = {
			["outline"] = "THICKOUTLINE",
			["authorOptions"] = {
			},
			["displayText"] = "%c",
			["customText"] = "function()\n    \n    local c = RAID_CLASS_COLORS[select(2,UnitClass(\"player\"))]\n    local classcolor = ('c' .. c.colorStr )\n    \n    return (\"%.0f |%sfps|r %.0f |%sms|r\"):format(aura_env.fps or 0,classcolor or \"ffffff\",aura_env.latency or 0,classcolor or \"ffffff\")\n    \n    \nend\n\n\n\n\n\n\n\n",
			["shadowYOffset"] = -1,
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.refreshTime = 1\naura_env.lastTime = 0\n",
					["do_custom"] = true,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_type"] = "status",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["check"] = "update",
						["custom"] = "function()\n    if GetTime() - aura_env.lastTime > aura_env.refreshTime then\n        aura_env.lastTime = GetTime()\n        aura_env.fps = GetFramerate()\n        _,_,aura_env.latency = GetNetStats()\n        return true\n    else \n        return false\n    end\n    \nend\n\n\n\n",
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["custom"] = "function()\n    \n    return false\n    \nend\n\n\n\n",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["desc"] = "Displays FPS/MS",
			["font"] = "Expressway",
			["version"] = 1,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["ingroup"] = {
					["single"] = "solo",
					["multi"] = {
						["solo"] = true,
					},
				},
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["use_ingroup"] = true,
				["use_vehicleUi"] = false,
				["zoneIds"] = "",
				["class"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 15,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["regionType"] = "text",
			["fixedWidth"] = 200,
			["wordWrap"] = "WordWrap",
			["parent"] = "Info Displays",
			["selfPoint"] = "CENTER",
			["yOffset"] = -16,
			["xOffset"] = 0,
			["semver"] = "1.0.0",
			["config"] = {
			},
			["id"] = "FPS/MS",
			["justify"] = "LEFT",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["url"] = "",
			["uid"] = "H6U(OqxPgU2",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["displayText_format_c_format"] = "none",
		},
		["Map"] = {
			["controlledChildren"] = {
				"Valdrakken Map Labels", -- [1]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["parent"] = "PanzaUI - Utilities",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 64,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["subRegions"] = {
			},
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["borderInset"] = 1,
			["id"] = "Map",
			["uid"] = "bjXOf(BURHN",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 0,
			["config"] = {
			},
			["selfPoint"] = "CENTER",
			["groupIcon"] = 237386,
			["conditions"] = {
			},
			["information"] = {
			},
			["authorOptions"] = {
			},
		},
		["Invoker's Delight"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Invoker's Delight", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["useExactSpellId"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["useGroup_count"] = false,
						["use_absorbHealMode"] = true,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_tooltip"] = false,
						["use_absorbMode"] = true,
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["useName"] = true,
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["use_remaining"] = true,
						["subeventPrefix"] = "SPELL",
						["unevent"] = "timed",
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["auraspellids"] = {
							"386276", -- [1]
						},
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_totemNamePattern"] = false,
						["matchesShowOn"] = "showOnActive",
						["custom_hide"] = "timed",
						["sourceUnit"] = "player",
						["remaining_operator"] = ">",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["zoneIds"] = "",
				["use_dragonriding"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["use_vehicleUi"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["use_class_and_spec"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["desaturate"] = false,
			["parent"] = "Monk - Buffs",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["xOffset"] = 0,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["uid"] = "30i0Z(fB99U",
			["alpha"] = 1,
			["auto"] = false,
			["cooldownTextDisabled"] = false,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Invoker's Delight",
			["zoom"] = 0.3,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["frameStrata"] = 4,
			["config"] = {
			},
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["displayIcon"] = 2178534,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["url"] = "",
		},
		["Awekened Faeline"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"389391", -- [1]
							"389387", -- [2]
						},
						["remaining_operator"] = ">",
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Action Usable",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["useExactSpellId"] = false,
						["use_totemNamePattern"] = false,
						["use_debuffClass"] = false,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["spellName"] = 152175,
						["use_tooltip"] = false,
						["ownOnly"] = true,
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_remaining"] = true,
						["useName"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["type"] = "aura2",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["unevent"] = "timed",
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = "Whirling Dragon Punch",
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_unit"] = true,
						["use_totemName"] = false,
						["matchesShowOn"] = "showOnActive",
						["sourceUnit"] = "player",
						["useGroup_count"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_legacy_floor"] = false,
					["anchorXOffset"] = 0,
					["text_text_format_p_format"] = "timed",
					["type"] = "subtext",
					["text_shadowXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_anchorYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = true,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["spellknown"] = 388193,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["zoom"] = 0.3,
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 3528275,
			["authorOptions"] = {
			},
			["xOffset"] = 0,
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["semver"] = "7.0.2",
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Awekened Faeline",
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 4,
			["uid"] = "MytwF(V)78q",
			["inverse"] = false,
			["desaturate"] = false,
			["conditions"] = {
			},
			["cooldown"] = false,
			["parent"] = "Monk - Buffs",
		},
		["Earth Shield"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["sound"] = " custom",
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["useMatch_count"] = false,
						["auranames"] = {
							"383648", -- [1]
						},
						["use_power"] = false,
						["group_count"] = "0",
						["custom_hide"] = "timed",
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_START",
						["power_operator"] = ">",
						["fetchTooltip"] = false,
						["event"] = "Power",
						["combineMatches"] = "showLowest",
						["use_alwaystrue"] = true,
						["useGroup_count"] = false,
						["stacks"] = "0",
						["subeventPrefix"] = "SPELL",
						["stacksOperator"] = ">",
						["powertype"] = 12,
						["useStacks"] = true,
						["match_count"] = "0",
						["match_countOperator"] = ">",
						["debuffType"] = "HELPFUL",
						["use_powertype"] = true,
						["buffShowOn"] = "showOnActive",
						["useName"] = true,
						["type"] = "aura2",
						["spellName"] = 228260,
						["power"] = "0",
						["unevent"] = "auto",
						["use_showOn"] = true,
						["group_countOperator"] = ">",
						["ownOnly"] = true,
						["realSpellName"] = "Void Eruption",
						["use_spellName"] = true,
						["spellIds"] = {
							124273, -- [1]
							124275, -- [2]
							124274, -- [3]
						},
						["unit"] = "player",
						["use_tooltip"] = false,
						["names"] = {
							"Heavy Stagger", -- [1]
							"Light Stagger", -- [2]
							"Moderate Stagger", -- [3]
						},
						["use_unit"] = true,
						["matchesShowOn"] = "showOnActive",
					},
					["untrigger"] = {
						["showOn"] = "showAlways",
						["spellName"] = 228260,
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 26,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["text_text_format_3.tooltip1_format"] = "none",
					["rotateText"] = "NONE",
					["text_text_format_tooltip1_format"] = "none",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_2.tooltip1_format"] = "none",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_text_format_1.tooltip1_decimal_precision"] = 0,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_text_format_1.unitCount_format"] = "none",
					["text_text_format_1.tooltip1_format"] = "Number",
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_font"] = "Expressway",
					["anchorXOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_text_format_1.tooltip1_round_type"] = "round",
					["text_text_format_1.tooltip2_format"] = "none",
					["text_shadowXOffset"] = 0,
					["text_anchorPoint"] = "BOTTOM",
					["text_text_format_p_time_format"] = 0,
					["text_text_format_1.tooltip3_format"] = "none",
					["text_text_format_unitCount_format"] = "none",
					["text_text_format_matchCount_format"] = "none",
					["text_fontType"] = "OUTLINE",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
						["PRIEST"] = true,
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["use_exact_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["talent"] = {
					["multi"] = {
						[115069] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["class_and_spec"] = {
					["single"] = 270,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["use_class_and_spec"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 974,
				["use_petbattle"] = false,
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0.3,
			["stickyDuration"] = false,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["icon"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["uid"] = "vrLyMMikou2",
			["alpha"] = 1,
			["semver"] = "3.1.1",
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100005,
			["id"] = "Earth Shield",
			["frameStrata"] = 4,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["parent"] = "Shaman - Buffs",
			["config"] = {
			},
			["inverse"] = false,
			["xOffset"] = 0,
			["displayIcon"] = 136089,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["url"] = "",
		},
		["Primal Storm"] = {
			["sparkWidth"] = 10,
			["iconSource"] = -1,
			["wagoID"] = "fTuRJ__jk",
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["use_absorbMode"] = true,
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Conditions",
						["unit"] = "player",
						["custom_type"] = "stateupdate",
						["events"] = "DRAGONFLIGHT_EVENT_TRACKER",
						["spellIds"] = {
						},
						["use_unit"] = true,
						["check"] = "event",
						["custom"] = "function(allstates, event, id)\n    if event == \"DRAGONFLIGHT_EVENT_TRACKER\" and id == aura_env.id\n    or event == \"STATUS\" or event == \"OPTIONS\"\n    then\n        local regionTimers = {\n            [1] = 1671310800, -- NA\n            [2] = nil, -- KR\n            [3] = 1671303600, -- EU\n            [4] = nil, -- TW\n            [5] = nil -- CN\n        }\n        \n        local firstEvent = regionTimers[GetCurrentRegion()]\n        --Return early if we don't have data on the specific region\n        if(firstEvent == nil) then\n            return\n        end\n        \n        local interval = 10800\n        local duration = 7200\n        local time_to_next = interval - ((GetServerTime() - firstEvent) % interval)\n        local active = interval - time_to_next < duration\n        local remaining = duration - (interval - time_to_next)\n        \n        local huntZones = {\n        }\n        \n        local zoneTimers = {}\n        \n        allstates[\"\"] = {\n            changed = true,\n            show = true,\n            progressType = \"timed\",\n            autoHide = true,\n            duration = active and duration or interval-duration,\n            expirationTime = GetTime() + (active and remaining or time_to_next),\n            icon = 4643988,\n            active = active\n        }\n        \n        return true\n    end\nend\n\n\n\n\n\n\n",
						["subeventPrefix"] = "SPELL",
						["customVariables"] = "{\n    active = {\n        display = \"Primal Storms Active\", \n        type = \"bool\",\n    },\n    expirationTime = true,\n}\n\n\n\n\n",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["zoom"] = 0,
			["selfPoint"] = "CENTER",
			["sparkOffsetX"] = 0,
			["barColor"] = {
				1, -- [1]
				0.48627454042435, -- [2]
				0.039215687662363, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["value"] = 1,
						["variable"] = "active",
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								1, -- [2]
								0.027450982481241, -- [3]
								1, -- [4]
							},
							["property"] = "barColor",
						}, -- [1]
						{
							["property"] = "sub.4.text_visible",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "sub.5.text_visible",
						}, -- [3]
					},
				}, -- [1]
			},
			["version"] = 16,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_shadowXOffset"] = 1,
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_1.formattedTime_format"] = "none",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_format"] = 2,
					["text_font"] = "Expressway",
					["text_text_format_p_decimal_precision"] = 1,
					["type"] = "subtext",
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_fontType"] = "OUTLINE",
					["text_shadowYOffset"] = -1,
					["text_text"] = "%p",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_fontSize"] = 14,
					["anchorXOffset"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [3]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "Primal Storm",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorYOffset"] = 0,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = -1,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_LEFT",
					["text_text_format_p_time_format"] = 0,
					["text_shadowXOffset"] = 1,
					["text_fontSize"] = 14,
					["anchorXOffset"] = 0,
					["text_text_format_n_format"] = "none",
				}, -- [4]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "Primal Storms Up",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorYOffset"] = 0,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = -1,
					["text_visible"] = false,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_LEFT",
					["text_text_format_p_time_format"] = 0,
					["text_shadowXOffset"] = 1,
					["text_fontSize"] = 14,
					["anchorXOffset"] = 0,
					["text_text_format_n_format"] = "none",
				}, -- [5]
				{
					["border_offset"] = 2,
					["border_anchor"] = "bar",
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Drop Shadow",
					["border_size"] = 10,
				}, -- [6]
				{
					["border_offset"] = 2,
					["border_anchor"] = "bar",
					["type"] = "subborder",
					["border_color"] = {
						1, -- [1]
						0.8666667342185974, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["border_size"] = 13,
				}, -- [7]
			},
			["gradientOrientation"] = "HORIZONTAL",
			["internalVersion"] = 64,
			["load"] = {
				["use_petbattle"] = false,
				["use_encounter"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["class"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
				},
				["use_level"] = true,
				["level"] = "70",
				["level_operator"] = "==",
				["use_vehicleUi"] = false,
				["use_size"] = true,
				["use_combat"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "none",
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["source"] = "import",
			["height"] = 25,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon"] = true,
			["width"] = 240,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["frameStrata"] = 1,
			["parent"] = "Alerts",
			["icon_side"] = "LEFT",
			["sparkHidden"] = "NEVER",
			["sparkHeight"] = 30,
			["texture"] = "ToxiUI Clean",
			["semver"] = "2.0.0",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["spark"] = false,
			["tocversion"] = 100005,
			["id"] = "Primal Storm",
			["config"] = {
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["sparkOffsetY"] = 0,
			["uid"] = "N6UkKMCbwGq",
			["inverse"] = false,
			["authorOptions"] = {
			},
			["orientation"] = "HORIZONTAL",
			["displayIcon"] = 4643988,
			["information"] = {
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
					["custom"] = "C_Timer.After(0, function() WeakAuras.ScanEvents(\"DRAGONFLIGHT_EVENT_TRACKER\", aura_env.id) end)\n    \n    ",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
			},
		},
		["Stagger"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["sound"] = " custom",
					["do_sound"] = false,
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["useGroup_count"] = false,
						["matchesShowOn"] = "showAlways",
						["use_unit"] = true,
						["use_tooltip"] = false,
						["ownOnly"] = true,
						["unit"] = "player",
						["auranames"] = {
							"124275", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HARMFUL",
						["spellName"] = 228260,
						["useName"] = true,
						["use_debuffClass"] = false,
						["unevent"] = "auto",
						["use_showOn"] = true,
						["fetchTooltip"] = true,
						["event"] = "Conditions",
						["subeventSuffix"] = "_CAST_START",
						["realSpellName"] = "Void Eruption",
						["use_spellName"] = true,
						["spellIds"] = {
							124273, -- [1]
							124275, -- [2]
							124274, -- [3]
						},
						["type"] = "aura2",
						["custom_hide"] = "timed",
						["combineMatches"] = "showLowest",
						["names"] = {
							"Heavy Stagger", -- [1]
							"Light Stagger", -- [2]
							"Moderate Stagger", -- [3]
						},
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
						["showOn"] = "showAlways",
						["spellName"] = 228260,
					},
				}, -- [1]
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["useGroup_count"] = false,
						["matchesShowOn"] = "showAlways",
						["use_unit"] = true,
						["use_tooltip"] = false,
						["ownOnly"] = true,
						["unit"] = "player",
						["auranames"] = {
							"124274", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HARMFUL",
						["spellName"] = 228260,
						["useName"] = true,
						["use_debuffClass"] = false,
						["unevent"] = "auto",
						["use_showOn"] = true,
						["fetchTooltip"] = true,
						["event"] = "Conditions",
						["subeventSuffix"] = "_CAST_START",
						["realSpellName"] = "Void Eruption",
						["use_spellName"] = true,
						["spellIds"] = {
							124273, -- [1]
							124275, -- [2]
							124274, -- [3]
						},
						["type"] = "aura2",
						["custom_hide"] = "timed",
						["combineMatches"] = "showLowest",
						["names"] = {
							"Heavy Stagger", -- [1]
							"Light Stagger", -- [2]
							"Moderate Stagger", -- [3]
						},
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
						["showOn"] = "showAlways",
						["spellName"] = 228260,
					},
				}, -- [2]
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["useGroup_count"] = false,
						["matchesShowOn"] = "showAlways",
						["use_unit"] = true,
						["use_tooltip"] = false,
						["ownOnly"] = true,
						["unit"] = "player",
						["auranames"] = {
							"124273", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HARMFUL",
						["spellName"] = 228260,
						["useName"] = true,
						["use_debuffClass"] = false,
						["unevent"] = "auto",
						["use_showOn"] = true,
						["fetchTooltip"] = true,
						["event"] = "Conditions",
						["subeventSuffix"] = "_CAST_START",
						["realSpellName"] = "Void Eruption",
						["use_spellName"] = true,
						["spellIds"] = {
							124273, -- [1]
							124275, -- [2]
							124274, -- [3]
						},
						["type"] = "aura2",
						["custom_hide"] = "timed",
						["combineMatches"] = "showLowest",
						["names"] = {
							"Heavy Stagger", -- [1]
							"Light Stagger", -- [2]
							"Moderate Stagger", -- [3]
						},
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
						["showOn"] = "showAlways",
						["spellName"] = 228260,
					},
				}, -- [3]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 26,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_text_format_3.tooltip1_format"] = "none",
					["rotateText"] = "NONE",
					["text_text_format_tooltip1_format"] = "none",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_fontSize"] = 12,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_2.tooltip1_format"] = "none",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_text_format_1.tooltip1_decimal_precision"] = 0,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["type"] = "subtext",
					["text_text_format_1.tooltip3_format"] = "none",
					["text_font"] = "Expressway",
					["text_text_format_p_time_format"] = 0,
					["text_anchorYOffset"] = 0,
					["text_text_format_1.tooltip1_round_type"] = "round",
					["text_text_format_1.tooltip2_format"] = "none",
					["text_text_format_c_format"] = "none",
					["text_anchorPoint"] = "TOP",
					["text_text_format_1.tooltip1_format"] = "Number",
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_time_mod_rate"] = true,
					["text_fontType"] = "OUTLINE",
					["anchorXOffset"] = 0,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_class_and_spec"] = true,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["talent"] = {
					["multi"] = {
						[115069] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_dragonriding"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
						["PRIEST"] = true,
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class_and_spec"] = {
					["single"] = 268,
				},
				["zoneIds"] = "",
			},
			["source"] = "import",
			["width"] = 40,
			["useCooldownModRate"] = true,
			["icon"] = true,
			["stickyDuration"] = false,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 645193,
			["parent"] = "Monk - Buffs",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["config"] = {
			},
			["frameStrata"] = 4,
			["xOffset"] = 0,
			["zoom"] = 0.3,
			["semver"] = "3.1.1",
			["tocversion"] = 100005,
			["id"] = "Stagger",
			["auto"] = false,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["cooldownTextDisabled"] = false,
			["uid"] = "ciXus68Nudi",
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "buffed",
								["value"] = 0,
							}, -- [1]
							{
								["trigger"] = 2,
								["variable"] = "buffed",
								["value"] = 0,
							}, -- [2]
							{
								["trigger"] = 3,
								["variable"] = "buffed",
								["value"] = 0,
							}, -- [3]
						},
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["property"] = "sub.2.text_visible",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = "463281",
							["property"] = "displayIcon",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "buffed",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = "460954",
							["property"] = "displayIcon",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "sub.3.glow",
						}, -- [2]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = 3,
						["variable"] = "buffed",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = "463282",
							["property"] = "displayIcon",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "sub.4.glow",
						}, -- [2]
					},
				}, -- [4]
			},
			["cooldown"] = false,
			["url"] = "https://wago.io/r1CzQ6azX/26",
		},
		["Lava Surge"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Shaman - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"120954", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["useExactSpellId"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["useGroup_count"] = false,
						["use_absorbHealMode"] = true,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["unit"] = "player",
						["use_tooltip"] = false,
						["use_absorbMode"] = true,
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_genericShowOn"] = true,
						["type"] = "aura2",
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["useName"] = false,
						["subeventPrefix"] = "SPELL",
						["unevent"] = "timed",
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["auraspellids"] = {
							"77762", -- [1]
						},
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_totemNamePattern"] = false,
						["matchesShowOn"] = "showOnActive",
						["custom_hide"] = "timed",
						["sourceUnit"] = "player",
						["remaining_operator"] = ">",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = true,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["use_vehicleUi"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 388023,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["xOffset"] = 0,
			["selfPoint"] = "CENTER",
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["uid"] = "zTYYEkkU0kV",
			["frameStrata"] = 4,
			["authorOptions"] = {
			},
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Lava Surge",
			["semver"] = "7.0.2",
			["useCooldownModRate"] = true,
			["width"] = 40,
			["zoom"] = 0.3,
			["config"] = {
			},
			["inverse"] = false,
			["stickyDuration"] = false,
			["displayIcon"] = 451169,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["cooldownEdge"] = false,
		},
		["Tiger's Lust (CD)"] = {
			["iconSource"] = 0,
			["parent"] = "Monk - Movement",
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = true,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"152173", -- [1]
						},
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "SPELL",
						["spellName"] = 116841,
						["charges_operator"] = "<",
						["type"] = "spell",
						["debuffType"] = "HELPFUL",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["ownOnly"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 116841,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["charges"] = "1",
						["use_charges"] = false,
						["useName"] = true,
						["use_track"] = true,
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%p",
					["text_text_format_p_gcd_cast"] = false,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_text_format_p_abbreviate_max"] = 8,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["text_fontType"] = "OUTLINE",
					["text_anchorYOffset"] = 10,
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_time_format"] = 0,
					["text_anchorPoint"] = "CENTER",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_text_format_p_color"] = true,
					["text_justify"] = "CENTER",
					["text_text_format_p_abbreviate"] = false,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["border_offset"] = 4,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["border_size"] = 18,
				}, -- [4]
			},
			["height"] = 40,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[269] = true,
						[270] = true,
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_spellknown"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_class_and_spec"] = false,
				["spellknown"] = 116841,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["xOffset"] = -10,
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["authorOptions"] = {
			},
			["cooldown"] = true,
			["displayIcon"] = 651727,
			["uid"] = "BJ7JtHpD9zg",
			["frameStrata"] = 1,
			["zoom"] = 0.1,
			["width"] = 40,
			["tocversion"] = 100002,
			["id"] = "Tiger's Lust (CD)",
			["alpha"] = 1,
			["useCooldownModRate"] = true,
			["anchorFrameType"] = "SELECTFRAME",
			["cooldownTextDisabled"] = true,
			["config"] = {
			},
			["inverse"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["init"] = {
				},
				["finish"] = {
					["do_glow"] = false,
					["glow_frame_type"] = "UNITFRAME",
					["glow_action"] = "show",
				},
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["url"] = "",
		},
		["Barber"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "vVnrs5WY3",
			["parent"] = "Valdrakken Map Labels",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = -61.363037109375,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["duration"] = "1",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Conditions",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["spellIds"] = {
						},
						["events"] = "OPEN_WORLD_MAP, WORLD_MAP_UPDATE, QUEST_LOG_UPDATE",
						["custom"] = "function()\n    local mapID = WorldMapFrame:GetMapID()\n    if mapID == 2112 then -- Valdrakken\n        return true\n    else\n        return false\n    end\nend\n\n\n--2112 = Valdrakken\n--2112 = Valdrakken",
						["check"] = "update",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["font"] = "Expressway",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "2112",
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["xOffset"] = -283.63722229004,
			["anchorFrameFrame"] = "WorldMapFrame",
			["regionType"] = "text",
			["url"] = "",
			["authorOptions"] = {
			},
			["fixedWidth"] = 200,
			["displayText_format_p_time_precision"] = 1,
			["displayText"] = "Barber\n",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "Barber",
			["wordWrap"] = "WordWrap",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["shadowYOffset"] = -1,
			["uid"] = "fkzDEKvXFca",
			["justify"] = "CENTER",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 135,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["easeStrength"] = 3,
					["preset"] = "spiralandpulse",
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Dance of Chi-Ji"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Dance of Chi-Ji", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_debuffClass"] = false,
						["useGroup_count"] = false,
						["spellName"] = 0,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["useExactSpellId"] = false,
						["use_tooltip"] = false,
						["remaining_operator"] = ">",
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["useName"] = true,
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["type"] = "aura2",
						["unevent"] = "timed",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_totemName"] = false,
						["matchesShowOn"] = "showOnActive",
						["sourceUnit"] = "player",
						["use_totemNamePattern"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowXOffset"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_format"] = "timed",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_format"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = true,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 205523,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["useCooldownModRate"] = true,
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 606543,
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["frameStrata"] = 4,
			["cooldownTextDisabled"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Dance of Chi-Ji",
			["auto"] = false,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 0,
			["uid"] = "DhQOMys3NFb",
			["inverse"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["conditions"] = {
			},
			["cooldown"] = false,
			["desaturate"] = false,
		},
		["Unread Mail"] = {
			["iconSource"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = true,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"152173", -- [1]
						},
						["ownOnly"] = true,
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "SPELL",
						["use_charges"] = false,
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["custom_hide"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["spellName"] = 58875,
						["charges_operator"] = "<",
						["useName"] = true,
						["custom"] = "function() \n    return HasNewMail();\nend",
						["custom_type"] = "event",
						["type"] = "custom",
						["charges"] = "1",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 58875,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["events"] = "UPDATE_PENDING_MAIL",
						["check"] = "event",
						["unit"] = "player",
						["use_track"] = true,
						["use_genericShowOn"] = true,
					},
					["untrigger"] = {
						["custom"] = "function()\n    return true\nend",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 18,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "LEFT",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_fontType"] = "OUTLINE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 10,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["anchorXOffset"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
					["text_shadowXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "Unread Mail",
					["text_anchorPoint"] = "OUTER_RIGHT",
					["text_text_format_p_gcd_cast"] = false,
					["text_text_format_p_color"] = true,
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["border_offset"] = 4,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["border_size"] = 18,
				}, -- [4]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_spellknown"] = false,
				["use_vehicleUi"] = false,
				["ingroup"] = {
				},
				["use_exact_spellknown"] = false,
				["spellknown"] = 58875,
				["instance_type"] = {
				},
			},
			["source"] = "import",
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
			},
			["parent"] = "Alerts",
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["url"] = "",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["init"] = {
				},
				["finish"] = {
					["do_glow"] = false,
					["glow_frame_type"] = "UNITFRAME",
					["glow_action"] = "show",
				},
			},
			["cooldown"] = false,
			["displayIcon"] = 413580,
			["uid"] = "lAx4P0mIf)n",
			["frameStrata"] = 1,
			["cooldownTextDisabled"] = true,
			["width"] = 30,
			["tocversion"] = 100002,
			["id"] = "Unread Mail",
			["useCooldownModRate"] = true,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["zoom"] = 0.1,
			["config"] = {
			},
			["inverse"] = false,
			["xOffset"] = 0,
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["authorOptions"] = {
			},
		},
		["Target Highlight"] = {
			["controlledChildren"] = {
				"Left Arrow", -- [1]
				"Right Arrow", -- [2]
				"Health Percentage", -- [3]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = 0,
			["groupIcon"] = 878211,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 64,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["subRegions"] = {
			},
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["config"] = {
			},
			["id"] = "Target Highlight",
			["borderInset"] = 1,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["parent"] = "PanzaUI - Utilities",
			["uid"] = "IdpFxE4eQHb",
			["selfPoint"] = "CENTER",
			["yOffset"] = 0,
			["conditions"] = {
			},
			["information"] = {
			},
			["authorOptions"] = {
			},
		},
		["Blackout Combo"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Blackout Combo", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["remaining_operator"] = ">",
						["useGroup_count"] = false,
						["useExactSpellId"] = false,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["custom_hide"] = "timed",
						["use_tooltip"] = false,
						["matchesShowOn"] = "showOnActive",
						["use_totemNamePattern"] = false,
						["ownOnly"] = true,
						["useName"] = true,
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["type"] = "aura2",
						["unevent"] = "timed",
						["auraspellids"] = {
							"386963", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_totemName"] = false,
						["use_unit"] = true,
						["sourceUnit"] = "player",
						["use_debuffClass"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowXOffset"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_format"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_talent"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[196736] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["cooldownTextDisabled"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["url"] = "",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 574568,
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["auto"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Blackout Combo",
			["authorOptions"] = {
			},
			["frameStrata"] = 4,
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["uid"] = "2crph1q3fjz",
			["inverse"] = false,
			["parent"] = "Monk - Buffs",
			["conditions"] = {
			},
			["cooldown"] = false,
			["selfPoint"] = "CENTER",
		},
		["Heal - Renewing Mist"] = {
			["iconSource"] = -1,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = true,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showAlways",
						["unit"] = "player",
						["spellName"] = 115151,
						["charges_operator"] = ">",
						["type"] = "spell",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 115151,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_charges"] = true,
						["subeventPrefix"] = "SPELL",
						["charges"] = "0",
						["use_track"] = true,
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%1.charges",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "BOTTOMRIGHT",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["type"] = "subtext",
					["text_anchorXOffset"] = 2,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_text_format_p_format"] = "timed",
					["text_fontType"] = "OUTLINE",
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_c_format"] = "none",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 270,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 17,
					["multi"] = {
						[115151] = true,
					},
				},
				["use_vehicle"] = false,
				["use_class_and_spec"] = true,
				["use_talent"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[2] = true,
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "bounceDecay",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["regionType"] = "icon",
			["xOffset"] = 0,
			["parent"] = "Monk - Healer",
			["cooldown"] = false,
			["displayIcon"] = 627487,
			["config"] = {
			},
			["alpha"] = 1,
			["zoom"] = 0.1,
			["anchorFrameType"] = "SCREEN",
			["tocversion"] = 100002,
			["id"] = "Heal - Renewing Mist",
			["useCooldownModRate"] = true,
			["frameStrata"] = 1,
			["width"] = 30,
			["cooldownTextDisabled"] = true,
			["uid"] = "huZY3KYKLJU",
			["inverse"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["init"] = {
				},
				["finish"] = {
					["glow_frame_type"] = "UNITFRAME",
					["do_glow"] = false,
					["glow_action"] = "show",
				},
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["url"] = "",
		},
		["MM+ Portals"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "vVnrs5WY3",
			["parent"] = "Valdrakken Map Labels",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = -39.755615234375,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["duration"] = "1",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Conditions",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["spellIds"] = {
						},
						["events"] = "OPEN_WORLD_MAP, WORLD_MAP_UPDATE, QUEST_LOG_UPDATE",
						["custom"] = "function()\n    local mapID = WorldMapFrame:GetMapID()\n    if mapID == 2112 then -- Valdrakken\n        return true\n    else\n        return false\n    end\nend\n\n\n--2112 = Valdrakken\n--2112 = Valdrakken",
						["check"] = "update",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["font"] = "Expressway",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "2112",
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["xOffset"] = -94.059326171875,
			["anchorFrameFrame"] = "WorldMapFrame",
			["regionType"] = "text",
			["url"] = "",
			["authorOptions"] = {
			},
			["fixedWidth"] = 200,
			["displayText_format_p_time_precision"] = 1,
			["displayText"] = "MM+ Portals",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "MM+ Portals",
			["wordWrap"] = "WordWrap",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["shadowYOffset"] = -1,
			["uid"] = "6m0UIoJt7Ey",
			["justify"] = "CENTER",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 135,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["easeStrength"] = 3,
					["preset"] = "spiralandpulse",
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Alerts"] = {
			["grow"] = "DOWN",
			["controlledChildren"] = {
				"Community Feast", -- [1]
				"Dragonbane Keep", -- [2]
				"Primal Storm", -- [3]
				"Aylaag Camp", -- [4]
				"Battle Res", -- [5]
				"AFK", -- [6]
				"Durability <60%", -- [7]
				"Unread Mail", -- [8]
				"New Talent Point available", -- [9]
				"Hunter - Missing Pet", -- [10]
				"Jeeves up!", -- [11]
				"Healthstone up!", -- [12]
				"Summon Stone up!", -- [13]
				"Shaman - Missing Lightning Shield", -- [14]
				"Shaman - Missing Flametongue Weapon", -- [15]
				"Shaman - Missing Windfury Weapon", -- [16]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = -900,
			["yOffset"] = 600,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["space"] = 5,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["radius"] = 200,
			["selfPoint"] = "TOPLEFT",
			["align"] = "LEFT",
			["stagger"] = 0,
			["subRegions"] = {
			},
			["config"] = {
			},
			["internalVersion"] = 64,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["authorOptions"] = {
			},
			["animate"] = false,
			["useLimit"] = false,
			["scale"] = 1,
			["centerType"] = "LR",
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "dynamicgroup",
			["borderSize"] = 2,
			["sort"] = "none",
			["groupIcon"] = 1100023,
			["arcLength"] = 360,
			["constantFactor"] = "RADIUS",
			["rowSpace"] = 1,
			["borderOffset"] = 4,
			["gridType"] = "RD",
			["frameStrata"] = 1,
			["id"] = "Alerts",
			["fullCircle"] = true,
			["gridWidth"] = 5,
			["anchorFrameType"] = "SCREEN",
			["limit"] = 5,
			["borderInset"] = 1,
			["parent"] = "PanzaUI - Utilities",
			["uid"] = "iT2bkOtnJCb",
			["conditions"] = {
			},
			["information"] = {
			},
			["rotation"] = 0,
		},
		["New Talent Point available"] = {
			["iconSource"] = 0,
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
					["glow_frame_type"] = "UNITFRAME",
					["do_glow"] = false,
					["glow_action"] = "show",
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"152173", -- [1]
						},
						["use_charges"] = false,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["use_genericShowOn"] = true,
						["subeventPrefix"] = "SPELL",
						["custom_hide"] = "custom",
						["spellName"] = 58875,
						["events"] = "PLAYER_STARTED_MOVING, PLAYER_XP_UPDATE, SKILL_LINES_CHANGED, TRAIT_CONFIG_UPDATED",
						["debuffType"] = "HELPFUL",
						["charges_operator"] = "<",
						["type"] = "custom",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["charges"] = "1",
						["useName"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 58875,
						["use_spellName"] = true,
						["custom"] = "function()\n    \n    local hasUnspentPoints, numClassPoints, numSpecPoints = C_ClassTalents.HasUnspentTalentPoints()\n    \n    if (hasUnspentPoints == true or numClassPoints >= 1 or numSpecPoints >= 1) then\n        return true\n        \n    end\n    \nend",
						["custom_type"] = "status",
						["check"] = "event",
						["ownOnly"] = true,
						["use_track"] = true,
						["unit"] = "player",
					},
					["untrigger"] = {
						["custom"] = "",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 18,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "LEFT",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_justify"] = "CENTER",
					["type"] = "subtext",
					["text_anchorXOffset"] = 10,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["text_text_format_p_time_legacy_floor"] = true,
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_color"] = true,
					["text_text_format_p_gcd_cast"] = false,
					["text_text"] = "New Talent Point available",
					["text_anchorPoint"] = "OUTER_RIGHT",
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_time_mod_rate"] = true,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["type"] = "subborder",
					["border_size"] = 18,
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["border_offset"] = 4,
				}, -- [4]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = false,
				["use_vehicleUi"] = false,
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["use_exact_spellknown"] = false,
				["spellknown"] = 58875,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["icon"] = true,
			["authorOptions"] = {
			},
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["url"] = "",
			["parent"] = "Alerts",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["alpha"] = 1,
			["zoom"] = 0.1,
			["anchorFrameType"] = "SELECTFRAME",
			["tocversion"] = 100002,
			["id"] = "New Talent Point available",
			["frameStrata"] = 1,
			["useCooldownModRate"] = true,
			["width"] = 30,
			["cooldownTextDisabled"] = true,
			["uid"] = "Yhr)AWTQtuc",
			["inverse"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
			},
			["displayIcon"] = 132222,
			["cooldown"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Right Arrow"] = {
			["parent"] = "Target Highlight",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["custom"] = "function()\n    local region = aura_env.region\n    local plate = C_NamePlate.GetNamePlateForUnit(\"target\")\n    if plate then\n        region:ClearAllPoints()\n        region:SetPoint(\"CENTER\", plate, \"CENTER\", 90, -10)\n        region:Show()\n    else\n        region:Hide()\n    end\n    return true\nend\n\n\n\n",
						["custom_type"] = "status",
						["check"] = "update",
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["rotation"] = 270,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 65,
			["rotate"] = true,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\targeting-mark.tga",
			["alpha"] = 1,
			["xOffset"] = 0,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["id"] = "Right Arrow",
			["authorOptions"] = {
			},
			["frameStrata"] = 1,
			["width"] = 90,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "V2(BfBuyEZ9",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["discrete_rotation"] = 0,
		},
		["Fire Elemental"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "198067",
						["duration"] = "30",
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["use_track"] = true,
						["use_unit"] = true,
						["use_genericShowOn"] = true,
						["names"] = {
						},
						["spellIds"] = {
						},
						["spellName"] = "Fire Elemental",
						["use_spellName"] = true,
						["type"] = "combatlog",
						["use_absorbHealMode"] = true,
						["auraspellids"] = {
							"381755", -- [1]
						},
						["subeventSuffix"] = "_CAST_SUCCESS",
						["useExactSpellId"] = true,
						["event"] = "Combat Log",
						["use_absorbMode"] = true,
						["realSpellName"] = 0,
						["use_spellId"] = false,
						["custom"] = "function(states, event, ...)\n    if event == \"OPTIONS\" then\n        states[\"\"] = {\n            icon = 136024,\n            duration = 60,\n            expirationTime = GetTime() + 60,\n            progressType = \"timed\",\n            autoHide = true,\n            changed = true,\n            show = true,\n        }\n        return true\n    end\n    \n    local unit = ...\n    if unit == \"player\" then\n        local GUID = UnitGUID(\"pet\")\n        if GUID then\n            local pet = select(6, strsplit(\"-\", GUID))\n            if pet == \"61056\" then\n                local duration = GetPetTimeRemaining()\n                if duration then\n                    states[\"\"] = {\n                        icon = 136024,\n                        duration = duration/1000,\n                        expirationTime = GetTime() + duration/1000,\n                        progressType = \"timed\",\n                        autoHide = true,\n                        changed = true,\n                        show = true,\n                    }\n                    return true\n                end\n            end\n        elseif states[\"\"] then\n            states[\"\"].show = false\n            states[\"\"].changed = true\n            return true\n        end\n    end\nend\n\n\n\n\n\n\n",
						["use_sourceUnit"] = true,
						["ownOnly"] = true,
						["debuffType"] = "HELPFUL",
						["sourceUnit"] = "player",
						["useRem"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_precision"] = 1,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowXOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["use_combat"] = true,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[397251] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_exact_spellknown"] = false,
				["spellknown"] = 198067,
				["use_dragonriding"] = false,
			},
			["parent"] = "Shaman - Buffs",
			["source"] = "import",
			["width"] = 40,
			["useCooldownModRate"] = true,
			["xOffset"] = 0,
			["desaturate"] = false,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 135790,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["config"] = {
			},
			["frameStrata"] = 4,
			["cooldownTextDisabled"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Fire Elemental",
			["auto"] = false,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["uid"] = "irW4wvYa4oa",
			["inverse"] = false,
			["conditions"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
		},
		["Invoke Yu'lon, the Jade Serpent"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "322118",
						["auranames"] = {
							"120954", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Combat Log",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["useGroup_count"] = false,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "SPELL",
						["use_tooltip"] = false,
						["remaining_operator"] = ">",
						["use_totemNamePattern"] = false,
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["type"] = "combatlog",
						["use_remaining"] = true,
						["unevent"] = "timed",
						["auraspellids"] = {
							"243435", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["buffShowOn"] = "showOnActive",
						["totemName"] = "123904",
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = false,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["custom_hide"] = "timed",
						["duration"] = "25",
						["sourceUnit"] = "player",
						["useExactSpellId"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_shadowXOffset"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["use_vehicleUi"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 322118,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["icon"] = true,
			["xOffset"] = 0,
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["cooldownEdge"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["uid"] = "NPH7jFd0Jro",
			["alpha"] = 1,
			["semver"] = "7.0.2",
			["zoom"] = 0.3,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Invoke Yu'lon, the Jade Serpent",
			["cooldownTextDisabled"] = false,
			["frameStrata"] = 4,
			["width"] = 40,
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["stickyDuration"] = false,
			["displayIcon"] = 574571,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
		},
		["Power of the Maelstrom"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Shaman - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"191877", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_absorbHealMode"] = true,
						["custom_hide"] = "timed",
						["stacksOperator"] = ">=",
						["useStacks"] = true,
						["useGroup_count"] = false,
						["use_totemNamePattern"] = false,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "SPELL",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["stacks"] = "1",
						["use_unit"] = true,
						["use_genericShowOn"] = true,
						["duration"] = "25",
						["totemName"] = "123904",
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["use_remaining"] = true,
						["useName"] = true,
						["buffShowOn"] = "showOnActive",
						["unevent"] = "timed",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["type"] = "aura2",
						["matchesShowOn"] = "showOnActive",
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_tooltip"] = false,
						["use_totemName"] = false,
						["useExactSpellId"] = false,
						["sourceUnit"] = "player",
						["remaining_operator"] = ">",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_format"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_format"] = "timed",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [2]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_precision"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "BOTTOM",
					["text_fontType"] = "OUTLINE",
					["text_shadowXOffset"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_talent"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
						[191861] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["xOffset"] = 0,
			["selfPoint"] = "CENTER",
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["uid"] = "C6ElBvvBZot",
			["frameStrata"] = 4,
			["authorOptions"] = {
			},
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Power of the Maelstrom",
			["semver"] = "7.0.2",
			["useCooldownModRate"] = true,
			["width"] = 40,
			["zoom"] = 0.3,
			["config"] = {
			},
			["inverse"] = false,
			["stickyDuration"] = false,
			["displayIcon"] = 135820,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["cooldownEdge"] = false,
		},
		["Clock"] = {
			["outline"] = "THICKOUTLINE",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayText"] = "%c",
			["customText"] = "function()\n    local hours = date(\"%I\")\n    local c = RAID_CLASS_COLORS[select(2,UnitClass(\"player\"))]\n    local classcolor = ('c' .. c.colorStr )\n    local minutes = date(\"%M\")\n    local ampm = date(\"%p\")\n    \n    if WeakAuras.IsOptionsOpen() then\n        return (\"%d:%d |%s%s |r\"):format(12, 30, classcolor, \"PM\")\n    else\n        if string.sub(hours,1,1) == \"0\"\n        then \n            hours = string.sub(hours,2,2)\n            \n            \n            \n        end\n        return(\"%s:%s|%s%s|r\"):format(hours,minutes,classcolor,ampm)\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["shadowYOffset"] = -1,
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["desc"] = "Current Time",
			["font"] = "Expressway",
			["version"] = 1,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["ingroup"] = {
					["single"] = "solo",
					["multi"] = {
						["solo"] = true,
					},
				},
				["use_encounter"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["use_ingroup"] = true,
				["zoneIds"] = "",
				["use_vehicleUi"] = false,
				["use_never"] = false,
				["class"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 18,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["regionType"] = "text",
			["fixedWidth"] = 200,
			["wordWrap"] = "WordWrap",
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["preferToUpdate"] = false,
			["yOffset"] = 10,
			["authorOptions"] = {
			},
			["semver"] = "1.0.0",
			["config"] = {
			},
			["id"] = "Clock",
			["url"] = "",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 0,
			["uid"] = "50uLiRjP1SM",
			["justify"] = "CENTER",
			["parent"] = "Info Displays",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["displayText_format_c_format"] = "none",
		},
		["Invoke Chi-Ji, the Red Crane"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "325197",
						["auranames"] = {
							"120954", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Combat Log",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["useGroup_count"] = false,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_tooltip"] = false,
						["subeventPrefix"] = "SPELL",
						["use_genericShowOn"] = true,
						["buffShowOn"] = "showOnActive",
						["debuffType"] = "HELPFUL",
						["useExactSpellId"] = true,
						["use_remaining"] = true,
						["auraspellids"] = {
							"243435", -- [1]
						},
						["unevent"] = "timed",
						["duration"] = "25",
						["custom_hide"] = "timed",
						["totemType"] = 1,
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = false,
						["spellIds"] = {
							120954, -- [1]
						},
						["unit"] = "player",
						["type"] = "combatlog",
						["use_totemNamePattern"] = false,
						["sourceUnit"] = "player",
						["remaining_operator"] = ">",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_format"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_format"] = "timed",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_talent"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["zoneIds"] = "",
				["race"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
						[388212] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_combat"] = true,
				["spellknown"] = 325197,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["width"] = 40,
			["frameStrata"] = 4,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["authorOptions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 877514,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["zoom"] = 0.3,
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Invoke Chi-Ji, the Red Crane",
			["semver"] = "7.0.2",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["stickyDuration"] = false,
			["uid"] = "KZtONoVH9dU",
			["inverse"] = false,
			["cooldownEdge"] = false,
			["conditions"] = {
			},
			["cooldown"] = false,
			["xOffset"] = 0,
		},
		["Bonedust Brew"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"386276", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["remaining_operator"] = ">",
						["useGroup_count"] = false,
						["useExactSpellId"] = false,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["custom_hide"] = "timed",
						["use_tooltip"] = false,
						["matchesShowOn"] = "showOnActive",
						["use_totemNamePattern"] = false,
						["ownOnly"] = true,
						["useName"] = true,
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["type"] = "aura2",
						["unevent"] = "timed",
						["auraspellids"] = {
							"386276", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_totemName"] = false,
						["use_unit"] = true,
						["sourceUnit"] = "player",
						["use_debuffClass"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowXOffset"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_format"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 386276,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["useCooldownModRate"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 3578227,
			["parent"] = "Monk - Buffs",
			["url"] = "",
			["config"] = {
			},
			["frameStrata"] = 4,
			["cooldownTextDisabled"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Bonedust Brew",
			["auto"] = false,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 0,
			["uid"] = "bDMK0dvJd5T",
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["cooldown"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
		},
		["Heal - Vivacious Vivification 2"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Shaman - Healer",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"392883", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Action Usable",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_totemNamePattern"] = false,
						["useGroup_count"] = false,
						["use_absorbHealMode"] = true,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["matchesShowOn"] = "showOnActive",
						["use_tooltip"] = false,
						["use_absorbMode"] = true,
						["unit"] = "player",
						["remaining_operator"] = ">",
						["useName"] = true,
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["use_remaining"] = true,
						["subeventPrefix"] = "SPELL",
						["unevent"] = "timed",
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["totemType"] = 1,
						["realSpellName"] = "Expel Harm",
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["ownOnly"] = true,
						["spellName"] = 322101,
						["sourceUnit"] = "player",
						["useExactSpellId"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%c",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_legacy_floor"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["type"] = "subtext",
					["text_text_format_p_time_precision"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_shadowXOffset"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_c_format"] = "none",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = true,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = true,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_talent"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
						[388812] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["use_vehicleUi"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 392883,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["icon"] = true,
			["url"] = "",
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["uid"] = "kBUdLxjdvkJ",
			["frameStrata"] = 4,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Heal - Vivacious Vivification 2",
			["semver"] = "7.0.2",
			["useCooldownModRate"] = true,
			["width"] = 30,
			["zoom"] = 0.3,
			["config"] = {
			},
			["inverse"] = false,
			["authorOptions"] = {
			},
			["displayIcon"] = 1360980,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["xOffset"] = 0,
		},
		["Dragonriding UI Speed"] = {
			["sparkWidth"] = 10,
			["iconSource"] = -1,
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["default"] = false,
					["desc"] = "Display speed on bar.",
					["key"] = "speedshow",
					["useDesc"] = true,
					["name"] = "Display Speed Value",
					["width"] = 1.05,
				}, -- [1]
				{
					["type"] = "toggle",
					["default"] = false,
					["desc"] = "Whether to display units after speed value.",
					["key"] = "speedshowunits",
					["useDesc"] = true,
					["name"] = "Show Units",
					["width"] = 1,
				}, -- [2]
				{
					["type"] = "toggle",
					["default"] = false,
					["desc"] = "Whether to change the bar color on thrill of the skies",
					["key"] = "showthrillcolor",
					["useDesc"] = true,
					["name"] = "Change Bar Color on thrill",
					["width"] = 1,
				}, -- [3]
			},
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = -70,
			["anchorPoint"] = "TOP",
			["sparkRotation"] = 0,
			["url"] = "",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["wordWrap"] = "WordWrap",
			["barColor"] = {
				0, -- [1]
				1, -- [2]
				0.054901964962482, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["font"] = "Friz Quadrata TT",
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["load"] = {
				["ingroup"] = {
				},
				["use_zoneIds"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "none",
					["multi"] = {
						["none"] = true,
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["zoneIds"] = "1978, 2022, 2023, 2024, 2025, 2112, 2093",
				["difficulty"] = {
					["single"] = "timewalking",
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["class"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["instance_type"] = {
				},
				["use_dragonriding"] = true,
				["spellknown"] = 372610,
				["itemtypeequipped"] = {
				},
			},
			["shadowXOffset"] = 1,
			["smoothProgress"] = true,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["texture"] = "ToxiUI Clean",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["spark"] = false,
			["tocversion"] = 100002,
			["alpha"] = 1,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["fixedWidth"] = 200,
			["outline"] = "OUTLINE",
			["sparkOffsetX"] = 0,
			["wagoID"] = "oXqLOc7a-",
			["parent"] = "Dragonriding",
			["adjustedMin"] = "20",
			["shadowYOffset"] = -1,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_type"] = "stateupdate",
						["customVariables"] = "{\n    value = \"number\",\n    delta = \"number\",\n    boosting = \"bool\",\n    thrill = \"bool\",\n}",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["unit"] = "player",
						["customDuration"] = "function()\n    return aura_env.smooth_delta + 0.5, 1, true\nend",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["names"] = {
						},
						["check"] = "event",
						["custom"] = "function(...)\n    return aura_env.trigger1(...)\nend",
						["events"] = "PLAYER_MOUNT_DISPLAY_CHANGED, MOUNT_JOURNAL_USABILITY_CHANGED, LEARNED_SPELL_IN_TAB, UNIT_SPELLCAST_SUCCEEDED:player, DMUI_DRAGONRIDING_UPDATE, VEHICLE_ANGLE_UPDATE",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "all",
				["customTriggerLogic"] = "function(t) return (t[2] or t[3]) and t[4] end",
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_legacy_floor"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 0.74901962280273,
					["duration_type"] = "seconds",
					["colorA"] = 1,
					["colorG"] = 0,
					["type"] = "custom",
					["easeType"] = "none",
					["scaley"] = 1,
					["alpha"] = 0,
					["colorB"] = 0.015686275437474,
					["y"] = 0,
					["x"] = 0,
					["scalex"] = 1,
					["easeStrength"] = 3,
					["colorFunc"] = "function(_, r1, g1, b1, a1, r2, g2, b2, a2)\n    local progress = 1 - math.min(1, math.max(aura_env.smooth_accel + 0.5, 0))\n    if not aura_env.boosting then\n        return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    else\n        return r1, g1, b1, a1\n    end\nend",
					["rotate"] = 0,
					["colorType"] = "custom",
					["use_color"] = false,
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["preferToUpdate"] = false,
			["information"] = {
				["forceEvents"] = true,
			},
			["version"] = 8,
			["subRegions"] = {
				{
					["type"] = "subforeground",
				}, -- [1]
				{
					["type"] = "subbackground",
				}, -- [2]
				{
					["text_shadowXOffset"] = 2,
					["text_text_format_1.speedtext_format"] = "none",
					["text_text"] = "%1.speedtext",
					["anchorXOffset"] = 0,
					["text_text_format_.speedtext_format"] = "none",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_n_format"] = "none",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_format"] = "Number",
					["text_text_format_p_decimal_precision"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Accidental Presidency",
					["text_fontType"] = "None",
					["text_anchorYOffset"] = 0.5,
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_LEFT",
					["text_text_format_p_time_format"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0, -- [4]
					},
					["text_fontSize"] = 18,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_round_type"] = "floor",
				}, -- [3]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_1.speedtext_format"] = "none",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_fontSize"] = 18,
					["anchorXOffset"] = 0,
					["text_text_format_p_round_type"] = "floor",
					["text_text_format_n_format"] = "none",
					["text_text_format_.speedtext_format"] = "none",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["type"] = "subtext",
					["text_anchorXOffset"] = 1,
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0.5,
					["text_visible"] = false,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_shadowXOffset"] = 2,
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_text_format_p_time_format"] = 0,
					["text_text_format_1.angle_format"] = "none",
					["text_text"] = "%1.angle",
					["text_text_format_p_format"] = "Number",
					["text_text_format_1.angle_decimal_precision"] = 1,
				}, -- [4]
				{
					["border_size"] = 10,
					["border_anchor"] = "bar",
					["border_offset"] = 2,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Drop Shadow",
					["type"] = "subborder",
				}, -- [5]
				{
					["border_size"] = 13,
					["border_anchor"] = "bar",
					["border_offset"] = 2,
					["border_color"] = {
						1, -- [1]
						0.8666667342185974, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["type"] = "subborder",
				}, -- [6]
				{
					["tick_blend_mode"] = "ADD",
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["automatic_length"] = true,
					["tick_thickness"] = 2,
					["tick_placement_mode"] = "AtValue",
					["use_texture"] = false,
					["tick_color"] = {
						1, -- [1]
						0.8156863451004, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_placement"] = "60",
					["tick_length"] = 30,
					["tick_mirror"] = false,
					["type"] = "subtick",
				}, -- [7]
			},
			["height"] = 20,
			["adjustedMax"] = "100",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["fontSize"] = 12,
			["source"] = "import",
			["config"] = {
				["speedshow"] = false,
				["speedshowunits"] = false,
				["showthrillcolor"] = false,
			},
			["displayText_format_p_time_mod_rate"] = true,
			["uid"] = "med64FuRb0g",
			["displayText"] = "Pitch: %p",
			["anchorFrameFrame"] = "WeakAuras:Dragonriding UI Pitch",
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 0,
			["zoom"] = 0,
			["icon_side"] = "RIGHT",
			["sparkHidden"] = "NEVER",
			["sparkHeight"] = 30,
			["anchorFrameParent"] = true,
			["justify"] = "LEFT",
			["internalVersion"] = 64,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "---- Parameters ----\n\nlocal mountEvents = {\n    [\"PLAYER_MOUNT_DISPLAY_CHANGED\"] = true,\n    [\"MOUNT_JOURNAL_USABILITY_CHANGED\"] = true,\n    [\"LEARNED_SPELL_IN_TAB\"] = true,\n}\n\nlocal ascentSpell = 372610\nlocal thrillBuff = 377234\nlocal thrillSpeed = 60\nlocal maxSamples = 5\nlocal ascentDuration = 3.5\nlocal ascentBoostMax = 35\nlocal pollRate = 1 / 10\nlocal updatePeriod = 1 / 10\nlocal showSpeed = aura_env.config.speedshow\nlocal changeColor = aura_env.config.showthrillcolor\nlocal lastAngleTime = 0\n\nlocal speedTextTypeAir = aura_env.config.speedtype == 1\nlocal speedTextFormat, speedTextFactor = \"\", 1\nif aura_env.config.speedunits == 1 then\n    speedTextFormat = aura_env.config.speedshowunits and \"%.1fyd/s\" or \"%.1f\"\nelse\n    speedTextFormat = aura_env.config.speedshowunits and \"%.0f%%\" or \"%.0f\"\n    speedTextFactor = 100 / 7\nend\n\n---- Variables ----\n\nlocal active = false\nlocal updateHandle = nil\nlocal ascentStart = 0\nlocal lastX, lastY, lastT = 0, 0, 0\nlocal samples = 0\nlocal skipped = false\nlocal angle = 0\nlocal smoothSpeed, smoothGSpeed, lastSpeed = 0, 0, 0\n\n---- Localized functions ----\n\nlocal ScanEvents = WeakAuras.ScanEvents\nlocal GetTime = GetTime\nlocal After = C_Timer.After\nlocal GetBestMapForUnit = C_Map.GetBestMapForUnit\nlocal GetPlayerMapPosition = C_Map.GetPlayerMapPosition\nlocal GetMapWorldSize = C_Map.GetMapWorldSize\n\n---- Trigger 1 ----\n\n-- Events:\n--   PLAYER_MOUNT_DISPLAY_CHANGED\n--   MOUNT_JOURNAL_USABILITY_CHANGED\n--   LEARNED_SPELL_IN_TAB\n--   UNIT_SPELLCAST_SUCCEEDED:player\n--   DMUI_DRAGONRIDING_UPDATE\n--   VEHICLE_ANGLE_UPDATE\n\nlocal function setActive(allstates, state)\n    active = state\n    After(0, function()\n            ScanEvents(\"DMUI_DRAGONRIDING_SHOW\", state)\n    end)\n    \n    if active then\n        if not updateHandle then\n            updateHandle = C_Timer.NewTicker(pollRate, function()\n                    if active then\n                        ScanEvents(\"DMUI_DRAGONRIDING_UPDATE\", true)\n                    end\n            end)\n        end\n        \n        if not allstates[\"\"] then\n            allstates[\"\"] = {\n                show = true,\n                changed = true,\n                progressType = \"static\",\n                value = 0,\n                accel = 0,\n                total = 100,\n                boosting = false,\n                thrill = false,\n                speedtext = \"\",\n                angle = \"\",\n            }\n            return true\n        end\n    else\n        if updateHandle then\n            updateHandle:Cancel()\n            updateHandle = nil\n        end\n        \n        if allstates[\"\"] then\n            allstates[\"\"].show = false\n            allstates[\"\"].changed = true\n            return true\n        end\n    end\nend\n\naura_env.trigger1 = function(allstates, event, _, newAngle, spellId)\n    \n    if event ~= \"DMUI_DRAGONRIDING_UDPATE\" then\n        \n        -- Detect dragonriding pitch\n        -- if event == \"VEHICLE_ANGLE_UPDATE\" and newAngle then\n        --     angle = newAngle\n        --     lastAngleTime = GetTime()\n        --     return false\n        -- end\n        \n        -- Ensure ticker is stopped on opening WA options\n        if event == \"OPTIONS\" then\n            return setActive(allstates, false)\n        end\n        \n        -- Detect dragonriding start/end\n        if mountEvents[event] then\n            if IsMounted() then\n                for _, mountId in ipairs(C_MountJournal.GetCollectedDragonridingMounts()) do\n                    if select(4, C_MountJournal.GetMountInfoByID(mountId)) then\n                        return setActive(allstates, true)\n                    end\n                end\n            end\n            return setActive(allstates, false)\n        end\n        \n        -- Detect ascent boost\n        if event == \"UNIT_SPELLCAST_SUCCEEDED\" then\n            if spellId == ascentSpell then\n                ascentStart = GetTime()\n            end\n            return false\n        end\n    end\n    \n    local time = GetTime()\n    \n    -- Delta time\n    local dt = time - lastT\n    if dt < updatePeriod then\n        -- Rate limit speed updates!\n        return false\n    end\n    lastT = time\n    \n    if not allstates or not allstates[\"\"] then return false end\n    \n    -- Force pitch updates at regular intervals if enabled\n    if forceAngle and IsFlying() and lastAngleTime < GetTime() - 0.05 then\n        VehicleAimDecrement()\n        VehicleAimIncrement()\n    end\n    \n    -- Compute accurate speed if possible\n    local instanced = true\n    local speed, groundSpeed = 0, 0\n    local map = GetBestMapForUnit(\"player\")\n    if map then\n        local position = GetPlayerMapPosition(map, \"player\")\n        if position then\n            instanced = false\n            \n            -- Delta position\n            local x, y = position.x, position.y\n            local w, h = GetMapWorldSize(map)\n            x = x * w\n            y = y * h\n            local dx = x - lastX\n            local dy = y - lastY\n            lastX = x\n            lastY = y\n            \n            -- Compute horizontal speed and adjust for pitch\n            groundSpeed = math.sqrt(dx * dx + dy * dy) / dt\n            if groundSpeed > 0 then\n                local cosTheta = math.cos(math.abs(angle))\n                if cosTheta > 0 then\n                    speed = groundSpeed / cosTheta\n                end\n            end\n        end\n    end\n    \n    -- Ignore obviously invalid speeds that occur when jumping zones\n    if speed > 150 then\n        return false\n    end\n    \n    -- If speed can't be detected, reduce exp-avg window size\n    if speed == 0 then\n        samples = math.min(1, samples)\n    end\n    \n    local thrill = C_UnitAuras.GetPlayerAuraBySpellID(thrillBuff)\n    \n    -- Override with ascent boost\n    local boosting = false\n    if thrill and time < ascentStart + ascentDuration then\n        boosting = true\n        local progress = (time - ascentStart) / ascentDuration\n        local boost = thrillSpeed + (1 - progress) * ascentBoostMax\n        if speed < boost then\n            speed = boost\n            samples = 0\n            skipped = true\n        end\n    end\n    \n    -- Override speed based on Thrill buff\n    if speed < thrillSpeed and thrill then\n        speed = thrillSpeed\n    end\n    \n    if speed > thrillSpeed and not thrill then\n        speed = thrillSpeed\n        samples = 0\n        skipped = true\n    end\n    \n    -- Skip sampling on large apparent speed changes\n    if math.abs(speed - smoothSpeed) > 100 then\n        if skipped then\n            samples = 0\n        else\n            skipped = true\n            return false\n        end\n    end\n    skipped = false\n    \n    -- Compute smooth speed\n    samples = math.min(maxSamples, samples + 1)\n    local lastWeight = (samples - 1) / samples\n    local newWeight = 1 / samples\n    smoothSpeed = smoothSpeed * lastWeight + speed * newWeight\n    smoothGSpeed = smoothGSpeed * lastWeight + groundSpeed * newWeight\n    lastSpeed = smoothSpeed\n    \n    -- Update display variables\n    local s = allstates[\"\"]\n    s.changed = true\n    s.value = smoothSpeed\n    s.boosting = boosting\n    if changeColor then\n        s.thrill = not not thrill\n    end\n    s.angle = showAngle and string.format(\"%.1f°\", angle * 57.29578) or \"\"\n    if showSpeed then\n        local speed = (speedTextTypeAir or instanced) and smoothSpeed or smoothGSpeed\n        s.speedtext = speed < 1 and \"\" or string.format(speedTextFormat, speed * speedTextFactor)\n    end\n    \n    return true\nend",
					["do_custom"] = true,
				},
				["finish"] = {
					["custom"] = "if aura_env.reshow then\n    EncounterBar:Show()\n    aura_env.reshow = false\nend",
					["do_custom"] = true,
				},
			},
			["semver"] = "1.0.7",
			["displayText_format_p_time_precision"] = 1,
			["id"] = "Dragonriding UI Speed",
			["icon"] = false,
			["frameStrata"] = 1,
			["width"] = 240,
			["displayText_format_p_time_format"] = 0,
			["sparkRotationMode"] = "AUTO",
			["inverse"] = false,
			["selfPoint"] = "BOTTOM",
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "thrill",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								1, -- [1]
								0.8117647767067, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["property"] = "barColor",
						}, -- [1]
					},
				}, -- [1]
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Secret Infusion"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Secret Infusion", -- [1]
						},
						["remaining_operator"] = ">",
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_absorbHealMode"] = true,
						["useExactSpellId"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_debuffClass"] = false,
						["useGroup_count"] = false,
						["use_totemNamePattern"] = false,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["spellName"] = 0,
						["use_tooltip"] = false,
						["use_genericShowOn"] = true,
						["matchesShowOn"] = "showOnActive",
						["ownOnly"] = true,
						["type"] = "aura2",
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["useName"] = true,
						["auraspellids"] = {
							"386276", -- [1]
						},
						["unevent"] = "timed",
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_unit"] = true,
						["use_absorbMode"] = true,
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["sourceUnit"] = "player",
						["subeventSuffix"] = "_CAST_SUCCESS",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_format"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_format"] = "timed",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["use_dragonriding"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["spellknown"] = 388491,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["width"] = 40,
			["frameStrata"] = 4,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["cooldownEdge"] = false,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 629483,
			["xOffset"] = 0,
			["authorOptions"] = {
			},
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["zoom"] = 0.3,
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Secret Infusion",
			["semver"] = "7.0.2",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["uid"] = "9sIpGlzyeHv",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = false,
			["desaturate"] = false,
		},
		["Bigicon"] = {
			["grow"] = "RIGHT",
			["controlledChildren"] = {
				"Raid Ability Timeline BigIcon", -- [1]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["wagoID"] = "NyseKq1Xo",
			["xOffset"] = -24,
			["preferToUpdate"] = false,
			["yOffset"] = -240,
			["gridType"] = "RD",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["rowSpace"] = 1,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["radius"] = 200,
			["selfPoint"] = "LEFT",
			["align"] = "CENTER",
			["gridWidth"] = 5,
			["borderInset"] = 1,
			["stagger"] = 0,
			["sortHybridTable"] = {
				["Raid Ability Timeline BigIcon"] = false,
			},
			["version"] = 55,
			["subRegions"] = {
			},
			["anchorPoint"] = "CENTER",
			["useLimit"] = false,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["parent"] = "Raid Ability Timeline",
			["source"] = "import",
			["rotation"] = 0,
			["scale"] = 1,
			["centerType"] = "LR",
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "dynamicgroup",
			["borderSize"] = 2,
			["limit"] = 5,
			["uid"] = "PpkAm2EPwEW",
			["animate"] = false,
			["constantFactor"] = "RADIUS",
			["sort"] = "none",
			["borderOffset"] = 4,
			["semver"] = "1.0.54",
			["tocversion"] = 100002,
			["id"] = "Bigicon",
			["space"] = 2,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["fullCircle"] = true,
			["config"] = {
			},
			["arcLength"] = 360,
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["internalVersion"] = 64,
		},
		["Inn"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "vVnrs5WY3",
			["parent"] = "Valdrakken Map Labels",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = 53.911193847656,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["duration"] = "1",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Conditions",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["spellIds"] = {
						},
						["events"] = "OPEN_WORLD_MAP, WORLD_MAP_UPDATE, QUEST_LOG_UPDATE",
						["custom"] = "function()\n    local mapID = WorldMapFrame:GetMapID()\n    if mapID == 2112 then -- Valdrakken\n        return true\n    else\n        return false\n    end\nend\n\n\n--2112 = Valdrakken\n--2112 = Valdrakken",
						["check"] = "update",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["font"] = "Expressway",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "2112",
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["xOffset"] = -331.40748596191,
			["anchorFrameFrame"] = "WorldMapFrame",
			["regionType"] = "text",
			["url"] = "",
			["authorOptions"] = {
			},
			["fixedWidth"] = 200,
			["displayText_format_p_time_precision"] = 1,
			["displayText"] = "Inn",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "Inn",
			["wordWrap"] = "WordWrap",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["shadowYOffset"] = -1,
			["uid"] = "ga6Yu2CqA2n",
			["justify"] = "CENTER",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 135,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["easeStrength"] = 3,
					["preset"] = "spiralandpulse",
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Thunder Focus Tea"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Thunder Focus Tea", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["useExactSpellId"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["useGroup_count"] = false,
						["use_absorbHealMode"] = true,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_tooltip"] = false,
						["use_absorbMode"] = true,
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["useName"] = true,
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["use_remaining"] = true,
						["subeventPrefix"] = "SPELL",
						["unevent"] = "timed",
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["auraspellids"] = {
							"120954", -- [1]
						},
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_totemNamePattern"] = false,
						["matchesShowOn"] = "showOnActive",
						["custom_hide"] = "timed",
						["sourceUnit"] = "player",
						["remaining_operator"] = ">",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "TOP",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = true,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["use_vehicleUi"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 116680,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["desaturate"] = false,
			["parent"] = "Monk - Buffs",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["xOffset"] = 0,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["uid"] = "G0QKhFhhyQu",
			["alpha"] = 1,
			["auto"] = false,
			["cooldownTextDisabled"] = false,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Thunder Focus Tea",
			["zoom"] = 0.3,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["frameStrata"] = 4,
			["config"] = {
			},
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["displayIcon"] = 611418,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["url"] = "",
		},
		["Shuffle"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Shuffle", -- [1]
						},
						["remaining_operator"] = ">",
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_absorbHealMode"] = true,
						["useExactSpellId"] = false,
						["fetchTooltip"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_debuffClass"] = false,
						["useGroup_count"] = false,
						["matchesShowOn"] = "showOnActive",
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["spellName"] = 0,
						["use_tooltip"] = false,
						["use_totemNamePattern"] = false,
						["use_genericShowOn"] = true,
						["use_totemName"] = false,
						["type"] = "aura2",
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["useName"] = true,
						["auraspellids"] = {
							"386963", -- [1]
						},
						["unevent"] = "timed",
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["ownOnly"] = true,
						["unit"] = "player",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["sourceUnit"] = "player",
						["subeventSuffix"] = "_CAST_SUCCESS",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_text_format_p_time_precision"] = 1,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["spellknown"] = 322120,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["zoom"] = 0.3,
			["stickyDuration"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 642416,
			["parent"] = "Monk - Buffs",
			["icon"] = true,
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["semver"] = "7.0.2",
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Shuffle",
			["url"] = "",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 4,
			["uid"] = "5s73hIjLwTB",
			["inverse"] = false,
			["xOffset"] = 0,
			["conditions"] = {
			},
			["cooldown"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Storm, Earth and Fire"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"137639", -- [1]
						},
						["ownOnly"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["use_debuffClass"] = false,
						["useGroup_count"] = false,
						["spellName"] = 0,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_unit"] = true,
						["use_tooltip"] = false,
						["use_totemName"] = false,
						["unit"] = "player",
						["matchesShowOn"] = "showOnActive",
						["type"] = "aura2",
						["useName"] = true,
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["use_remaining"] = true,
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["unevent"] = "timed",
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["useExactSpellId"] = false,
						["use_totemNamePattern"] = false,
						["remaining_operator"] = ">",
						["sourceUnit"] = "player",
						["use_genericShowOn"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_shadowXOffset"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["zoneIds"] = "",
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["use_vehicleUi"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 137639,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["url"] = "",
			["authorOptions"] = {
			},
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["uid"] = "NAy75UL0eaW",
			["alpha"] = 1,
			["semver"] = "7.0.2",
			["zoom"] = 0.3,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Storm, Earth and Fire",
			["cooldownTextDisabled"] = false,
			["frameStrata"] = 4,
			["width"] = 40,
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 136038,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
		},
		["Touch of Death"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Monk - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Dance of Chi-Ji", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 322109,
						["use_absorbHealMode"] = true,
						["useExactSpellId"] = false,
						["event"] = "Action Usable",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["use_totemNamePattern"] = false,
						["use_debuffClass"] = false,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["custom_hide"] = "timed",
						["use_tooltip"] = false,
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["remaining_operator"] = ">",
						["use_genericShowOn"] = true,
						["type"] = "spell",
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["useName"] = true,
						["auraspellids"] = {
							"387184", -- [1]
						},
						["unevent"] = "timed",
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = "Touch of Death",
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["unit"] = "player",
						["use_absorbMode"] = true,
						["ownOnly"] = true,
						["sourceUnit"] = "player",
						["useGroup_count"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%c",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_format"] = 0,
					["anchorXOffset"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["type"] = "subtext",
					["text_text_format_p_time_precision"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_anchorYOffset"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_c_format"] = "none",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = true,
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
						[270] = true,
						[268] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["spellknown"] = 322109,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["zoom"] = 0.3,
			["icon"] = true,
			["desaturate"] = false,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 606552,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["semver"] = "7.0.2",
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Touch of Death",
			["url"] = "",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 4,
			["uid"] = "DKipnUj4Fhq",
			["inverse"] = false,
			["xOffset"] = 0,
			["conditions"] = {
			},
			["cooldown"] = false,
			["authorOptions"] = {
			},
		},
		["Info Displays"] = {
			["controlledChildren"] = {
				"Clock", -- [1]
				"FPS/MS", -- [2]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = -640,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 64,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["desc"] = "Time/FPS-MS Display",
			["version"] = 1,
			["load"] = {
				["use_class"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 0.85,
			["border"] = false,
			["borderEdge"] = "None",
			["regionType"] = "group",
			["borderSize"] = 16,
			["borderOffset"] = 5,
			["semver"] = "1.0.0",
			["borderInset"] = 11,
			["id"] = "Info Displays",
			["authorOptions"] = {
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["selfPoint"] = "BOTTOMLEFT",
			["uid"] = "50TrgisYDvM",
			["config"] = {
			},
			["parent"] = "PanzaUI - Utilities",
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
				["forceEvents"] = true,
				["groupOffset"] = true,
			},
			["groupIcon"] = 878230,
		},
		["Earth Elemental"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Shaman - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "198103",
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["custom"] = "function(states, event, ...)\n    if event == \"OPTIONS\" then\n        states[\"\"] = {\n            icon = 136024,\n            duration = 60,\n            expirationTime = GetTime() + 60,\n            progressType = \"timed\",\n            autoHide = true,\n            changed = true,\n            show = true,\n        }\n        return true\n    end\n    \n    local unit = ...\n    if unit == \"player\" then\n        local GUID = UnitGUID(\"pet\")\n        if GUID then\n            local pet = select(6, strsplit(\"-\", GUID))\n            if pet == \"61056\" then\n                local duration = GetPetTimeRemaining()\n                if duration then\n                    states[\"\"] = {\n                        icon = 136024,\n                        duration = duration/1000,\n                        expirationTime = GetTime() + duration/1000,\n                        progressType = \"timed\",\n                        autoHide = true,\n                        changed = true,\n                        show = true,\n                    }\n                    return true\n                end\n            end\n        elseif states[\"\"] then\n            states[\"\"].show = false\n            states[\"\"].changed = true\n            return true\n        end\n    end\nend\n\n\n\n\n\n\n",
						["duration"] = "60",
						["unit"] = "player",
						["sourceUnit"] = "player",
						["subeventPrefix"] = "SPELL",
						["spellName"] = "Earth Elemental",
						["debuffType"] = "HELPFUL",
						["ownOnly"] = true,
						["type"] = "combatlog",
						["use_absorbHealMode"] = true,
						["auraspellids"] = {
							"381755", -- [1]
						},
						["subeventSuffix"] = "_CAST_SUCCESS",
						["use_spellId"] = false,
						["event"] = "Combat Log",
						["useExactSpellId"] = true,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["use_genericShowOn"] = true,
						["use_unit"] = true,
						["use_track"] = true,
						["useRem"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_shadowXOffset"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_talent"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = true,
				["use_exact_spellknown"] = false,
				["role"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[397251] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 198103,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["selfPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["authorOptions"] = {
			},
			["xOffset"] = 0,
			["uid"] = "SWUUhi6J6eE",
			["alpha"] = 1,
			["semver"] = "7.0.2",
			["zoom"] = 0.3,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Earth Elemental",
			["cooldownTextDisabled"] = false,
			["frameStrata"] = 4,
			["width"] = 40,
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 136024,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["desaturate"] = false,
		},
		["Mouse"] = {
			["controlledChildren"] = {
				"Cursor", -- [1]
				"Global Cooldown Tracker", -- [2]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = 0,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["subRegions"] = {
			},
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["borderInset"] = 1,
			["id"] = "Mouse",
			["uid"] = "sRFEeIKaIk6",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["parent"] = "PanzaUI - Utilities",
			["config"] = {
			},
			["authorOptions"] = {
			},
			["groupIcon"] = 647701,
			["conditions"] = {
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
		},
		["Master of the Elements"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"260734", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["useExactSpellId"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["useGroup_count"] = false,
						["use_totemNamePattern"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["use_absorbHealMode"] = true,
						["use_tooltip"] = false,
						["remaining_operator"] = ">",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_genericShowOn"] = true,
						["use_remaining"] = true,
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
						["totemType"] = 1,
						["useName"] = true,
						["unevent"] = "timed",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["subeventPrefix"] = "SPELL",
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["custom_hide"] = "timed",
						["use_unit"] = true,
						["use_absorbMode"] = true,
						["sourceUnit"] = "player",
						["ownOnly"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_format"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_format"] = "timed",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["glow"] = true,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_talent"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
						[16166] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 205523,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["width"] = 40,
			["useCooldownModRate"] = true,
			["icon"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 136027,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["stickyDuration"] = false,
			["config"] = {
			},
			["frameStrata"] = 4,
			["cooldownTextDisabled"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Master of the Elements",
			["auto"] = false,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["parent"] = "Shaman - Buffs",
			["uid"] = "TJKeh4ZiLvH",
			["inverse"] = false,
			["xOffset"] = 0,
			["conditions"] = {
			},
			["cooldown"] = false,
			["url"] = "",
		},
		["Thunderfist"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"393565", -- [1]
						},
						["remaining_operator"] = ">",
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["stacksOperator"] = ">=",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["matchesShowOn"] = "showOnActive",
						["useExactSpellId"] = false,
						["useGroup_count"] = false,
						["useStacks"] = true,
						["use_totemNamePattern"] = false,
						["spellName"] = 0,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["unit"] = "player",
						["stacks"] = "1",
						["use_genericShowOn"] = true,
						["use_unit"] = true,
						["ownOnly"] = true,
						["totemType"] = 1,
						["debuffType"] = "HELPFUL",
						["buffShowOn"] = "showOnActive",
						["duration"] = "25",
						["useName"] = true,
						["auraspellids"] = {
							"387184", -- [1]
						},
						["unevent"] = "timed",
						["subeventPrefix"] = "SPELL",
						["type"] = "aura2",
						["use_remaining"] = true,
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["use_tooltip"] = false,
						["use_absorbMode"] = true,
						["use_absorbHealMode"] = true,
						["sourceUnit"] = "player",
						["use_debuffClass"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_text_format_p_time_precision"] = 1,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
				}, -- [2]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_format"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "BOTTOM",
					["anchorYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = true,
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["spellknown"] = 393565,
				["role"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["width"] = 40,
			["zoom"] = 0.3,
			["stickyDuration"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 1282595,
			["parent"] = "Monk - Buffs",
			["icon"] = true,
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["semver"] = "7.0.2",
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Thunderfist",
			["url"] = "",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 4,
			["uid"] = "WaiV)MFl4tR",
			["inverse"] = false,
			["xOffset"] = 0,
			["conditions"] = {
			},
			["cooldown"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Bank"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "vVnrs5WY3",
			["parent"] = "Valdrakken Map Labels",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = -66.303649902344,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_alwaystrue"] = true,
						["duration"] = "1",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["custom_type"] = "event",
						["event"] = "Conditions",
						["unit"] = "player",
						["use_absorbMode"] = true,
						["spellIds"] = {
						},
						["events"] = "OPEN_WORLD_MAP, WORLD_MAP_UPDATE, QUEST_LOG_UPDATE",
						["custom"] = "function()\n    local mapID = WorldMapFrame:GetMapID()\n    if mapID == 2112 then -- Valdrakken\n        return true\n    else\n        return false\n    end\nend\n\n\n--2112 = Valdrakken\n--2112 = Valdrakken",
						["check"] = "update",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 64,
			["selfPoint"] = "CENTER",
			["font"] = "Expressway",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zoneIds"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "2112",
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["xOffset"] = -81.800262451172,
			["anchorFrameFrame"] = "WorldMapFrame",
			["regionType"] = "text",
			["url"] = "",
			["authorOptions"] = {
			},
			["fixedWidth"] = 200,
			["displayText_format_p_time_precision"] = 1,
			["displayText"] = "Bank",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["semver"] = "1.0.1",
			["tocversion"] = 100002,
			["id"] = "Bank",
			["wordWrap"] = "WordWrap",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["shadowYOffset"] = -1,
			["uid"] = "vq7I3O0keaz",
			["justify"] = "CENTER",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 135,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["easeStrength"] = 3,
					["preset"] = "spiralandpulse",
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Raid Ability Timeline"] = {
			["controlledChildren"] = {
				"Raid Ability Timeline Icon", -- [1]
				"Raid Ability Timeline Backdrop ElvUI", -- [2]
				"Bigicon", -- [3]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["wagoID"] = "NyseKq1Xo",
			["xOffset"] = 400,
			["preferToUpdate"] = false,
			["yOffset"] = 240,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["use_alwaystrue"] = false,
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Conditions",
						["unit"] = "player",
						["spellIds"] = {
						},
						["debuffType"] = "HELPFUL",
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["buffShowOn"] = "showOnActive",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desc"] = "",
			["version"] = 55,
			["subRegions"] = {
			},
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["affixes"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_class"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "None",
			["regionType"] = "group",
			["borderSize"] = 16,
			["uid"] = "rsF)xvpdH)S",
			["borderOffset"] = 5,
			["semver"] = "1.0.54",
			["tocversion"] = 100002,
			["id"] = "Raid Ability Timeline",
			["parent"] = "PanzaUI - Utilities",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["groupIcon"] = 134376,
			["borderInset"] = 11,
			["config"] = {
			},
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
				["forceEvents"] = true,
				["groupOffset"] = true,
			},
			["selfPoint"] = "BOTTOMLEFT",
		},
		["Jeeves up!"] = {
			["iconSource"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = true,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
					["glow_frame_type"] = "UNITFRAME",
					["do_glow"] = false,
					["glow_action"] = "show",
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_unit"] = true,
						["ownOnly"] = true,
						["use_afk"] = true,
						["auranames"] = {
							"152173", -- [1]
						},
						["names"] = {
						},
						["use_charges"] = false,
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "SPELL",
						["use_genericShowOn"] = true,
						["custom_hide"] = "custom",
						["spellIds"] = {
						},
						["use_spellName"] = false,
						["debuffType"] = "HELPFUL",
						["type"] = "combatlog",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["spellName"] = 58875,
						["charges_operator"] = "<",
						["useName"] = true,
						["use_absorbHealMode"] = true,
						["custom_type"] = "event",
						["unit"] = "player",
						["spellId"] = "67826",
						["event"] = "Combat Log",
						["use_exact_spellName"] = true,
						["realSpellName"] = 58875,
						["use_spellId"] = true,
						["events"] = "PLAYER_DEAD,UPDATE_INVENTORY_DURABILITY,PLAYER_ENTERING_WORLD",
						["charges"] = "1",
						["check"] = "event",
						["use_absorbMode"] = true,
						["use_track"] = true,
						["duration"] = "5",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 18,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "LEFT",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_text_format_p_abbreviate_max"] = 8,
					["type"] = "subtext",
					["text_anchorXOffset"] = 10,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["text_text_format_c_format"] = "none",
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_color"] = true,
					["text_text_format_p_gcd_cast"] = false,
					["text_text"] = "Jeeves up!",
					["text_anchorPoint"] = "OUTER_RIGHT",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowXOffset"] = 0,
					["text_text_format_p_time_mod_rate"] = true,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["border_size"] = 18,
					["border_offset"] = 4,
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["type"] = "subborder",
				}, -- [4]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_spellknown"] = false,
				["use_vehicleUi"] = false,
				["use_ingroup"] = false,
				["use_exact_spellknown"] = false,
				["spellknown"] = 58875,
				["ingroup"] = {
					["multi"] = {
						["group"] = true,
						["raid"] = true,
					},
				},
			},
			["source"] = "import",
			["icon"] = true,
			["xOffset"] = 0,
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["url"] = "",
			["authorOptions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["alpha"] = 1,
			["zoom"] = 0.1,
			["anchorFrameType"] = "SELECTFRAME",
			["tocversion"] = 100002,
			["id"] = "Jeeves up!",
			["frameStrata"] = 1,
			["useCooldownModRate"] = true,
			["width"] = 30,
			["cooldownTextDisabled"] = true,
			["uid"] = "c89XkS8sYm1",
			["inverse"] = false,
			["parent"] = "Alerts",
			["displayIcon"] = 254097,
			["cooldown"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "alphaPulse",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
			},
		},
		["Invoke Chi-Ji by Gift of the Celestials"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "325197",
						["auranames"] = {
							"120954", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Combat Log",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["useGroup_count"] = false,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["use_tooltip"] = false,
						["use_totemNamePattern"] = false,
						["duration"] = "12",
						["debuffType"] = "HELPFUL",
						["buffShowOn"] = "showOnActive",
						["custom_hide"] = "timed",
						["type"] = "combatlog",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["auraspellids"] = {
							"243435", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["remaining_operator"] = ">",
						["totemName"] = "123904",
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = false,
						["spellIds"] = {
							120954, -- [1]
						},
						["unevent"] = "timed",
						["use_remaining"] = true,
						["useExactSpellId"] = true,
						["sourceUnit"] = "player",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_text_format_p_time_precision"] = 1,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_talent"] = false,
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
						[388212] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_petbattle"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["spellknown"] = 325197,
				["use_dragonriding"] = false,
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["cooldownEdge"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["parent"] = "Monk - Buffs",
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["uid"] = "SAgyVhmDX1Z",
			["alpha"] = 1,
			["semver"] = "7.0.2",
			["zoom"] = 0.3,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Invoke Chi-Ji by Gift of the Celestials",
			["cooldownTextDisabled"] = false,
			["frameStrata"] = 4,
			["width"] = 40,
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["displayIcon"] = 877514,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
		},
		["Invoke Xuen, the White Tiger"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "123904",
						["auranames"] = {
							"120954", -- [1]
						},
						["remaining_operator"] = ">",
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Combat Log",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["useGroup_count"] = false,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["use_tooltip"] = false,
						["useExactSpellId"] = true,
						["duration"] = "20",
						["custom_hide"] = "timed",
						["debuffType"] = "HELPFUL",
						["use_remaining"] = true,
						["type"] = "combatlog",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["unevent"] = "timed",
						["use_genericShowOn"] = true,
						["auraspellids"] = {
							"243435", -- [1]
						},
						["totemType"] = 1,
						["totemName"] = "123904",
						["realSpellName"] = 0,
						["use_spellName"] = false,
						["spellIds"] = {
							120954, -- [1]
						},
						["subeventPrefix"] = "SPELL",
						["buffShowOn"] = "showOnActive",
						["matchesShowOn"] = "showOnActive",
						["sourceUnit"] = "player",
						["use_totemNamePattern"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_precision"] = 1,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_text_format_p_format"] = "timed",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_shadowXOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [2]
			},
			["height"] = 27.7,
			["load"] = {
				["use_petbattle"] = false,
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = true,
				["zoneIds"] = "",
				["size"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["use_combat"] = true,
				["spellknown"] = 123904,
				["role"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["width"] = 40,
			["useCooldownModRate"] = true,
			["icon"] = true,
			["authorOptions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 620832,
			["stickyDuration"] = false,
			["parent"] = "Monk - Buffs",
			["config"] = {
			},
			["frameStrata"] = 4,
			["cooldownTextDisabled"] = false,
			["zoom"] = 0.3,
			["semver"] = "7.0.2",
			["tocversion"] = 100002,
			["id"] = "Invoke Xuen, the White Tiger",
			["auto"] = false,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 0,
			["uid"] = "dPsppK54(4u",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["conditions"] = {
			},
			["cooldown"] = false,
			["cooldownEdge"] = false,
		},
		["Heal - Essence Font"] = {
			["iconSource"] = -1,
			["parent"] = "Monk - Healer",
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = true,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["use_charges"] = false,
						["genericShowOn"] = "showOnReady",
						["names"] = {
						},
						["spellName"] = 191837,
						["charges_operator"] = ">",
						["charges"] = "0",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 191837,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_genericShowOn"] = true,
						["subeventPrefix"] = "SPELL",
						["type"] = "spell",
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "bounceDecay",
					["easeStrength"] = 3,
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "TOPLEFT",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorYOffset"] = 0,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = 2,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "CENTER",
					["text_text_format_p_format"] = "timed",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 12,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_1.charges_format"] = "none",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 30,
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["single"] = 270,
					["multi"] = {
						[270] = true,
					},
				},
				["talent"] = {
					["single"] = 17,
					["multi"] = {
						[191837] = true,
					},
				},
				["use_vehicle"] = false,
				["use_class_and_spec"] = true,
				["use_talent"] = false,
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[2] = true,
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["xOffset"] = 0,
			["authorOptions"] = {
			},
			["regionType"] = "icon",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
					["do_glow"] = false,
					["glow_frame_type"] = "UNITFRAME",
					["glow_action"] = "show",
				},
				["init"] = {
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["uid"] = "JBehBem1guJ",
			["useCooldownModRate"] = true,
			["cooldownTextDisabled"] = true,
			["width"] = 30,
			["tocversion"] = 100002,
			["id"] = "Heal - Essence Font",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0.1,
			["config"] = {
			},
			["inverse"] = true,
			["selfPoint"] = "CENTER",
			["displayIcon"] = 1360978,
			["cooldown"] = false,
			["url"] = "",
		},
		["Summon Stone up!"] = {
			["iconSource"] = 0,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "LEFT",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = true,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "698",
						["use_genericShowOn"] = true,
						["use_afk"] = true,
						["auranames"] = {
							"152173", -- [1]
						},
						["unit"] = "player",
						["use_charges"] = false,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["use_unit"] = true,
						["spellName"] = 58875,
						["spellIds"] = {
						},
						["use_spellName"] = false,
						["custom_hide"] = "custom",
						["useName"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["debuffType"] = "HELPFUL",
						["charges_operator"] = "<",
						["charges"] = "1",
						["use_absorbHealMode"] = true,
						["custom_type"] = "event",
						["duration"] = "5",
						["ownOnly"] = true,
						["event"] = "Combat Log",
						["use_exact_spellName"] = true,
						["realSpellName"] = 58875,
						["use_spellId"] = true,
						["events"] = "PLAYER_DEAD,UPDATE_INVENTORY_DURABILITY,PLAYER_ENTERING_WORLD",
						["type"] = "combatlog",
						["check"] = "event",
						["subeventPrefix"] = "SPELL",
						["use_track"] = true,
						["use_absorbMode"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["easeStrength"] = 3,
				},
				["main"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "alphaPulse",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
					["text_text_format_p_realm_name"] = "never",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["rotateText"] = "NONE",
					["text_text_format_p_decimal_precision"] = 1,
					["text_text_format_p_gcd_gcd"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_p_gcd_channel"] = false,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_gcd_hide_zero"] = false,
					["text_fontSize"] = 18,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "LEFT",
					["text_automaticWidth"] = "Auto",
					["anchorYOffset"] = 0,
					["text_text_format_p_abbreviate_max"] = 8,
					["text_justify"] = "CENTER",
					["type"] = "subtext",
					["text_anchorXOffset"] = 10,
					["text_text_format_1.charges_format"] = "none",
					["text_font"] = "Expressway",
					["text_text_format_p_time_legacy_floor"] = true,
					["text_text_format_p_abbreviate"] = false,
					["text_text_format_p_color"] = true,
					["text_text_format_p_gcd_cast"] = false,
					["text_text"] = "Summon Stone up!",
					["text_anchorPoint"] = "OUTER_RIGHT",
					["text_text_format_p_time_format"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_time_mod_rate"] = true,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["border_offset"] = 4,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.5137255191802979, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Blizzard Tooltip",
					["border_size"] = 18,
				}, -- [4]
			},
			["height"] = 30,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
						["group"] = true,
						["raid"] = true,
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_dragonriding"] = false,
				["use_spec"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 269,
					["multi"] = {
						[263] = true,
						[264] = true,
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 18,
					["multi"] = {
						[386965] = true,
						[152173] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["use_spellknown"] = false,
				["use_vehicleUi"] = false,
				["use_petbattle"] = false,
				["use_exact_spellknown"] = false,
				["spellknown"] = 58875,
				["use_ingroup"] = false,
			},
			["source"] = "import",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["xOffset"] = 0,
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["url"] = "",
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
				},
				["finish"] = {
					["glow_frame_type"] = "UNITFRAME",
					["do_glow"] = false,
					["glow_action"] = "show",
				},
				["init"] = {
				},
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["config"] = {
			},
			["frameStrata"] = 1,
			["zoom"] = 0.1,
			["anchorFrameType"] = "SELECTFRAME",
			["tocversion"] = 100002,
			["id"] = "Summon Stone up!",
			["useCooldownModRate"] = true,
			["alpha"] = 1,
			["width"] = 30,
			["cooldownTextDisabled"] = true,
			["uid"] = "0gcd0pprR8z",
			["inverse"] = false,
			["parent"] = "Alerts",
			["displayIcon"] = 136223,
			["cooldown"] = false,
			["selfPoint"] = "CENTER",
		},
		["Primordial Wave"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["parent"] = "Shaman - Buffs",
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"375986", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["custom_hide"] = "timed",
						["use_absorbHealMode"] = true,
						["useExactSpellId"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["useGroup_count"] = false,
						["use_totemNamePattern"] = false,
						["use_debuffClass"] = false,
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["matchesShowOn"] = "showOnActive",
						["use_tooltip"] = false,
						["use_totemName"] = false,
						["unit"] = "player",
						["ownOnly"] = true,
						["type"] = "aura2",
						["use_remaining"] = true,
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["useName"] = true,
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["unevent"] = "timed",
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["remaining_operator"] = ">",
						["spellName"] = 0,
						["sourceUnit"] = "player",
						["subeventSuffix"] = "_CAST_SUCCESS",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_text_format_p_time_precision"] = 1,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_format"] = 0,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["zoneIds"] = "",
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[262] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["use_vehicleUi"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 375982,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["url"] = "",
			["authorOptions"] = {
			},
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["desaturate"] = false,
			["icon"] = true,
			["uid"] = "OYngXAxPe0H",
			["alpha"] = 1,
			["semver"] = "7.0.2",
			["zoom"] = 0.3,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Primordial Wave",
			["cooldownTextDisabled"] = false,
			["frameStrata"] = 4,
			["width"] = 40,
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 3578231,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["xOffset"] = 0,
		},
		["Blackout Kick!"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "132578",
						["auranames"] = {
							"Blackout Kick!", -- [1]
						},
						["use_genericShowOn"] = true,
						["remaining"] = "0",
						["use_totemType"] = true,
						["spellName"] = 0,
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Cooldown Progress (Spell)",
						["use_spellId"] = true,
						["name"] = "Fortifying Brew",
						["use_sourceUnit"] = true,
						["combineMatches"] = "showLowest",
						["use_track"] = true,
						["ownOnly"] = true,
						["useGroup_count"] = false,
						["use_totemNamePattern"] = false,
						["use_totemName"] = false,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
							"Fortifying Brew", -- [1]
						},
						["use_absorbMode"] = true,
						["use_tooltip"] = false,
						["use_unit"] = true,
						["custom_hide"] = "timed",
						["matchesShowOn"] = "showOnActive",
						["use_remaining"] = true,
						["useName"] = true,
						["debuffType"] = "HELPFUL",
						["totemName"] = "123904",
						["type"] = "aura2",
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"387184", -- [1]
						},
						["duration"] = "25",
						["buffShowOn"] = "showOnActive",
						["unevent"] = "timed",
						["totemType"] = 1,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
							120954, -- [1]
						},
						["unit"] = "player",
						["remaining_operator"] = ">",
						["useExactSpellId"] = false,
						["sourceUnit"] = "player",
						["use_debuffClass"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 29,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_mod_rate"] = true,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Expressway",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "TOP",
					["text_visible"] = true,
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = true,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["use_dragonriding"] = false,
				["zoneIds"] = "",
				["use_class_and_spec"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[269] = true,
					},
				},
				["talent"] = {
					["single"] = 9,
					["multi"] = {
						[383695] = false,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
						true, -- [1]
						[3] = true,
					},
				},
				["use_petbattle"] = false,
				["use_vehicleUi"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spellknown"] = 205523,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["anchorFrameType"] = "SCREEN",
			["parent"] = "Monk - Buffs",
			["stickyDuration"] = false,
			["xOffset"] = 0,
			["cooldown"] = false,
			["regionType"] = "icon",
			["conditions"] = {
			},
			["url"] = "",
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "shrink",
				},
			},
			["uid"] = "(rGZQM)qwmd",
			["alpha"] = 1,
			["semver"] = "7.0.2",
			["zoom"] = 0.3,
			["auto"] = false,
			["tocversion"] = 100002,
			["id"] = "Blackout Kick!",
			["cooldownTextDisabled"] = false,
			["frameStrata"] = 4,
			["width"] = 40,
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["authorOptions"] = {
			},
			["displayIcon"] = 574575,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
		},
		["Maelstrom"] = {
			["iconSource"] = 0,
			["wagoID"] = "zGkglqspc",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["sound"] = " custom",
					["do_sound"] = false,
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["auranames"] = {
							"124275", -- [1]
						},
						["use_alwaystrue"] = true,
						["useGroup_count"] = false,
						["subeventPrefix"] = "SPELL",
						["matchesShowOn"] = "showAlways",
						["use_unit"] = true,
						["unit"] = "player",
						["spellName"] = 228260,
						["powertype"] = 11,
						["custom_hide"] = "timed",
						["buffShowOn"] = "showOnActive",
						["type"] = "unit",
						["subeventSuffix"] = "_CAST_START",
						["use_powertype"] = true,
						["debuffType"] = "HARMFUL",
						["unevent"] = "auto",
						["useName"] = true,
						["use_debuffClass"] = false,
						["power"] = "0",
						["power_operator"] = ">=",
						["fetchTooltip"] = true,
						["event"] = "Power",
						["use_showOn"] = true,
						["realSpellName"] = "Void Eruption",
						["use_spellName"] = true,
						["spellIds"] = {
							124273, -- [1]
							124275, -- [2]
							124274, -- [3]
						},
						["names"] = {
							"Heavy Stagger", -- [1]
							"Light Stagger", -- [2]
							"Moderate Stagger", -- [3]
						},
						["use_tooltip"] = false,
						["combineMatches"] = "showLowest",
						["ownOnly"] = true,
						["use_power"] = false,
					},
					["untrigger"] = {
						["showOn"] = "showAlways",
						["spellName"] = 228260,
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 64,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 26,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%1.power",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = false,
					["text_text_format_3.tooltip1_format"] = "none",
					["rotateText"] = "NONE",
					["text_text_format_tooltip1_format"] = "none",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_fontSize"] = 16,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_text_format_2.tooltip1_format"] = "none",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_text_format_1.tooltip1_decimal_precision"] = 0,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_text_format_1.tooltip3_format"] = "none",
					["type"] = "subtext",
					["text_text_format_1.tooltip2_format"] = "none",
					["text_shadowXOffset"] = 0,
					["text_font"] = "Expressway",
					["text_text_format_c_format"] = "none",
					["text_anchorYOffset"] = 0,
					["text_text_format_1.tooltip1_round_type"] = "round",
					["text_text_format_1.tooltip1_format"] = "Number",
					["text_text_format_p_time_precision"] = 1,
					["text_anchorPoint"] = "TOP",
					["text_text_format_p_time_mod_rate"] = true,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_text_format_power_format"] = "none",
					["text_text_format_1.power_format"] = "none",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glow"] = false,
					["glowXOffset"] = -0.5,
					["glowThickness"] = 1.5,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["glow"] = false,
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = -0.5,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = -0.5,
					["glowScale"] = 1,
					["glowThickness"] = 1.5,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 27.7,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["use_class_and_spec"] = false,
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["use_dragonriding"] = false,
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["talent"] = {
					["multi"] = {
						[115069] = true,
					},
				},
				["use_vehicle"] = false,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
						[3] = true,
					},
				},
				["class"] = {
					["single"] = "MONK",
					["multi"] = {
						["PRIEST"] = true,
					},
				},
				["use_petbattle"] = false,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class_and_spec"] = {
					["single"] = 268,
					["multi"] = {
						[262] = true,
					},
				},
				["zoneIds"] = "",
			},
			["source"] = "import",
			["width"] = 40,
			["frameStrata"] = 4,
			["parent"] = "Shaman - Buffs",
			["stickyDuration"] = false,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["regionType"] = "icon",
			["displayIcon"] = 237584,
			["icon"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["config"] = {
			},
			["useCooldownModRate"] = true,
			["xOffset"] = 0,
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 100005,
			["id"] = "Maelstrom",
			["semver"] = "3.1.1",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0.3,
			["uid"] = "BFd9sGHti01",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["check"] = {
						["op"] = "==",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "power",
								["value"] = "0",
								["op"] = "==",
							}, -- [1]
						},
						["trigger"] = 1,
						["variable"] = "power",
						["value"] = "0",
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "power",
						["value"] = "0",
						["op"] = ">",
					},
					["changes"] = {
						{
							["value"] = 237584,
							["property"] = "displayIcon",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "sub.2.text_visible",
						}, -- [2]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "percentpower",
						["op"] = ">=",
						["value"] = "90",
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.4.glow",
						}, -- [1]
					},
				}, -- [3]
			},
			["cooldown"] = false,
			["url"] = "",
		},
	},
	["login_squelch_time"] = 10,
	["lastArchiveClear"] = 1671574415,
	["minimap"] = {
		["hide"] = true,
	},
	["lastUpgrade"] = 1674489783,
	["personalRessourceDisplayFrame"] = {
	},
	["registered"] = {
	},
	["dbVersion"] = 64,
	["editor_font_size"] = 12,
	["editor_theme"] = "Monokai",
}
