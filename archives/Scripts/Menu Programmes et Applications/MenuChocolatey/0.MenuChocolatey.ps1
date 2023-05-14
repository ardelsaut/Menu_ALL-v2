if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Clear-Host
    Write-Host "ChocolaTey n'est pas installé" -ForegroundColor Cyan
    Write-Host "ChocolaTey est nécessaire" -ForegroundColor Cyan
    $InstallerChocolatey = Read-Host "Voulez-vous l'installer? (1/2)"
    Clear-Host
    if ($InstallerChocolatey -eq "1") {
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest https://community.chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
        Write-Host "Chocolatey est installé" -ForegroundColor Green
    } else {
        Write-Host "Installation de Chocoltey refusée, Fin."
        exit
    }
}

$MenuChocolatey = Menu-Perso -MenuTitle "Menu: Chocolatey" -MenuOptions "Export Applications Chocolatey","Import Applications Chocolatey","Search Chocolatey Application","Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
do {
     Switch($MenuChocolatey){
        # Backup Applications Chocolatey
        0
        {
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuChocolatey\1.ExportAppListChoco.ps1"
            & "$Retourmenu"
            exit
        }
        1
        {
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuChocolatey\2.ImportAppListChoco.ps1"
            & "$Retourmenu"
            exit
        }
        # Search Chocolatey Application
        2
        {
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuChocolatey\3.SearchChocoapp.ps1"
            & "$Retourmenu"
            exit
        }
        # Retour...
        3
        {
            $Retourmenu = "$FileLocale\..\Menus\3.MenuProgrammesEtApplications.ps1" 
            & "$Retourmenu"
            exit
        }
}}until ($MenuChocolatey -in "3")
