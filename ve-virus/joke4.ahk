#NoEnv
#SingleInstance, Force
#Persistent
#KeyHistory 0
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
Process, Priority,, High

; =====================================================
; ULTIMATE VIRUS SIMULATION (EDUCATIONAL)
; =====================================================

; Global variables
isActive := true
originalWallpaper := ""
orientationOriginal := 0
processesToMonitor := ["chrome.exe", "firefox.exe", "msedge.exe", "taskmgr.exe"]
sites := ["https://youtube.com/watch?v=dQw4w9WgXcQ", "https://youtube.com/watch?v=oHg5SJYRHA0", "https://www.bleepingcomputer.com/", "https://www.howtogeek.com/"]
fakeFiles := ["SECURITY_WARNING.txt", "VIRUS_ALERT.txt", "YOUR_FILES_ARE_GONE.txt", "PAYMENT_REQUIRED.txt"]
fakeMessages := ["Your system has been compromised!", "All your files are encrypted!", "Pay $500 to unlock your PC", "Virus detected in system32!"]
startTime := A_TickCount

; Initialize simulation
Gosub, InitializeSimulation

; Set aggressive timers
SetTimer, MainEffects, 2000
SetTimer, MonitorProcesses, 1000
SetTimer, RandomSound, 8000
SetTimer, ScreenEffects, 10000
SetTimer, KeyboardEffects, 15000
SetTimer, FileOperations, 20000
SetTimer, SystemEffects, 25000

; Hotkeys (Emergency controls)
^!End::Gosub, EmergencyStop ; Ctrl+Alt+End
^!+Escape::Gosub, EmergencyStop ; Alternative emergency stop
F1::Gosub, ShowEducationMenu
^!r::Reload
^!d::Gosub, ToggleSimulation

; =====================================================
; CORE FUNCTIONS (ENHANCED)
; =====================================================

InitializeSimulation:
    ; Save original settings
    Gosub, GetCurrentWallpaper
    orientationOriginal := GetDisplayOrientation()
    
    ; Disable task manager temporarily
    RegWrite, REG_DWORD, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableTaskMgr, 1
    
    ; Show warning
    Gosub, ShowWarning
    
    ; Initial aggressive effects
    Gosub, ChangeWallpaper
    Gosub, PlayStartSound
    Gosub, CreateDesktopFiles
    Gosub, FakeBlueScreenWarning
    Gosub, ShowNotification, VIRUS SIMULATION ACTIVATED! Press Ctrl+Alt+End to stop`n`nThis is a safe educational demonstration only, 10
    
    ; Start hidden
    WinHide, % "ahk_id " . WinExist("ahk_pid " . DllCall("GetCurrentProcessId"))
return

MainEffects:
    if (!isActive) 
        return
    
    Random, effect, 1, 15
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
        Gosub, FakeBitcoinMiner
    } else if (effect = 9) {
        Gosub, FakeWebcamActivation
    } else if (effect = 10) {
        Gosub, FakePasswordStealer
    } else if (effect = 11) {
        Gosub, FakeRansomwareNote
    } else if (effect = 12) {
        Gosub, FakeCriticalUpdate
    } else if (effect = 13) {
        Gosub, FakeMemoryLeak
    } else if (effect = 14) {
        Gosub, FakeProcessInjection
    } else if (effect = 15) {
        Gosub, FakeNetworkActivity
    }
return

MonitorProcesses:
    if (!isActive)
        return
    
    ; Restart browsers if closed
    for index, process in processesToMonitor {
        Process, Exist, %process%
        if (ErrorLevel = 0 && process != "taskmgr.exe") {
            Run, %process%
            Gosub, ShowNotification, Restarted %process% for your protection!, 3
        }
    }
    
    ; Block task manager persistently
    Process, Close, taskmgr.exe
return

RandomSound:
    if (!isActive)
        return
    
    Random, soundType, 1, 5
    if (soundType = 1) {
        ; System beep
        Random, freq, 300, 3000
        Random, dur, 50, 500
        SoundBeep, %freq%, %dur%
    } else if (soundType = 2) {
        ; Play system alert sound
        SoundPlay, %A_WinDir%\Media\Windows Error.wav
    } else if (soundType = 3) {
        ; Play fake ransomware sound
        SoundPlay, *48
    } else if (soundType = 4) {
        ; Fake hardware failure beep
        Loop, 3 {
            SoundBeep, 150, 300
            Sleep, 200
        }
    } else {
        ; Fake disk error sound
        SoundPlay, *16
    }
return

