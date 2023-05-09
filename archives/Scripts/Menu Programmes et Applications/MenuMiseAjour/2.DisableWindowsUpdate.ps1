# Scripts Nono
# 2.DisableWindowsUpdate.ps1
# V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2\archives\Scripts\Menu Programmes et Applications\MenuMiseAjour\2.DisableWindowsUpdate.ps1
Clear-Host
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}
$Host.UI.RawUI.WindowTitle = 'Disable_WinUPD'
$WindowsUpdateServices = ("wuauserv", "WaaSMedicSvc", "UsoSvc")
$WindowsUpdateServices | ForEach-Object{
Set-Service -Name $_ -StartupType Disabled -ErrorAction SilentlyContinue | Out-Null
Stop-Service -Name $_ -ErrorAction SilentlyContinue | Out-Null
}
Disable-ScheduledTask -TaskName "\Microsoft\Windows\WindowsUpdate\Scheduled Start" | Out-Null
if (!(Test-Path "HKLM:\Software\Microsoft\WindowsUpdate\UX\Settings"))
{
    New-Item -Path "HKLM:\Software\Microsoft\WindowsUpdate\UX\Settings" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\Software\Microsoft\WindowsUpdate\UX\Settings" -Name "UxOption" -Type DWord -Value 1
Stop-Process -Name "MoUsoCoreWorker" -Force -PassThru -ErrorAction SilentlyContinue | Out-Null
Stop-Process -Name "TiWorker" -Force -PassThru -ErrorAction SilentlyContinue | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\WaaSMedicSvc" -Name Start -Value 4
if(!(Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ -ErrorAction SilentlyContinue | Select-Object -ExpandProperty WinUpdOff -ErrorAction SilentlyContinue))
{ 
New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name "WinUpdOff" -PropertyType ExpandString -Value 'powershell.exe -ExecutionPolicy Bypass -File "%UserProfile%\Documents\Applications_Portables\Scripts\WinUpd\Disable_WinUpd.ps1"' -Force
}
Write-Host "Windows Update est désactivé" -ForegroundColor Green               
pause                      
