[System.Console]::CursorVisible = $false
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){
    Write-Host "Lancement du Script en mode Administrateur" -ForegroundColor Cyan -NoNewline
    Start-Sleep -Milliseconds 20
    Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path) -Verb RunAs
    exit
}
$FileLocale = if (-not $PSScriptRoot) { Split-Path -Parent (Convert-Path ([environment]::GetCommandLineArgs()[0])) } else { $PSScriptRoot }

& "$FileLocale\..\modules\Unblock-Files.ps1"
. "$FileLocale\..\modules\FunctionMenu.ps1"
. "$FileLocale\..\modules\FunctionSet-Policy.ps1"
& "$FileLocale\0.MenuMain.ps1"

$UserPath = [System.Environment]::GetEnvironmentVariable("Path", "User")
$NonoOSPath = Get-Item "$FileLocale\..\.."
if ($UserPath -notlike "$NonoOSPath")
{
    [System.Environment]::SetEnvironmentVariable("Path", "$UserPath;$NonoOSPath", "User")
}

Clear-Host
exit