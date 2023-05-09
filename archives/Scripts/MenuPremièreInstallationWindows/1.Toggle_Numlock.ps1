# Scripts Nono
# Toggle Numlock
# "V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2\archives\Scripts\1.Toggle_Numlock.ps1"
Clear-Host
# Set-ItemProperty -Path 'HKCU:\Control Panel\Keyboard' -Name "InitialKeyboardIndicators" -Value 2
if(-not [console]::NumberLock){
    $w = New-Object -ComObject WScript.Shell;
    $w.SendKeys('{NUMLOCK}'); 
    Write-Host "Numlock activé" -ForegroundColor Green
} else {
    Write-Host "Numlock était activé" -ForegroundColor Green 
}
Pause