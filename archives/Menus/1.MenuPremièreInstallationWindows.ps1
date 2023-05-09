$Menu1stInstallWin = Menu-Perso -MenuTitle "Menu: Première Installation de  Windows..." -MenuOptions "1.Indispensales Win11","2.Activer Numlock","3.Dark Thème","4.AutoLogon","5.Activer checkbox","6.Disable Windows Defender","7.Désactiver Windows UAC","8.Activer File Extension","9.Configurer ssh et remote desktop","10.Renommer PC","11.Activer Bureau à distance","12.Remove OneDrive","13.Installer Chocolatey","0.Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True

do {
    Switch($Menu1stInstallWin){
        # Toggle Numlock
        0
        {
            $Retourmenu = "$FileLocale\1.MenuPremièreInstallationWindows.ps1" 
            & "$FileLocale\..\Scripts\MenuPremièreInstallationWindows\1.indispensables.ps1"
            & "$Retourmenu"
            exit
        }
        1
        {
            & "$FileLocale\..\Scripts\MenuPremièreInstallationWindows\1.Toggle_Numlock.ps1"
            & "$Retourmenu"
            exit
        }
        # Dark Theme
        2
        {
            & "$FileLocale\..\Scripts\MenuPremièreInstallationWindows\2.EnableDarkTheme.ps1"
            & "$Retourmenu"
            exit
        }
        # Autologon Nono
        3
        {
            & "$FileLocale\..\Scripts\MenuPremièreInstallationWindows\3.Autologon_Nono.ps1"
            & "$Retourmenu"
            exit
        }
        # 3.Activer checkbox
        4
        {
            & "$FileLocale\..\Scripts\MenuPremièreInstallationWindows\4.Activer_checkbox.ps1"
            & "$Retourmenu"
            exit
        }
        # 4.Disable Windows Defender
        5
        {
            & "$FileLocale\..\Scripts\MenuPremièreInstallationWindows\5.DisableWindowsDefender.ps1"
            & "$Retourmenu"
            exit
        }
        # 5.Désactiver Windows UAC
        6
        {
            & "$FileLocale\..\Scripts\MenuPremièreInstallationWindows\6.DisableUac.ps1"
            & "$Retourmenu"
            exit
        }
        # 6.Activer File Extension
        7
        {
            & "$FileLocale\..\Scripts\MenuPremièreInstallationWindows\7.EnableFileExtension.ps1"
            & "$Retourmenu"
            exit
        }
        # Configurer ssh et remote desktop
        8
        {
            & "$FileLocale\..\Scripts\MenuPremièreInstallationWindows\11.ssh_and_Remote Desktop.ps1"
            & "$Retourmenu"
            exit
        }
        # Renommer pc
        9
        {
            & "$FileLocale\..\Scripts\MenuPremièreInstallationWindows\12.RenamePc.ps1"
            & "$Retourmenu"
            exit
        }
        # Bureau à distance
        10
        {
            & "$FileLocale\..\Scripts\MenuPremièreInstallationWindows\13.RemoteDesktop.ps1"
            & "$Retourmenu"
            exit
        }
        # Copie Script Menu_All
        11
        {
            & "$FileLocale\..\Scripts\MenuPremièreInstallationWindows\14.Remove-OneDrive.ps1"
            & "$Retourmenu"
            exit
        }
        # Installer Chocolatey
        12
        {
            & "$FileLocale\..\Scripts\MenuPremièreInstallationWindows\15.InstallChoco.ps1"
            & "$Retourmenu"
            exit
        }
        # Retour
        13
        {
            & "$FileLocale/0.MenuMain.ps1"
            exit

        }
    }} until ($Menu1stInstallWin -in "13")