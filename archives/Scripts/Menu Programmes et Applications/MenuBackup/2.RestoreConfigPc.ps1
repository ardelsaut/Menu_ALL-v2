# Scripts Nono
# 1.BackupConfigPc.ps1
# V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2\archives\Scripts\Menu Programmes et Applications\MenuBackup\1.BackupConfigPc.ps1
Clear-Host

##
$dateTime = Get-Date -Format 'dd-MM-yyyy_HH.mm'
If(!(Test-Path "V:\")){
    Write-Host "Il faut être connecté au Nas pour poursuivre..." -ForegroundColor Cyan
    Pause
    Exit
}
if ($env:COMPUTERNAME -match "Fixe") {
    $prefix = "Fixe"
} elseif ($env:COMPUTERNAME -match "Portable") {
    $prefix = "Portable"
} else {
    $prefix = "Inconnu"
}

# Restore Backup config local
$CheminDossierRestore = "V:\03.PC\01.WINDOWS\01.DOSSIERS_CONFIG\PC-$prefix"
$FichierZip = (Get-ChildItem "$CheminDossierRestore" | Sort-Object LastWriteTime -Descending | Select-Object -First 1).FullName

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
$Start_7Zip x $FichierZip -o$env:USERPROFILE