#Requires AutoHotkey v2.0

#Include "../CanineMacro.ahk"

; Coordinates for different clicking spots.
; This global is used for accessing each spot.
global CORDS := Map()

; Get our screen resolution
global SCREEN_HEIGHT := SysGet(1)
global SCREEN_WIDTH := SysGet(0)

setup() {
    ; 2560x1440 screen resolution
    if (SCREEN_WIDTH = 2560 && SCREEN_HEIGHT = 1440) {
        ; Inventory
        CORDS["Inventory"] := Map()
        CORDS["Inventory"]["Potions"] := [594, 621]
        CORDS["Inventory"]["Search"] := [1724, 363]
        CORDS["Inventory"]["Use"] := [727, 460]

        ; Dialog Messages
        CORDS["MessageBox"] := Map()
        CORDS["MessageBox"]["Accept"] := [1284, 951]
        CORDS["MessageBox"]["Close"] := [1693, 365]

        ; Elements on main screen
        CORDS["Game"] := Map()
        CORDS["Game"]["AutoFarm"] := [221, 640]
        CORDS["Game"]["AutoHatch"] := [85, 640]
        CORDS["Game"]["AutoHatchOn"] := [1447, 563]
        CORDS["Game"]["ChargedOn"] := [1447, 705]
        CORDS["Game"]["StartHatch"] := [1565, 955]
        CORDS["Game"]["FreeGifts"] := [85, 490]
        CORDS["Game"]["TeleportButton"] := [221, 500]
        CORDS["Game"]["TeleportVoid"] := [590, 522]
        CORDS["Game"]["TeleportResult"] := [1275, 476]
        CORDS["Game"]["BestArea"] := [600, 523]

        ; First location in the free gifts window

        ; To move right, add 200 to x
        ; To move down, add 200 y
        CORDS["Game"]["FreeGiftsStartPos"] := [983, 450]   
    }

    if (SCREEN_WIDTH = 1920 && SCREEN_HEIGHT = 1080) {
        CORDS["Inventory"] := Map()
        CORDS["Inventory"]["Potions"] := [424, 452]
        CORDS["Inventory"]["Search"] := [1363, 259]
        CORDS["Inventory"]["Use"] := [527, 353]

        ; Dialog Messages
        CORDS["MessageBox"] := Map()
        CORDS["MessageBox"]["Accept"] := [961, 720]
        CORDS["MessageBox"]["Close"] := [1291, 265]

        ; Elements on main screen
        CORDS["Game"] := Map()
        CORDS["Game"]["AutoFarm"] := [174, 488]
        CORDS["Game"]["AutoHatch"] := [65, 488]
        CORDS["Game"]["AutoHatchOn"] := [1093, 387]
        CORDS["Game"]["ChargedOn"] := [1093, 525]
        CORDS["Game"]["StartHatch"] := [1191, 730]
        CORDS["Game"]["FreeGifts"] := [85, 490]
        CORDS["Game"]["TeleportButton"] := [173, 403]
        CORDS["Game"]["TeleportVoid"] := [423, 580]
        CORDS["Game"]["TeleportResult"] := [962, 355]

        ; First location in the free gifts window

        ; To move right, add 200 to x
        ; To move down, add 200 y
        CORDS["Game"]["FreeGiftsStartPos"] := [983, 450]
    }
}