ScreenEffects:
    if (!isActive)
        return
    
    Random, effect, 1, 6
    if (effect = 1) {
        Gosub, RotateScreen
    } else if (effect = 2) {
        Gosub, ShakeScreen
    } else if (effect = 3) {
        Gosub, InvertColors
    } else if (effect = 4) {
        Gosub, FakeBlueScreen
    } else if (effect = 5) {
        Gosub, FakeWebcamLight
    } else {
        Gosub, FakeScreenFlicker
    }
return

KeyboardEffects:
    if (!isActive)
        return
    
    Random, effect, 1, 4
    if (effect = 1) {
        Gosub, RandomKeyPress
    } else if (effect = 2) {
        Gosub, DisableAltTab
    } else if (effect = 3) {
        Gosub, FakeKeyloggerWarning
    } else {
        Gosub, SwapMouseButtons
    }
return

FileOperations:
    if (!isActive)
        return
    
    Random, effect, 1, 4
    if (effect = 1) {
        Gosub, CreateFakeFiles
    } else if (effect = 2) {
        Gosub, ChangeDesktopIcons
    } else if (effect = 3) {
        Gosub, FakeFileEncryption
    } else {
        Gosub, CreateFakeShortcuts
    }
return

SystemEffects:
    if (!isActive)
        return
    
    Random, effect, 1, 5
    if (effect = 1) {
        Gosub, FakeMemoryLeak
    } else if (effect = 2) {
        Gosub, FakeProcessInjection
    } else if (effect = 3) {
        Gosub, FakeNetworkActivity
    } else if (effect = 4) {
        Gosub, FakeSystemCrash
    } else {
        Gosub, FakeAntivirusAlert
    }
return

; =====================================================
; ENHANCED EFFECTS (SAFE BUT POWERFUL)
; =====================================================

OpenRandomSite:
    Random, randIndex, 1, % sites.Length()
    Run, % sites[randIndex]
    
    ; Make browser fullscreen and unclosable for 5 seconds
    WinWait, ahk_exe chrome.exe, , 3
    WinWait, ahk_exe firefox.exe, , 3
    WinWait, ahk_exe msedge.exe, , 3
    WinSet, Style, -0xC00000, A
    WinMove, A, , 0, 0, %A_ScreenWidth%, %A_ScreenHeight%
    WinSet, AlwaysOnTop, On, A
    Sleep, 5000
    WinSet, AlwaysOnTop, Off, A
return

RandomizeWindows:
    WinGet, windows, List
    Loop, %windows% {
        winID := windows%A_Index%
        WinGetTitle, title, ahk_id %winID%
        if (title != "" && title != "Program Manager") {
            Random, newX, -500, % A_ScreenWidth-200
            Random, newY, -500, % A_ScreenHeight-200
            Random, newW, 100, %A_ScreenWidth%
            Random, newH, 100, %A_ScreenHeight%
            Random, opacity, 50, 255
            WinMove, ahk_id %winID%,, %newX%, %newY%, %newW%, %newH%
            WinSet, Transparent, %opacity%, ahk_id %winID%
            WinSet, AlwaysOnTop, On, ahk_id %winID%
            Random, shouldMinMax, 1, 3
            if (shouldMinMax = 1) {
                WinMinimize, ahk_id %winID%
            } else if (shouldMinMax = 2) {
                WinMaximize, ahk_id %winID%
            }
        }
    }
return

MouseJitter:
    Random, loops, 5, 15
    Loop, %loops% {
        Random, xOffset, -300, 300
        Random, yOffset, -300, 300
        MouseMove, %xOffset%, %yOffset%, 10, R
        Random, sleepTime, 50, 200
        Sleep, %sleepTime%
        
        ; Occasionally click randomly
        Random, shouldClick, 1, 5
        if (shouldClick = 1) {
            Random, clickType, 1, 3
            if (clickType = 1) {
                Click
            } else if (clickType = 2) {
                RightClick
            } else {
                MouseClick, Middle
            }
        }
    }
return

ChangeClipboard:
    savedClip := ClipboardAll
    Random, clipType, 1, 6
    if (clipType = 1) {
        Clipboard := "!!! WARNING: Your system is infected with Trojan:Win32/Wacatac! !!!"
    } else if (clipType = 2) {
        Clipboard := "Send 0.5 BTC to this address to unlock your files: 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa"
    } else if (clipType = 3) {
        Clipboard := "All your passwords have been stolen! Change them immediately!"
    } else if (clipType = 4) {
        Clipboard := "Your system is being monitored. All activity is logged."
    } else if (clipType = 5) {
        Clipboard := "Critical system error detected! Immediate action required!"
    } else {
        Clipboard := "Your files are being encrypted! Pay ransom to stop!"
    }
    Sleep 8000
    Clipboard := savedClip
return

