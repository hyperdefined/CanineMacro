; Set some settings we need
#Requires AutoHotkey v2.0
#SingleInstance Force
CoordMode "Mouse", "Window"
CoordMode "Pixel", "Window"
SetMouseDelay 10

#Include "%A_ScriptDir%\Utils"
#Include "Movement.ahk"
#Include "Hotkeys.ahk"
#Include "CordsManager.ahk"
#Include "OCR.ahk"
#Include "Pin.ahk"
#Include "ScanScreen.ahk"

; Setup some globals
global BEST_AREA := "Aether Colosseum"
global POTIONS := ["Coins Potion", "Diamonds Potion", "Damage Potion", "Lucky Eggs Potion", "Treasure Hunter Potion"]
global disconnects := 0
global loops := 0

; Set the icon
iconFile := A_WorkingDir . "\Utils\wolf.ico"
TraySetIcon iconFile

F8:: {
    MsgBox("Disconnects: " disconnects "`nLoops: " loops, "CanineMacro Results")
    Sleep 10000
    ExitApp
}
F5:: {
    global loops
    setup() ; Run setup for cords loading
    ; The main loop
    Loop {
        checkStatus()
        selectRoblox()
        eatFruit()
        usePotions()
        ;claimGifts() - broken, will fix
        teleportToBest()
        moveToCenter()
        clickAutoFarm() ; Turn on
        placeFlag()
        placeSprinkler()
        useAbility()
        useItems()
        moveToEgg()
        hatch()
        moveAwayFromEgg()
        clickAutoFarm() ; Turn off
        teleportToVoid()
        loops:= loops + 1
    }
}

; Make sure we did not disconnect
checkStatus() {
    global disconnects
    ToolTip "Checking status"
	
    disconnected := checkRobloxDisconnect("Disconnected|Reconnect|Leave")
    if (disconnected) {
        disconnects:= disconnects + 1
        ToolTip "Disconnected, restarting"
        Run "roblox://placeID=8737899170"
        Sleep 95000
    }
}

; Start auto hatching eggs
hatch() {
    ToolTip "Hatching eggs"
    ; Make sure our toggles are set
    clickSpot(CORDS["Game"]["AutoHatch"], 300)
    clickSpot(CORDS["Game"]["AutoHatchOn"], 300)
    clickSpot(CORDS["Game"]["ChargedOn"], 300)
    clickSpot(CORDS["MessageBox"]["Close"], 150)
	
    ; Hatch for 15 minutes, each minute restarting the hatch
	Loop 5 {
        ; Open the hatch menu
        Send "{e}"
        Sleep 300
        ; Start hatching
        clickSpot(CORDS["Game"]["StartHatch"], 300)
        Sleep 60000
    }
}

; Use potions from inventory
usePotions() {
    Send(INVENTORY)
    Sleep 200
    clickSpot(CORDS["Inventory"]["Potions"], 300)
    for value in POTIONS {
        clickSpot(CORDS["Inventory"]["Search"], 300)
        Send(value)
        Sleep 400
        clickSpot(CORDS["Inventory"]["Use"], 300)
    }
    Sleep 500
    Send(INVENTORY)
    Sleep 1000
}

; Place flags
placeFlag() {
    ToolTip "Placing flags"
    Loop 50 {
        Send "{" MAGNET_FLAG " down}"
        Sleep 150
        Send "{" MAGNET_FLAG " up}"
        Sleep 400
        cannotPlace := checkMessageBox("flag|place|different")
        if (cannotPlace) {
            clickSpot(CORDS["MessageBox"]["Accept"], 150)
            Sleep 1000
            break
        }
    }
    Sleep 1000
}

placeSprinkler() {
    ToolTip "Placing sprinkers"
    Loop 50 {
        Send "{" SPRINKLER " down}"
        Sleep 150
        Send "{" SPRINKLER " up}"
        Sleep 400

        cannotPlace := checkMessageBox("place|sprinklers")
        if (cannotPlace) {
            clickSpot(CORDS["MessageBox"]["Accept"], 150)
            Sleep 1000
            break
        }
    }
    Sleep 1000
}

