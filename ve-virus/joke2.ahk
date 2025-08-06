
#NoEnv
#SingleInstance, Force
#Persistent
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

; =====================================================
; ADVANCED CYBERSECURITY SIMULATION TOOL
; =====================================================

; Global variables
isActive := false
orientationOriginal := -1
processesToMonitor := "chrome.exe,firefox.exe,msedge.exe,opera.exe,brave.exe,taskmgr.exe,cmd.exe,regedit.exe,msconfig.exe"
sites := "https://youtube.com/watch?v=dQw4w9WgXcQ,https://youtube.com/watch?v=oHg5SJYRHA0,https://www.bleepingcomputer.com/,https://www.howtogeek.com/,https://example.com/security-alert"
errorMessages := "Critical System Error: 0x80070005,Memory Access Violation at 0x7FF89876,Security Threat Detected: Trojan:Script/Wacatac.B!ml,Your files are being encrypted! (Simulation),System32 files corrupted! Restart required,Virus detected: Heur.AdvML.B!,Boot sector compromised! (Simulation),Task Manager disabled by administrator,Critical: Disk failure imminent"

; Show warnings and start simulation
Gosub, ShowTripleWarning

; =====================================================
; WARNING SYSTEM WITH BEEP SOUNDS
; =====================================================

ShowTripleWarning:
    ; First warning
    MsgBox, 4144, CYBERSECURITY SIMULATION - WARNING 1/3, 
    (LTrim
    WARNING: ADVANCED VIRUS SIMULATION ACTIVATION
    
    This is an educational demonstration showing how
    real malware behaves. Your system will experience:
    - Random browser windows opening
    - Screen rotation effects
    - Fake system warnings
    - Mouse/keyboard anomalies
    - Security tool limitations
    
    Press OK to proceed to next warning
    )
    
    ; Second warning
    MsgBox, 4144, CYBERSECURITY SIMULATION - WARNING 2/3, 
    (LTrim
    IMPORTANT: SYSTEM ALTERATIONS WILL OCCUR
    
    After activation:
    - Desktop files will be created
    - Screen may rotate temporarily
    - Security tools may be blocked
    - Fake error messages will appear
    
    Press OK for final confirmation
    )
    
    ; Third warning
    MsgBox, 4144, CYBERSECURITY SIMULATION - FINAL WARNING 3/3, 
    (LTrim
    FINAL CONFIRMATION REQUIRED
    
    SAFETY PROTOCOLS:
    - Press Ctrl+Alt+End to STOP immediately
    - Press F1 for educational information
    - All effects are temporary and reversible
    
    WARNING: This simulation is very realistic!
    Only proceed if you understand this is an exercise.
    
    Press OK to activate or Cancel to abort
    )
    
    ; Abort if user cancels
    IfMsgBox, Cancel
    {
        MsgBox, Simulation aborted. No changes were made.
        ExitApp
    }
    
    ; Play activation beeps
    Loop, 3 {
        SoundBeep, 500, 300
        Sleep, 200
        SoundBeep, 1000, 500
        Sleep, 300
    }
    
    ; Initialize simulation
    Gosub, InitializeSimulation
return

InitializeSimulation:
    ; Set initial state
    isActive := true
    
    ; Initial effects
    Gosub, CreateDesktopFiles
    Gosub, DisableSystemTools
    Gosub, ShowStartNotification
    Gosub, SimulateStartupPersistence
    
    ; Set timers
    SetTimer, MainEffects, 10000  ; More frequent effects
    SetTimer, MonitorProcesses, 5000
    SetTimer, RandomSound, 20000
    SetTimer, ScreenEffects, 30000
    SetTimer, SpecialEffects, 90000
return

; =====================================================
; ENHANCED CORE FUNCTIONS
; =====================================================

MainEffects:
    if (!isActive) 
        return
    
    Random, effect, 1, 18
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
    } else if (effect = 14) {
        Gosub, BlockWindowsKey
    } else if (effect = 15) {
        Gosub, RegistryTamperSimulation
    } else if (effect = 16) {
        Gosub, SimulateFileEncryption
    } else if (effect = 17) {
        Gosub, FakeKeyloggerWarning
    } else if (effect = 18) {
        Gosub, CriticalSystemAlert
    }
