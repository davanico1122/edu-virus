
#NoEnv
#SingleInstance, Force
#Persistent
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

; =====================================================
; ULTRA-SECURE EDUCATIONAL VIRUS SIMULATION
; =====================================================

; Global variables
isActive := false
processesToMonitor := "chrome.exe,firefox.exe,msedge.exe,opera.exe,brave.exe"
sites := "https://youtube.com/watch?v=dQw4w9WgXcQ,https://youtube.com/watch?v=oHg5SJYRHA0,https://www.bleepingcomputer.com/,https://www.howtogeek.com/,https://example.com/security-alert"
errorMessages := "Critical System Error: 0x80070005,Memory Access Violation at 0x7FF89876,Security Threat Detected: Trojan:Script/Wacatac.B!ml,Your files are being encrypted! (Simulation),System32 files corrupted! Restart required,Virus detected: Heur.AdvML.B!,Boot sector compromised! (Simulation)"

; Show warnings and start simulation
Gosub, ShowDoubleWarning

; =====================================================
; WARNING SYSTEM WITH BEEP SOUNDS
; =====================================================

ShowDoubleWarning:
    ; First warning
    MsgBox, 4144, CYBERSECURITY SIMULATION - WARNING 1/2, 
    (LTrim
    WARNING: ADVANCED VIRUS SIMULATION ACTIVATION
    
    This is an educational demonstration showing how
    real malware behaves. Your system will experience:
    - Random browser windows opening
    - Screen rotation effects
    - Fake system warnings
    - Mouse movement anomalies
    
    Press OK to proceed to final warning
    )
    
    ; Second warning
    MsgBox, 4144, CYBERSECURITY SIMULATION - FINAL WARNING 2/2, 
    (LTrim
    FINAL WARNING: ACTIVATION IN PROGRESS
    
    After pressing OK:
    1. You will hear BEEP BEEP confirmation
    2. Simulation will start immediately
    3. Desktop files will be created
    4. System monitoring will begin
    
    SAFETY MEASURES:
    - Press Ctrl+Alt+End to STOP immediately
    - Press F1 for educational information
    - All effects are temporary and reversible
    
    Press OK to activate simulation or Cancel to abort
    )
    
    ; Abort if user cancels
    IfMsgBox, Cancel
    {
        MsgBox, Simulation aborted. No changes were made.
        ExitApp
    }
    
    ; Play activation beeps
    SoundBeep, 800, 600
    Sleep, 300
    SoundBeep, 1200, 800
    Sleep, 500
    
    ; Initialize simulation
    Gosub, InitializeSimulation
return

InitializeSimulation:
    ; Set initial state
    isActive := true
    
    ; Initial effects
    Gosub, CreateDesktopFiles
    Gosub, ShowStartNotification
    
    ; Set timers
    SetTimer, MainEffects, 15000
    SetTimer, MonitorProcesses, 7000
    SetTimer, RandomSound, 25000
    SetTimer, ScreenEffects, 45000
    SetTimer, SpecialEffects, 120000
return

; =====================================================
; ENHANCED CORE FUNCTIONS
; =====================================================

MainEffects:
    if (!isActive) 
        return
    
    Random, effect, 1, 20
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
    } else if (effect = 8) {
        Gosub, FlipScreenTemporarily
    } else if (effect = 9) {
        Gosub, SimulateKeyPresses
    } else if (effect = 10) {
        Gosub, FakeUpdatePopup
    } else if (effect = 11) {
        Gosub, FakeRansomwareNote
    } else if (effect = 12) {
        Gosub, FakeBlueScreen
    } else if (effect = 13) {
        Gosub, FakeLoginScreen
    }
    ; 14-20: No action (intentional gap for reduced frequency)
return

MonitorProcesses:
    if (!isActive)
        return
    
    Loop, Parse, processesToMonitor, `,
    {
        Process, Exist, %A_LoopField%
        if (ErrorLevel = 0) {
            Run, %A_LoopField%
            ShowNotification("Restarted " . A_LoopField . " for your safety!")
        }
    }
return

SpecialEffects:
    if (!isActive)
        return
    
    Random, effect, 1, 4
    if (effect = 1) {
        Gosub, MatrixEffect
    } else if (effect = 2) {
        Gosub, FakeBitcoinMiner
    } else if (effect = 3) {
        Gosub, NetworkFloodWarning
    }
return

; =====================================================
; ENHANCED SIMULATION EFFECTS (FIXED SYNTAX)
; =====================================================

OpenRandomSite:
    StringSplit, siteArray, sites, `,
    Random, randIndex, 1, %siteArray0%
    Run, % siteArray%randIndex%
return

