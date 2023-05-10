Clear-Host
Write-Host "Création d'un lien symbolique" -ForegroundColor Cyan
$PathLinkOrigin = Read-Host "Path du dossier source"
$PathToLink = Read-Host "Path du dossier symbolisé"
New-Item -ItemType SymbolicLink -Path "$PathToLink" -Target "$PathLinkOrigin"
Pause
Clear-Host
exit

New-Item -ItemType SymbolicLink -Path "$env:APPDATA\Microsoft\Windows\Recent\CustomDestinations" -Name "NomDuFichier.lnk" -Value "C:\Chemin\vers\le\dossier"