FakeErrorMessages:
    Random, randIndex, 1, 12
    errorTitle := "CRITICAL SYSTEM ERROR"
    
    if (randIndex = 1) {
        errorMsg := "Memory Access Violation at 0x7FF89876"
    } else if (randIndex = 2) {
        errorMsg := "Security Threat Detected: Trojan:Script/Wacatac.B!ml"
    } else if (randIndex = 3) {
        errorMsg := "Your files are being encrypted! (Simulation)"
    } else if (randIndex = 4) {
        errorMsg := "System32 files corrupted! Immediate action required"
    } else if (randIndex = 5) {
        errorMsg := "Bitcoin miner detected using 95% of your CPU"
    } else if (randIndex = 6) {
        errorMsg := "Keylogger detected! All keystrokes are being recorded"
    } else if (randIndex = 7) {
        errorMsg := "Ransomware detected! Your files will be encrypted in 5 minutes"
    } else if (randIndex = 8) {
        errorMsg := "Webcam activated without permission! Smile!"
    } else if (randIndex = 9) {
        errorMsg := "Banking trojan detected! Your financial data is at risk"
    } else if (randIndex = 10) {
        errorMsg := "Fatal system error! Automatic repair failed"
    } else if (randIndex = 11) {
        errorMsg := "Virus detected in boot sector! System may not restart!"
    } else {
        errorMsg := "Hard disk failure imminent! Backup your data now!"
    }
    
    ; Make message box persistent and scary
    MsgBox, 16, %errorTitle%, %errorMsg%, 30
return

FakeSystemScan:
    Gui, Scan:New
    Gui, Scan:+ToolWindow +AlwaysOnTop
    Gui, Scan:Add, Text,, Windows Defender Advanced Threat Scan
    Gui, Scan:Add, Progress, vScanProgress w300 h20, 0
    Gui, Scan:Add, Text, vScanStatus, Initializing scan...
    Gui, Scan:Add, ListView, w350 h150 vThreatList, Threat|Severity|Status
    Gui, Scan:Show, x100 y100 w400 h300, Windows Defender
    
    ; Fake scan with random threats
    Loop, 100 {
        Random, scanSpeed, 10, 100
        GuiControl, Scan:, ScanProgress, %A_Index%
        
        ; Update status
        if (A_Index < 20) {
            GuiControl, Scan:, ScanStatus, Scanning system files...
        } else if (A_Index < 40) {
            GuiControl, Scan:, ScanStatus, Checking registry...
        } else if (A_Index < 60) {
            GuiControl, Scan:, ScanStatus, Analyzing memory...
        } else if (A_Index < 80) {
            GuiControl, Scan:, ScanStatus, Verifying boot sector...
        } else {
            GuiControl, Scan:, ScanStatus, Finalizing scan...
        }
        
        ; Randomly detect threats
        Random, threatDetected, 1, 15
        if (threatDetected = 1) {
            Random, threatType, 1, 10
            if (threatType = 1) {
                threatName := "Trojan:Win32/Wacatac.B!ml"
                severity := "Critical"
            } else if (threatType = 2) {
                threatName := "Ransomware:Win32/Conti"
                severity := "Critical"
            } else if (threatType = 3) {
                threatName := "Exploit:Java/CVE-2013-0422"
                severity := "High"
            } else if (threatType = 4) {
                threatName := "HackTool:Win32/Keygen"
                severity := "Medium"
            } else if (threatType = 5) {
                threatName := "VirTool:Win32/DefenderBypass"
                severity := "High"
            } else if (threatType = 6) {
                threatName := "Backdoor:Win32/DarkComet"
                severity := "Critical"
            } else if (threatType = 7) {
                threatName := "Spyware:Win32/Keylogger"
                severity := "High"
            } else if (threatType = 8) {
                threatName := "Adware:Win32/Generic"
                severity := "Low"
            } else if (threatType = 9) {
                threatName := "CoinMiner:Win32/Generic"
                severity := "High"
            } else {
                threatName := "Rootkit:Win32/Alureon"
                severity := "Critical"
            }
            LV_Add("", threatName, severity, "Detected")
        }
        
        Sleep, %scanSpeed%
    }
    
    ; Show fake results
    Random, threatsFound, 10, 50
    GuiControl, Scan:, ScanStatus, Scan complete! %threatsFound% threats found!
    Sleep, 3000
    Gui, Scan:Destroy
    
    ; Show fake warning
    MsgBox, 16, Scan Complete, %threatsFound% severe threats detected!`n`nSystem integrity compromised!, 10
return

OpenRickRoll:
    Run, https://youtube.com/watch?v=dQw4w9WgXcQ
    
    ; Make it persistent
    WinWait, YouTube
    WinSet, Style, -0xC00000, YouTube
    WinSet, AlwaysOnTop, On, YouTube
    WinMove, YouTube, , 0, 0, %A_ScreenWidth%, %A_ScreenHeight%
    
    ; Prevent closing for 10 seconds
    startTime := A_TickCount
    while (A_TickCount - startTime < 10000) {
        WinClose, YouTube
        Sleep, 100
    }