; Use items for rank
useItems() {
    ToolTip "Spawning comet"
    Send(COMET)
    Sleep 150
    clickSpot(CORDS["MessageBox"]["Accept"], 300)
    Sleep 15000 ; Give Comet 15 seconds to break
    ToolTip "Spawning lucky block"
    Send(LUCKY_BLOCK)
    Sleep 150
    clickSpot(CORDS["MessageBox"]["Accept"], 300)
    Sleep 15000 ; Give Lucky Block 15 seconds to break
    ToolTip "Spawning coin jar"
    Send(COIN_JAR)
    Sleep 150
    clickSpot(CORDS["MessageBox"]["Accept"], 300)
    Sleep 15000 ; Give Coin Jar 15 seconds to break
    ToolTip "Spawning Pinata"
    Send(PINATA)
    Sleep 150
    clickSpot(CORDS["MessageBox"]["Accept"], 300)
    Sleep 10000 ; Give Pinata 7 seconds to break
    ; Force a dialog close at the end just in case
    clickSpot(CORDS["MessageBox"]["Accept"], 300)
}

; Toggle AutoFarm
clickAutoFarm() {
    ToolTip "Toggling autofarm"
    clickSpot(CORDS["Game"]["AutoFarm"], 1000)
}

; Teleport to the best area
teleportToBest() {
    ToolTip "Teleporting to best"
    clickSpot(CORDS["Game"]["TeleportButton"], 1000)
	clickSpot(CORDS["Game"]["BestArea"], 10000)
}

; Teleport to the void
teleportToVoid() {
    ToolTip "Teleporting to void"
    clickSpot(CORDS["Game"]["TeleportButton"], 1000)
    clickSpot(CORDS["Game"]["TeleportVoid"], 10000)
}

; Use ability
useAbility() {
    ToolTip "Using ultimate"
    Send(ABILITY)
    Sleep 500
}

; Eat all fruits
eatFruit() {
    Loop 5 {
        ToolTip "Eating fruit"
        Send(BANANA)
        clickSpot(CORDS["MessageBox"]["Close"], 500)
        Send(PINEAPPLE)
        clickSpot(CORDS["MessageBox"]["Close"], 500)
        Send(MELON)
        clickSpot(CORDS["MessageBox"]["Close"], 500)
        Send(APPLE)
        clickSpot(CORDS["MessageBox"]["Close"], 500)
        Send(ORANGE)
        clickSpot(CORDS["MessageBox"]["Close"], 500)
        Send(RAINBOW_FRUIT)
        clickSpot(CORDS["MessageBox"]["Close"], 500)
        Sleep 2000
    }
}

; Claim the free gifts
; THIS IS BROKEN CURRENTLY, WILL FIX
claimGifts() {
    ToolTip "Claiming gifts"
    clickSpot(CORDS["Game"]["FreeGifts"], 300)
    xPos := CORDS["Game"]["FreeGiftsStartPos"][1]
    yPos := CORDS["Game"]["FreeGiftsStartPos"][2]
    Sleep 300
    ; Loop 3 times, for each row
    Loop 3 {
        ; Loop 4 times to click each present
        Loop 4 {
            ; Click the item in row
            clickSpotPos(xPos, yPos, 500)
            scanBorder := Pin(1069, 572, 1500, 838, 0, "b3 flash0")
            scanResult := OCR.FromRect(1069, 572, 1500, 838)
            cannotClaim := RegExMatch(scanResult.Text, "redeem|gift")
            scanBorder.Destroy()
            if (cannotClaim) {
                clickSpot(CORDS["MessageBox"]["Accept"], 300)
                clickSpot(CORDS["MessageBox"]["Close"], 300)
                Sleep 1000
                return
            }
            ; Move to right one spot
            xPos += 200
        }
        ; After row is done, move to next one
        xPos := CORDS["Game"]["FreeGiftsStartPos"][1]
        ; Move down one row
        yPos += 200
    }
    ; Close the gifts window
    clickSpot(CORDS["MessageBox"]["Close"], 3000)
}

; Click by position from CORDS
clickSpot(CORDS, wait) {
    SendEvent "{Click, " CORDS[1] ", " CORDS[2] ", 1}"
    Sleep wait
}

; Click by x and y positions
clickSpotPos(x, y, wait) {
    Send "{Click, " x ", " y ", 1}"
    Sleep wait
}

; Make sure Roblox is selected
selectRoblox() {
    ToolTip "Selecting Roblox"
    try {
        WinActivate "ahk_exe RobloxPlayerBeta.exe"
    } catch {
        ToolTip "Restarting game"
        Run "roblox://placeID=8737899170"
        Sleep 65000
    }
    Sleep 4000
}