RandomizeWindows:
    WinGet, windows, List
    Loop, %windows% {
        winID := windows%A_Index%
        WinGetTitle, title, ahk_id %winID%
        if (title != "" && title != "Program Manager" && title != "Start") {
            Random, newX, -100, % A_ScreenWidth-200
            Random, newY, -100, % A_ScreenHeight-200
            Random, newW, 300, %A_ScreenWidth%
            Random, newH, 200, %A_ScreenHeight%
            WinMove, ahk_id %winID%,, %newX%, %newY%, %newW%, %newH%
        }
    }
return

MouseJitter:
    Loop, 15 {
        Random, xOffset, -50, 50
        Random, yOffset, -50, 50
        MouseMove, %xOffset%, %yOffset%, 0, R
        Random, sleepTime, 50, 150
        Sleep, %sleepTime%
    }
return

ChangeClipboard:
    savedClip := ClipboardAll
    Clipboard := "!!! WARNING: System compromised! Run security scan immediately! (Educational Simulation) !!!"
    Sleep 3000
    Clipboard := savedClip
return

FakeErrorMessages:
    StringSplit, errorArray, errorMessages, `,
    Random, randIndex, 1, %errorArray0%
    TrayTip, CRITICAL SYSTEM ALERT, % errorArray%randIndex%, 10, 3
return

FakeSystemScan:
    Progress, B1 W400 H80, Scanning system for threats..., Educational Virus Simulation, Windows Defender
    totalSteps := 100
    Loop, %totalSteps% {
        Random, currentStep, % A_Index, % totalSteps
        Progress, %currentStep%
        Random, scanTime, 50, 200
        Sleep, %scanTime%
    }
    Progress, Off
    ShowNotification("Scan complete! 248 threats detected (Simulation)")
return

OpenRickRoll:
    Run, https://youtube.com/watch?v=dQw4w9WgXcQ
return

FlipScreenTemporarily:
    ShowNotification("Display orientation reversed! (Simulation)")
    Sleep 5000
    ShowNotification("Display orientation restored")
return

SimulateKeyPresses:
    Send, {Ctrl down}
    Random, key, 65, 90  ; A-Z
    Send, % Chr(key)
    Sleep, 100
    Send, {Ctrl up}
return

FakeUpdatePopup:
    MsgBox, 262180, SYSTEM UPDATE REQUIRED, 
    (LTrim
    Your system needs to install critical security updates!
    This will help protect against recent virus threats.
    
    Install now? (Simulation)
    )
    
    IfMsgBox, Yes
    {
        Progress, B1 W400, Installing security updates..., System Update, Please wait...
        Loop, 100 {
            Progress, %A_Index%
            Sleep, 30
        }
        Progress, Off
        ShowNotification("System updated successfully! (Simulation)")
    }
    else
    {
        ShowNotification("System update postponed (Simulation)")
    }
return

FakeRansomwareNote:
    desktop := A_Desktop
    fileName := desktop . "\URGENT_RANSOM_NOTE.txt"
    noteContent =
    (LTrim
    ATTENTION!

    Your files have been encrypted! (Simulation)

    This is a harmless educational simulation.

    In a real ransomware attack:
    - Your files would be inaccessible
    - You'd be asked to pay a ransom
    - Recovery without backup would be impossible

    Protect yourself:
    1. Keep regular backups
    2. Use reliable antivirus
    3. Update your software

    This simulation is part of a cybersecurity education program.
    Press Ctrl+Alt+End to stop the simulation immediately.
    )
    FileAppend, %noteContent%, %fileName%
    Run, notepad.exe "%fileName%"
return

FakeBlueScreen:
    Gui, 99:New, -Caption +AlwaysOnTop
    Gui, 99:Color, 0000AA
    Gui, 99:Font, cWhite s12, Lucida Console
    Gui, 99:Add, Text, x100 y100, A problem has been detected and this system has been protected by a simulation.
    Gui, 99:Add, Text, x100 y150, *** EDUCATIONAL SIMULATION ***
    Gui, 99:Add, Text, x100 y200, This is a fake blue screen for educational purposes.
    Gui, 99:Add, Text, x100 y250, Your system will recover automatically in 5 seconds...
    Gui, 99:Add, Text, x100 y300, Press Ctrl+Alt+End to stop the simulation immediately.
    Gui, 99:Show, NoActivate Maximize
    Sleep, 5000
    Gui, 99:Destroy
return

FakeLoginScreen:
    Gui, 98:New, -Caption +AlwaysOnTop
    Gui, 98:Color, 2D2D2D
    Gui, 98:Font, cWhite s14, Segoe UI
    Gui, 98:Add, Text, xCenter y100, WINDOWS SECURITY
    Gui, 98:Add, Text, xCenter y150, Your session is locked due to security simulation
    Gui, 98:Add, Text, xCenter y200, Press any key to continue (Educational Purpose)
    Gui, 98:Show, NoActivate Maximize

    ; Ganti KeyWait, Any dengan Input
    Input, KeyPressed, L1
    Gui, 98:Destroy
    ShowNotification("Login simulation complete! This was a security exercise.")
return

MatrixEffect:
    Gui, 97:New, -Caption +AlwaysOnTop +ToolWindow
    Gui, 97:Color, 000000
    Gui, 97:Font, c00FF00 s12, Lucida Console
    Loop, 50 {
        Random, xPos, 0, %A_ScreenWidth%
        Random, yPos, 0, %A_ScreenHeight%
        Random, char, 65, 90
        Gui, 97:Add, Text, x%xPos% y%yPos%, % Chr(char)
    }
    Gui, 97:Show, NoActivate
    Sleep, 3000
    Gui, 97:Destroy
return


FakeBitcoinMiner:
    Progress, B1 W400, Simulating cryptocurrency mining..., Bitcoin Miner, This is a harmless simulation
    Loop, 100 {
        Random, progress, % A_Index, 100
        Progress, %progress%
        Sleep, 50
    }
    Progress, Off
    ShowNotification("Cryptocurrency mining simulation complete! (Educational)")
return

NetworkFloodWarning:
    ShowNotification("NETWORK THREAT DETECTED: Simulated DDoS attack blocked!")
return

ShakeScreen:
    startTime := A_TickCount
    While (A_TickCount - startTime < 2000) {
        Random, xOffset, -15, 15
        Random, yOffset, -15, 15
        WinGet, windows, List
        Loop, %windows% {
            winID := windows%A_Index%
            WinGetPos, x, y,,, ahk_id %winID%
            if (x != "" && y != "") {
                WinMove, ahk_id %winID%,, % x+xOffset, % y+yOffset
            }
        }
        Sleep, 50
    }
return

CreateDesktopFiles:
    desktop := A_Desktop
    Loop, 8 {
        fileName := desktop . "\URGENT_SECURITY_WARNING_" . A_Index . ".txt"
        FileAppend,
        (LTrim
        IMPORTANT SYSTEM NOTICE (Educational Simulation)
        
        This file was created for cybersecurity education purposes.
        It demonstrates how malware creates fake warning files.
        
        Safety Precautions:
        - Keep your operating system updated
        - Use reputable antivirus software
        - Be cautious with email attachments
        - Backup important files regularly
        
        You may safely delete this file.
        Press Ctrl+Alt+End to stop simulation.
        ), %fileName%
    }
return

ShowStartNotification:
    notificationText =
    (LTrim
    Educational cybersecurity simulation is ACTIVE!
    
    Press F1 for information
    Ctrl+Alt+D to pause/resume
    Ctrl+Alt+End to STOP immediately
    
    All effects are temporary and reversible
    )
    TrayTip, VIRUS SIMULATION ACTIVATED, %notificationText%, 10, 1
return

; =====================================================
; CONTROL FUNCTIONS (SAFETY FIRST)
; =====================================================

EmergencyStop:
    isActive := false
    
    ; Cleanup desktop files
    desktop := A_Desktop
    Loop, 8 {
        fileName := desktop . "\URGENT_SECURITY_WARNING_" . A_Index . ".txt"
        FileDelete, %fileName%
    }
    
    ; Cleanup ransom note
    FileDelete, %A_Desktop%\URGENT_RANSOM_NOTE.txt
    
    ; Destroy any active GUIs
    Gui, 97:Destroy
    Gui, 98:Destroy
    Gui, 99:Destroy
    
    ; Final notification
    TrayTip, SIMULATION STOPPED, All effects disabled!`nYour system is now safe., 10, 1
    Sleep, 3000
    
    ; Play shutdown sound
    SoundPlay, *64
    
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
    (LTrim
    ULTRA-SECURE VIRUS SIMULATION (EDUCATIONAL)
    
    Features:
    - Safe browser redirection
    - Window randomization
    - Mouse movement simulation
    - Fake system alerts
    - Temporary screen effects
    - Simulated security scans
    - Ransomware education
    - Blue screen simulation
    
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
    5. Ransomware tactics
    6. Scare tactics
    
    Real malware can:
    - Encrypt your files
    - Steal passwords
    - Install backdoors
    - Damage your system
    
    Protection Tips:
    - Use reputable antivirus
    - Keep systems updated
    - Backup important data 3-2-1 rule
    - Never open suspicious attachments
    - Enable firewall protection
    )
return

; =====================================================
; HELPER FUNCTIONS (FIXED SYNTAX)
; =====================================================

ShowNotification(message) {
    TrayTip, VIRUS SIMULATION, %message%, 5, 1
}

RandomSound:
    if (!isActive)
        return
    
    Random, freq, 300, 2000
    Random, dur, 50, 800
    SoundBeep, %freq%, %dur%
return

; Hotkeys
^!End::Gosub, EmergencyStop ; Ctrl+Alt+End
F1::Gosub, ShowEducationMenu
^!r::Reload
^!d::Gosub, ToggleSimulation