return

MonitorProcesses:
    if (!isActive)
        return
    
    ; Block security tools
    securityTools := "taskmgr.exe,cmd.exe,regedit.exe,msconfig.exe,ProcessHacker.exe"
    Loop, Parse, securityTools, `,
    {
        Process, Exist, %A_LoopField%
        if (ErrorLevel) {
            Process, Close, %A_LoopField%
            ShowNotification(A_LoopField . " disabled for security! (Simulation)")
        }
    }
    
    ; Restart browsers
    browsers := "chrome.exe,firefox.exe,msedge.exe,opera.exe,brave.exe"
    Loop, Parse, browsers, `,
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
    
    Random, effect, 1, 6
    if (effect = 1) {
        Gosub, MatrixEffect
    } else if (effect = 2) {
        Gosub, FakeBitcoinMiner
    } else if (effect = 3) {
        Gosub, NetworkFloodWarning
    } else if (effect = 4) {
        Gosub, FakeAntivirusAlert
    } else if (effect = 5) {
        Gosub, ShakeScreen
    } else if (effect = 6) {
        Gosub, SimulateDataExfiltration
    }
return

; =====================================================
; ENHANCED SIMULATION EFFECTS
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
    Loop, 25 {
        Random, xOffset, -75, 75
        Random, yOffset, -75, 75
        MouseMove, %xOffset%, %yOffset%, 0, R
        Random, sleepTime, 30, 100
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
    
    ; Randomly choose between tray tip and message box
    Random, msgType, 1, 3
    if (msgType = 1) {
        TrayTip, CRITICAL SYSTEM ALERT, % errorArray%randIndex%, 10, 3
    } else if (msgType = 2) {
        MsgBox, 16, SYSTEM ERROR, % errorArray%randIndex%
    } else {
        SplashTextOn, 400, 100, SECURITY ALERT, % errorArray%randIndex%
        Sleep, 3000
        SplashTextOff
    }
return

FakeSystemScan:
    Progress, B1 W400 H80, Scanning system for threats..., Educational Virus Simulation, Windows Defender
    totalSteps := 100
    Loop, %totalSteps% {
        Random, currentStep, % A_Index, % totalSteps
        Progress, %currentStep%
        Random, scanTime, 30, 150
        Sleep, %scanTime%
    }
    Progress, Off
    ShowNotification("Scan complete! 372 threats detected (Simulation)")
return

OpenRickRoll:
    Run, https://youtube.com/watch?v=dQw4w9WgXcQ
return

FlipScreenTemporarily:
    if (orientationOriginal = -1) {
        orientationOriginal := GetCurrentDisplayOrientation()
    }
    
    newOrientation := orientationOriginal
    while (newOrientation == orientationOriginal) {
        Random, newOrientation, 0, 3
    }
    
    SetDisplayOrientation(newOrientation)
    ShowNotification("Display orientation changed to " . newOrientation . " (Simulation)")
    Sleep, 5000
    SetDisplayOrientation(orientationOriginal)
    ShowNotification("Display orientation restored")
return

SimulateKeyPresses:
    BlockInput, On
    Send, {Ctrl down}
    Random, key, 65, 90  ; A-Z
    Send, % Chr(key)
    Sleep, 100
    Send, {Ctrl up}
    BlockInput, Off
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
            Sleep, 20
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
    fileName := desktop . "\!!!_URGENT_RANSOM_NOTE_!!!.txt"
    noteContent =
    (LTrim
    ATTENTION!

    YOUR FILES HAVE BEEN ENCRYPTED! (Simulation)

    This is a harmless educational simulation.

    In a real ransomware attack:
    - Your files would be inaccessible
    - You'd be asked to pay cryptocurrency ransom
    - Recovery without backup would be impossible
    - Personal files would be permanently lost

    PROTECT YOURSELF:
    1. Keep regular 3-2-1 backups (3 copies, 2 media, 1 offsite)
    2. Use reputable antivirus with ransomware protection
    3. Keep all software updated
    4. Enable Show File Extensions in Explorer
    5. Be cautious with email attachments

    This simulation is part of a cybersecurity education program.
    Press Ctrl+Alt+End to stop the simulation immediately.
    )
    FileAppend, %noteContent%, %fileName%
    Run, notepad.exe "%fileName%"
    
    ; Create fake encrypted files
    Gosub, CreateFakeEncryptedFiles
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

    ; Ganti KeyWait, Any dengan Input untuk menangkap tombol apa pun
    Input, SingleKey, L1 M
    
    Gui, 98:Destroy
    ShowNotification("Login simulation complete! This was a security exercise.")
return


MatrixEffect:
    Gui, 97:New, -Caption +AlwaysOnTop +ToolWindow
    Gui, 97:Color, 000000
    Gui, 97:Font, c00FF00 s12, Lucida Console
    Loop, 100 {
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
        Sleep, 40
    }
    Progress, Off
    ShowNotification("Cryptocurrency mining simulation complete! (Educational)")
return

NetworkFloodWarning:
    ShowNotification("NETWORK THREAT DETECTED: Simulated DDoS attack blocked!")
return

ShakeScreen:
    startTime := A_TickCount
    While (A_TickCount - startTime < 3000) {
        Random, xOffset, -20, 20
        Random, yOffset, -20, 20
        WinGet, windows, List
        Loop, %windows% {
            winID := windows%A_Index%
            WinGetPos, x, y,,, ahk_id %winID%
            if (x != "" && y != "") {
                WinMove, ahk_id %winID%,, % x+xOffset, % y+yOffset
            }
        }
        Sleep, 40
    }
return

CreateDesktopFiles:
    desktop := A_Desktop
    Loop, 10 {
        fileName := desktop . "\!!!_SECURITY_WARNING_" . A_Index . "!!!.txt"
        FileAppend, 
        (LTrim
        !!! URGENT SYSTEM NOTICE (Educational Simulation) !!!
        
        This file was created for cybersecurity education purposes.
        It demonstrates how malware creates fake warning files.
        
        MALWARE INDICATORS:
        - Unexpected file creation
        - System performance issues
        - Strange popup messages
        - Changed system settings
        
        SAFETY PRECAUTIONS:
        - Keep your OS and software updated
        - Use reputable antivirus software
        - Be cautious with email attachments
        - Backup important files regularly (3-2-1 rule)
        
        You may safely delete this file.
        Press Ctrl+Alt+End to stop simulation.
        ), %fileName%
    }
    
    ; Create fake encrypted files
    Gosub, CreateFakeEncryptedFiles
return

CreateFakeEncryptedFiles:
    desktop := A_Desktop
    fileTypes := "docx,xlsx,pptx,jpg,png,mp3,avi"
    Loop, 5 {
        Random, fileTypeIndex, 1, 7
        StringSplit, typeArray, fileTypes, `,
        fileName := desktop . "\important_document_" . A_Index . "." . typeArray%fileTypeIndex% . ".ENCRYPTED"
        FileAppend, [ENCRYPTED SIMULATION] This file would be inaccessible in a real attack!`n, %fileName%
    }
return

ShowStartNotification:
    TrayTip, VIRUS SIMULATION ACTIVATED, 
    (LTrim
    EDUCATIONAL CYBERSECURITY SIMULATION ACTIVE!
    
    Press F1 for information
    Ctrl+Alt+D to pause/resume
    Ctrl+Alt+End to STOP immediately
    
    All effects are temporary and reversible
    ), 10, 1
return

; =====================================================
; POWERFUL NEW EFFECTS
; =====================================================

BlockWindowsKey:
    Hotkey, *LWin, BlockKey, On
    Hotkey, *RWin, BlockKey, On
    SetTimer, UnblockWindowsKey, 30000
    ShowNotification("Windows key disabled temporarily (Simulation)")
return

BlockKey:
return

UnblockWindowsKey:
    Hotkey, *LWin, Off
    Hotkey, *RWin, Off
    SetTimer, UnblockWindowsKey, Off
    ShowNotification("Windows key re-enabled")
return

RegistryTamperSimulation:
    RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\VirusSimulation, TestValue, This is a harmless simulation
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\VirusSimulation, SimulationActive, 1
    ShowNotification("Simulated registry modification (Educational)")
    Sleep, 3000
return

SimulateFileEncryption:
    ShowNotification("Simulating file encryption process...")
    Progress, B1 W400, Simulating file encryption..., Ransomware Simulation, Educational Purpose Only
    Loop, 100 {
        Progress, %A_Index%
        Sleep, 20
    }
    Progress, Off
    ShowNotification("File encryption simulation complete! (No actual files modified)")
return

FakeKeyloggerWarning:
    MsgBox, 16, SECURITY ALERT, 
    (LTrim
    KEYLOGGER DETECTED! (Simulation)
    
    Educational simulation detected potential
    keylogging activity on your system.
    
    In a real attack:
    - Passwords could be stolen
    - Financial information compromised
    - Personal data exposed
    
    PROTECTION TIPS:
    1. Use a password manager
    2. Enable two-factor authentication
    3. Regularly scan for malware
    4. Avoid suspicious downloads
    )
return

CriticalSystemAlert:
    SplashTextOn, 500, 150, CRITICAL ALERT, 
    (LTrim
    SYSTEM INTEGRITY COMPROMISED!
    
    Immediate action required:
    1. Disconnect from network
    2. Run full system scan
    3. Contact IT support
    
    (Educational Simulation - No actual threat)
    )
    Sleep, 5000
    SplashTextOff
return

DisableSystemTools:
    ShowNotification("System tools temporarily restricted (Simulation)")
    
    ; Disable task manager via registry (temporarily)
    RegWrite, REG_DWORD, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableTaskMgr, 1
    
    ; Block common admin tools
    tools := "cmd.exe,regedit.exe,msconfig.exe,compmgmt.msc"
    Loop, Parse, tools, `,
    {
        FileCopy, % A_ComSpec, %A_Temp%\%A_LoopField%, 1
    }
return

SimulateStartupPersistence:
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, SecuritySimulation, "%A_ScriptFullPath%"
    ShowNotification("Simulated persistence mechanism activated")
return

SimulateDataExfiltration:
    Progress, B1 W400, Simulating data exfiltration..., Security Alert, Educational Purpose Only
    Loop, 100 {
        Progress, %A_Index%
        Sleep, 25
    }
    Progress, Off
    ShowNotification("Data exfiltration simulation complete! (No data sent)")
return

FakeAntivirusAlert:
    Gui, 96:New, -Caption +AlwaysOnTop
    Gui, 96:Color, 0000FF
    Gui, 96:Font, cWhite s12, Arial
    Gui, 96:Add, Text, xCenter y20, SECURITY ALERT!
    Gui, 96:Add, Text, xCenter y60, Advanced threat detected: Educational.Simulation
    Gui, 96:Add, Text, xCenter y100, This is a simulation for educational purposes.
    Gui, 96:Add, Text, xCenter y140, Press OK to run a scan (simulated).
    Gui, 96:Add, Button, xCenter y180 w100 h30 gFakeAVScan, OK
    Gui, 96:+LastFound
    WinSet, AlwaysOnTop, On
    SetTimer, CloseFakeAV, 10000
    Gui, 96:Show, NoActivate
return

FakeAVScan:
    SetTimer, CloseFakeAV, Off
    Gui, 96:Destroy
    Progress, B1 W400, Scanning for threats..., Antivirus Simulation, This is a harmless simulation
    Loop, 100 {
        Random, progress, % A_Index, 100
        Progress, %progress%
        Sleep, 25
    }
    Progress, Off
    ShowNotification("Antivirus scan complete! 1 simulation threat found.")
return

CloseFakeAV:
    SetTimer, CloseFakeAV, Off
    Gui, 96:Destroy
return

; =====================================================
; DISPLAY ORIENTATION FUNCTIONS
; =====================================================

GetCurrentDisplayOrientation() {
    VarSetCapacity(devMode, 220, 0)
    NumPut(220, devMode, 0, "UInt")  ; dmSize
    DllCall("EnumDisplaySettingsA", "Ptr", 0, "Int", -1, "Ptr", &devMode)
    return NumGet(devMode, 84, "UInt")  ; dmDisplayOrientation
}

SetDisplayOrientation(orientation) {
    VarSetCapacity(devMode, 220, 0)
    NumPut(220, devMode, 0, "UInt")  ; dmSize
    DllCall("EnumDisplaySettingsA", "Ptr", 0, "Int", -1, "Ptr", &devMode)
    
    ; Set new orientation
    NumPut(orientation, devMode, 84, "UInt")  ; dmDisplayOrientation
    
    ; Set flags
    fields := NumGet(devMode, 36, "UInt")  ; dmFields
    fields |= 0x800000  ; DM_DISPLAYORIENTATION
    NumPut(fields, devMode, 36, "UInt")
    
    ; Apply changes
    ret := DllCall("ChangeDisplaySettingsExA", "Ptr", 0, "Ptr", &devMode, "Ptr", 0, "Int", 0, "Ptr", 0)
    if (ret != 0) {
        ; ShowNotification("Display change failed (code: " . ret . ")")
    }
}

; =====================================================
; CONTROL FUNCTIONS
; =====================================================

EmergencyStop:
    isActive := false
    
    ; Restore screen orientation
    if (orientationOriginal != -1) {
        SetDisplayOrientation(orientationOriginal)
    }
    
    ; Cleanup desktop files
    desktop := A_Desktop
    Loop, 10 {
        fileName := desktop . "\!!!_SECURITY_WARNING_" . A_Index . "!!!.txt"
        FileDelete, %fileName%
    }
    
    ; Cleanup ransom note and encrypted files
    FileDelete, %A_Desktop%\!!!_URGENT_RANSOM_NOTE_!!!.txt
    FileDelete, %A_Desktop%\*.ENCRYPTED
    
    ; Destroy any active GUIs
    Loop, 99 {
        Gui, %A_Index%:Destroy
    }
    
    ; Unblock Windows keys
    Gosub, UnblockWindowsKey
    
    ; Clean registry
    RegDelete, HKEY_CURRENT_USER, Software\VirusSimulation
    RegDelete, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Run, SecuritySimulation
    RegDelete, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableTaskMgr
    
    ; Restore system tools
    tools := "cmd.exe,regedit.exe,msconfig.exe,compmgmt.msc"
    Loop, Parse, tools, `,
    {
        FileDelete, %A_Temp%\%A_LoopField%
    }
    
    ShowNotification("Simulation STOPPED! All effects reversed")
    Sleep, 3000
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
    ADVANCED MALWARE SIMULATION (EDUCATIONAL)
    
    Features:
    - Screen rotation effects
    - Fake ransomware simulation
    - System tools restriction
    - Registry modification simulation
    - Startup persistence simulation
    - Data exfiltration simulation
    - Fake cryptocurrency miner
    - Security tool blocking
    
    Safety Measures:
    - Press Ctrl+Alt+End to STOP immediately
    - Press Ctrl+Alt+D to pause/resume
    - All effects are temporary
    - Restarting PC removes all effects
    
    Educational Purpose:
    Demonstrates real malware techniques:
    1. Social engineering
    2. System disruption
    3. Persistence mechanisms
    4. Browser manipulation
    5. Ransomware tactics
    6. Defense evasion
    7. Data theft simulation
    
    Real-world Protection:
    - Use endpoint protection with behavioral analysis
    - Implement application whitelisting
    - Use network segmentation
    - Conduct regular security audits
    - Employ intrusion detection systems
    )
return

; =====================================================
; HELPER FUNCTIONS
; =====================================================

ShowNotification(message) {
    TrayTip, VIRUS SIMULATION, %message%, 5, 1
}

RandomSound:
    if (!isActive)
        return
    
    Random, freq, 200, 2500
    Random, dur, 50, 1000
    SoundBeep, %freq%, %dur%
return

; Hotkeys
^!End::Gosub, EmergencyStop ; Ctrl+Alt+End
F1::Gosub, ShowEducationMenu
^!r::Reload
^!d::Gosub, ToggleSimulation
