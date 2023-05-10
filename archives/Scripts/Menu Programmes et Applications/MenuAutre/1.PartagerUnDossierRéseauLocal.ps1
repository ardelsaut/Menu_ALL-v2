# Scripts Nono
# 8.PartagerUnDossierRéseauLocal.ps1
# V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2\archives\Scripts\8.PartagerUnDossierRéseauLocal.ps1
Clear-Host
$DossierPartage = Read-Host "Quel est le Path du Dossier à partager?"
Clear-Host
$NomNouveauPartage = Read-Host "Nom du partage?"
New-SmbShare -Name "$NomNouveauPartage" -Path "$DossierPartage" -FullAccess "tout le monde"
Write-Host "Dossier $DossierPartage partagé. Nom du Partage: $NomNouveauPartage" -ForegroundColor Green
Pause