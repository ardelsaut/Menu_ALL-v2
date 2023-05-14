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
    $FileNas = "V:\03.PC\01.WINDOWS\Menu_ALL-v2"
    choco export -o "$FileNaso\archives\Chocolatey\PC_$prefix`_$dateTime`_packages.config" -v --skipcompatibilitychecks --allowunofficial -f
    $nombreFichiers = 3
    $listeFichiers = Get-ChildItem "$FileNas\archives\Chocolatey" | Where-Object { $_.Name -like "*$prefix*" } | Sort-Object CreationTime
    if ($listeFichiers.Count -gt $nombreFichiers) {
        $listeFichiers[0..($listeFichiers.Count - $nombreFichiers - 1)] | Remove-Item -Force
    }
} else {
    Write-Host "Chocolatey n'est pas installé."
}
pause
