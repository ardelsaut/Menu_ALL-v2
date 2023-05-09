# Scripts Nono
# 5.DisableWindowsDefender.ps1
# "V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2\archives\Scripts\5.DisableWindowsDefender.ps1"
Clear-Host


Set-MpPreference
if($? -eq "True"){
    Set-MpPreference -ExclusionPath "A:\", "B:\", "C:\", "D:\", "E:\", "F:\", "G:\", "H:\", "I:\", "J:\", "K:\", "L:\", "M:\", "N:\", "O:\", "P:\", "Q:\", "R:\", "S:\", "T:\", "U:\", "V:\", "W:\", "X:\", "Y:\", "Z:\"
    Set-MpPreference -DisableDatagramProcessing $true -Force
    Set-MpPreference -DisablePrivacyMode $true -Force
    Set-MpPreference -DisableBehaviorMonitoring $true -Force
    Set-MpPreference -DisableRealtimeMonitoring $true -Force
    Set-MpPreference -DisableScriptScanning  $true -Force
    Set-MpPreference -DisableArchiveScanning $true -Force
    Set-MpPreference -DisableCatchupFullScan $true -Force
    Set-MpPreference -DisableCatchupQuickScan $true -Force
    Set-MpPreference -DisableCpuThrottleOnIdleScans $true -Force
    Set-MpPreference -DisableEmailScanning $true -Force
    Set-MpPreference -DisableRemovableDriveScanning $true -Force
    Set-MpPreference -DisableRestorePoint $true -Force
    Set-MpPreference -DisableScanningMappedNetworkDrivesForFullScan $true -Force
    Set-MpPreference -DisableScanningNetworkFiles $true -Force
    Set-MpPreference -DisableIOAVProtection $true -Force
    Write-Host "Windows Defender est désactivé" -ForegroundColor Green    
} else {
    Write-Host "Windows Defender est déja désactivé" -ForegroundColor Green    
}
Pause

