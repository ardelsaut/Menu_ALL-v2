$MenuProgEtApp = Menu-Perso -MenuTitle "Programmes et Applications" -MenuOptions "1.Menu Backup", "2.Menu Mise à jour", "2.Menu Chocolatey", "3.Menu Winget", "4.Menu Créer une tâche", "5.Menu Autre", "6.Menu Remote Desktop", "0.Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
$FileLocale = if (-not $PSScriptRoot) { Split-Path -Parent (Convert-Path ([environment]::GetCommandLineArgs()[0])) } else { $PSScriptRoot }
do {
    Switch ($MenuProgEtApp) {
        # 1.Menu Backup
        0 
        {
            $Retourmenu= "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuBackup\0.Menubackup.ps1" 
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuBackup\0.Menubackup.ps1"
            Write-Host "$Retourmenu"
            exit
        }
        1 
        {
            $Retourmenu= "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuMiseAjour\0.MenuMiseAJour.ps1" 
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuMiseAjour\0.MenuMiseAJour.ps1"
            exit
        }
        # Menu Chocolatey
        2
        {
            $Retourmenu = "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuChocolatey\0.MenuChocolatey.ps1" 
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuChocolatey\0.MenuChocolatey.ps1"
            exit
        }
        # Menu Winget
        3
        {

            $Retourmenu = "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuWinget\0.MenuWinget.ps1" 
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuWinget\0.MenuWinget.ps1"
            exit
        }   
        # Menu Créer une Tâche
        4
        {
            $Retourmenu = "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuTaskManager\0.MenuTaskManager.ps1" 
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuTaskManager\0.MenuTaskManager.ps1"
            exit

        }
        # Menu Autre
        5 
        {
            $Retourmenu = "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuAutre\0.MenuAutre.ps1"
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuAutre\0.MenuAutre.ps1"
            exit
        }
        # Menu RemoteDesktop
        6 
        {
            $Retourmenu = "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuRemoteDesktop\0.MenuRemoteDesktop.ps1"
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuRemoteDesktop\0.MenuRemoteDesktop.ps1"
            exit
        }
        # Retour ...
        7 {
            & "$FileLocale/0.MenuMain.ps1"
            exit
        }
    }
}until ($MenuProgEtApp -in "7")
