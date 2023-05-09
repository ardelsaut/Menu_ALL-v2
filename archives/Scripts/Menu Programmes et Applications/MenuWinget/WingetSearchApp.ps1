Clear-Host
$applicationWinget = Read-Host -Prompt "Nom de l'application à chercher sur Winget" -Verbose
Clear-Host
Winget search $applicationWinget
$applicationWinget = Read-Host -Prompt "Si vous voulez installer l'application, copiez son id à la suite..." -Verbose
if ( $applicationWinget -eq "" )
{
    Clear-Host
    Write-Host "Aucune Application sélectionnée." -ForegroundColor Cyan
    Write-Host "Retour au Menu Winget..." -ForegroundColor Cyan
    Start-Sleep -Seconds 0.8
}
if ( $applicationWinget -ne "" )
{
    Clear-Host
    Write-Host "Installation de $applicationWinget sélectionné." -ForegroundColor Cyan
    winget install $applicationWinget
    Pause
}
