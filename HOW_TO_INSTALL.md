## Installation

1. Download the latest PanzaUI [release](https://github.com/MarioCatuogno/PanzaUI/releases) and unzip it.
2. Install the PanzaUI addon from [CurseForge](https://www.curseforge.com/wow/addons/panzaui), or copy the `PanzaUI` folder into `World of Warcraft/_retail_/Interface/AddOns`.
3. Copy the `Fonts` folder (from `PanzaUI/Fonts`) into `World of Warcraft/_retail_` (next to the `Interface` folder, not inside it).
4. Install the [required addons](https://github.com/MarioCatuogno/PanzaUI?tab=readme-ov-file#required-addons).
5. Launch World of Warcraft and set the UI scale to 0.65 (Options → System → Graphics → Use UI Scale).
6. Import the PanzaUI Edit Mode layout, which places every frame of the UI:
   - type `/pui` to open the PanzaUI options;
   - in the **Profiles** section, click **Import** next to **Blizzard Edit Mode** and confirm with **Yes**;
   - type `/rl` to reload the UI.

   The layout is saved as **PanzaUI** and made active (an older PanzaUI layout is replaced). It can't be imported in combat.
7. Import the mandatory [Platynator](https://github.com/MarioCatuogno/PanzaUI/blob/main/PanzaUI/Profiles/PanzaUI-Platynator.txt) profile (`/platynator` → Profiles → Import).
8. If you want, you can also import these profiles to match my UI:
   - [BigWigs](https://github.com/MarioCatuogno/PanzaUI/blob/main/PanzaUI/Profiles/PanzaUI-BigWigs.txt) (`/bw` → Profiles → Import)
   - [Cooldown Manager](#cooldown-manager-class-profiles) class profiles (Edit Mode → Cooldown Manager → Advanced Cooldown Settings → Import)
9. Type `/pui` to open the PanzaUI options and turn off anything you don't like.
10. Enjoy!

__Note__: the fonts replace the default ones of the whole game. To get the original fonts back, just delete the `Fonts` folder from `_retail_`.

## Profiles

### Addon Profiles

| Profile | Github Link | Wago Link |
|---|---|---|
| Platynator | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/PanzaUI/Profiles/PanzaUI-Platynator.txt) | [Import](https://wago.io/UxWRLG-r_) |
| BigWigs | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/PanzaUI/Profiles/PanzaUI-BigWigs.txt) | — |

### Cooldown Manager Class Profiles

Optional class-specific profiles for the Cooldown Manager. These are not required to replicate the UI.

| Class / Spec | Github Link | Wago Link |
|---|---|---|
| Druid — Feral | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/PanzaUI/Profiles/CooldownManager/Druid-Feral.txt) | — |
| Druid — Guardian | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/PanzaUI/Profiles/CooldownManager/Druid-Guardian.txt) | — |
| Mage — Frost | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/PanzaUI/Profiles/CooldownManager/Mage-Frost.txt) | — |
| Monk — Brewmaster | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/PanzaUI/Profiles/CooldownManager/Monk-Brewmaster.txt) | [Import](https://wago.io/SC-WYrPjb) |
| Monk — Mistweaver | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/PanzaUI/Profiles/CooldownManager/Monk-Mistweaver.txt) | — |
| Monk — Windwalker | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/PanzaUI/Profiles/CooldownManager/Monk-Windwalker.txt) | [Import](https://wago.io/EE08tdX1t) |
| Rogue — Outlaw | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/PanzaUI/Profiles/CooldownManager/Rogue-Outlaw.txt) | — |
| Shaman — Elemental | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/PanzaUI/Profiles/CooldownManager/Shaman-Elemental.txt) | — |
| Shaman — Enhancement | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/PanzaUI/Profiles/CooldownManager/Shaman-Enhancement.txt) | — |

## FAQ

**PanzaUI is not in the AddOns list, what should I do?**

Check that the file `_retail_/Interface/AddOns/PanzaUI/PanzaUI.toc` exists: the `PanzaUI` folder must not be inside another `PanzaUI` folder.

**Why didn't the fonts change?**

Make sure the `Fonts` folder is directly inside `_retail_` and restart the game completely (a `/reload` is not enough for fonts).

**Does it support WoW Classic?**

No — PanzaUI only supports the **Retail** version of World of Warcraft.

**Where do I find the latest version of the profiles?**

Here on Github (see the releases or pre-releases) or on [CurseForge](https://www.curseforge.com/wow/addons/panzaui).

**Why is my UI shifted or why can't I see the Minimap?**

The Blizzard UI profile is made for 2560×1440. On other resolutions, lower the UI scale a little and move the frames in Edit Mode.

**Can I support your work?**

If you enjoy the UI and want to offer me a beer, be my guest! But if not, that's totally cool too, the UI remains free for everyone, always.

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/V4D020XOPV)
