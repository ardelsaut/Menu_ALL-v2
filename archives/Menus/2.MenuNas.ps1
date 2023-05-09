$MenuNas = Menu-Perso -MenuTitle "Menu Nas...:" -MenuOptions "1.Connection au Nas '192.168.1.54'","2.Connection au Nas 'nonobouli.myds.me'","3.Nas","4.Copie Fichier Nas","0.Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
do {
Switch($MenuNas){
    # Connection au Nas 192.168.1.54
    0
    {
        $Retourmenu = "$FileLocale\2.MenuNas.ps1" 
        & "$FileLocale\..\Scripts\MenuNas\1.ConnectionNas192.168.1.54.ps1"
        & "$Retourmenu"
        exit
    }
    # Connection au Nas 'nonobouli.myds.me'
    1
    {
        & "$FileLocale\..\Scripts\MenuNas\2.ConnectionNasnonobouli.myds.me.ps1"
        & "$Retourmenu"
        exit
    }
    # Nas
    2
    {
        & "$FileLocale\..\Scripts\MenuNas\3.Nas.ps1"
        & "$Retourmenu"
        exit
    }
    # Copie fichier Nas
    3
    {
        & "$FileLocale\..\Scripts\MenuNas\4.CopieFichierNas.ps1"
        & "$Retourmenu"
        exit
    }
    # Retour
    4
    {
        & "$FileLocale/0.MenuMain.ps1"
        exit
    }
    }} until ($MenuNas -in "4")