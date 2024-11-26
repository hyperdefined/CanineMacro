#Requires AutoHotkey v2.0

; Turn on hoverboard, move right, turn off
moveToCenter() {
    ToolTip "Moving to center"
    pressHoverBoard(1000)
    move(RIGHT, 915)
    pressHoverBoard(1000)
}

; Turn on hoverboard, move up, turn off
moveToEgg() {
    ToolTip "Moving to egg"
    pressHoverBoard(1300)
    move(FORWARD, 820)
    pressHoverBoard(1000)
}

; Turn on hoverboard, move down, turn off
moveAwayFromEgg() {
    ToolTip "Moving away from egg"
    pressHoverBoard(1300)
    move(BACK, 1200)
    pressHoverBoard(1000)
	Sleep 7000
    ; When the player walks away, there is a chance the eggs still appear.
    ; In this case, spam click to hatch them
    Loop 50 {
        Click
        Sleep 50
    }
    Sleep 8000
}

; Presses the hoverboard off/on
pressHoverBoard(wait) {
    Send(HOVERBOARD)
    Sleep wait
}

; Move in a direction.
; Direction should be the key held down.
move(direction, duration) {
    Send "{" direction " down}"
    Sleep duration
    Send "{" direction " up}"
}