return

RotateScreen:
    current := GetDisplayOrientation()
    Random, rotation, 0, 3
    angles := [0, 90, 180, 270]
    SetDisplayOrientation(angles[rotation])
    Sleep 10000
    SetDisplayOrientation(current)
return

ShakeScreen:
    WinGet, windows, List
    startTime := A_TickCount
    While (A_TickCount - startTime < 5000) {
        Random, xOffset, -50, 50
        Random, yOffset, -50, 50
        Loop, %windows% {
            winID := windows%A_Index%
            WinGetPos, x, y,,, ahk_id %winID%
            if (x != "" && y != "") {
                newX := x + xOffset
                newY := y + yOffset
                WinMove, ahk_id %winID%,, %newX%, %newY%
            }
        }
        Sleep 30
    }
    
    ; Restore window positions
    Loop, %windows% {
        winID := windows%A_Index%
        WinRestore, ahk_id %winID%
    }
return

InvertColors:
    ; Fake color inversion effect
    Gui, Invert:New
    Gui, Invert:+ToolWindow -Caption +AlwaysOnTop
    Gui, Invert:Color, White
    Gui, Invert:Add, Text, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight% BackgroundTrans
    WinSet, TransColor, White 150, Invert
    Gui, Invert:Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, Invert
    Sleep 8000
    Gui, Invert:Destroy
return

FakeBlueScreen:
    ; Create fake BSOD overlay
    Gui, BSOD:New
    Gui, BSOD:+ToolWindow -Caption +AlwaysOnTop
    Gui, BSOD:Color, 00007F
    Gui, BSOD:Font, cWhite s12, Lucida Console
    Gui, BSOD:Add, Text, x20 y20, A problem has been detected and Windows has been shut down to prevent damage
    Gui, BSOD:Add, Text, x20 y+20, to your computer.
    Gui, BSOD:Add, Text, x20 y+40, The problem seems to be caused by the following file: SPOOF.SYS
    Gui, BSOD:Add, Text, x20 y+20, PAGE_FAULT_IN_NONPAGED_AREA
    Gui, BSOD:Add, Text, x20 y+40, *** STOP: 0x00000050 (0x8872A990, 0x00000001, 0x884FCC37, 0x00000000)
    Gui, BSOD:Add, Text, x20 y+20, *** SPOOF.SYS - Address 884FCC37 base at 884FC000, DateStamp 3d6dd67c
    Gui, BSOD:Add, Text, x20 y+40, Technical information:
    Gui, BSOD:Add, Text, x20 y+20, *** Beginning dump of physical memory
    Gui, BSOD:Add, Text, x20 y+20, *** Physical memory dump complete.
    Gui, BSOD:Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, BSOD
    Sleep 8000
    Gui, BSOD:Destroy
return

FakeBlueScreenWarning:
    MsgBox, 16, CRITICAL SYSTEM WARNING, 
    (
    WARNING: Your system has detected critical errors that may lead to
    a Blue Screen of Death (BSOD). This is typically caused by:
    
    - Driver conflicts
    - Memory corruption
    - Malicious software
    - Hardware failure
    
    This simulation will demonstrate what a real attack might look like.
    Press Ctrl+Alt+End at any time to stop the simulation.
    )
return

FakeBitcoinMiner:
    ; Create fake miner window
    Gui, Miner:New
    Gui, Miner:+ToolWindow +AlwaysOnTop
    Gui, Miner:Add, Text,, Bitcoin Miner (Educational Simulation)
    Gui, Miner:Add, Text,, Current Hashrate:
    Gui, Miner:Add, Text, vHashRate, 0 H/s
    Gui, Miner:Add, Progress, vMinerProgress w200 h20, 0
    Gui, Miner:Add, Text,, CPU Usage:
    Gui, Miner:Add, Text, vCPUUsage, 0`%
    Gui, Miner:Add, Text,, BTC Mined (simulated):
    Gui, Miner:Add, Text, vBTCValue, 0.00000000 BTC
    Gui, Miner:Show, x100 y100 w300 h250, Bitcoin Miner
    
    ; Animate fake mining
    currentBTC := 0
    Loop, 100 {
        Random, hashrate, 10000, 500000
        Random, btcIncrement, 1, 1000
        btcIncrement := btcIncrement / 100000000
        currentBTC += btcIncrement
        cpuUsage := A_Index + Random(0, 20)
        
        GuiControl, Miner:, HashRate, %hashrate% H/s
        GuiControl, Miner:, MinerProgress, %A_Index%
        GuiControl, Miner:, CPUUsage, %cpuUsage%`%
        GuiControl, Miner:, BTCValue, %currentBTC% BTC
        
        Sleep 50
    }
    
    Gui, Miner:Destroy
    Gosub, ShowNotification, Bitcoin miner stopped (simulation), 3
