Clear-Host
$DestinationFichierNas = "$env:USERPROFILE\Documents\1.Scripts\1.Nas"
$NomduFichierNas = "3.Nas.ps1"
if(!(Test-Path "$DestinationFichierNas\$NomduFichierNas")){
    Write-Host "On copie le fichier nas dans $DestinationFichierNas" -ForegroundColor Cyan
    Write-Host "Avec comme nom $NomduFichierNas" -ForegroundColor Cyan
    New-Item "$DestinationFichierNas" -Type Directory -Force | Out-Null
    # Copy-Item -Path -Destination "$DestinationFichierNas\$NomduFichierNas" -Force | Out-Null
    Copy-Item -Path "$FileLocale\..\Scripts\MenuNas\$NomduFichierNas" -Destination "$DestinationFichierNas\$NomduFichierNas" -Force
    Write-Host "On règle la clé de registre pour que le script se lance à chaque démarrage du système" -ForegroundColor Cyan
}
$QuestionConnexion = Read-Host "Voulez-vous lancer la Connection au Nas? (Y/N)"
Write-Host "Script copié et enregistré dans le registre"
if ($QuestionConnexion -eq "Y") {
    powershell.exe -ExecutionPolicy Bypass -File "$FileLocale\..\Scripts\MenuNas\$NomduFichierNas"
}    
Pause
Clear-Host
