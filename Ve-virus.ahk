#NoEnv
#SingleInstance, Force
#Persistent
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

; =====================================================
; ADVANCED EDUCATIONAL VIRUS SIMULATION
; =====================================================

; Global variables
isActive := true
originalWallpaper := ""
orientationOriginal := 0
processesToMonitor1 := "chrome.exe"
processesToMonitor2 := "firefox.exe"
processesToMonitor3 := "msedge.exe"
sites1 := "https://youtube.com/watch?v=dQw4w9WgXcQ"
sites2 := "https://youtube.com/watch?v=oHg5SJYRHA0"
sites3 := "https://www.bleepingcomputer.com/"
sites4 := "https://www.howtogeek.com/"

; Initialize simulation
Gosub, InitializeSimulation

; Set timers
SetTimer, MainEffects, 10000
SetTimer, MonitorProcesses, 5000
SetTimer, RandomSound, 30000
SetTimer, ScreenEffects, 60000

; Hotkeys
^!End::Gosub, EmergencyStop ; Ctrl+Alt+End
F1::Gosub, ShowEducationMenu
^!r::Reload
^!d::Gosub, ToggleSimulation

; =====================================================
; CORE FUNCTIONS
; =====================================================

InitializeSimulation:
    ; Save original settings
    originalWallpaper := GetCurrentWallpaper()
    orientationOriginal := GetDisplayOrientation()
    
    ; Show warning
    Gosub, ShowWarning
    
    ; Initial effects
    Gosub, ChangeWallpaper
    Gosub, PlayStartSound
    Gosub, CreateDesktopFiles
    ShowNotification("Virus simulation started! Press F1 for help")
return

MainEffects:
    if (!isActive) 
        return
    
    Random, effect, 1, 7
    if (effect = 1) {
        Gosub, OpenRandomSite
    } else if (effect = 2) {
        Gosub, RandomizeWindows
    } else if (effect = 3) {
        Gosub, MouseJitter
    } else if (effect = 4) {
        Gosub, ChangeClipboard
    } else if (effect = 5) {
        Gosub, FakeErrorMessages
    } else if (effect = 6) {
        Gosub, FakeSystemScan
    } else if (effect = 7) {
        Gosub, OpenRickRoll
    }
return

MonitorProcesses:
    if (!isActive)
        return
    
    Process, Exist, %processesToMonitor1%
    if (ErrorLevel = 0) {
        Run, %processesToMonitor1%
        ShowNotification("Restarted " . processesToMonitor1 . " for your safety!")
    }
    
    Process, Exist, %processesToMonitor2%
    if (ErrorLevel = 0) {
        Run, %processesToMonitor2%
        ShowNotification("Restarted " . processesToMonitor2 . " for your safety!")
    }
    
    Process, Exist, %processesToMonitor3%
    if (ErrorLevel = 0) {
        Run, %processesToMonitor3%
        ShowNotification("Restarted " . processesToMonitor3 . " for your safety!")
    }
return

RandomSound:
    if (!isActive)
        return
    
    Random, freq, 500, 2000
    Random, dur, 100, 500
    SoundBeep, %freq%, %dur%
return

ScreenEffects:
    if (!isActive)
        return
    
    Random, effect, 1, 3
    if (effect = 1) {
        Gosub, RotateScreen
    } else if (effect = 2) {
        Gosub, ShakeScreen
    } else {
        ShowNotification("Screen effect triggered!")
    }
return

; =====================================================
; SIMULATION EFFECTS (SAFE)
; =====================================================

OpenRandomSite:
    Random, randIndex, 1, 4
    if (randIndex = 1) {
        Run, %sites1%
    } else if (randIndex = 2) {
        Run, %sites2%
    } else if (randIndex = 3) {
        Run, %sites3%
    } else {
        Run, %sites4%
    }
return

RandomizeWindows:
    WinGet, windows, List
    Loop, %windows% {
        winID := windows%A_Index%
        WinGetTitle, title, ahk_id %winID%
        if (title != "" && title != "Program Manager") {
            Random, newX, -100, % A_ScreenWidth-200
            Random, newY, -100, % A_ScreenHeight-200
            Random, newW, 300, %A_ScreenWidth%
            Random, newH, 200, %A_ScreenHeight%
            WinMove, ahk_id %winID%,, %newX%, %newY%, %newW%, %newH%
        }
    }
return

MouseJitter:
    Random, xOffset, -100, 100
    Random, yOffset, -100, 100
    MouseMove, %xOffset%, %yOffset%, 50, R
return

ChangeClipboard:
    savedClip := ClipboardAll
    Clipboard := "!!! WARNING: System compromised! (Educational Simulation) !!!"
    Sleep 2000
    Clipboard := savedClip
return

FakeErrorMessages:
    Random, randIndex, 1, 5
    if (randIndex = 1) {
        errorMsg := "Critical System Error: 0x80070005"
    } else if (randIndex = 2) {
        errorMsg := "Memory Access Violation at 0x7FF89876"
    } else if (randIndex = 3) {
        errorMsg := "Security Threat Detected: Trojan:Script/Wacatac.B!ml"
    } else if (randIndex = 4) {
        errorMsg := "Your files are being encrypted! (Simulation)"
    } else {
        errorMsg := "System32 files corrupted! Restart required"
    }
    
    TrayTip, SYSTEM ALERT, %errorMsg%, 3, 3
