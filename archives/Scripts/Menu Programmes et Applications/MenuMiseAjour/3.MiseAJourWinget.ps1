# Scripts Nono
# 3.MiseAJourWinget.ps1
# V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2\archives\Scripts\Menu Programmes et Applications\MenuMiseAjour\3.MiseAJourWinget.ps1
Clear-Host
Write-Host "Mise à jour des applications Winget" -ForegroundColor Cyan               
winget upgrade --all
$mp3FilePath = "V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu ALL\archives\Sons\WingetMisAJour.wav"
$soundPlayer = New-Object -TypeName System.Media.SoundPlayer -ArgumentList $mp3FilePath
$soundPlayer.Play()
$soundPlayer.Dispose()              
Write-Host "Applications Winget Mise à jour" -ForegroundColor Green               
Pause | Out-Null
