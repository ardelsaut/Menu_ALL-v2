Clear-Host
$PathWingetConfig = "$PSScriptRoot\..\..\..\winget"
$exportPath = "$PathWingetConfig\winget_$(Get-Date -Format 'ddMMyyyy_HHmm').list"
# # winget export --source 'winget' --output $exportPath  --accept-source-agreements
winget export --output $exportPath  --accept-source-agreements
$nombreFichiers = 3
$listeFichiers = Get-ChildItem $PathWingetConfig | Sort-Object CreationTime
if ($listeFichiers.Count -gt $nombreFichiers) {
    $listeFichiers[0..($listeFichiers.Count - $nombreFichiers - 1)] | Remove-Item -Force
}
explorer.exe "$PathWingetConfig"
pause

# ls  "$PSScriptRoot\..\..\..\winget"
