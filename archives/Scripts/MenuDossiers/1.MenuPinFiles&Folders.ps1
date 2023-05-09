do {
    $dossiers = Menu-Perso -MenuTitle "Menu Épingler...:" -MenuOptions "1.Épingler Dossier 'Menu_All-V2' a 'explorer'","2.Épingler Dossiers 'Nas'","0.Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
    Switch($dossiers){
        # 1.Épingler Dossier 'Menu_All'-V2
        0
        {
            $o = new-object -com shell.application
            $o.Namespace('V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2').Self.InvokeVerb("pintohome")
            4.MenuDossiers.ps1
        }
        # 2.Épingler Dossiers 'Nas'
        1
        {
            $o = new-object -com shell.application
            $o.Namespace('U:\').Self.InvokeVerb("pintohome")
            $o = new-object -com shell.application
            $o.Namespace('V:\').Self.InvokeVerb("pintohome")
            $o = new-object -com shell.application
            $o.Namespace('Y:\').Self.InvokeVerb("pintohome")
        }
        # Retour....
        2
        {
             & "$FileLocale/4.MenuDossiers.ps1"
             exit
        }
}}until ($dossiers -in "2")

