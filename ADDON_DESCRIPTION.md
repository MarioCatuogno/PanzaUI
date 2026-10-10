![PanzaUI](https://raw.githubusercontent.com/MarioCatuogno/PanzaUI/main/Images/panzaui_logo.jpeg)

# PanzaUI

**PanzaUI** keeps the default World of Warcraft UI and fixes what bothers me in it: the small inconsistencies between panels, plus a few features I used to get from other addons.

It does not replace Blizzard's frames. It restyles them after they are drawn, so Edit Mode, the Blizzard options and every Blizzard feature keep working as usual.

## ✨ Why PanzaUI?

About **1 MB** of memory and about **0.1%** CPU on average. PanzaUI hooks the Blizzard frames already on screen instead of building new ones, with no libraries or frameworks. My previous setup, made of several big addons and profiles (until [1.7-RELEASE](https://github.com/MarioCatuogno/PanzaUI/releases/tag/1.7)), used about **70-90 MB** and about **15%** CPU on average for the same result.

### Built for Midnight
Midnight limits what addons can read and change in combat. PanzaUI was written around those limits from the start, so it does not break or taint the UI.

![PanzaUI - Combat](https://raw.githubusercontent.com/MarioCatuogno/PanzaUI/main/Images/panzaui_dummy.jpeg)

## 🧩 Features

Every feature has its own toggle.

### General
- **Refined text**: a clean outlined font across the whole UI, from unit frames to menus and tooltips
- **Class colors** on the health bars, with reaction colors for NPCs
- **Custom bar textures** for unit frames, cast bars, Cooldown Manager, Personal Resource Display, Damage Meter and progress bars
- **Refined borders**: rounded icons in the action bar style across Blizzard panels (rewards and Great Vault, professions, currency, equipment sets, collections, Delves companion), colored by item quality, and a cleaner border for tooltips (including the Group Finder queue status), pop-ups, Delves and Edit Mode windows
- **Profiles**: the PanzaUI Edit Mode layout and the Platynator and BigWigs profiles, imported with one click

### Action Bars
- Cleaner buttons, with no macro names or keybindings
- Icon zoom to hide the old borders of classic icons
- Optional red icons when the target is out of range
- Visibility for every bar: always, on mouseover (with a smooth fade in and out), only while Skyriding, never while Skyriding, only in combat, only out of combat or hidden (also for Micro Menu, Bag Bar and XP bar)
- Want my setup? Check [this guide](https://github.com/MarioCatuogno/PanzaUI/issues/119)

### Bags & Items
- Item level on equipment in bags, banks and the Character and Inspect panels, colored by quality
- Auto-repair and auto-sell of junk items at merchants

### Chat
- Cleaner chat windows, timestamps and short channel names
- Clickable web links, with a box to copy them
- No more minor messages: guild message of the day, loot of other players, online/offline and join/leave notices, group settings, spells learned when changing specialization, and more

### Combat
- Rounded icons for buffs, debuffs, Cooldown Manager and Damage Meter
- Elapsed time on the cast bars
- Dynamic Cooldown Manager layout, always packed with no gaps
- Cleaner Personal Resource Display with health and power as a percentage, optionally hidden while you cast

![PanzaUI - Raid](https://raw.githubusercontent.com/MarioCatuogno/PanzaUI/main/Images/panzaui_raid_01.jpeg)

### Party & Raid Frames
- Names without server and health as a percentage
- Cleaner shields, heal prediction and aggro border
- Sharper role icons

### Quest & Minimap
- Cleaner minimap and Quest Tracker, without the All Objectives header and with the quest count on the Quests header
- Quest Tracker hidden during boss fights, Mythic+ and instance combat, so you can focus on the fight

### Tooltips
- Class colored names, faction (red for Horde, blue for Alliance), Mythic+ rating and item level of players
- Item and spell IDs
- Mount of players, with its icon

### Unit Frames
- Refined Player, Target, Focus, Boss and Pet frames: centered names, health and power as a percentage
- Less clutter: PvP icons, glows, combat text and other minor elements hidden
- Class icon instead of the portrait for players, if you prefer it

### Various
- Cursor ring in your class color
- Fast auto-loot and fast item delete
- Mythic+ keystone inserted automatically in the Font of Power
- Current expansion filter set automatically in the Auction House
- Destination shown while flying on a flight path
- `/way` command to set map waypoints from coordinates
- Rounded icons and a matching HD border for Platynator nameplates
- Refined style for BigWigs bars (Blizzard style), Battle Res icon, queue timer and start timer
- No more flashing micro menu alerts

![PanzaUI - Interface](https://raw.githubusercontent.com/MarioCatuogno/PanzaUI/main/Images/panzaui_interface_01.jpeg)

## ⚙️ Options

Everything is in **Options → AddOns → PanzaUI**, or just type `/pui` in chat.

![PanzaUI - Options](https://raw.githubusercontent.com/MarioCatuogno/PanzaUI/main/Images/panzaui_menu_01.jpeg)

Handy chat commands:

| Command | What it does |
|---|---|
| `/pui` | Opens the PanzaUI options |
| `/rl` | Reloads the UI |
| `/rd` | Starts a ready check |
| `/pl` | Starts a 10-second pull timer |

## 🎨 The full PanzaUI look

PanzaUI works on its own with any layout. To get the PanzaUI layout of the frames and the profiles for Platynator and BigWigs, just click **Import** in the Profiles section of the options. If you want the exact look of the screenshots, the [GitHub page](https://github.com/MarioCatuogno/PanzaUI) also has the fonts and the Cooldown Manager class profiles, with a short [installation guide](https://github.com/MarioCatuogno/PanzaUI/blob/main/HOW_TO_INSTALL.md).

![PanzaUI - Party](https://raw.githubusercontent.com/MarioCatuogno/PanzaUI/main/Images/panzaui_party_01.jpeg)

## 🤖 AI Disclaimer

PanzaUI is designed, tested in game and maintained by me. During development I used an AI assistant to help write and review the code, track down bugs and improve performance. Every change has been checked and tested in game before being released.

## 🐞 Bugs and feedback

Found a bug or have an idea? [Open an issue on GitHub](https://github.com/MarioCatuogno/PanzaUI/issues) and I'll help as much as I can.

## ☕ Support

PanzaUI is and will always be free. If you enjoy it and want to offer me a beer, be my guest on [Ko-fi](https://ko-fi.com/V4D020XOPV)!
