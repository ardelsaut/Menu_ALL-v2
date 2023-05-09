Clear-Host
$applicationChoco = Read-Host -Prompt "Nom de l'application à chercher sur Chocolatey" -Verbose
Clear-Host
choco search $applicationChoco
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
$applicationChoco = Read-Host -Prompt "Si vous voulez installer l'application, copiez son id à la suite..." -Verbose
if ( $applicationChoco -eq "" )
{
    Clear-Host
    Write-Host "Aucune Application sélectionnée." -ForegroundColor Cyan
    Write-Host "Retour au Menu Chocolatey..." -ForegroundColor Cyan
    Start-Sleep -Seconds 0.8
}
if ( $applicationChoco -ne "" )
{
    Clear-Host
    Write-Host "Installation de $applicationChoco sélectionné." -ForegroundColor Cyan
    choco install $applicationChoco
    Pause
}
