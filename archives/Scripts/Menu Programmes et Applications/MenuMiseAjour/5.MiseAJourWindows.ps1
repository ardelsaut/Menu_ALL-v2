Clear-Host
Update-Help -Force
if (!(Get-Module -ListAvailable -Name PSWindowsUpdate)) {
    Set-PSRepository -InstallationPolicy Trusted -Name PSGallery
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
    Write-Host "Module does not exist"
    Install-Module -Name PSWindowsUpdate -Force -SkipPublisherCheck -Confirm:$false
    Import-Module PSWindowsUpdate
} 
Get-WindowsUpdate -AcceptAll -Download -Install -IgnoreReboot -Verbose
Write-Host "Windows a été mis à jour par Powershell" -ForegroundColor Green
pause
