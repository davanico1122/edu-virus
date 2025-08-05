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
processesToMonitor := ["chrome.exe", "firefox.exe", "msedge.exe"]
sites := ["https://youtube.com/watch?v=dQw4w9WgXcQ", "https://youtube.com/watch?v=oHg5SJYRHA0", "https://www.bleepingcomputer.com/", "https://www.howtogeek.com/"]

; Initialize simulation
InitializeSimulation()

; Set timers
SetTimer, MainEffects, 10000
SetTimer, MonitorProcesses, 5000
SetTimer, RandomSound, 30000
SetTimer, ScreenEffects, 60000

; Hotkeys
^!End::EmergencyStop() ; Ctrl+Alt+End
F1::ShowEducationMenu()
^!r::ReloadScript()
^!d::ToggleSimulation()

; =====================================================
; CORE FUNCTIONS
; =====================================================

InitializeSimulation() {
    ; Save original settings
    originalWallpaper := GetCurrentWallpaper()
    orientationOriginal := GetDisplayOrientation()
    
    ; Show warning
    ShowWarning()
    
    ; Initial effects
    ChangeWallpaper()
    PlayStartSound()
    CreateDesktopFiles()
    ShowNotification("Virus simulation started! Press F1 for help")
}

MainEffects() {
    if (!isActive) 
        return
    
    Random, effect, 1, 7
    switch effect
    {
        case 1: OpenRandomSite()
        case 2: RandomizeWindows()
        case 3: MouseJitter()
        case 4: ChangeClipboard()
        case 5: FakeErrorMessages()
        case 6: FakeSystemScan()
        case 7: OpenRickRoll()
    }
}

MonitorProcesses() {
    if (!isActive)
        return
    
    for index, process in processesToMonitor {
        Process, Exist, %process%
        if (ErrorLevel = 0) {
            Run, % process
            ShowNotification("Restarted " process " for your safety!")
        }
    }
}

RandomSound() {
    if (!isActive)
        return
    
    SoundBeep, % Random(500, 2000), % Random(100, 500)
}

ScreenEffects() {
    if (!isActive)
        return
    
    Random, effect, 1, 3
    switch effect
    {
        case 1: RotateScreen(180, 5000)
        case 2: InvertColors(3000)
        case 3: ShakeScreen(5, 1000)
    }
}

; =====================================================
; SIMULATION EFFECTS (SAFE)
; =====================================================

OpenRandomSite() {
    Random, randIndex, 1, % sites.Length()
    Run, % sites[randIndex]
}

RandomizeWindows() {
    WinGet, windows, List
    Loop, %windows% {
        winID := windows%A_Index%
        WinGetTitle, title, ahk_id %winID%
        if (title != "" && title != "Program Manager") {
            Random, newX, -100, A_ScreenWidth-200
            Random, newY, -100, A_ScreenHeight-200
            Random, newW, 300, A_ScreenWidth
            Random, newH, 200, A_ScreenHeight
            WinMove, ahk_id %winID%,, newX, newY, newW, newH
        }
    }
}

MouseJitter() {
    Random, xOffset, -100, 100
    Random, yOffset, -100, 100
    MouseMove, xOffset, yOffset, 50, R
}

ChangeClipboard() {
    savedClip := ClipboardAll
    Clipboard := "!!! WARNING: System compromised! (Educational Simulation) !!!"
    Sleep 2000
    Clipboard := savedClip
}

FakeErrorMessages() {
    errors := [
        "Critical System Error: 0x80070005",
        "Memory Access Violation at 0x7FF89876",
        "Security Threat Detected: Trojan:Script/Wacatac.B!ml",
        "Your files are being encrypted! (Simulation)",
        "System32 files corrupted! Restart required"
    ]
    
    Random, randIndex, 1, % errors.Length()
    TrayTip, SYSTEM ALERT, % errors[randIndex], 3, 3
}

