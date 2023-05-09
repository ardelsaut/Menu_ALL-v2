# Scripts Nono
# 1.EnableWindowsUpdate.ps1
# V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2\archives\Scripts\Menu Programmes et Applications\MenuMiseAjour\EnableWindowsUpdate.ps1
Clear-Host
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}
$WindowsUpdateServices = ("wuauserv", "WaaSMedicSvc", "UsoSvc")
$WindowsUpdateServices | ForEach-Object{
    Set-Service -Name $_ -StartupType Automatic -ErrorAction SilentlyContinue | Out-Null
    Start-Service -Name $_ -ErrorAction SilentlyContinue | Out-Null
}
Enable-ScheduledTask -TaskName "\Microsoft\Windows\WindowsUpdate\Scheduled Start" | Out-Null
if (!(Test-Path "HKLM:\Software\Microsoft\WindowsUpdate\UX\Settings"))
{
    New-Item -Path "HKLM:\Software\Microsoft\WindowsUpdate\UX\Settings" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\Software\Microsoft\WindowsUpdate\UX\Settings" -Name "UxOption" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\WaaSMedicSvc" -Name Start -Value 2
# $time = Get-Date -UFormat %Y-%m-%dT%R:%SZ
# Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseFeatureUpdatesStartTime' -Value "$time" -Force
# Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseFeatureUpdatesEndTime' -Value "2050-03-17T00:29:34Z" -Force
# Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseQualityUpdatesStartTime' -Value "$time" -Force
# Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseQualityUpdatesEndTime' -Value "2050-03-17T00:29:34Z" -Force
# Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseUpdatesStartTime' -Value "$time" -Force
# Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseUpdatesExpiryTime' -Value "2050-03-17T00:29:34Z" -Force
Write-Host "Windows Update est activé" -ForegroundColor Green               
pause       
