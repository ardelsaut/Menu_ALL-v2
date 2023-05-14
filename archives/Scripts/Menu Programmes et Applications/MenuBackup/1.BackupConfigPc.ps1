# Scripts Nono
# 1.BackupConfigPc.ps1
# V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2\archives\Scripts\Menu Programmes et Applications\MenuBackup\1.BackupConfigPc.ps1
Clear-Host

## Mise en place des Variables
$dateTime = Get-Date -Format 'dd-MM-yyyy_HH.mm'
If(!(Test-Path "V:\")){
    Write-Host "Il faut être connecté au Nas pour poursuivre..." -ForegroundColor Cyan
    Pause
    Clear-Host
    Exit
}
if ($env:COMPUTERNAME -match "Fixe") {
    $prefix = "Fixe"
} elseif ($env:COMPUTERNAME -match "Portable") {
    $prefix = "Portable"
} else {
    $prefix = "Inconnu"
}

$CheminTacheBackup = "$env:USERPROFILE\Documents\1.Scripts\4.TachePlanifiées"
If(!(Test-Path $CheminTacheBackup)){
    New-Item -ItemType Directory -Path "$CheminTacheBackup" -Force
}

$taskname = "1.TacheBackupConfigPc.ps1"
If(!(Test-Path "$CheminTacheBackup\$taskname")){
    $ContenuScript = Get-Content $PSCommandPath
    Add-Content -Value $ContenuScript -Path "$CheminTacheBackup\$taskname" -Force
}

if(!(Get-ScheduledTask -TaskName "$taskname")){
    $actionparams = @{
        execute  = 'powershell.exe'
        argument = "-ExecutionPolicy Bypass -NoExit -NoProfile -WindowStyle Minimized -File $CheminTacheBackup\$taskname"
    }
    $action = New-ScheduledTaskAction @actionparams -Verbose
    $settingsParams = @{
        RunOnlyIfIdle = $true
        RestartOnIdle = $true
        DontStopOnIdleEnd = $true
        AllowStartIfOnBatteries = $true
        DontStopIfGoingOnBatteries = $true
        StartWhenAvailable = $true
        IdleDuration = '00:15:00'
        IdleWaitTimeout = '00:00:00'
        ExecutionTimeLimit = '05:00:00'
        MultipleInstances  = 'IgnoreNew'
    }
    $settings = New-ScheduledTaskSettingsSet @settingsParams -Verbose
    $triggerParams = @{
        Daily = $true
        DaysInterval = '2'
        At = '11am'
    }
    $trigger = New-ScheduledTaskTrigger @triggerParams -Verbose
    $params = @{
        TaskName = $taskName
        TaskPath = "\NonoOs"
        Trigger  = $trigger
        Action   = $action
        Runlevel = "Highest"
        Settings = $settings
    }
    Register-ScheduledTask @params -Force -Verbose
}

$FileNas = "V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2"
$destinationFolder = "$FileNas\..\..\01.DOSSIERS_CONFIG\PC-$prefix\CONFIG_$prefix`_$dateTime.ZIP"
$filePath = "c:\exclude.txt"
$content = @(
    "$env:USERPROFILE\GDrive",
    "$env:USERPROFILE\GDrive2",
    "$env:USERPROFILE\links",
    "$env:USERPROFILE\Cookies",
    "$env:USERPROFILE\Searches"
)
Set-Content -Path $filePath -Value $content -Encoding UTF8

if (!(Test-Path "$FileLocale\..\modules\.exe\7zr.exe")){
    if (!(Test-Path "$env:ProgramFiles\7-Zip\7z.exe")){
        Invoke-WebRequest "https://www.7-zip.org/a/7z1900-x64.msi" -OutFile "$env:USERPROFILE\Downloads\7z1900-x64.msi"
        Start-Process msiexec.exe -ArgumentList "/i $env:USERPROFILE\Downloads\7z1900-x64.msi /quiet" -Wait
        $Start_7Zip = "$env:ProgramFiles\7-Zip\7z.exe"
    } else {
        $Start_7Zip = "$env:ProgramFiles\7-Zip\7z.exe"
        
    }
} else {
    $Start_7Zip = "$FileLocale\..\modules\.exe\7zr.exe"
}

& $Start_7Zip a -tzip -mx0 -mmt "$FileNas\..\..\01.DOSSIERS_CONFIG\PC-$prefix\CONFIG_$prefix`_$dateTime.ZIP" "$env:USERPROFILE\*" -xr@c:\exclude.txt
if ($filePath){
    Remove-Item -Force -Path "$filePath" -Recurse
}

$nombreFichiers = 3
$listeFichiers = Get-ChildItem "$FileNas\..\..\01.DOSSIERS_CONFIG\PC-$prefix" | Where-Object { $_.Name -like "*$prefix*" } | Sort-Object CreationTime
if ($listeFichiers.Count -gt $nombreFichiers) {
    $listeFichiers[0..($listeFichiers.Count - $nombreFichiers - 1)] | Remove-Item -Force
}

# Backup Winget
if (Get-Command winget.exe -ErrorAction SilentlyContinue) {
    winget export --output "$FileNas\archives\winget\PC_$prefix`_Winget_$dateTime.list"  --accept-source-agreements
    $nombreFichiers = 3
    $listeFichiers = Get-ChildItem "$FileNas\archives\winget" | Where-Object { $_.Name -like "*$prefix*" } | Sort-Object CreationTime
    if ($listeFichiers.Count -gt $nombreFichiers) {
        $listeFichiers[0..($listeFichiers.Count - $nombreFichiers - 1)] | Remove-Item -Force
    }
    } else {
    Write-Host "Windows Package Manager  n'est pas installé."
}
pause

Clear-Host

# Backup Choco
if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
    choco export -o "$FileNas\archives\Chocolatey\PC_$prefix`_$dateTime`_packages.config" -v --skipcompatibilitychecks --allowunofficial -f
    $nombreFichiers = 3
    $listeFichiers = Get-ChildItem "$FileNas\archives\Chocolatey" | Where-Object { $_.Name -like "*$prefix*" } | Sort-Object CreationTime
    if ($listeFichiers.Count -gt $nombreFichiers) {
        $listeFichiers[0..($listeFichiers.Count - $nombreFichiers - 1)] | Remove-Item -Force
    }
} else {
    Write-Host "Chocolatey n'est pas installé."
}
pause

Clear-Host


# Fin
Write-Host "Backup de toute la Config de PC_$prefix`_Config faite!" -ForegroundColor Green               
Write-Host "(Chocolatey, Winget, et Dossier Utilisateur PC_$prefix)" -ForegroundColor Green
Start-Process -FilePath "explorer.exe" -ArgumentList "$FileNas\..\..\01.DOSSIERS_CONFIG\PC-$prefix" -WindowStyle Minimize
Pause
Clear-Host
exit
