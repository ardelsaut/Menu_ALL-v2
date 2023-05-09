$MenuChocolatey = Menu-Perso -MenuTitle "Menu: Chocolatey" -MenuOptions "Search Chocolatey Application","Backup Applications Chocolatey","Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
do {
     Switch($MenuChocolatey){
        # Search Chocolatey Application
        0
        {
            & "$DossierScriptsGlobal\Menu Programmes et Applications\MenuChocolatey\SearchChocoapp.ps1"
            & "$Retourmenu"
            exit
        }
        # Backup Applications Chocolatey
        1
        {
            & "$DossierScriptsGlobal\Menu Programmes et Applications\MenuChocolatey\BackUpAppListChoco.ps1"
            & "$Retourmenu"
            exit
        }
        # Retour...
        2
        {
            $Retourmenu = "$FileLocale\..\Menus\3.MenuProgrammesEtApplications.ps1" 
            & "$Retourmenu"
            exit
        }
}}until ($MenuChocolatey -in "2")
