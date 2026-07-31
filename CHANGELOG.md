## 1.6-RELEASE

This is a small release that fixes some bugs and improve performance. Adds and fixes some CDM profiles and enable some new features in EQoL. It is compatible with WoW patch 12.1.

### 🛠️ Core

* Removed Personal Resource Display skinning to improve performance
* Removed Tooltips Health bar skinning to improve performance

### 👤 Profiles

* BlizzUI - Fixed the buffs CDM frame position
* BlizzUI - Fixed the position of Quest Tracker and Damage Meter to be in line with Minimap
* Cooldown Manager Centered - Added glow to many Buffs and Procs from various classes
* EnhanceQoL - Changed Action Bars settings
* EnhanceQoL - Changed the size and position of XP bar
* EnhanceQoL - Removed health bar from Tooltips
* EnhanceQoL - Removed text for Combo Points resource bar

### 🧮 Class CDM

* Rogue - Outlaw: Added a new Rogue Outlaw CDM profile
* Mage - Frost: Reordered the Buffs abilities
* Mage - Frost: Reordered the Essential Cooldown abilities
* Monk - Brewmaster: Added glow to some Buffs
* Monk - Windwalker: Added glow to some Buffs

### 📏 Various

* Removed EllesmereUI profile. Will stick to EQOL suite.

## 1.5-RELEASE

This is a small release that fixes some bugs from previous version, adds and fixes some CDM profiles and enable some new features in EQoL. Added also a WIP "EllesmereUI" profile for testing purpose.

### 🛠️ Core

* Added a CVar to extend the camera distance
* Changed default texture for border and status bar of PanzaUI
* Changed the texture of the Personal Resource Bar
* Forced the max foreground FPS to 60

### 👤 Profiles

* BlizzUI - Fixed the UI to match 2560×1440 resolution
* EUI - Added a very early WIP profile for EllesmereUI
* EnhanceQoL - Added counter in Quest Tracker frame
* EnhanceQoL - Changed hide settings for Player, Target, ToT, Focus and Pet frames
* EnhanceQoL - Changed the Minimap border texture
* EnhanceQoL - Changed the border texture to PanzaUI to all the frames
* EnhanceQoL - Changed the size and position of Raid Marker for Player, Focus, Target and Target of Target frames
* EnhanceQoL - Changed the size, position and border of Boss frame
* EnhanceQoL - Changed the size, position and border of Cast bars
* EnhanceQoL - Changed the size, position and border of Party frame
* EnhanceQoL - Changed the size, position and border of Player frame
* EnhanceQoL - Changed the size, position and border of Raid frame
* EnhanceQoL - Changed the size, position and border of Target frame
* EnhanceQoL - Enabled copy link in chat window
* EnhanceQoL - Enabled healer mana indicator in Dungeons
* EnhanceQoL - Enabled some features for Delves
* EnhanceQoL - Enabled the auto-release feature in PVP
* EnhanceQoL - Fixed border color in various frames
* EnhanceQoL - Fixed border in all frames after last update of EQOL addon
* EnhanceQoL - Fixed border texture issue in Damage Meter tooltips
* EnhanceQoL - Fixed border texture issue in Pet frame
* EnhanceQoL - Fixed border texture issue in Raid frame
* EnhanceQoL - Fixed debuffs frame size and position
* EnhanceQoL - Fixed minimap border size
* EnhanceQoL - Fixed Quest Tracker frame height
* EnhanceQoL - Fixed the font size of Damage Meter tooltips
* EnhanceQoL - Hidden CDM buffs and essential cooldowns tracker while flying/skyriding
* EnhanceQoL - Hidden the Quick Join button in Social frame
* EnhanceQoL - Increased cursor ring size
* EnhanceQoL - Increased the refresh rate of the Damage Meter
* EnhanceQoL - Increased the refresh rate of the Minimap coordinates
* EnhanceQoL - Updated the profile to the latest version of addon
* EnhanceQoL - Reskinned the Quest Tracker with same font's style of other parts of UI
* Platynator - Adjusted the text stack position on icons
* Platynator - Changed the texture of the borders
* Platynator - Fixed the Simplified profile

### 🧮 Class CDM

* Monk - Windwalker: Reordered the Essential Cooldown abilities

### 📏 Various

* Added a new support button on Ko-Fi, totally optional since the UI will stay free forever!
* Added SharedMedia_MyMedia as required addon
* Added Wago links for those who wants to follow this UI on a proper WoW website
* Disable the "Pulse" feature in Masque to avoid the bug with GCD blink
* Updated documentation to the latest UI version
* Updated images to the new 2560x1440 resolution
* Updated WTF variables for several addons

## 1.4-RELEASE

