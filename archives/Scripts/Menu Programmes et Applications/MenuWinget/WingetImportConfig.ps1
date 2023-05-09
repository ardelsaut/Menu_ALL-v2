Clear-Host
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Output "winget n'est pas installé. Installation de winget..."
    $wingetReleases = Invoke-RestMethod -Uri https://api.github.com/repos/microsoft/winget-cli/releases/latest
    $wingetDownloadUrl = $wingetReleases.assets | Where-Object { $_.name -match 'Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle' } | Select-Object -ExpandProperty browser_download_url
    Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
    Invoke-WebRequest -Uri $wingetDownloadUrl -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
    Add-AppxPackage .\Microsoft.VCLibs.x64.14.00.Desktop.appx
    Add-AppxPackage .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
    Remove-Item .\Microsoft.VCLibs.x64.14.00.Desktop.appx
    Remove-Item .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
    Write-Output "winget has been installed."
} else {
    Write-Output "winget is already installed."
}

winget install VSCodium.VSCodium  --override "/silent /mergetasks='!runcode,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath'"
# winget install VSCodium.VSCodium  --override  /mergetasks='!runcode,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath' --force
$ImportPath = Get-ChildItem "$FileLocale\..\winget" | Sort-Object { $_.LastWriteTime } | Select-Object -last 1
winget import --import-file $ImportPath.FullName --ignore-unavailable --accept-package-agreements --accept-source-agreements --ignore-versions
Pause