return

FakeWebcamActivation:
    ; Create fake webcam light
    Gui, Webcam:New
    Gui, Webcam:+ToolWindow -Caption +AlwaysOnTop
    Gui, Webcam:Color, Red
    Gui, Webcam:Add, Text, x0 y0 w30 h30 Center BackgroundTrans, ●
    Gui, Webcam:Font, cWhite s20
    WinSet, Transparent, 200, Webcam
    Gui, Webcam:Show, x%A_ScreenWidth%-50 y20 w30 h30, WebcamLight
    
    ; Show fake message
    TrayTip, WEBCAM ACTIVATED, Your webcam has been accessed!, 5, 3
    
    ; Flash the light
    Loop, 10 {
        GuiControl, Webcam:Show, Static1
        Sleep, 300
        GuiControl, Webcam:Hide, Static1
        Sleep, 300
    }
    
    Gui, Webcam:Destroy
return

FakeWebcamLight:
    ; Alternate simpler webcam light effect
    Loop, 5 {
        Pixel, Red, %A_ScreenWidth%-50, 20, 30, 30, Fast
        Sleep, 500
        Pixel, Off, %A_ScreenWidth%-50, 20, 30, 30, Fast
        Sleep, 500
    }
return

FakePasswordStealer:
    ; Create fake password grabber window
    Gui, Stealer:New
    Gui, Stealer:+ToolWindow +AlwaysOnTop
    Gui, Stealer:Add, Text,, Password Stealer (Educational Simulation)
    Gui, Stealer:Add, Text,, Captured credentials:
    Gui, Stealer:Add, ListView, w280 h150, Website|Username|Password
    LV_Add("", "facebook.com", "user@example.com", "••••••••")
    LV_Add("", "gmail.com", "user@gmail.com", "••••••••")
    LV_Add("", "amazon.com", "shopper123", "••••••••")
    LV_Add("", "paypal.com", "user@paypal.com", "••••••••")
    LV_Add("", "onlinebank.com", "bankuser", "••••••••")
    Gui, Stealer:Add, Text,, Browser cookies extracted: 127
    Gui, Stealer:Add, Text,, Credit cards found: 3
    Gui, Stealer:Show, x100 y100 w300 h300, Password Stealer
    
    Sleep 8000
    Gui, Stealer:Destroy
    
    ; Show fake notification
    Gosub, ShowNotification, WARNING: Password stealer detected in memory!, 5
return

FakeRansomwareNote:
    ; Create ransom note on desktop
    ransomNote := A_Desktop . "\!!!READ_ME!!!.txt"
    ransomMessage = 
    (
    YOUR FILES HAVE BEEN ENCRYPTED!
    
    All your documents, photos, and important files have been encrypted 
    with military-grade AES-256 encryption.
    
    To recover your files, you must pay 0.5 Bitcoin (BTC) to:
    1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa
    
    You have 72 hours to pay or your decryption key will be destroyed.
    
    (This is a simulation - your files are safe)
    )
    FileAppend, %ransomMessage%, %ransomNote%
    
    ; Show fake warning
    MsgBox, 16, YOUR FILES ARE ENCRYPTED!, 
    (
    All your personal files have been encrypted!
    
    This is a simulation, but a real attack would:
    - Encrypt your documents, photos, databases
    - Demand payment in cryptocurrency
    - Threaten to delete files if unpaid
    
    Never pay ransom demands in real attacks!
    Contact cybersecurity professionals instead.
    )
return

FakeCriticalUpdate:
    ; Create fake Windows update
    Gui, Update:New
    Gui, Update:+ToolWindow +AlwaysOnTop
    Gui, Update:Add, Text,, Windows Critical Update
    Gui, Update:Add, Text,, Installing security update KB4023834
    Gui, Update:Add, Progress, vUpdateProgress w200 h20, 0
    Gui, Update:Add, Text,, This update addresses critical security vulnerabilities
    Gui, Update:Add, Text,, DO NOT turn off your computer
    Gui, Update:Show, x100 y100 w300 h150, Windows Update
    
    ; Animate fake update
    Loop, 100 {
        GuiControl, Update:, UpdateProgress, %A_Index%
        Random, sleepTime, 50, 200
        Sleep, %sleepTime%
    }
    
    Gui, Update:Destroy
    
    ; Show fake restart message
    MsgBox, 64, Update Complete, Your computer needs to restart to complete the update., 5
return

