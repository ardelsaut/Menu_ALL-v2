# ###########################################################################
# ##########
# # Sample #
# ##########
# # Recopier le nom du fichier .ps1, sans le path
# $Title = ""
# $PathScriptPs1ToExe = ""

# $TestModulePS2EXE = (Get-Module -ListAvailable).Name -match "ps2exe"
# if ($TestModulePS2EXE.Length -eq 0) {
#     Install-Module ps2exe
#     Import-Module ps2exe -UseWindowsPowerShell
# }

# $DestinationExeFolder = "$env:USERPROFILE\Documents\1.Scripts\4.Exe_Files"
# if (!(Test-Path $DestinationExeFolder)) {
#     New-Item -Path $DestinationExeFolder -ItemType Directory
# }
# Invoke-ps2exe -inputFile "$PathScriptPs1ToExe" -outputFile "$env:USERPROFILE\Documents\1.Scripts\4.Exe_Files\$Title.exe" -x64 -iconFile "$env:USERPROFILE\Pictures\Avatar\avatar_icone.ico" $Console -requireAdmin -title "$Title" -description "$Title" -company "NonoOS" -product "NonoOS" -copyright "NonoOS" -trademark "NonoOS" -version "1.0" -Verbose
# # $Console = noConsole"+
# Copy-Item -Path "$env:USERPROFILE\Documents\1.Scripts\4.Exe_Files\*" -Destination "V:\03.PC\01.WINDOWS\Menu_ALL-v2\archives\modules\.exe\own_.exe"  -Force -Recurse

# $sourceFilePath = "C:\Path\to\test.txt"
# $shortcutFilePath = "$env:USERPROFILE\Desktop\test.lnk"

# $shell = New-Object -ComObject WScript.Shell
# $shortcut = $shell.CreateShortcut($shortcutFilePath)
# $shortcut.TargetPath = $sourceFilePath
# $shortcut.Save()

# ###########################################################################


# ###########################################################################
# #######
# # Nas #
# #######
# # Recopier le nom du fichier .ps1, sans le path
# $Title = "Nas"
# $PathScriptPs1ToExe = "V:\03.PC\01.WINDOWS\Menu_ALL-v2\archives\Scripts\MenuNas\3.Nas.ps1"

# $TestModulePS2EXE = (Get-Module -ListAvailable).Name -match "ps2exe"
# if ($TestModulePS2EXE.Length -eq 0) {
#     Install-Module ps2exe
#     Import-Module ps2exe -UseWindowsPowerShell
# }

# $DestinationExeFolder = "$env:USERPROFILE\Documents\1.Scripts\4.Exe_Files"
# if (!(Test-Path $DestinationExeFolder)) {
#     New-Item -Path $DestinationExeFolder -ItemType Directory
# }
# Invoke-ps2exe -inputFile "$PathScriptPs1ToExe" -outputFile "$env:USERPROFILE\Documents\1.Scripts\4.Exe_Files\$Title.exe" -x64 -iconFile "$env:USERPROFILE\Pictures\Avatar\avatar_icone.ico" $Console -requireAdmin -title "$Title" -description "$Title" -company "NonoOS" -product "NonoOS" -copyright "NonoOS" -trademark "NonoOS" -version "1.0" -Verbose
# # $Console = noConsole"

# ###########################################################################



# ###########################################################################
# ############
# # Shutdown #
# ############
# # Recopier le nom du fichier .ps1, sans le path
# $Title = "Shutdown_Poweroff_Computer"
# $PathScriptPs1ToExe = "C:\Users\Nono\Desktop\Stop-Computer -ComputerName localhost -F.ps1"

# $TestModulePS2EXE = (Get-Module -ListAvailable).Name -match "ps2exe"
# if ($TestModulePS2EXE.Length -eq 0) {
#     Install-Module ps2exe
#     Import-Module ps2exe -UseWindowsPowerShell
# }

# $DestinationExeFolder = "$env:USERPROFILE\Documents\1.Scripts\4.Exe_Files"
# if (!(Test-Path $DestinationExeFolder)) {
#     New-Item -Path $DestinationExeFolder -ItemType Directory
# }
# Invoke-ps2exe -inputFile "$PathScriptPs1ToExe" -outputFile "$env:USERPROFILE\Documents\1.Scripts\4.Exe_Files\$Title.exe" -x64 -iconFile "$env:USERPROFILE\Pictures\Avatar\avatar_icone.ico" $Console -requireAdmin -title "$Title" -description "$Title" -company "NonoOS" -product "NonoOS" -copyright "NonoOS" -trademark "NonoOS" -version "1.0" -Verbose
# # $Console = noConsole"
# Copy-Item -Path "$env:USERPROFILE\Documents\1.Scripts\4.Exe_Files\*" -Destination "V:\03.PC\01.WINDOWS\Menu_ALL-v2\archives\modules\.exe\own_.exe"  -Force -Recurse

# $sourceFilePath = "$env:USERPROFILE\Documents\1.Scripts\4.Exe_Files\$Title.exe"
# $shortcutFilePath = "C:\Users\Nono\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\exe_files\$Title.exe.lnk"
# if (!(Test-Path "C:\Users\Nono\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\exe_files")) {
#     New-Item -Path "C:\Users\Nono\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\exe_files" -ItemType Directory
# }

# $shell = New-Object -ComObject WScript.Shell
# $shortcut = $shell.CreateShortcut($shortcutFilePath)
# $shortcut.TargetPath = $sourceFilePath
# $shortcut.Save()

# ###########################################################################


# Retrieve a list of applications set to start at boot using Get-ScheduledTask
$taskApps = Get-ScheduledTask | Where-Object { $_.Settings.Hidden -eq $false }
$taskAppNames = $taskApps | Select-Object -ExpandProperty TaskName

# Retrieve a list of applications set to start at boot using Get-WmiObject
$wmiApps = Get-WmiObject -Query "SELECT * FROM Win32_StartupCommand"

# Create an array to store the output objects
$output = @()

# Build the output objects from task apps
foreach ($app in $taskApps) {
    $appName = $app.TaskName
    $appPath = $app.taskpath
    $outputObject = [PSCustomObject]@{
        Name = $appName
        Path = $appPath
    }
    $output += $outputObject
}

# Build the output objects from WMI apps that are not already captured by Get-ScheduledTask
foreach ($app in $wmiApps) {
    if ($app.Name -notin $taskAppNames) {
        $appName = $app.Name
        $appPath = $app.Command
        $outputObject = [PSCustomObject]@{
            Name = $appName
            Path = $appPath
        }
        $output += $outputObject
    }
}

# Output the list of boot applications in a formatted table
$output | Format-Table -AutoSize

Pause

# # Specify the application details
$applicationName = "OneDriveSetup"
# $applicationPath = "C:\Windows\System32\OneDriveSetup.exe"

# Specify the application details
# $applicationName = "EpicGamesLauncher"
# $applicationPath = "C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win64\EpicGamesLauncher.exe"

# Build the registry path for the startup entry
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$entryName = $applicationName -replace '\W', ''

# Check if the entry exists
if (Test-Path -Path "$registryPath\$entryName") {
    # Remove the startup entry
    Remove-Item -Path "$registryPath\$entryName" -ErrorAction Stop
    Write-Host "Startup entry '$applicationName' has been removed."
} else {
    Write-Host "Startup entry '$applicationName' was not found."
}