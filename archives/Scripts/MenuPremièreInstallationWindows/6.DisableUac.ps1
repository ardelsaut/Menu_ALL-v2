# Scripts Nono
# 6.DisableWindowsDefender.ps1
# "V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2\archives\Scripts\6.DisableUac.ps1"
Clear-Host
$DisableUac = Get-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA 
If($($DisableUac.EnableLUA) -ne 0)
{
    New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force
    Write-Host "Uac est déssactivé" -ForegroundColor Green
} else {
    Write-Host "Uac est déja déssactivé" -ForegroundColor Green
}
Pause
