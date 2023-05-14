Clear-Host
Write-Host "Création d'un lien symbolique" -ForegroundColor Cyan
$PathLinkOrigin = Read-Host "Path du dossier source"
$PathToLink = Read-Host "Path du dossier symbolisé"
New-Item -ItemType SymbolicLink -Path "$PathToLink" -Target "$PathLinkOrigin"
Pause
Clear-Host
Write-Host "Création d'un lien symbolique" -ForegroundColor Green

Pause