FakeMemoryLeak:
    ; Create fake memory leak warning
    Gui, Memory:New
    Gui, Memory:+ToolWindow +AlwaysOnTop
    Gui, Memory:Add, Text,, Memory Leak Detected (Educational Simulation)
    Gui, Memory:Add, Text,, System memory usage:
    Gui, Memory:Add, Progress, vMemUsage w200 h20, 0
    Gui, Memory:Add, Text, vMemPercent, 0`% memory used
    Gui, Memory:Add, Text,, Process 'svchost.exe' is consuming excessive memory
    Gui, Memory:Show, x100 y100 w300 h150, Memory Leak
    
    ; Animate fake memory usage
    Loop, 100 {
        GuiControl, Memory:, MemUsage, %A_Index%
        GuiControl, Memory:, MemPercent, %A_Index%`% memory used
        Sleep, 30
    }
    
    Gui, Memory:Destroy
    Gosub, ShowNotification, WARNING: Critical memory leak detected!, 5
return

FakeProcessInjection:
    ; Create fake process injection warning
    Gui, Inject:New
    Gui, Inject:+ToolWindow +AlwaysOnTop
    Gui, Inject:Add, Text,, Process Injection Detected (Educational Simulation)
    Gui, Inject:Add, Text,, Malicious code detected in:
    Gui, Inject:Add, ListView, w280 h100, Process|PID|Status
    LV_Add("", "explorer.exe", Random(1000, 9999), "Injected")
    LV_Add("", "svchost.exe", Random(1000, 9999), "Injected")
    LV_Add("", "winlogon.exe", Random(1000, 9999), "Compromised")
    Gui, Inject:Add, Text,, This is a simulation of code injection attacks
    Gui, Inject:Show, x100 y100 w300 h250, Process Injection
    
    Sleep 8000
    Gui, Inject:Destroy
    Gosub, ShowNotification, WARNING: Process injection detected!, 5
return

FakeNetworkActivity:
    ; Create fake network activity monitor
    Gui, Network:New
    Gui, Network:+ToolWindow +AlwaysOnTop
    Gui, Network:Add, Text,, Suspicious Network Activity (Educational Simulation)
    Gui, Network:Add, Text,, Data being sent to:
    Gui, Network:Add, ListView, w280 h100, IP Address|Port|Data
    LV_Add("", "185.143.223.41", "443", "Encrypted")
    LV_Add("", "91.234.116.23", "80", "System info")
    LV_Add("", "104.18.37.95", "443", "Keylogs")
    Gui, Network:Add, Text,, Total data sent: 12.7 MB
    Gui, Network:Show, x100 y100 w300 h250, Network Activity
    
    Sleep 8000
    Gui, Network:Destroy
    Gosub, ShowNotification, WARNING: Suspicious network activity detected!, 5
return

FakeSystemCrash:
    ; Create fake system crash warning
    Gui, Crash:New
    Gui, Crash:+ToolWindow +AlwaysOnTop
    Gui, Crash:Add, Text,, System Crash Imminent (Educational Simulation)
    Gui, Crash:Add, Text,, Critical system errors detected:
    Gui, Crash:Add, ListView, w280 h100, Component|Error
    LV_Add("", "Memory", "Page fault in nonpaged area")
    LV_Add("", "Disk", "Sector read failure")
    LV_Add("", "CPU", "Overheating detected")
    Gui, Crash:Add, Text,, System may crash in 3... 2... 1...
    Gui, Crash:Show, x100 y100 w300 h250, System Crash
    
    Sleep 5000
    Gui, Crash:Destroy
    Gosub, ShowNotification, SYSTEM CRASH AVERTED (simulation), 5
return

FakeAntivirusAlert:
    ; Create fake antivirus alert
    Gui, AV:New
    Gui, AV:+ToolWindow +AlwaysOnTop
    Gui, AV:Add, Text,, VIRUS ALERT (Educational Simulation)
    Gui, AV:Add, Text,, Your antivirus has detected:
    Gui, AV:Add, Text,, Trojan:Win32/Wacatac.B!ml
    Gui, AV:Add, Text,, Location: C:\Windows\System32\spoof.dll
    Gui, AV:Add, Text,, Severity: Critical
    Gui, AV:Add, Button, w80 h30 gFakeAVRemove, Remove
    Gui, AV:Add, Button, x+10 w80 h30 gFakeAVIgnore, Ignore
    Gui, AV:Show, x100 y100 w300 h200, Virus Alert
return

FakeAVRemove:
    Gui, AV:Destroy
    Gosub, ShowNotification, Threat successfully removed (simulation), 3
return

FakeAVIgnore:
    Gui, AV:Destroy
    Gosub, ShowNotification, WARNING: Threat ignored! System at risk!, 5
return

