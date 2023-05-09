do {
    $MenuRemote = Menu-Perso -MenuTitle "Menu: Remote Desktop..." -MenuOptions "1.Win10Nas","2.PC_FIXE","3.Medion_Portable","0.Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
     Switch($MenuRemote){
        # Win10Nas Remote Desktop
        0
        {
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuRemoteDesktop\Win10Nas.ps1"
            & "$Retourmenu"
            exit
        }
        # PC_FIXE Remote Desktop
        1
        {
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuRemoteDesktop\PC-FIXE.ps1"
            & "$Retourmenu"
            exit
        }
        # Medion_Portable Remote Desktop
        2
        {
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuRemoteDesktop\Medion-Portable.ps1"
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
        }}until ($MenuRemote -in "3")