return

FakeSystemScan:
    Progress, B1 W300, Scanning system for threats..., Educational Simulation, Malware Scanner
    Loop, 100 {
        Progress, %A_Index%
        Sleep 20
    }
    Progress, Off
    ShowNotification("Scan complete! 127 threats found (Simulation)")
return

OpenRickRoll:
    Run, https://youtube.com/watch?v=dQw4w9WgXcQ
return

RotateScreen:
    current := GetDisplayOrientation()
    SetDisplayOrientation(180)
    Sleep 5000
    SetDisplayOrientation(current)
return

ShakeScreen:
    WinGet, windows, List
    startTime := A_TickCount
    While (A_TickCount - startTime < 1000) {
        Random, xOffset, -5, 5
        Random, yOffset, -5, 5
        Loop, %windows% {
            winID := windows%A_Index%
            WinGetPos, x, y,,, ahk_id %winID%
            if (x != "" && y != "") {
                newX := x + xOffset
                newY := y + yOffset
                WinMove, ahk_id %winID%,, %newX%, %newY%
            }
        }
        Sleep 50
    }
return

CreateDesktopFiles:
    desktop := A_Desktop
    Loop, 5 {
        fileName := desktop . "\Warning_" . A_Index . ".txt"
        FileAppend, This is a harmless text file for educational purposes. `nDelete me anytime! `nSimulation ID: %A_Now%, %fileName%
    }
return

ChangeWallpaper:
    ; Skip wallpaper change to avoid issues
    ShowNotification("Wallpaper effect triggered!")
return

; =====================================================
; CONTROL FUNCTIONS
; =====================================================

EmergencyStop:
    isActive := false
    
    ; Restore original settings if needed
    if (originalWallpaper != "") {
        SetWallpaper(originalWallpaper)
    }
    
    ; Cleanup desktop files
    desktop := A_Desktop
    Loop, 5 {
        fileName := desktop . "\Warning_" . A_Index . ".txt"
        FileDelete, %fileName%
    }
    
    ShowNotification("Simulation stopped! All effects disabled")
    ExitApp
return

ToggleSimulation:
    isActive := !isActive
    
    if (isActive) {
        ShowNotification("Simulation RESUMED")
    } else {
        ShowNotification("Simulation PAUSED")
    }
return

ShowEducationMenu:
    MsgBox, 64, Cybersecurity Education, 
    (
    ADVANCED VIRUS SIMULATION (EDUCATIONAL)
    
    Features:
    - Safe browser redirection
    - Window randomization
    - Mouse movement simulation
    - Fake system alerts
    - Temporary screen effects
    - Simulated "threat detection"
    
    Safety Measures:
    - Press Ctrl+Alt+End to STOP immediately
    - Press Ctrl+Alt+D to pause/resume
    - All effects are temporary
    - Restarting PC removes all effects
    
    Educational Purpose:
    This demonstrates common malware techniques:
    1. Social engineering (fake warnings)
    2. System disruption (screen effects)
    3. Persistence (process monitoring)
    4. Browser manipulation
    
    Real malware can:
    - Encrypt your files
    - Steal passwords
    - Install backdoors
    
    Protection Tips:
    - Use reputable antivirus
    - Keep systems updated
    - Backup important data
    - Don't open suspicious attachments
    )
return

; =====================================================
; HELPER FUNCTIONS
; =====================================================

ShowWarning:
    MsgBox, 48, EDUCATIONAL SIMULATION, 
    (
    WARNING: ADVANCED VIRUS SIMULATION ACTIVATED!
    
    This is a safe educational demonstration showing 
    how real malware behaves. Your system will experience:
    - Browser windows opening
    - Screen effects
    - Fake warnings
    - Mouse movement
    
    Press Ctrl+Alt+End to STOP immediately
    Press F1 for educational information
    
    This simulation is TEMPORARY and NON-DESTRUCTIVE.
    All effects will stop after system restart.
    )
return

ShowNotification(message) {
    TrayTip, SIMULATION NOTICE, %message%, 5, 1
}

PlayStartSound:
    SoundPlay, *16
return

GetCurrentWallpaper() {
    VarSetCapacity(wallpaper, 1024 * 2, 0)
    DllCall("SystemParametersInfo", "UInt", 0x73, "UInt", 1024, "Ptr", &wallpaper, "UInt", 0)
    return StrGet(&wallpaper)
}

SetWallpaper(path) {
    DllCall("SystemParametersInfo", "UInt", 0x14, "UInt", 0, "Str", path, "UInt", 3)
}

GetDisplayOrientation() {
    VarSetCapacity(dev, 156, 0)
    DllCall("EnumDisplaySettingsA", "UInt", 0, "UInt", -1, "Ptr", &dev)
    return NumGet(dev, 132, "UInt")
}

SetDisplayOrientation(orientation) {
    VarSetCapacity(dev, 156, 0)
    DllCall("EnumDisplaySettingsA", "UInt", 0, "UInt", -1, "Ptr", &dev)
    NumPut(orientation, dev, 132, "UInt")
    DllCall("ChangeDisplaySettingsExA", "UInt", 0, "Ptr", &dev, "UInt", 0, "UInt", 0x01, "UInt", 0)
}
