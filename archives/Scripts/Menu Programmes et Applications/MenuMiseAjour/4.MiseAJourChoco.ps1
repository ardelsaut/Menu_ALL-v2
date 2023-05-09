Clear-Host
$mp3FilePath = "V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu ALL\archives\Sons\ChocoMisAJour.wav"
Write-Host "Mise à jour des applications Chocolatey" -ForegroundColor Cyan               
choco upgrade all --skipcompatibilitychecks --allowunofficial --yes --acceptlicense
Write-Host "Applications Chocolatey mises à jour" -ForegroundColor Green
$soundPlayer = New-Object -TypeName System.Media.SoundPlayer -ArgumentList $mp3FilePath
$soundPlayer.Play()
$soundPlayer.Dispose()              
pause | Out-Null
