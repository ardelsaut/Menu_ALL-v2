﻿Clear-Host
$rootFolder = Read-Host "Dans quel path faut-il chercher?"
Clear-Host
$SearchWord = Read-Host "Quel est le mot à rechercher dans les fichier"
Clear-Host
Write-Host "Recherche en cours..." -foregroundColor Cyan
Write-Host "Un peu de patience..." -foregroundColor Cyan
# Recherchez tous les fichiers contenant le mot "$SearchWord"
$results = Get-ChildItem -Path $rootFolder -Recurse | Select-String -Pattern "$SearchWord" -List
Clear-Host
# Afficher les résultats dans une sortie facilement lisible
if ($results) {
    Write-Host "Les fichiers contenant le mot '$SearchWord' ont été trouvés dans le dossier suivant : $rootFolder"

    foreach ($result in $results) {
        Write-Host "Chemin d'accès : $($result.Path)"
        Write-Host "Ligne : $($result.LineNumber)"
        Write-Host "Contenu : $($result.Line)`n"
    }
}
else {
    Write-Host "Aucun fichier contenant le mot '$SearchWord' n'a été trouvé dans le dossier suivant : $rootFolder"
}
Pause
Clear-Host