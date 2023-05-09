$MenuTask = Menu-Perso -MenuTitle "Menu: Créer une tâche..." -MenuOptions "Créer une tâche (Powershell)", "Créer une tâche (.exe)", "Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
do {
    Switch ($MenuTask) { 
        # Créer une tâche (Powershell)
        0 {
            & "$DossierScripts\Menu Programmes et Applications\MenuTaskManager\CreerUneTachePowershell.ps1"
            $FileLocale\..\S
        }   
        1 {
            & "$DossierScripts\Menu Programmes et Applications\MenuTaskManager\CreerUneTacheExecutable.ps1"
        }   
        # Retour...
        2 {
            $Retourmenu = "$FileLocale\..\Menus\3.MenuProgrammesEtApplications.ps1" 
            & "$Retourmenu"
            exit
        }
    }
}until ($MenuTask -in "2")
