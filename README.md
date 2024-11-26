# CanineMacro
CanineMacro is a macro to do various things in Pet Simulator 99 automatically. This macro can help you rank up and farm while away. Macros are allowed on Roblox and Pet Simulator 99. This does not inject anything into the game, as this uses AutoHotKey.

## Functions
The macro runs on a "main loop," and does these things:
1. Check status, rejoin if we got disconnected.
2. Select the game window.
3. Eat 5x of each fruits.
4. Use 1 of each potion type (coins, lucky, gems, treasure hunter, damage). This will use the best one for each.
5. Teleport to the best area (the one that counts for ranks).
6. Move to the center of the breakable area and turn on autofarm.
7. Place flags (you can change which ones).
8. Place sprinklers.
9. Use ultimate.
10. Use 1 of each item (comet, lucky block, pinata, coin jar).
11. Move to egg, turn on auto hatching and charged.
12. Hatch for ~15 minutes, restarting every 1 minute in case you run out of coins.
13. Move away from egg.
14. Teleport back to void.

## Setup
Because the macro clicks on certain spots, it only works on certain resolutions. You can change your resolution by right clicking your desktop and clicking "Display settings." If your resolution/scaling is not listed below, it will not work. You can either request a resolution or match yours to one below.
|Resolution|Scaling|Supported?|
|---|---|---|
|1920x1080|100%|✅|
|2560x1440|100%|✅|

Download the repository, [install AutoHotKey 2.0](https://www.autohotkey.com/).

This macro requires some setup. This makes the macro more consistent with keybindings. You must set these keybindings in your Pet Simulator 99 settings. You can swap out shiny fruit instead if you want. 
|Item|Hotkey|
|---|---|
|Banana|T|
|Pineapple|Y|
|Watermelon|U|
|Apple|K|
|Orange|P|
|Rainbow Fruit|L|
|Any Flag|M|
|Lucky Block|B|
|Sprinkler|H|
|Coin Jar|V|
|Pinata|N|
|Comet|C|

Afterwards, simply join Pet Simulator 99 and make sure you spawn in the void. Do not move your camera. Hide the in-game chat and leaderboard. Make sure autofarm and autohatch are both fully disabled. Once everything is set, simply launch `CanineMacro.ahk` and press F5. To stop the macro, press F8.

You can use this in public lobbies, but the best area (Aether Colosseum) has some collision issues with the wings your player wears and can break moving around. I recommend until this is fixed to use a private lobby.

## Credits
This macro is inspired from [HatchGrind](https://github.com/waktool/HatchGrind). I wasn't able to get this macro working, so I decided to make my own. Some code is taken from there.

The icon used is from [Mutant Standard emoji](https://mutant.tech/), which is licensed under [CC BY-NC-SA 4.0 International](https://creativecommons.org/licenses/by-nc-sa/4.0/).