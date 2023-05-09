$MenuUpdate = Menu-Perso -MenuTitle "Menu: Mise à jour" -MenuOptions "Enable Windows Update","Disable Windows Update","Mise à jour Winget","Mise à jour Chocolatey","Mise à jour Windows by Powershell","Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
do {
    Switch($MenuUpdate){
    # Enable Windows Update
    0
    {
        & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuMiseAjour\1.EnableWindowsUpdate.ps1"
        & "$Retourmenu"
        exit
        }    
    # Disable_WinUPD
    1
    {
        & "$DossierScriptsGlobal\Menu Programmes et Applications\MenuMiseAjour\2.DisableWindowsUpdate.ps1"
        & "$Retourmenu"
        exit
        }    
    # Mise à jour Winget
    2
    {
        & "$DossierScriptsGlobal\Menu Programmes et Applications\MenuMiseAjour\3.MiseAJourWinget.ps1"
        & "$Retourmenu"
        exit
        }    
    # Mise à jour Chocolatey
    3
    {
        & "$DossierScriptsGlobal\Menu Programmes et Applications\MenuMiseAjour\4.MiseAJourChoco.ps1"
        & "$Retourmenu"
        exit
        }   
    # Mise à jour Windows by powershell
    4
    {
        & "$DossierScriptsGlobal\Menu Programmes et Applications\MenuMiseAjour\5.MiseAJourWindows.ps1"
        & "$Retourmenu"
        exit
    }
    # Retour "Menu: Mise à jour"
    5
    {
        $Retourmenu = "$FileLocale\..\Menus\3.MenuProgrammesEtApplications.ps1" 
        & "$Retourmenu"
        exit
}
        }}until ($MenuUpdate -in "5")
