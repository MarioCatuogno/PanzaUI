## Installation

1. Download the latest PanzaUI [release](https://github.com/MarioCatuogno/PanzaUI/releases) and unzip it.
2. Copy the `PanzaUI` folder (from `Interface/AddOns`) into `World of Warcraft/_retail_/Interface/AddOns`.
3. Copy the `Fonts` folder into `World of Warcraft/_retail_` (next to the `Interface` folder, not inside it).
4. Install the [required addons](https://github.com/MarioCatuogno/PanzaUI?tab=readme-ov-file#required-addons).
5. Launch World of Warcraft and set the UI scale to 0.65 (Options → System → Graphics → Use UI Scale).
6. Import the following mandatory profiles:
   - [BlizzardUI](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/PanzaUI-BlizzardUI.txt) (Edit Mode → Layout → Import)
   - [Platynator](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/PanzaUI-Platynator.txt) (`/platynator` → Profiles → Import)
7. If you want, you can also import these profiles to match my UI:
   - [BigWigs](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/PanzaUI-BigWigs.txt) (`/bw` → Profiles → Import)
   - [Cooldown Manager](#cooldown-manager-class-profiles) class profiles (Edit Mode → Cooldown Manager → Advanced Cooldown Settings → Import)
8. Type `/pui` to open the PanzaUI options and turn off anything you don't like.
9. Enjoy!

__Note__: the fonts replace the default ones of the whole game. To get the original fonts back, just delete the `Fonts` folder from `_retail_`.

## Profiles

### Addon Profiles

| Profile | Github Link | Wago Link |
|---|---|---|
| Blizzard UI | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/PanzaUI-BlizzardUI.txt) | [Import](https://wago.io/u-uPYMucI) |
| Platynator | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/PanzaUI-Platynator.txt) | [Import](https://wago.io/UxWRLG-r_) |
| BigWigs | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/PanzaUI-BigWigs.txt) | — |

### Cooldown Manager Class Profiles

Optional class-specific profiles for the Cooldown Manager. These are not required to replicate the UI.

| Class / Spec | Github Link | Wago Link |
|---|---|---|
| Druid — Feral | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/Cooldown%20Manager/Druid-Feral.txt) | — |
| Druid — Guardian | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/Cooldown%20Manager/Druid-Guardian.txt) | — |
| Mage — Frost | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/Cooldown%20Manager/Mage-Frost.txt) | — |
| Monk — Brewmaster | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/Cooldown%20Manager/Monk-Brewmaster.txt) | [Import](https://wago.io/SC-WYrPjb) |
| Monk — Mistweaver | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/Cooldown%20Manager/Monk-Mistweaver.txt) | — |
| Monk — Windwalker | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/Cooldown%20Manager/Monk-Windwalker.txt) | [Import](https://wago.io/EE08tdX1t) |
| Rogue — Outlaw | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/Cooldown%20Manager/Rogue-Outlaw.txt) | — |
| Shaman — Elemental | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/Cooldown%20Manager/Shaman-Elemental.txt) | — |
| Shaman — Enhancement | [Import](https://github.com/MarioCatuogno/PanzaUI/blob/main/Profiles/Cooldown%20Manager/Shaman-Enhancement.txt) | — |

## FAQ

**PanzaUI is not in the AddOns list, what should I do?**

Check that the file `_retail_/Interface/AddOns/PanzaUI/PanzaUI.toc` exists: the `PanzaUI` folder must not be inside another `PanzaUI` folder.

**Why didn't the fonts change?**

Make sure the `Fonts` folder is directly inside `_retail_` and restart the game completely (a `/reload` is not enough for fonts).

**Does it support WoW Classic?**

No — PanzaUI only supports the **Retail** version of World of Warcraft.

**Where do I find the latest version of the profiles?**

Here on Github (see the releases or pre-releases) or on [Wago](https://wago.io/PO1A4B5V3).

**Why is my UI shifted or why can't I see the Minimap?**

The Blizzard UI profile is made for 2560×1440. On other resolutions, lower the UI scale a little and move the frames in Edit Mode.

**Can I support your work?**

If you enjoy the UI and want to offer me a beer, be my guest! But if not, that's totally cool too, the UI remains free for everyone, always.

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/V4D020XOPV)
