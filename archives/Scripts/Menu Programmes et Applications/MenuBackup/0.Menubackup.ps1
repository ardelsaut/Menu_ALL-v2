$MenuUpdate = Menu-Perso -MenuTitle "Menu: Backup" -MenuOptions "1.Backup config PC", "2.Restore config PC", "Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
do {
    Switch($MenuUpdate){
    # 1.Backup config PC
    0
    {
        & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuBackup\1.BackupConfigPc.ps1"
        & "$Retourmenu"
        exit
    }    
    1
    {
        & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuBackup\1.BackupConfigPc.ps1"
        & "$Retourmenu"
        exit
    }    
    # Retour "Menu: Backup"
    2
    {
        $Retourmenu = "$FileLocale\..\Menus\3.MenuProgrammesEtApplications.ps1" 
        & "$Retourmenu"
        exit
    }
        }}until ($MenuUpdate -in "2")
