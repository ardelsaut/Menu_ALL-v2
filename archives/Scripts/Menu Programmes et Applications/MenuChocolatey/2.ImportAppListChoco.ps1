Clear-Host
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

if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
    $CheminDossierRestore = "V:\03.PC\01.WINDOWS\Menu_ALL-v2\archives\Chocolatey"
    $DossierChocoConfigChoco = (Get-ChildItem "$CheminDossierRestore" | Sort-Object LastWriteTime -Descending | Where-Object { $_.Name -like "*$prefix*" } | Select-Object -First 1).FullName
    choco install "$DossierChocoConfigChoco" --ignoredetectedreboot --allowemptychecksumsecure --allowemptychecksum --ignorechecksum --skipcompatibilitychecks --allowunofficial --force --yes --acceptlicense
} else {
    Write-Host "Chocolatey n'est pas installé."
}
pause
