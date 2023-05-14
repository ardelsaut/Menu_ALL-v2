$MenuAutres = Menu-Perso -MenuTitle "Menu: Autres..." -MenuOptions "1.Partager un Dossier","2.Rechercher dans un Fichier","3.Ouvrir Codium dans un Dossier donné","4.Lancer Windows SandBox","0.Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
do {
     Switch($MenuAutres){
        # 1.Partager un Dossier
        0
        {
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuAutre\1.PartagerUnDossierRéseauLocal.ps1"
            & "$Retourmenu"
            exit
        }
        # 2.Rechercher dans un Fichier
        1
        {
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuAutre\2.RechercherDansFichier.ps1"
            & "$Retourmenu"
            exit
        }
        # 3. Ouvrir codium dans un dossier donné
        2
        {
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuAutre\3.CodiumDansDossier.ps1"
            & "$Retourmenu"
            exit
        }
        # 3. Ouvrir Windows Sandbox
        3
        {
            & "$FileLocale\..\Scripts\Menu Programmes et Applications\MenuAutre\5.WindowsSandbox.ps1"
            & "$Retourmenu"
            exit
        }
        # Retour...
        4
        {
            $Retourmenu = "$FileLocale\..\Menus\3.MenuProgrammesEtApplications.ps1" 
            & "$Retourmenu"
            exit
        }
}}until ($MenuAutres -in "4")