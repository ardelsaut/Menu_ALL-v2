
Clear-Host
# Install-PackageProvider -Name "NuGet" -Force 
# Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted 
# Install-Package chocolatey                                            

$CheminDossierRestore = "V:\03.PC\01.WINDOWS\Menu_ALL-v2\archives\Chocolatey"
if ($env:COMPUTERNAME -match "Fixe") {
    $prefix = "Fixe"
} elseif ($env:COMPUTERNAME -match "Portable") {
    $prefix = "Portable"
} else {
    $prefix = "Inconnu"
}

if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest https://community.chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
    Clear-Host
}
$InstallPackage = Read-Host "Voulez-vous restaurer vos paquets choco?(1/2)"
If($InstallPackage -eq "1") {
    if ((Test-Path $CheminDossierRestore)) {
        Clear-Host
        Write-Host "On install les paquets choco..."
        $DossierChocoConfig = (Get-ChildItem "$CheminDossierRestore" | Sort-Object LastWriteTime -Descending | Where-Object { $_.Name -like "*$prefix*" } | Select-Object -First 1).FullName
        choco install "$DossierChocoConfig" --ignoredetectedreboot --allowemptychecksumsecure --allowemptychecksum --ignorechecksum --skipcompatibilitychecks --allowunofficial --force --yes --acceptlicense
        Pause
    } else {
        Clear-Host
        Write-Host "Il faut être connecté au Nas pour poursuivre"
        $SeConnecterNas = Read-Host "Voulez-vous vous connecter au Nas?(1/2)"
        if ($SeConnecterNas -eq 1) {
            & "$FileLocale\..\Scripts\MenuNas\3.Nas.ps1"
            Clear-Host
            Write-Host "On install les paquets choco..."
            $DossierChocoConfig = (Get-ChildItem "$CheminDossierRestore" | Sort-Object LastWriteTime -Descending | Where-Object { $_.Name -like "*$prefix*" } | Select-Object -First 1).FullName
            choco install "$DossierChocoConfig" --ignoredetectedreboot --allowemptychecksumsecure --allowemptychecksum --ignorechecksum --skipcompatibilitychecks --allowunofficial --force --yes --acceptlicense
        }
        Pause               
    }
}elseif ($InstallPackage -eq "2") {
        Clear-Host
        Write-Host "Rien à faire." -ForegroundColor Cyan
        Write-Host "Retour au menu..." -ForegroundColor Cyan
        Pause
}else {
    Clear-Host
    Write-Host "Erreur d'entrée." -ForegroundColor Cyan
    Write-Host "Retour au menu..." -ForegroundColor Cyan
    Pause
}