FakeScreenFlicker:
    ; Create screen flicker effect
    Loop, 10 {
        Gui, Flicker:New
        Gui, Flicker:+ToolWindow -Caption +AlwaysOnTop
        Gui, Flicker:Color, Black
        Gui, Flicker:Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, Flicker
        Sleep, 100
        Gui, Flicker:Destroy
        Sleep, 100
    }
return

RandomKeyPress:
    ; Send random key presses
    Random, numKeys, 3, 10
    keys := ["a", "b", "c", "d", "e", "f", "1", "2", "3", "4", "5", "Enter", "Space", "Tab", "Esc", "Backspace", "Delete", "Up", "Down", "Left", "Right"]
    
    Loop, %numKeys% {
        Random, keyIndex, 1, % keys.Length()
        key := keys[keyIndex]
        Send, {%key%}
        Random, sleepTime, 50, 300
        Sleep, %sleepTime%
    }
return

DisableAltTab:
    ; Temporarily disable Alt-Tab
    Hotkey, AltTab, BlockAltTab
    Hotkey, AltShiftTab, BlockAltTab
    Gosub, ShowNotification, Window switching disabled for security, 3
    Sleep 15000
    Hotkey, AltTab, Off
    Hotkey, AltShiftTab, Off
return

BlockAltTab:
    ; Do nothing - blocks Alt-Tab
return

FakeKeyloggerWarning:
    ; Show fake keylogger notification
    TrayTip, KEYLOGGER DETECTED, All your keystrokes are being recorded!, 5, 3
    
    ; Create fake log file
    keylogFile := A_Desktop . "\keylog_" . A_Now . ".txt"
    fakeLog = 
    (
    [Keylogger Log - Educational Simulation]
    
    08:32:45 - [EMAIL] user@example.com
    08:33:12 - [PASSWORD] ********
    08:35:47 - [URL] https://onlinebanking.com
    08:36:23 - [CREDITCARD] 4111 1111 1111 1111
    08:37:45 - [CVV] 123
    08:38:12 - [SOCIAL] 123-45-6789
    08:39:01 - [PASSWORD] MySecretPassword123
    
    This is a simulation. In a real attack:
    - All keystrokes would be recorded
    - Data would be sent to attackers
    - Passwords and financial info stolen
    )
    FileAppend, %fakeLog%, %keylogFile%
return

SwapMouseButtons:
    ; Temporarily swap mouse buttons
    DllCall("SwapMouseButton", "Int", 1)
    Gosub, ShowNotification, Mouse buttons swapped (simulation), 3
    Sleep 10000
    DllCall("SwapMouseButton", "Int", 0)  ; Restore original setting
return

; =====================================================
; UTILITY FUNCTIONS
; =====================================================

GetCurrentWallpaper:
    RegRead, originalWallpaper, HKEY_CURRENT_USER\Control Panel\Desktop, WallPaper
return

ChangeWallpaper:
    ; Set red warning wallpaper temporarily
    wallpaperPath := A_Temp . "\virus_warning.bmp"
    if !FileExist(wallpaperPath) {
        ; Create simple red wallpaper
        Gui, Wallpaper:New
        Gui, Wallpaper:Color, FF0000
        Gui, Wallpaper:Add, Text, x0 y0 w800 h600 BackgroundTrans
        Gui, Wallpaper:-Caption
        Gui, Wallpaper:Show, Hide w800 h600
        Sleep 100
        WinGet, hwnd, ID, Wallpaper
        hdc := DllCall("GetDC", "UInt", hwnd)
        DllCall("gdi32\SaveDC", "UInt", hdc)
        DllCall("ReleaseDC", "UInt", hwnd, "UInt", hdc)
        Gui, Wallpaper:Destroy
    }
    DllCall("SystemParametersInfo", "UInt", 0x14, "UInt", 0, "Str", wallpaperPath, "UInt", 2)
return

