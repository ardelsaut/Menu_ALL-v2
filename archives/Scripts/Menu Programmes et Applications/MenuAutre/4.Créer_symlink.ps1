Clear-Host
Write-Host "Création d'un lien symbolique" -ForegroundColor Cyan
Write-Host "Veuillez fournir le path complet source" -ForegroundColor Cyan
$PathLinkOrigin = Read-Host "Path du dossier source"
Write-Host "Laissez vide si vous voulez choisir en GUI" -ForegroundColor Cyan
$PathToLink = Read-Host "Path du dossier symbolisé"
New-Item -ItemType SymbolicLink -Path "$PathToLink" -Target "$PathLinkOrigin"
Pause
Clear-Host
exit

New-Item -ItemType SymbolicLink -Path "$env:APPDATA\Microsoft\Windows\Recent\CustomDestinations" -Name "NomDuFichier.lnk" -Value "C:\Chemin\vers\le\dossier"
