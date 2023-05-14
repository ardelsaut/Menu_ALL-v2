$FileNas = "V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2"
$MenuGolbal = Menu-Perso -MenuTitle "NonoOS" -MenuOptions "1.Programmes et Applications","2.Nas","4.Dossiers","1.Première Installation","0.Sortie..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
do {
    Switch($MenuGolbal){ 
### Menu "Programmes et Applications"
    0   
    {
        $Retourmenu = "$FileLocale\3.MenuProgrammesEtApplications.ps1" 
        & "$FileLocale\3.MenuProgrammesEtApplications.ps1"
        exit
    }    
### Menu "Nas"
    1
    {
        $Retourmenu = "$FileLocale\2.MenuNas.ps1" 
        & "$FileLocale\2.MenuNas.ps1"
        exit
    }    
### Menu "Dossiers"
    2
    {
        $Retourmenu = "$FileLocale\4.MenuDossiers.ps1" 
        & "$FileLocale\4.MenuDossiers.ps1"
        exit
    }
### Menu: "Première Installation Windows"
    3
    {
        $Retourmenu = "$FileLocale\1.MenuPremièreInstallationWindows.ps1" 
        Write-Output $Retourmenu
        & "$FileLocale\1.MenuPremièreInstallationWindows.ps1"
        exit
    }
### Sortie Script
    4
    {
        Clear-Host
        exit
    }
    }} until ($MenuGolbal -in "4")