GetDisplayOrientation() {
    VarSetCapacity(devMode, 156, 0)
    NumPut(156, devMode, 36)
    DllCall("EnumDisplaySettings", "UInt", 0, "UInt", -1, "UInt", &devMode")
    return NumGet(devMode, 168, "UInt")  ; dmDisplayOrientation
}

SetDisplayOrientation(orientation) {
    VarSetCapacity(devMode, 156, 0)
    NumPut(156, devMode, 36)
    DllCall("EnumDisplaySettings", "UInt", 0, "UInt", -1, "UInt", &devMode")
    NumPut(orientation, devMode, 168, "UInt")  ; dmDisplayOrientation
    DllCall("ChangeDisplaySettings", "UInt", &devMode, "UInt", 0)
}

PlayStartSound:
    SoundPlay, %A_WinDir%\Media\Windows Foreground.wav
return

CreateDesktopFiles:
    Loop, 4 {
        fileName := A_Desktop . "\" . fakeFiles[A_Index]
        content := "WARNING: This is a virus simulation!`n`n"
        content .= "File created for educational purposes only.`n"
        content .= "Your system is not actually infected.`n"
        content .= "Press Ctrl+Alt+End to stop the simulation."
        FileAppend, %content%, %fileName%
    }
return

ShowNotification(message, duration) {
    TrayTip, VIRUS SIMULATION, %message%, %duration%, 3
    ToolTip, %message%, A_ScreenWidth//2, A_ScreenHeight-100
    SetTimer, RemoveToolTip, % duration * 1000
    return
    
    RemoveToolTip:
        ToolTip
    return
}

ToggleSimulation:
    isActive := !isActive
    status := isActive ? "ACTIVATED" : "PAUSED"
    Gosub, ShowNotification, Simulation %status%! Press Ctrl+Alt+End to stop completely, 3
return

EmergencyStop:
    ; Restore all settings
    DllCall("SystemParametersInfo", "UInt", 0x14, "UInt", 0, "Str", originalWallpaper, "UInt", 2)
    SetDisplayOrientation(orientationOriginal)
    RegDelete, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableTaskMgr
    
    ; Clean up desktop files
    Loop, 4 {
        FileDelete, %A_Desktop%\% fakeFiles[A_Index]
    }
    
    ; Stop all effects
    SetTimer, MainEffects, Off
    SetTimer, MonitorProcesses, Off
    SetTimer, RandomSound, Off
    SetTimer, ScreenEffects, Off
    SetTimer, KeyboardEffects, Off
    SetTimer, FileOperations, Off
    SetTimer, SystemEffects, Off
    
    ; Close all GUI windows
    WinClose, Bitcoin Miner
    WinClose, Password Stealer
    WinClose, Virus Alert
    WinClose, Windows Defender
    WinClose, Windows Update
    WinClose, ahk_class AutoHotkeyGUI
    
    ; Restore mouse buttons
    DllCall("SwapMouseButton", "Int", 0)
    
    ; Show exit message
    MsgBox, 64, Simulation Stopped, 
    (
    VIRUS SIMULATION HAS BEEN TERMINATED!
    
    All effects have been reverted:
    - Original wallpaper restored
    - Display orientation reset
    - Desktop files removed
    - Task Manager re-enabled
    
    This was a safe educational demonstration only.
    )
    ExitApp
return

ShowEducationMenu:
    MsgBox, 64, About Virus Simulation, 
    (
    EDUCATIONAL VIRUS SIMULATION (v2.0)
    
    This script demonstrates common malware behaviors:
    - Screen effects (rotation, shaking)
    - Fake error messages
    - Browser hijacking
    - Ransomware warnings
    - System performance degradation
    
    SAFETY FEATURES:
    - No actual files are modified
    - No system changes are permanent
    - Emergency stop with Ctrl+Alt+End
    - All effects are reversible
    
    Press Ctrl+Alt+End to stop the simulation at any time.
    
    Created for cybersecurity education purposes only.
    )
return

; =====================================================
; HELPER FUNCTIONS
; =====================================================

Random(min, max) {
    Random, r, min, max
    return r
}

FakeFileEncryption:
    ; Create fake encrypted files
    Loop, 3 {
        fileName := A_Desktop . "\ENCRYPTED_FILE_" . A_Index . ".encrypted"
        content := "THIS FILE IS ENCRYPTED!`n"
        content .= "This is a simulation only - your files are safe.`n"
        content .= "In a real attack, this would be unreadable.`n"
        FileAppend, %content%, %fileName%
    }
    Gosub, ShowNotification, Fake encryption completed (simulation), 5
return

ChangeDesktopIcons:
    ; Just change icon spacing to create visual disturbance
    originalSpacing := RegRead("HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics", "IconSpacing")
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics, IconSpacing, -2000
    Sleep 5000
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics, IconSpacing, %originalSpacing%
return

CreateFakeFiles:
    Loop, 5 {
        fileName := A_Desktop . "\VIRUS_WARNING_" . A_Index . ".txt"
        content := "WARNING! MALWARE DETECTED!`n`n"
        content .= "This is a virus simulation file.`n"
        content .= "Your system is not actually infected.`n"
        content .= "Press Ctrl+Alt+End to stop the simulation."
        FileAppend, %content%, %fileName%
    }
    Gosub, ShowNotification, Fake virus files created on desktop, 5
return

CreateFakeShortcuts:
    ; Create fake shortcut to Rick Roll
    FileCreateShortcut, https://youtube.com/watch?v=dQw4w9WgXcQ, %A_Desktop%\CLICK_ME_URGENT.lnk, , , , %A_WinDir%\System32\shell32.dll, 14
    Gosub, ShowNotification, Fake shortcut created on desktop, 3
return
