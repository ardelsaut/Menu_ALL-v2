do {
    $dossiers = Menu-Perso -MenuTitle "Menu Dossier...:" -MenuOptions "1.Menu Épingler Dossiers","2.Ouvrir Dossier Scripts","3.Ouvrir Dossier Backup Config","4.Ouvrir Dossier Remote Desktop","5.Ouvrir Dossier Menu_NonoOS","0.Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
    Switch($dossiers){
        # Pin des dossiers
        0
        {
            # $Retourmenu = "$FileLocale\4.MenuDossiers.ps1" 
            & "$FileLocale\..\Scripts\MenuDossiers\1.MenuPinFiles&Folders.ps1"
            # & "$Retourmenu"
            exit
        }
        # Dossier COMPILATION_SCRIPTS
        1
        {
            explorer.exe "V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS"
        }
        # Dossier Backup user win11
        2
        {
            explorer.exe "V:\03.PC\01.WINDOWS\01.DOSSIERS_CONFIG\PC-FIXE"
        }
        # Dossier Remote Desktop
        3
        {
            explorer.exe "$FileLocale\..\Launchers\Remote_Desktop"
        }
        # Dossier Menu_NonoOS
        4
        {
            explorer.exe "V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2"
        }
        # Retour....
        5
        {
             & "$FileLocale/0.MenuMain.ps1"
             exit
        }
}}until ($dossiers -in "5")

