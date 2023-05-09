# Scripts Nono
# 12.RenommePC
# V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2\archives\Scripts\12.RenamePc.ps1
Clear-Host
Write-Host "A la suite, le PC va redémarrer... " -foregroundcolor "Magenta"
$continue = $(Write-Host "Voulez-vous continuer ?(Y/N)" -foregroundcolor "Cyan") + $(Read-Host)
if ($continue -eq "Y" -or $continue -eq "y") {
    Clear-Host
    $NouveauNomPc = $(Write-Host "Quel est le nouveau nom à attribuer ?" -foregroundcolor "Yellow") + $(Read-Host)
    Write-Host "Le pc redémarre..." -ForegroundColor Cyan
    Start-Sleep -Seconds 5
    Rename-Computer -NewName "$NouveauNomPc" -Restart
} elseif ($continue -eq "N" -or $continue -eq "n") {
    Clear-Host
    Write-Host "Opération annulée." -ForegroundColor Cyan
} else {
    Write-Host "Entrée invalide. Veuillez entrer Y ou N." -ForegroundColor Red
}
Pause