FakeSystemScan() {
    Progress, B1 W300, Scanning system for threats..., Educational Simulation, Malware Scanner
    Loop, 100 {
        Progress, %A_Index%
        Sleep 20
    }
    Progress, Off
    ShowNotification("Scan complete! 127 threats found (Simulation)")
}

OpenRickRoll() {
    Run, https://youtube.com/watch?v=dQw4w9WgXcQ
}

RotateScreen(degrees, duration) {
    current := GetDisplayOrientation()
    SetDisplayOrientation(degrees)
    Sleep duration
    SetDisplayOrientation(current)
}

InvertColors(duration) {
    DllCall("SetWindowCompositionAttribute", "ptr", WinExist("A"), "ptr", VarSetCapacity(CA, 4, 0) ? &CA : &CA, "uint", 0)
    Sleep duration
    DllCall("SetWindowCompositionAttribute", "ptr", WinExist("A"), "ptr", VarSetCapacity(CA, 4, 0) ? &CA : &CA, "uint", 1)
}

ShakeScreen(intensity, duration) {
    startTime := A_TickCount
    While (A_TickCount - startTime < duration) {
        Random, xOffset, -intensity, intensity
        Random, yOffset, -intensity, intensity
        for _, id in GetWindowList() {
            WinGetPos, x, y,,, ahk_id %id%
            WinMove, ahk_id %id%,, x + xOffset, y + yOffset
        }
        Sleep 50
    }
    ; Restore original positions
    for _, id in GetWindowList() {
        WinRestore, ahk_id %id%
    }
}

CreateDesktopFiles() {
    desktop := A_Desktop
    Loop, 5 {
        FileAppend, This is a harmless text file for educational purposes. `nDelete me anytime! `nSimulation ID: %A_Now%, %desktop%\Warning_%A_Index%.txt
    }
}

; =====================================================
; CONTROL FUNCTIONS
; =====================================================

EmergencyStop() {
    global isActive
    isActive := false
    
    ; Restore original settings
    SetWallpaper(originalWallpaper)
    SetDisplayOrientation(orientationOriginal)
    
    ; Cleanup
    Loop, 5 {
        FileDelete, %A_Desktop%\Warning_%A_Index%.txt
    }
    
    ShowNotification("Simulation stopped! All effects disabled")
    ExitApp
}

ToggleSimulation() {
    global isActive
    isActive := !isActive
    
    if (isActive) {
        ShowNotification("Simulation RESUMED")
    } else {
        ShowNotification("Simulation PAUSED")
    }
}

ReloadScript() {
    Reload
}

ShowEducationMenu() {
    MsgBox, 64, Cybersecurity Education, 
    (Ltrim
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
    
    YouTube Content Ideas:
    1. Show simulation effects
    2. Explain malware techniques
    3. Demonstrate proper removal
    4. Compare to real malware
    )
}

; =====================================================
; HELPER FUNCTIONS
; =====================================================

ShowWarning() {
    MsgBox, 48, EDUCATIONAL SIMULATION, 
    (Ltrim
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
}

ShowNotification(message) {
    TrayTip, SIMULATION NOTICE, %message%, 5, 1
}

PlayStartSound() {
    SoundPlay, *16
}

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
    DllCall("EnumDisplaySettingsA", "UInt", 0, "UInt", -1, "UInt", &dev)
    return NumGet(dev, 156-24, "UInt")
}

SetDisplayOrientation(orientation) {
    VarSetCapacity(dev, 156, 0)
    DllCall("EnumDisplaySettingsA", "UInt", 0, "UInt", -1, "UInt", &dev)
    NumPut(orientation, dev, 156-24, "UInt")
    DllCall("ChangeDisplaySettingsExA", "UInt", 0, "UInt", &dev, "UInt", 0, "UInt", 0x01|0x02|0x04, "UInt", 0)
}

GetWindowList() {
    WinGet, windows, List
    windowList := []
    Loop, %windows% {
        winID := windows%A_Index%
        windowList.Push(winID)
    }
    return windowList
}