This is a major release that adds many quality-of-life features thanks to the amazing [Enhance QoL](https://www.curseforge.com/wow/addons/eqol) addon! It replaces the following addons from the previous version: Better Blizz Frames, Details, Edit Mode Tweaks, Leatrix Maps, Leatrix Plus, LS: Maps, LS: Toasts, Sensei Resource Bar, TomTom, and Waypoint UI.

The UI has also been adjusted to support 2560×1440 monitors.

### 🛠️ Core

* Added a CVar to force friendly nameplates to show only the name
* Added a new border ("platy_border") to SharedMedia, based on Plusmouse's Platynator
* Changed the tooltip health bar texture to WGlass
* Forced the max background FPS to 8
* Removed unnecessary elements
* Resized the Spell Overlay frame to 75%
* Reworked the core addon code for easier maintenance

### 👤 Profiles

* BlizzUI - Adjusted the UI to match 2560×1440 resolution
* BlizzUI - Adjusted the position of all frames for EQOL Unit Frames
* BlizzUI - Adjusted the position of the Buffs frame
* BlizzUI - Adjusted the position of the Buffs Tracker of the Cooldown Manager
* BlizzUI - Adjusted the position of the Damage Meter frame
* BlizzUI - Adjusted the position of the Loot Window
* BlizzUI - Adjusted the position of the Micro Menu
* BlizzUI - Adjusted the position of the Quest Tracker
* BlizzUI - Adjusted the position of the Tooltip window
* BlizzUI - Increased the size of the Damage Meter bars
* Cooldown Manager Centered - Changed the text size for Essentials and Utilities
* EnhanceQoL - Adjusted the UI to match 2560×1440 resolution
* EnhanceQoL - Adjusted the position of the DPS meter
* EnhanceQoL - Adjusted the position of the toast frame
* EnhanceQoL - Added FPS counter in Minimap frame
* EnhanceQoL - Added mouse ring to cursor
* EnhanceQoL - Added mouseover to Action Bar 5
* EnhanceQoL - Added Roboto Condensed Bold as global font
* EnhanceQoL - Added Teleport panel to World Map
* EnhanceQoL - Added the Combat alert frame
* EnhanceQoL - Configured Boss frames
* EnhanceQoL - Configured Cast Bars frames
* EnhanceQoL - Configured Damage Meter frame
* EnhanceQoL - Configured Minimap frame
* EnhanceQoL - Configured Raid frames
* EnhanceQoL - Configured Tooltips frame
* EnhanceQoL - Enabled the option to automatically repair and sell junk items
* EnhanceQoL - Enabled the option to fast auto-loot
* EnhanceQoL - Enabled the UI crosshair during combat
* EnhanceQoL - Hidden Micro Menu frame
* EnhanceQoL - Hidden Minimap addon button
* EnhanceQoL - Hidden realm names from friendly nameplates
* Platynator - Adjusted the UI to match 2560×1440 resolution
* Platynator - Adjusted the Simplified scale
* Platynator - Added target role for friendly nameplates
* Platynator - Changed the alpha channel for non-targeted nameplates
* Platynator - Changed the border for targeted/mouseover nameplates
* Platynator - Changed the color for enemy nameplates
* Platynator - Changed the color for friendly nameplates
* Platynator - Changed the health bar color from Threat to Elite Type + Threat
* Platynator - Changed the Cast Bar texture to the default one
* Platynator - Changed the texture to WGlass
* Platynator - Changed the transparency for obscured targets
* Platynator - Fixed the Debuffs frame to show all debuffs
* Platynator - Removed options for Friendly Nameplates and Simplified Nameplates

### 🧮 Class CDM

* Added a new Cooldown Manager profile for Druid - Guardian
* Added a new Cooldown Manager profile for Shaman - Enhancement
* Mage - Frost: Modified the Essential Cooldown abilities
* Monk - Brewmaster: Added visual alerts for some Essential Cooldown abilities
* Monk - Brewmaster: Adjusted size to include Sensei Resource Bar
* Monk - Brewmaster: Modified the Essential Cooldown abilities
* Monk - Windwalker: Added visual alerts for some Essential Cooldown abilities
* Monk - Windwalker: Adjusted size to include Sensei Resource Bar
* Monk - Windwalker: Modified the Essential Cooldown abilities
* Shaman - Elemental: Added visual alerts for some Essential Cooldown abilities

### 📏 Various

* Removed macro PDFs
* Updated documentation to the latest UI version
* Updated TOC to the newest patch
* Updated WTF variables for several addons

## 1.3-RELEASE

This is a minor release that fixes some bugs in the PanzaUI addon and improves the UI setup documentation.

### 🛠️ Core

* Fixed a bug with the Buffs frame
* Removed deprecated CVars from patch 12.0

### 👤 Profiles

* Better Blizzard Frames - Hidden XP and Reputation bars
* BlizzUI - Adjusted the position of the Boss Timeline
* BlizzUI - Adjusted the position of the Damage Meter
* BlizzUI - Adjusted the position of the Micro Menu
* BlizzUI - Adjusted the position of the Tooltips
* Cooldown Manager Centered - Changed the font to "Roboto Condensed Bold"

### 🧮 Class CDM

* Monk - Brewmaster: Modified the Essential Cooldown abilities
* Monk - Windwalker: Modified the Essential Cooldown abilities

### 📏 Various

* Updated WTF variables for several addons
* Updated documentation to the latest UI version
* Updated TOC to the newest patch

## 1.2-RELEASE

This version is tested with the Midnight pre-patch. Compared to the previous release, it switches to the Blizzard Cooldown Manager for tracking abilities and utilities, adds CDM profiles for several classes, and changes the font from Expressway to Roboto Condensed Bold.

### 🛠️ Core

* Cleaned up the code
* Removed Garrison button scale
* Removed graphics settings from CVars

### 👤 Profiles

* Added a new Cooldown Manager Centered profile
* Added new Cooldown Manager profiles for Druid - Feral
* Added new Cooldown Manager profiles for Mage - Frost
* Added new Cooldown Manager profiles for Monk - Brewmaster
* Added new Cooldown Manager profiles for Monk - Windwalker
* Added new Cooldown Manager profiles for Shaman - Elemental
* Better Blizzard Frames - Changed the font to "Roboto Condensed Bold"
* Better Blizzard Frames - Formatted health numbers
* Better Blizzard Frames - Hidden hit indicator on pet frame
* BlizzUI - Adjusted the entire UI for the Midnight pre-patch
* Platynator - Changed the font to "Roboto Condensed Bold"
* Sensei - Changed the font to "Roboto Condensed Bold"

### 📏 Various

* Changed the font to "Roboto Condensed Bold"
* Updated WTF variables for several addons
* Updated documentation to include common issues
* Updated documentation to the latest UI version
* Updated documentation with links to external addons
* Updated TOC to the newest patch

### ⌨️ Macros

* Updated Mage macros
* Updated Monk macros
* Updated Shaman macros

## 1.1-RELEASE

This is a complete overhaul of PanzaUI, ready for Midnight!

⚠️ Due to Midnight's addon changes, the UI has switched back to a proper addon, migrating what was possible from WeakAuras.

### 🛠️ Core

* Added auto-collapse functionality to the Buffs frame
* Added a CVar section with useful CVars
* Adjusted the Quest Tracker frame size
* Configured the default minimap
* Reskinned the health bar texture of the default Blizzard tooltip

### 👤 Profiles

* Added a new Better Blizzard Frames profile (goodbye SUF)
* Added a new Platynator profile
* Added a new Sensei profile for secondary power bars
* BlizzUI - Updated the entire UI for Midnight
* Removed the Baganator profile
* Removed the Better Blizzard Plates profile
* Removed the Big Wigs profile
* Removed the Cell profile
* Removed the Details profile
* Removed the Frame Color profile
* Removed the Mouseover Action Settings profile
* Removed the Plater profile
* Removed the SUF profile

### 📏 Various

* Added WTF variables for several addons
* Removed all class WeakAuras
* Removed Class Template WeakAuras due to WeakAuras no longer being supported in Midnight
* Removed Core and Utilities WeakAuras
* Removed unnecessary documentation for Midnight
* Updated documentation to the latest UI version

## 1.0-RELEASE

### 🛠️ Core

* Added a new Power Bar frame for the player
* Added new CVars for camera settings
* Added new CVars for graphics settings
* Changed icons for various WeakAuras
* Cleaned up the code
* Fixed an issue with the alpha level of some scripts
* Fixed an issue with the GCD blink showing on every cooldown on action bars
* Fixed an issue with Player and Target frames not showing [#75](https://github.com/MarioCatuogno/PanzaUI/issues/75)
* Fixed the frame strata level of nameplates
* Increased the size of the Minimap Zone and Clock text
* Moved all PanzaUI features from an external addon to a new WeakAura [#72](https://github.com/MarioCatuogno/PanzaUI/issues/72)
* Reordered CVars
* Removed core.lua and PanzaUI.toc
* Removed the Saved Variables folder
* Rewrote the code for the Quest Tracker WeakAura
* Updated the Raid Ability Timeline to the latest WeakAura version

### ⚙️ Utilities

* Added a mouse cursor glow animation
* Added an alert for banquets or feasts
* Added an alert for flasks and potion cauldrons
* Added an alert for the Insanity bar in Visions of N'Zoth Revisited
* Added an alert for low supplies (e.g., flasks, potions, mana oils) [#73](https://github.com/MarioCatuogno/PanzaUI/issues/73)
* Adjusted the Movement group aura position
* Changed the crosshair to always be active during Skyriding
* Changed the texture for the Skyriding crosshair race target
* Fixed an issue with the Low Supplies tracker
* Fixed an issue with the Mana group tracker
* Moved some auras to the Core WeakAura
* Removed unused alerts
* Updated the Interrupt Tracker to the latest WeakAura version

### 🧮 Class WeakAuras

* All Classes - Moved the Buff frame to better integrate with the new Power Bar
* Class Template - Added a new WeakAura template to configure and tweak your class/spec [#71](https://github.com/MarioCatuogno/PanzaUI/issues/71)
* Class Template - Adjusted the Cooldowns tracker position
* Death Knight - Added new auras for the Frost spec [#70](https://github.com/MarioCatuogno/PanzaUI/issues/70)
* Death Knight - Adjusted the Cooldowns tracker position
* Druid - Adjusted the Cooldowns tracker position
* Hunter - Adjusted the Cooldowns tracker position
* Mage - Adjusted the Cooldowns tracker position
* Mage - Renamed all auras for better clarity
* Monk - Added Heart of the Jade Serpent to the Buffs tracker
* Monk - Added Jade Empowerment to the Buffs tracker
* Monk - Added Slicing Winds to the Buffs tracker
* Monk - Added The Emperor's Capacitor to the Buffs tracker
* Monk - Adjusted the Cooldowns tracker position
* Monk - Fixed an issue with the Teaching of the Monastery buff
* Monk - Removed unnecessary buffs
* Monk - Renamed all auras for better clarity
* Monk - Sorted the buffs in the Buffs tracker
* Paladin - Adjusted the Cooldowns tracker position
* Priest - Adjusted the Cooldowns tracker position
* Rogue - Added new auras for the Assassination spec [#74](https://github.com/MarioCatuogno/PanzaUI/issues/74)
* Rogue - Adjusted the Cooldowns tracker position
* Shaman - Adjusted the Cooldowns tracker position
* Warlock - Added a new WeakAura for the Warlock class (WIP)
* Warrior - Adjusted the Cooldowns tracker position

### 👤 Profiles

* Baganator - Added a new Baganator profile
* BigWigs - Adjusted the Messages frame position
* BlizzUI - Adjusted the Arena frame position
* BlizzUI - Adjusted the Quest frame position
* BlizzUI - Adjusted the Tooltip frame position
* Cell - Added a new Healer profile for raid frames
* Cell - Adjusted the position of raid and party frames
* Cell - Fixed frame visibility in Solo mode
* Details - Fixed the font sizes
* Details - Fixed the window positions
* Details - Removed the Scroll frame
* Details - Removed the second frame and added some automation for spec/role
* FrameColor - Added a new Frame Color profile
* Kui - Added a new Kui profile
* MouseoverActionSettings - Added automation to hide the Quest Tracker during combat in raids
* MouseoverActionSettings - Fixed an event trigger for some action bars
* Plater - Adjusted the health bar and cast bar width and height
* Plater - Fixed CVar settings
* Plater - Updated the NPC Color profile and scripts from Jundies ([link](https://wago.io/ak3iS95aa)) [#76](https://github.com/MarioCatuogno/PanzaUI/issues/76)
* Plater - Updated scripts from Jundies
* SUF - Adjusted the position of various frames
* SUF - Configured the Player frame for the Warlock class

### 📏 Various

* Added a new guide to configure personal Class WeakAuras
* Added screenshots from previous versions of the UI [#71](https://github.com/MarioCatuogno/PanzaUI/issues/71)
* Updated documentation to the latest UI version
* Updated screenshots to the latest UI version

## 0.9.0-RELEASE

### 🛠️ Addon

* Fixed Action Bar behavior after patch 11.0.5
* Removed the "hide UI while taxiing" feature
* Updated TOC to the newest patch

### ⌨️ Macros

* Added Druid macros for the Balance spec [#67](https://github.com/MarioCatuogno/PanzaUI/issues/67)
* Added Hunter macros for the Beast Mastery spec [#39](https://github.com/MarioCatuogno/PanzaUI/issues/39)
* Added Hunter macros for the Marksmanship spec [#65](https://github.com/MarioCatuogno/PanzaUI/issues/65)
* Added Priest macros for the Discipline spec [#66](https://github.com/MarioCatuogno/PanzaUI/issues/66)
* Added Warrior macros for the Protection spec [#35](https://github.com/MarioCatuogno/PanzaUI/issues/35)
* Updated Mage macros
* Updated Monk macros
* Updated Priest macros
* Updated Shaman macros

### 👤 Profiles

* BlizzUI - Moved the Vehicle button
* Cell - Adjusted the Raid Frame position
* Details - Increased the combat update interval to 2.5 seconds
* Details - Removed the end panel after M+
* Frame Color - Added a new Frame Color profile to darken the UI
* Plater - Updated the NPC Color profile from Jundies's profile ([link](https://wago.io/ak3iS95aa))
* WA All Classes - Adjusted the Cooldown group aura position
* WA Druid - Added Buffs, Cooldowns, and Healer group auras [#67](https://github.com/MarioCatuogno/PanzaUI/issues/67)
* WA Hunter - Added Buffs and Cooldowns group auras for the Beast Mastery spec [#39](https://github.com/MarioCatuogno/PanzaUI/issues/39)
* WA Hunter - Added Buffs and Cooldowns group auras for the Marksmanship spec [#65](https://github.com/MarioCatuogno/PanzaUI/issues/65)
* WA Monk - Added a Buff aura to track Flurry Strikes
* WA Monk - Added a Buff aura to track Ox Stance
* WA Monk - Adjusted the order of some Buff auras
* WA Monk - Changed the purpose of the Cooldowns group auras to track cooldowns of abilities longer than 1 minute
* WA Monk - Fixed a bug with the Combo Strike aura
* WA Priest - Added Buffs and Cooldowns group auras for the Discipline spec [#66](https://github.com/MarioCatuogno/PanzaUI/issues/66)
* WA Shaman - Changed the purpose of the Cooldowns group auras to track cooldowns of abilities longer than 1 minute
* WA Utilities - Added a new aura for Marksmanship Hunter to dismiss the pet when the Lone Wolf talent is active
* WA Utilities - Added a new Racing Timer for Skyriding races
* WA Utilities - Added new movement auras for the Druid class
* WA Utilities - Added new movement auras for the Hunter class
* WA Utilities - Added new movement auras for the Warrior class
* WA Utilities - Added a Valorstone tracker
* WA Utilities - Adjusted the Movement group aura position
* WA Utilities - Fixed a bug with the Boss cast bar
* WA Utilities - Fixed a bug with the Low Mana alert
* WA Utilities - Fixed the function to automatically hide some Quest Tracker frames during combat in dungeons and raids
* WA Utilities - Removed the animation for the Boss cast bar
* WA Utilities - Removed tracking for Health and Mana potions
* WA Warrior - Added Buffs and Cooldowns group auras for the Protection spec [#35](https://github.com/MarioCatuogno/PanzaUI/issues/35)

### 📏 Various

* Reduced the size of all PDFs containing class macro documentation
* Updated documentation to the latest UI version
* Updated screenshots to the latest UI version

## 0.8.2-RELEASE

### ⌨️ Macros

* Added Priest macros for the Holy spec [#38](https://github.com/MarioCatuogno/PanzaUI/issues/38)
* Updated Mage macros for the Frost spec
* Updated Shaman macros for the Restoration spec

### 👤 Profiles

* BigWigs - Adjusted alpha to 0 for Nameplate icons
* BigWigs - Adjusted font settings for Messages
* BlizzUI - Resized the Buffs/Debuffs frame
* WA Mage - Fixed a bug with the Icicles tracking aura
* WA Monk - Fixed the strata for Healer auras
* WA Priest - Added Buffs, Cooldowns, and Healer group auras [#38](https://github.com/MarioCatuogno/PanzaUI/issues/38)
* WA Shaman - Fixed the strata for Healer auras
* WA Utilities - Added a new Cast Bar aura for Bosses
* WA Utilities - Added a tracker for Healthstones, Health, and Mana potions
* WA Utilities - Added new alerts for the Priest class
* WA Utilities - Added new movement auras for the Priest class
* WA Utilities - Fixed a bug with the Combat Timer aura in the Alert group
* WA Utilities - Fixed a bug with the Skyriding crosshair during races
* WA Utilities - Fixed some misspellings in the Alert group
* WA Utilities - Fixed the function to automatically hide some Quest Tracker frames during combat in dungeons and raids
* WA Utilities - Improved performance by removing unnecessary Models from Cast Bar auras
* WA Utilities - Updated the Interrupt Tracker to the latest version of [this](https://wago.io/MInterruptTracker)

### 📏 Various

* Updated documentation to the latest UI version

## 0.8.1-RELEASE

### ⌨️ Macros

* Updated Mage macros for the Frost spec
* Updated Shaman macros for the Elemental spec [#32](https://github.com/MarioCatuogno/PanzaUI/issues/32)

### 👤 Profiles

* BigWigs - Removed all Nameplate icon auras for all TWW Dungeons
* BigWigs - Resized the Messages frame
* BlizzUI - Adjusted frames to create more space in the center of the screen [#56](https://github.com/MarioCatuogno/PanzaUI/issues/56)
* Cell - Adjusted frames to create more space in the center of the screen [#56](https://github.com/MarioCatuogno/PanzaUI/issues/56)
* Plater - Added arrows to the Target nameplate
* Plater - Adjusted the Plater Top and Bottom screen lock to 0.08
* Plater - Changed the NPC Color profile from Quazii to Jundies ([link](https://wago.io/ak3iS95aa))
* Plater - Changed the size of Special Buff
* Plater - Changed the size of the Target nameplate
* Plater - Removed the Quest Icon from nameplates
* SUF - Adjusted frames to create more space in the center of the screen [#56](https://github.com/MarioCatuogno/PanzaUI/issues/56)
* WA Mage - Changed the anchor for the Buffs aura (now anchored to Action Bar 5)
* WA Mage - Fixed some bugs in the Buffs aura
* WA Monk - Changed the anchor for the Buffs aura (now anchored to Action Bar 5)
* WA Paladin - Changed the anchor for the Buffs aura (now anchored to Action Bar 5)
* WA Shaman - Added auras for the Elemental specialization [#32](https://github.com/MarioCatuogno/PanzaUI/issues/32)
* WA Shaman - Changed the anchor for the Buffs aura (now anchored to Action Bar 5)
* WA Utilities - Added a function to automatically hide some Quest Tracker frames during combat in dungeons and raids
* WA Utilities - Added new alerts for Delves to track Brann's experience and the number of available Coffer Keys
* WA Utilities - Adjusted frames to create more space in the center of the screen [#56](https://github.com/MarioCatuogno/PanzaUI/issues/56)
* WA Utilities - Adjusted the size and position of the Interrupt tracker aura
* WA Utilities - Changed the anchor for Alert auras (should work with different monitor resolutions)
* WA Utilities - Changed the anchor for Cast Bar auras (now anchored to the Player Cast Bar frame)
* WA Utilities - Cleaned up some unnecessary auras to improve performance
* WA Utilities - Fixed the cooldown text position in the Movement tracker aura
* WA Utilities - Fixed the trigger for the Elite/Rare icon on nameplates
* WA Utilities - Removed Health text for SUF frames (using a custom Tag instead)
* WA Utilities - Removed the Right and Left arrows from Nameplates

### 📏 Various

* Updated documentation to the latest UI version

## 0.8.0-RELEASE

### 🛠️ Addon

* Added an option to anchor tooltips to the mouse cursor (disabled by default)
* Added an icon to the PanzaUI addon
* Cleaned up the code
* Removed automatic spell addition to Action Bars

### ⌨️ Macros

* Updated the Mage PDF with the new Action Bar layout configuration [#45](https://github.com/MarioCatuogno/PanzaUI/issues/45)
* Updated the Paladin PDF with the new Action Bar layout configuration [#45](https://github.com/MarioCatuogno/PanzaUI/issues/45)
* Updated Shaman macros for the Restoration spec

### 👤 Profiles

* BigWigs - Moved the Messages frame
* BlizzUI - Moved various frames
* Cell - Moved the Raid frame position
* Plater - Added a new Plater profile (based on [this](https://quazii.com/the-war-within-plater-nameplates-profile/) one by Quazii)
* SUF - Added a custom tag for health percentage for Player, Target, and Boss frames
* SUF - Adjusted the border size of various frames
* SUF - Adjusted the Boss and Arena frame positions and text size
* SUF - Adjusted the cast bar for Boss frames
* SUF - Disabled the Focus cast bar
* Threat Plates - Removed the profile (switched to Plater)
* WA Mage - Added some new Cooldown auras for the Frost specialization
* WA Paladin - Added Buffs and Cooldowns for the Retribution specialization [#48](https://github.com/MarioCatuogno/PanzaUI/issues/48)
* WA Paladin - Changed the order of the Buffs group
* WA Utilities - Added a central Cast Bar that shows only in combat
* WA Utilities - Added Health text on Nameplates
* WA Utilities - Added an automation to hide the Quest Tracker during combat in Party/Raid
* WA Utilities - Added an Elite/Boss/Rare icon on Nameplates
* WA Utilities - Added an Interrupt tracker based on [this](https://wago.io/MInterruptTracker)
* WA Utilities - Adjusted the border size of various frames
* WA Utilities - Fixed a bug with the CR aura in the Alert group

### 📏 Various

* Removed unnecessary files
* Updated all Saved Variables files
* Updated documentation to the latest version of UI
* Updated screenshots to the latest version of UI

## 0.7.2-RELEASE

### 🛠️ Addon

* Changed settings for Friendly Unit nameplates
* Fixed a bug with the Nameplate texture
* Fixed Lua errors with an unused frame
* Fixed the blink for Action Bar 4
* Reworked the Action Bar configuration
* Updated TOC to the newest patch

### ⌨️ Macros

* Updated the Monk PDF with the new Action Bar layout configuration [#45](https://github.com/MarioCatuogno/PanzaUI/issues/45)
* Updated the Paladin PDF with the new Action Bar layout configuration [#45](https://github.com/MarioCatuogno/PanzaUI/issues/45)
* Updated the Shaman PDF with the new Action Bar layout configuration [#45](https://github.com/MarioCatuogno/PanzaUI/issues/45)

### 👤 Profiles

* BigWigs - Updated settings for Nameplates
* BigWigs - Updated Voice settings
* BlizzUI - Increased the Chat frame size
* BlizzUI - Moved various frames
* BlizzUI - Overhauled the Action Bar layout (see [#45](https://github.com/MarioCatuogno/PanzaUI/issues/45) for the reason behind the new layout)
* BlizzUI - Resized the Quest Tracker frame
* Cell - Added a new Cell addon profile
* Details - Changed automation rules
* Details - Changed the update interval to 1 second
* Details - Reskinned the windows to be more coherent with SUF frames and the rest of the UI
* MouseoverActionSettings - Changed the bar order
* SUF - Moved the Boss frames
* SUF - Resized the Pet frame
* Threat Plates - Added missing Monk debuffs
* Threat Plates - Changed the layout for the Debuffs aura on the target
* Threat Plates - Changed settings for the Cast Bar
* Threat Plates - Changed settings for Headline View
* Threat Plates - Changed transparency settings for various nameplates
* Threat Plates - Fixed some settings
* WA - Modified the animation for all profiles
* WA Mage - Removed the Rotation group
* WA Monk - Added a Detox spell tracker to the Healer group
* WA Monk - Adjusted some WeakAura appearances in the Healer group
* WA Monk - Removed the Alert group
* WA Monk - Removed the Rotation group
* WA Paladin - Removed the Alert group
* WA Paladin - Removed the Rotation group
* WA Shaman - Added a Purify Spirit spell tracker to the Healer group
* WA Shaman - Adjusted some WeakAura appearances in the Healer group
* WA Shaman - Fixed a bug with the Healing Rain spell tracker
* WA Shaman - Moved the Cooldowns frame
* WA Utilities - Added a crosshair icon for Skyriding races
* WA Utilities - Added a low mana alert for healers
* WA Utilities - Added a new Skyriding Vigor charges aura
* WA Utilities - Added a party healer mana alert
* WA Utilities - Disabled the bottom clock
* WA Utilities - Fixed a bug with 2D portraits for Player and Target frames
* WA Utilities - Fixed the Cast Bar for SUF
* WA Utilities - Fixed the memory leak for the FPS aura
* WA Utilities - Fixed the position and length of text on Player and Target cast bars
* WA Utilities - Fixed the Skyfury alert for Shaman
* WA Utilities - Moved the Movement buff auras
* WA Utilities - Moved the Skyriding auras group under the SUF player frame
* WA Utilities - Updated the Raid Ability Timeline aura
* WA Utilities - Removed the Cast Bar animation

### 📏 Various

* Removed the Raid Frame Settings profile

## 0.7.1-RELEASE

⚠️ **Important:** Temporarily disabled many functions due to the TWW patch.

### 🛠️ Addon

* Cleaned up the code of the core addon
* Fixed the blink of the GCD on the Stance Bar [#36](https://github.com/MarioCatuogno/PanzaUI/issues/36)
* Hidden alerts from the default UI
* Updated TOC to the newest patch

### ⌨️ Macros

* Added a PDF containing keybinds and macros for Hunter (WIP) [#39](https://github.com/MarioCatuogno/PanzaUI/issues/39)
* Added a PDF containing keybinds and macros for Paladin (WIP) [#29](https://github.com/MarioCatuogno/PanzaUI/issues/29)
* Added a PDF containing keybinds and macros for Priest (WIP) [#38](https://github.com/MarioCatuogno/PanzaUI/issues/38)
* Added a PDF containing keybinds and macros for Warrior (WIP) [#35](https://github.com/MarioCatuogno/PanzaUI/issues/35)
* Updated the PDF containing keybinds and macros for Restoration Shaman [#41](https://github.com/MarioCatuogno/PanzaUI/issues/41)
* Updated the PDF containing keybinds and macros for Monk

### 👤 Profiles

* BigWigs - Added a BigWigs profile
* BlizzUI - Added Action Bars for spell rotation
* BlizzUI - Added the Stance Bar to the layout
* BlizzUI - Aligned Raid and Party frames
* Details - Changed to auto-erase data
* Details - Removed the Encounter timer
* MouseoverActionSettings - Added the Stance Bar to mouseover, under the Player frame
* MouseoverActionSettings - Fixed some bugs
* RFS - Added Priest filters
* RFS - Fixed some bugs
* RFS - Major overhaul of buffs/debuffs filters after the latest addon update
* RFS - Modified the Role icon and buffs/debuffs fonts
* SUF - Added the Pet frame [#40](https://github.com/MarioCatuogno/PanzaUI/issues/40)
* SUF - Fixed some bugs
* SUF - Removed the Holy Power bar from the Player frame
* Threat Plates - Added Hunter debuffs
* Threat Plates - Added Priest debuffs
* Threat Plates - Fixed some bugs
* WA Druid - Added a new Cooldown section [#30](https://github.com/MarioCatuogno/PanzaUI/issues/30)
* WA Druid - Added a new Resources section [#30](https://github.com/MarioCatuogno/PanzaUI/issues/30)
* WA Druid - Added a new Rotation section [#30](https://github.com/MarioCatuogno/PanzaUI/issues/30)
* WA Dungeons - Removed the WA profile
* WA Hunter - Added a new Cooldown section [#39](https://github.com/MarioCatuogno/PanzaUI/issues/39)
* WA Hunter - Added a new Resources section [#39](https://github.com/MarioCatuogno/PanzaUI/issues/39)
* WA Hunter - Added a new Rotation section [#39](https://github.com/MarioCatuogno/PanzaUI/issues/39)
* WA Mage - Updated the Buff section
* WA Monk - Added a new Alert section
* WA Monk - Removed the Rotation section
* WA Monk - Updated the Buff section
* WA Paladin - Added a new Paladin profile (WIP) [#29](https://github.com/MarioCatuogno/PanzaUI/issues/29)
* WA Priest - Added a new Priest profile (WIP) [#38](https://github.com/MarioCatuogno/PanzaUI/issues/38)
* WA Shaman - Added a new Alerts section [#32](https://github.com/MarioCatuogno/PanzaUI/issues/32)
* WA Shaman - Added a new Buffs section [#32](https://github.com/MarioCatuogno/PanzaUI/issues/32)
* WA Shaman - Added a new Cooldown section [#32](https://github.com/MarioCatuogno/PanzaUI/issues/32)
* WA Shaman - Added a new Healer section [#41](https://github.com/MarioCatuogno/PanzaUI/issues/41)
* WA Utilities - Added Battle Shout to Alerts to track missing buffs for Warrior
* WA Utilities - Added Devotion Aura to Alerts to track missing buffs for Paladin
* WA Utilities - Added various Alerts to track missing buffs for Shaman
* WA Utilities - Changed the max level to 80 to keep track of XP
* WA Utilities - Fixed various bugs
* WA Utilities - Updated the Clock
* WA Warrior - Added a new Warrior profile (WIP) [#35](https://github.com/MarioCatuogno/PanzaUI/issues/35)

### 📏 Various

* Updated the HOW TO INSTALL documentation

## 0.7.0-RELEASE

### 🛠️ Addon

* Added a Cast Bar configuration option
* Added Quality of Life features option
* Added a Raid Frames configuration option
* Added a Slash command `/panzaui` to open the addon panel
* Added a Various Frames configuration option
* Fixed the Chat Button frame
* Fixed the Resource Bar frame
* Hidden the Addon icon in the Minimap
* Hidden the Encounter Bar frame
* Hidden the Tracker icon in the Minimap
* Increased the size of the Clock button
* Increased the size of the Minimap text
* Modified Nameplate CVars to better fit the screen
* Moved the Minimap text, aligning it to the Calendar icon
* Optimized the code (now using less than 60KB of memory)
* Removed the Queue Icon configuration option
* Reskinned the Nameplate health bar
* Reskinned the Tooltip health bar
* Revamped the addon window in-game to better show the various options

### ⌨️ Macros

* Added a PDF containing keybinds and macros for Druid (WIP)
* Added a PDF containing keybinds and macros for Mage (WIP)
* Added a PDF containing keybinds and macros for Monk
* Added a PDF containing keybinds and macros for Rogue (WIP)
* Added a PDF containing keybinds and macros for Shaman (WIP)
* Added macros for Druid (WIP)
* Added macros for Mage (WIP)
* Added macros for Rogue (WIP)
* Added macros for Shaman (WIP)
* Updated macros for Monk

### 👤 Profiles

* BlizzUI - Adjusted the Action Bar frame position
* BlizzUI - Adjusted the Raid and Party frame positions
* BlizzUI - Moved the Cast Bar frame
* BlizzUI - Moved the Extra Abilities frame
* BlizzUI - Moved the Loot Window frame
* BlizzUI - Moved the Quest Tracker frame
* BlizzUI - Moved the Talking Head frame
* BlizzUI - Moved the Tooltip frame
* BlizzUI - Removed the dual profile for the Blizzard UI; merged into a single profile for Tank/DPS/Healer
* Details - Changed the Bars texture
* Details - Changed the Title Bar texture
* MouseoverActionSettings - Added a profile for the addon Mouseover Action Settings, used to mouseover some action bars
* RFS - Removed unnecessary buffs from Raid Frames
* SUF - Added Arena frames
* SUF - Total overhaul of various frames
* Threat Plates - Changed the Filtered Auras method from Allow to Block
* Threat Plates - Fixed the Level text position
* Threat Plates - Fixed the Threat Plates profile to only show personal debuffs
* WA Druid - Moved Buff auras to better integrate with the new layout
* WA Druid - Re-organized the Buff auras order
* WA Dungeons & Raids - Added the Raid Ability Timeline
* WA Dungeons & Raids - Removed the icon border
* WA Dungeons & Raids - Various tuning
* WA Mage - Added a new Mage profile (WIP)
* WA Monk - Added a new Cooldown section
* WA Monk - Added a new Resources section
* WA Monk - Added a new Rotation section
* WA Monk - Moved Buff auras to better integrate with the new layout
* WA Monk - Re-organized the Buff auras order
* WA Monk - Removed the Serenity Buff aura
* WA Monk - Removed the Summon White Tiger Statue aura
* WA Rogue - Re-organized the Buff auras order
* WA Shaman - Added Buff auras for Enhancement Shaman
* WA Shaman - Moved Buff auras to better integrate with the new layout
* WA Shaman - Re-organized the Buff auras order
* WA Utilities - Added Arcane Intellect to Alerts to track missing buffs for Mage
* WA Utilities - Added Cast Bars for Player and Target frames (SUF is mandatory)
* WA Utilities - Added Cloak of Coordination to Alerts
* WA Utilities - Added an icon and casting time to the Blizzard Cast Bar
* WA Utilities - Added Great Vault to Alerts
* WA Utilities - Added Nameplate target arrows
* WA Utilities - Added Poisons to Alerts to track missing poisons for Rogue
* WA Utilities - Added the Skyriding bar and buffs
* WA Utilities - Added XP information in %
* WA Utilities - Fixed the loading condition for Alerts
* WA Utilities - Hidden the Quest Tracker during Raid/Party encounters
* WA Utilities - Moved Movement buffs/cooldown tracker from Class to Utilities
* WA Utilities - Moved the Raid Ability Timeline
* WA Utilities - Re-organized the Buff auras order
* WA Utilities - Removed mouse trails
* WA Utilities - Removed old Events tracker

### 📏 Various

* Added an SUF auras list for buffs/debuffs
* Updated SavedVariables
* Updated talents for Monk
* Updated the TOC version

## 0.6.0-RELEASE

* Added portraits for Player and Target frames
* Changed SUF textures
* Updated Blizzard profiles for DPS/Tank and Healer
* Switched from Immersion to DialogueUI
* Reworked core.lua, removing unused functions and polishing the code
* Updated SavedVariables
* Updated the TOC version

## 0.5.0-RELEASE

* Added the options.lua file with an Interface panel
* Reworked core.lua, adding functions
* Updated SavedVariables
* Updated the TOC version

## 0.4.0-RELEASE

* Fixed the trigger for the Haste Buff
* Updated the ThreatPlates profile
* Updated the TOC version
