#Requires AutoHotkey v2.0

#Include "OCR.ahk"
#Include "Pin.ahk"

; Get our screen resolution
global SCREEN_HEIGHT := SysGet(1)
global SCREEN_WIDTH := SysGet(0)

checkMessageBox(text) {
    if (SCREEN_WIDTH = 2560 && SCREEN_HEIGHT = 1440) {
        scanBorder := Pin(955, 500, 1614, 614, 0, "b3 flash0")
        scanResult := OCR.FromRect(955, 500, 1614, 614)
        scanBorder.Destroy()
        return RegExMatch(scanResult.Text, text)
    }
    if (SCREEN_WIDTH = 1920 && SCREEN_HEIGHT = 1080) {
        scanBorder := Pin(644, 327, 1285, 600, 0, "b3 flash0")
        scanResult := OCR.FromRect(644, 327, 1285, 600)
        scanBorder.Destroy()
        return RegExMatch(scanResult.Text, text)
    }
    return 0
}

checkRobloxDisconnect(text) {
    if (SCREEN_WIDTH = 2560 && SCREEN_HEIGHT = 1440) {
        scanBorder := Pin(1069, 572, 1500, 838, 0, "b3 flash0")
        scanResult := OCR.FromRect(1069, 572, 1500, 838)
        scanBorder.Destroy()
        return RegExMatch(scanResult.Text, text)
    }
    if (SCREEN_WIDTH = 1920 && SCREEN_HEIGHT = 1080) {
        scanBorder := Pin(624, 369, 1184, 719, 0, "b3 flash0")
        scanResult := OCR.FromRect(624, 369, 1184, 719)
        scanBorder.Destroy()
        return RegExMatch(scanResult.Text, text)
    }
    return 0
}