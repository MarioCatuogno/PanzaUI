
ThreatPlatesDB = {
	["char"] = {
		["Sfilatino - Draenor"] = {
			["welcome"] = true,
			["spec"] = {
				nil, -- [1]
				nil, -- [2]
				true, -- [3]
				false, -- [4]
			},
		},
		["Panzarotto - Draenor"] = {
			["spec"] = {
				true, -- [1]
				[3] = false,
			},
			["welcome"] = true,
		},
		["Formaggino - Draenor"] = {
			["spec"] = {
				[3] = false,
			},
			["welcome"] = true,
		},
		["Friarielli - Draenor"] = {
			["welcome"] = true,
		},
	},
	["profileKeys"] = {
		["Sfilatino - Draenor"] = "PanzaUI",
		["Panzarotto - Draenor"] = "PanzaUI",
		["Formaggino - Draenor"] = "PanzaUI",
		["Friarielli - Draenor"] = "PanzaUI",
	},
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["global"] = {
		["version"] = "11.1.15",
	},
	["profiles"] = {
		["Bajheera - Sargeras"] = {
			["nameplate"] = {
				["toggle"] = {
					["TargetS"] = true,
					["TargetA"] = true,
				},
				["alpha"] = {
					["Target"] = 2,
					["NonTarget"] = 0.8499999999999999,
				},
				["scale"] = {
					["Minus"] = 1,
					["Tapped"] = 1,
					["Guardian"] = 1,
					["Totem"] = 0.9000000000000004,
					["Neutral"] = 1,
					["FriendlyPlayer"] = 1.5,
					["Pet"] = 1,
					["Target"] = 0.3500000000000003,
				},
			},
			["threat"] = {
				["ON"] = false,
			},
			["uniqueWidget"] = {
				["ON"] = false,
			},
			["HeadlineView"] = {
				["name"] = {
					["size"] = 12,
				},
				["useScaling"] = true,
			},
			["classWidget"] = {
				["ON"] = false,
			},
			["AuraWidget"] = {
				["Buffs"] = {
					["ShowDispellable"] = false,
					["ShowEnemy"] = false,
					["HideUnlimitedDuration"] = true,
					["ShowAllEnemy"] = true,
					["ModeBar"] = {
						["Enabled"] = true,
					},
					["AnchorTo"] = "Healthbar",
					["ShowOnEnemyNPCs"] = false,
					["HealthbarMode"] = {
						["Anchor"] = "RIGHT",
					},
				},
				["CrowdControl"] = {
					["NameMode"] = {
						["Anchor"] = "TOP",
						["HorizontalOffset"] = 0,
						["VerticalOffset"] = 35,
					},
					["HealthbarMode"] = {
						["Anchor"] = "TOP",
						["HorizontalOffset"] = 0,
						["VerticalOffset"] = 35,
					},
					["ModeIcon"] = {
						["Columns"] = 5,
						["MaxAuras"] = 5,
					},
					["ModeBar"] = {
						["BarHeight"] = 14,
					},
				},
				["Debuffs"] = {
					["ShowBlizzardForFriendly"] = false,
					["ShowBoss"] = false,
					["ModeBar"] = {
						["IconSpacing"] = 1,
					},
					["ShowAllFriendly"] = true,
					["ShowDispellable"] = false,
					["ShowFriendly"] = true,
					["ModeIcon"] = {
						["Style"] = "custom",
						["IconWidth"] = 20,
						["StackCount"] = {
							["VerticalOffset"] = 2,
						},
						["Duration"] = {
							["VerticalOffset"] = 0,
							["Font"] = {
								["HorizontalAlignment"] = "LEFT",
							},
						},
						["IconHeight"] = 18,
						["RowSpacing"] = 6,
					},
				},
			},
			["totemSettings"] = {
				["T2"] = {
					["Style"] = "special",
				},
				["E1"] = {
					["Style"] = "special",
				},
				["T1"] = {
					["Style"] = "special",
				},
				["T6"] = {
					["Name"] = "Mana Spring Totem",
				},
				["O1"] = {
					["Style"] = "special",
				},
				["R4"] = {
					["Style"] = "special",
				},
				["P5"] = {
					["Style"] = "special",
				},
				["P4"] = {
					["Style"] = "special",
				},
				["P2"] = {
					["Style"] = "special",
				},
				["B1"] = {
					["Style"] = "special",
				},
				["P1"] = {
					["Style"] = "special",
				},
			},
			["totemWidget"] = {
				["scale"] = 50,
			},
			["NamePlateFriendlyClickThrough"] = true,
			["FocusWidget"] = {
				["ON"] = false,
			},
			["settings"] = {
				["healthbar"] = {
					["height"] = 16,
					["width"] = 132,
				},
				["eliteicon"] = {
					["theme"] = "stddragon",
				},
				["name"] = {
					["flags"] = "OUTLINE",
					["y"] = 18,
				},
				["castbar"] = {
					["y"] = -20,
				},
				["frame"] = {
					["height"] = 59.925,
					["y"] = 12,
					["width"] = 170.8,
				},
				["level"] = {
					["show"] = false,
				},
				["skullicon"] = {
					["scale"] = 14,
				},
				["elitehealthborder"] = {
					["show"] = true,
				},
			},
			["Visibility"] = {
				["FriendlyPlayer"] = {
					["UseHeadlineView"] = true,
				},
				["FriendlyMinus"] = {
					["Show"] = false,
				},
			},
			["targetWidget"] = {
				["theme"] = "glow",
			},
		},
		["Default"] = {
			["settings"] = {
				["spellicon"] = {
					["y"] = -12,
					["x"] = 75,
				},
				["healthbar"] = {
					["height"] = 12,
					["TargetUnit"] = {
						["Font"] = {
							["Typeface"] = "Expressway",
						},
						["ShowOnlyInCombat"] = false,
						["ShowNotMyself"] = false,
					},
					["backdrop"] = "Solid",
					["texture"] = "Solid",
				},
				["castbar"] = {
					["CastTarget"] = {
						["Show"] = false,
					},
					["backdrop"] = "Solid",
					["texture"] = "Solid",
				},
				["threatborder"] = {
					["show"] = false,
				},
				["frame"] = {
					["y"] = -20,
					["height"] = 55.225,
					["width"] = 154,
				},
			},
			["Visibility"] = {
				["HideFriendlyInCombat"] = true,
				["NeutralMinus"] = {
					["Show"] = false,
				},
				["FriendlyPlayer"] = {
					["UseHeadlineView"] = true,
				},
				["FriendlyMinus"] = {
					["UseHeadlineView"] = true,
				},
				["FriendlyNPC"] = {
					["UseHeadlineView"] = true,
				},
			},
			["HeadlineView"] = {
				["ForceFriendlyInCombat"] = "NAME",
				["ShowFocusHighlight"] = false,
			},
			["Automation"] = {
				["FriendlyUnits"] = "HIDE_COMBAT",
			},
		},
		["Panzarotto - Draenor"] = {
			["nameplate"] = {
				["toggle"] = {
					["CastingEnemyUnitAlpha"] = true,
					["OccludedUnits"] = true,
					["TargetS"] = true,
				},
				["alpha"] = {
					["NonTarget"] = 0.2999999999999998,
					["OccludedUnits"] = 0.04999999999999993,
				},
			},
			["ResourceWidget"] = {
				["BarTexture"] = "Solid",
				["Font"] = "Expressway",
				["ShowText"] = false,
				["ShowBar"] = false,
			},
			["BlizzardSettings"] = {
				["Names"] = {
					["Font"] = {
						["Typeface"] = "Expressway",
					},
				},
			},
			["AuraWidget"] = {
				["Debuffs"] = {
					["FilterMode"] = "Allow",
					["FilterBySpell"] = {
						"Keg Smash", -- [1]
						"Breath of Fire", -- [2]
						"Bonedust Brew", -- [3]
						"Exploding Keg", -- [4]
						"Weapons of Order", -- [5]
						"", -- [6]
					},
					["ModeBar"] = {
						["BackgroundTexture"] = "Solid",
						["Label"] = {
							["Font"] = {
								["Typeface"] = "Expressway",
							},
						},
						["Texture"] = "Solid",
					},
					["ShowDispellable"] = false,
					["ModeIcon"] = {
						["Duration"] = {
							["Anchor"] = "TOP",
							["Font"] = {
								["Typeface"] = "Expressway",
								["HorizontalAlignment"] = "CENTER",
								["Size"] = 9,
							},
						},
						["Style"] = "custom",
						["IconWidth"] = 16,
						["StackCount"] = {
							["Anchor"] = "BOTTOM",
							["Font"] = {
								["Typeface"] = "Expressway",
								["HorizontalAlignment"] = "CENTER",
								["Size"] = 9,
							},
						},
						["Rows"] = 1,
						["IconHeight"] = 16,
						["MaxAuras"] = 5,
					},
				},
				["CrowdControl"] = {
					["ModeBar"] = {
						["BackgroundTexture"] = "Solid",
						["Label"] = {
							["Font"] = {
								["Typeface"] = "Expressway",
							},
						},
						["Texture"] = "Solid",
					},
					["ShowFriendly"] = false,
					["ModeIcon"] = {
						["Columns"] = 1,
						["IconWidth"] = 25,
						["StackCount"] = {
							["Anchor"] = "BOTTOM",
							["Font"] = {
								["Typeface"] = "Expressway",
								["Transparency"] = 0,
								["HorizontalAlignment"] = "CENTER",
							},
						},
						["Duration"] = {
							["Font"] = {
								["flags"] = "OUTLINE",
								["HorizontalAlignment"] = "CENTER",
								["Typeface"] = "Expressway",
								["Color"] = {
									["g"] = 0.05882353335618973,
								},
								["Size"] = 18,
							},
						},
						["Style"] = "custom",
						["IconHeight"] = 25,
					},
				},
				["Buffs"] = {
					["ShowUnlimitedInInstances"] = false,
					["HideUnlimitedDuration"] = true,
					["ShowUnlimitedInCombat"] = false,
					["ModeBar"] = {
						["BackgroundTexture"] = "Solid",
						["Label"] = {
							["Font"] = {
								["Typeface"] = "Expressway",
							},
						},
						["Texture"] = "Solid",
					},
					["ModeIcon"] = {
						["IconWidth"] = 20,
						["Duration"] = {
							["Anchor"] = "TOP",
							["Font"] = {
								["Typeface"] = "Expressway",
								["HorizontalAlignment"] = "CENTER",
								["Size"] = 9,
							},
						},
						["Style"] = "custom",
						["IconHeight"] = 20,
						["ColumnSpacing"] = 6,
						["Rows"] = 1,
						["StackCount"] = {
							["Anchor"] = "BOTTOM",
							["Font"] = {
								["Typeface"] = "Expressway",
								["HorizontalAlignment"] = "CENTER",
								["Size"] = 9,
							},
						},
						["MaxAuras"] = 5,
					},
					["ShowUnlimitedOnBosses"] = false,
					["ShowOnEnemyNPCs"] = false,
					["ShowUnlimitedAlways"] = true,
				},
				["ShowTargetOnly"] = true,
				["ShowOmniCC"] = false,
			},
			["totemWidget"] = {
				["ON"] = false,
			},
			["socialWidget"] = {
				["ShowFriendIcon"] = false,
				["ShowFactionIcon"] = false,
			},
			["targetWidget"] = {
				["theme"] = "threat_glow",
				["Size"] = 30,
			},
			["arenaWidget"] = {
				["ShowNumber"] = false,
				["ShowOrb"] = false,
			},
			["HeadlineView"] = {
				["ShowFocusHighlight"] = false,
				["FriendlySubtext"] = "ROLE",
			},
			["settings"] = {
				["customtext"] = {
					["typeface"] = "Expressway",
					["flags"] = "OUTLINE",
					["size"] = 8,
				},
				["healthbar"] = {
					["TargetUnit"] = {
						["ShowOnlyInCombat"] = false,
						["ShowNotMyself"] = false,
					},
					["backdrop"] = "Solid",
					["texture"] = "Solid",
				},
				["eliteicon"] = {
					["theme"] = "skullandcross",
					["x"] = 60,
				},
				["threatborder"] = {
					["show"] = false,
				},
				["skullicon"] = {
					["scale"] = 20,
					["x"] = 50,
					["show"] = false,
				},
				["spellicon"] = {
					["y"] = -20,
					["x"] = -55,
					["scale"] = 12,
				},
				["name"] = {
					["typeface"] = "Expressway",
					["flags"] = "OUTLINE",
					["AbbreviationForEnemyUnits"] = "INITIALS",
					["AbbreviationForFriendlyUnits"] = "INITIALS",
				},
				["spelltext"] = {
					["typeface"] = "Expressway",
					["flags"] = "OUTLINE",
				},
				["castbar"] = {
					["y"] = -20,
					["CastTimeText"] = {
						["HorizontalOffset"] = 0,
					},
					["SpellNameText"] = {
						["HorizontalOffset"] = 13,
					},
					["CastTarget"] = {
						["Show"] = false,
						["Font"] = {
							["Typeface"] = "Expressway",
						},
					},
					["backdrop"] = "Solid",
					["texture"] = "Solid",
				},
				["level"] = {
					["typeface"] = "Expressway",
					["flags"] = "OUTLINE",
					["size"] = 8,
				},
				["frame"] = {
					["y"] = -20,
					["height"] = 52.875,
					["width"] = 154,
				},
				["raidicon"] = {
					["scale"] = 22,
					["x"] = -60,
					["hpColor"] = false,
				},
			},
			["threat"] = {
				["ON"] = false,
			},
			["totemSettings"] = {
				["hideHealthbar"] = true,
			},
			["FocusWidget"] = {
				["ON"] = false,
			},
			["BossModsWidget"] = {
				["Font"] = "Expressway",
				["ShowInHeadlineView"] = false,
				["ON"] = false,
			},
			["Automation"] = {
				["FriendlyUnits"] = "HIDE_COMBAT",
			},
			["classWidget"] = {
				["ShowInHeadlineView"] = true,
				["theme"] = "clean",
			},
			["Visibility"] = {
				["FriendlyPlayer"] = {
					["UseHeadlineView"] = true,
				},
				["FriendlyMinus"] = {
					["UseHeadlineView"] = true,
				},
				["FriendlyNPC"] = {
					["UseHeadlineView"] = true,
				},
			},
			["ExperienceWidget"] = {
				["Texture"] = "Solid",
			},
		},
		["Panzarotto - Draenor (1)"] = {
			["nameplate"] = {
				["toggle"] = {
					["CastingEnemyUnitAlpha"] = true,
					["OccludedUnits"] = true,
					["TargetS"] = true,
				},
				["alpha"] = {
					["NonTarget"] = 0.2999999999999998,
					["OccludedUnits"] = 0.04999999999999993,
				},
			},
			["ResourceWidget"] = {
				["BarTexture"] = "Solid",
				["Font"] = "Expressway",
				["ShowText"] = false,
				["ShowBar"] = false,
			},
			["BlizzardSettings"] = {
				["Names"] = {
					["Font"] = {
						["Typeface"] = "Expressway",
					},
				},
			},
			["AuraWidget"] = {
				["Debuffs"] = {
					["FilterMode"] = "Allow",
					["ModeBar"] = {
						["BackgroundTexture"] = "Solid",
						["Label"] = {
							["Font"] = {
								["Typeface"] = "Expressway",
							},
						},
						["Texture"] = "Solid",
					},
					["ShowDispellable"] = false,
					["ModeIcon"] = {
						["Duration"] = {
							["Anchor"] = "TOP",
							["Font"] = {
								["Typeface"] = "Expressway",
								["HorizontalAlignment"] = "CENTER",
								["Size"] = 9,
							},
						},
						["Style"] = "custom",
						["IconWidth"] = 16,
						["StackCount"] = {
							["Anchor"] = "BOTTOM",
							["Font"] = {
								["Typeface"] = "Expressway",
								["HorizontalAlignment"] = "CENTER",
								["Size"] = 9,
							},
						},
						["Rows"] = 1,
						["IconHeight"] = 16,
						["MaxAuras"] = 5,
					},
				},
				["Buffs"] = {
					["ShowUnlimitedInInstances"] = false,
					["HideUnlimitedDuration"] = true,
					["ShowUnlimitedInCombat"] = false,
					["ModeBar"] = {
						["BackgroundTexture"] = "Solid",
						["Label"] = {
							["Font"] = {
								["Typeface"] = "Expressway",
							},
						},
						["Texture"] = "Solid",
					},
					["ShowUnlimitedAlways"] = true,
					["ShowUnlimitedOnBosses"] = false,
					["ShowOnEnemyNPCs"] = false,
					["ModeIcon"] = {
						["IconWidth"] = 20,
						["Duration"] = {
							["Anchor"] = "TOP",
							["Font"] = {
								["Typeface"] = "Expressway",
								["HorizontalAlignment"] = "CENTER",
								["Size"] = 9,
							},
						},
						["Style"] = "custom",
						["IconHeight"] = 20,
						["ColumnSpacing"] = 6,
						["Rows"] = 1,
						["StackCount"] = {
							["Anchor"] = "BOTTOM",
							["Font"] = {
								["Typeface"] = "Expressway",
								["HorizontalAlignment"] = "CENTER",
								["Size"] = 9,
							},
						},
						["MaxAuras"] = 5,
					},
				},
				["ShowTargetOnly"] = true,
				["CrowdControl"] = {
					["ModeBar"] = {
						["BackgroundTexture"] = "Solid",
						["Label"] = {
							["Font"] = {
								["Typeface"] = "Expressway",
							},
						},
						["Texture"] = "Solid",
					},
					["ShowFriendly"] = false,
					["ModeIcon"] = {
						["Columns"] = 1,
						["IconWidth"] = 25,
						["StackCount"] = {
							["Anchor"] = "BOTTOM",
							["Font"] = {
								["HorizontalAlignment"] = "CENTER",
								["Transparency"] = 0,
							},
						},
						["Duration"] = {
							["Font"] = {
								["flags"] = "OUTLINE",
								["HorizontalAlignment"] = "CENTER",
								["Typeface"] = "Expressway",
								["Color"] = {
									["g"] = 0.05882353335618973,
								},
								["Size"] = 18,
							},
						},
						["Style"] = "custom",
						["IconHeight"] = 25,
					},
				},
			},
			["ExperienceWidget"] = {
				["Texture"] = "Solid",
			},
			["Automation"] = {
				["FriendlyUnits"] = "HIDE_COMBAT",
			},
			["targetWidget"] = {
				["theme"] = "threat_glow",
				["Size"] = 30,
			},
			["threat"] = {
				["ON"] = false,
			},
			["HeadlineView"] = {
				["ShowFocusHighlight"] = false,
				["FriendlySubtext"] = "ROLE",
			},
			["arenaWidget"] = {
				["ShowNumber"] = false,
				["ShowOrb"] = false,
			},
			["BossModsWidget"] = {
				["Font"] = "Expressway",
				["ShowInHeadlineView"] = false,
				["ON"] = false,
			},
			["totemSettings"] = {
				["hideHealthbar"] = true,
			},
			["FocusWidget"] = {
				["ON"] = false,
			},
			["classWidget"] = {
				["theme"] = "clean",
				["ShowInHeadlineView"] = true,
			},
			["settings"] = {
				["customtext"] = {
					["typeface"] = "Expressway",
					["flags"] = "OUTLINE",
					["size"] = 8,
				},
				["healthbar"] = {
					["TargetUnit"] = {
						["ShowNotMyself"] = false,
						["ShowOnlyInCombat"] = false,
					},
					["backdrop"] = "Solid",
					["texture"] = "Solid",
				},
				["eliteicon"] = {
					["theme"] = "skullandcross",
					["x"] = 60,
				},
				["threatborder"] = {
					["show"] = false,
				},
				["skullicon"] = {
					["show"] = false,
					["x"] = 50,
					["scale"] = 20,
				},
				["spellicon"] = {
					["scale"] = 12,
					["x"] = -55,
					["y"] = -20,
				},
				["name"] = {
					["typeface"] = "Expressway",
					["flags"] = "OUTLINE",
					["AbbreviationForEnemyUnits"] = "INITIALS",
					["AbbreviationForFriendlyUnits"] = "INITIALS",
				},
				["spelltext"] = {
					["typeface"] = "Expressway",
					["flags"] = "OUTLINE",
				},
				["castbar"] = {
					["y"] = -20,
					["CastTimeText"] = {
						["HorizontalOffset"] = 0,
					},
					["SpellNameText"] = {
						["HorizontalOffset"] = 13,
					},
					["CastTarget"] = {
						["Show"] = false,
						["Font"] = {
							["Typeface"] = "Expressway",
						},
					},
					["backdrop"] = "Solid",
					["texture"] = "Solid",
				},
				["level"] = {
					["flags"] = "OUTLINE",
					["typeface"] = "Expressway",
					["size"] = 8,
				},
				["frame"] = {
					["height"] = 52.875,
					["y"] = -20,
					["width"] = 154,
				},
				["raidicon"] = {
					["scale"] = 22,
					["x"] = -60,
					["hpColor"] = false,
				},
			},
			["socialWidget"] = {
				["ShowFriendIcon"] = false,
				["ShowFactionIcon"] = false,
			},
			["Visibility"] = {
				["FriendlyPlayer"] = {
					["UseHeadlineView"] = true,
				},
				["FriendlyMinus"] = {
					["UseHeadlineView"] = true,
				},
				["FriendlyNPC"] = {
					["UseHeadlineView"] = true,
				},
			},
			["totemWidget"] = {
				["ON"] = false,
			},
		},
		["PanzaUI"] = {
			["nameplate"] = {
				["toggle"] = {
					["CastingEnemyUnitAlpha"] = true,
					["TargetS"] = true,
					["OccludedUnits"] = true,
				},
				["alpha"] = {
					["OccludedUnits"] = 0.04999999999999993,
					["NonTarget"] = 0.2999999999999998,
				},
			},
			["ResourceWidget"] = {
				["ShowBar"] = false,
				["BarTexture"] = "Solid",
				["Font"] = "Expressway",
				["ShowText"] = false,
			},
			["totemWidget"] = {
				["ON"] = false,
			},
			["socialWidget"] = {
				["ShowFriendIcon"] = false,
				["ShowFactionIcon"] = false,
			},
			["questWidget"] = {
				["scale"] = 18,
				["ModeHPBar"] = true,
				["ShowProgress"] = false,
			},
			["arenaWidget"] = {
				["NumberText"] = {
					["Font"] = {
						["Typeface"] = "Expressway",
					},
				},
				["ShowNumber"] = false,
				["ShowOrb"] = false,
			},
			["CVarsBackup"] = {
				["nameplateMinAlpha"] = "0.6",
				["nameplateShowOnlyNames"] = "0",
				["nameplateMaxAlpha"] = "1.0",
			},
			["FocusWidget"] = {
				["ON"] = false,
			},
			["BossModsWidget"] = {
				["Font"] = "Expressway",
				["ShowInHeadlineView"] = false,
				["ON"] = false,
			},
			["BlizzardSettings"] = {
				["Names"] = {
					["Font"] = {
						["Typeface"] = "Expressway",
					},
				},
			},
			["AuraWidget"] = {
				["CrowdControl"] = {
					["ShowFriendly"] = false,
					["ModeBar"] = {
						["BackgroundTexture"] = "ToxiUI Clean",
						["Label"] = {
							["Font"] = {
								["Typeface"] = "Expressway",
							},
						},
						["Texture"] = "ToxiUI Clean",
					},
					["ModeIcon"] = {
						["Columns"] = 1,
						["IconWidth"] = 25,
						["Duration"] = {
							["Font"] = {
								["flags"] = "OUTLINE",
								["HorizontalAlignment"] = "CENTER",
								["Typeface"] = "Expressway",
								["Color"] = {
									["g"] = 0.05882353335618973,
								},
								["Size"] = 18,
							},
						},
						["Style"] = "custom",
						["IconHeight"] = 25,
						["StackCount"] = {
							["Font"] = {
								["Transparency"] = 0,
								["HorizontalAlignment"] = "CENTER",
								["Typeface"] = "Expressway",
							},
							["Anchor"] = "BOTTOM",
						},
					},
				},
				["ShowTargetOnly"] = true,
				["ShowOmniCC"] = false,
				["Debuffs"] = {
					["FilterBySpell"] = {
						"Keg Smash", -- [1]
						"Breath of Fire", -- [2]
						"Bonedust Brew", -- [3]
						"Exploding Keg", -- [4]
						"Weapons of Order", -- [5]
						"Flame Shock", -- [6]
						"", -- [7]
					},
					["FilterMode"] = "Allow",
					["ModeIcon"] = {
						["IconWidth"] = 16,
						["Rows"] = 1,
						["MaxAuras"] = 5,
						["Style"] = "custom",
						["IconHeight"] = 16,
						["StackCount"] = {
							["Font"] = {
								["HorizontalAlignment"] = "CENTER",
								["Typeface"] = "Expressway",
								["Size"] = 9,
							},
							["Anchor"] = "BOTTOM",
						},
						["Duration"] = {
							["Font"] = {
								["HorizontalAlignment"] = "CENTER",
								["Typeface"] = "Expressway",
								["Size"] = 9,
							},
							["Anchor"] = "TOP",
						},
					},
					["ShowDispellable"] = false,
					["ModeBar"] = {
						["BackgroundTexture"] = "ToxiUI Clean",
						["Label"] = {
							["Font"] = {
								["Typeface"] = "Expressway",
							},
						},
						["Texture"] = "ToxiUI Clean",
					},
				},
				["Buffs"] = {
					["ShowUnlimitedInCombat"] = false,
					["HideUnlimitedDuration"] = true,
					["ShowUnlimitedOnBosses"] = false,
					["ShowUnlimitedInInstances"] = false,
					["ShowOnEnemyNPCs"] = false,
					["ModeIcon"] = {
						["IconWidth"] = 20,
						["Rows"] = 1,
						["StackCount"] = {
							["Font"] = {
								["HorizontalAlignment"] = "CENTER",
								["Typeface"] = "Expressway",
								["Size"] = 9,
							},
							["Anchor"] = "BOTTOM",
						},
						["Style"] = "custom",
						["IconHeight"] = 20,
						["ColumnSpacing"] = 6,
						["Duration"] = {
							["Font"] = {
								["HorizontalAlignment"] = "CENTER",
								["Typeface"] = "Expressway",
								["Size"] = 9,
							},
							["Anchor"] = "TOP",
						},
						["MaxAuras"] = 5,
					},
					["ModeBar"] = {
						["BackgroundTexture"] = "ToxiUI Clean",
						["Label"] = {
							["Font"] = {
								["Typeface"] = "Expressway",
							},
						},
						["Duration"] = {
							["Font"] = {
								["Typeface"] = "Expressway",
							},
						},
						["StackCount"] = {
							["Font"] = {
								["Typeface"] = "Expressway",
							},
						},
						["Texture"] = "ToxiUI Clean",
					},
					["ShowUnlimitedAlways"] = true,
				},
			},
			["settings"] = {
				["customtext"] = {
					["typeface"] = "Expressway",
					["size"] = 8,
					["flags"] = "OUTLINE",
				},
				["eliteicon"] = {
					["x"] = 60,
					["theme"] = "skullandcross",
				},
				["spellicon"] = {
					["y"] = -14,
					["x"] = -45,
					["scale"] = 10,
				},
				["spelltext"] = {
					["flags"] = "OUTLINE",
					["typeface"] = "Expressway",
					["height"] = 8,
					["size"] = 7,
				},
				["level"] = {
					["typeface"] = "Expressway",
					["flags"] = "OUTLINE",
					["size"] = 8,
				},
				["healthbar"] = {
					["TargetUnit"] = {
						["ShowOnlyInCombat"] = false,
						["Font"] = {
							["Typeface"] = "Expressway",
						},
						["ShowNotMyself"] = false,
					},
					["backdrop"] = "ToxiUI Clean",
					["texture"] = "ToxiUI Clean",
				},
				["castbar"] = {
					["SpellNameText"] = {
						["HorizontalOffset"] = 22,
					},
					["CastTarget"] = {
						["Show"] = false,
						["Font"] = {
							["Typeface"] = "Expressway",
						},
					},
					["texture"] = "ToxiUI Clean",
					["CastTimeText"] = {
						["HorizontalOffset"] = 0,
					},
					["backdrop"] = "ToxiUI Clean",
					["width"] = 100,
					["y"] = -14,
					["height"] = 8,
				},
				["threatborder"] = {
					["show"] = false,
				},
				["skullicon"] = {
					["x"] = 50,
					["scale"] = 20,
					["show"] = false,
				},
				["name"] = {
					["typeface"] = "Expressway",
					["flags"] = "OUTLINE",
					["AbbreviationForEnemyUnits"] = "INITIALS",
					["AbbreviationForFriendlyUnits"] = "INITIALS",
				},
				["frame"] = {
					["y"] = -20,
					["height"] = 52.875,
					["width"] = 154,
				},
				["raidicon"] = {
					["scale"] = 22,
					["hpColor"] = false,
					["x"] = -60,
				},
			},
			["targetWidget"] = {
				["theme"] = "threat_glow",
				["Size"] = 30,
			},
			["HeadlineView"] = {
				["ShowFocusHighlight"] = false,
				["ShowMouseoverHighlight"] = false,
				["FriendlySubtext"] = "ROLE",
				["name"] = {
					["y"] = 0,
					["size"] = 9,
				},
			},
			["ExperienceWidget"] = {
				["Texture"] = "Solid",
			},
			["totemSettings"] = {
				["hideHealthbar"] = true,
			},
			["Automation"] = {
				["FriendlyUnits"] = "HIDE_COMBAT",
				["HideFriendlyUnitsInInstances"] = true,
			},
			["classWidget"] = {
				["ShowInHeadlineView"] = true,
				["theme"] = "clean",
			},
			["threat"] = {
				["ON"] = false,
			},
			["Visibility"] = {
				["FriendlyNPC"] = {
					["UseHeadlineView"] = true,
				},
				["FriendlyPlayer"] = {
					["UseHeadlineView"] = true,
				},
				["FriendlyMinus"] = {
					["UseHeadlineView"] = true,
				},
			},
		},
	},
}
