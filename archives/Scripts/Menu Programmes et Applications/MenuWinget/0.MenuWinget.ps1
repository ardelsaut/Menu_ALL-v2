$MenuWinget = Menu-Perso -MenuTitle "Menu: Winget" -MenuOptions "Search Winget Application","Export Applications Winget","Import Applications Winget","Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
do {
     Switch($MenuWinget){
        # Search Winget Application
        0
        {
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuWinget\WingetSearchApp.ps1"
            & "$Retourmenu"
            exit
        }
        # Export Applications Winget
        1
        {
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuWinget\WingetExportConfig.ps1"
            & "$Retourmenu"
            exit
        }
        2
        # Import Applications Winget
        {
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuWinget\WingetImportConfig.ps1"
            & "$Retourmenu"
            exit
        }
        # Retour..."Menu: Winget"
        3
        {
            $Retourmenu = "$FileLocale\..\Menus\3.MenuProgrammesEtApplications.ps1" 
            & "$Retourmenu"
            exit
        }
# Retour "Menu: Winget"
}}until ($MenuWinget -in "3")
