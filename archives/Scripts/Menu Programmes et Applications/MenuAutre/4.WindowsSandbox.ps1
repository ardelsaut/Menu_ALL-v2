$IsSandboxInstalled = Get-WindowsOptionalFeature -Online -FeatureName "Containers-DisposableClientVM"
if (!($IsSandboxInstalled.State -eq "Enabled")){
  Enable-WindowsOptionalFeature -Online -FeatureName "Containers-DisposableClientVM" -All
  Write-Host "WindowsSandbox n'était pas activé, il faut peut-être redémarré le pc."
}
$FichierWsb = "C:\WindowsSandbox.wsb"
if (Test-Path -Path "$FichierWsb") {
    Remove-Item -Path "$FichierWsb" -Recurse -Force  | Out-Null
} 
New-Item -Path "$FichierWsb" -ItemType File -Force  | Out-Null
# Add the configuration text to the file
@"
<Configuration>
  <VGPU>Enable</VGPU>
  <Networking>Enable</Networking>
  <MappedFolders>
    <MappedFolder>
      <HostFolder>V:\03.PC\01.WINDOWS\Menu_ALL-v2</HostFolder>
      <ReadOnly>false</ReadOnly>
    </MappedFolder>
  </MappedFolders>
  <LogonCommand>
    <Command></Command>
  </LogonCommand>
  <AudioInput>Enable</AudioInput>
  <VideoInput>Enable</VideoInput>
  <ProtectedClient>Enable</ProtectedClient>
  <PrinterRedirection>enable</PrinterRedirection>
  <ClipboardRedirection>Enable</ClipboardRedirection>
  <MemoryInMB>8192</MemoryInMB>
</Configuration>
"@ | Out-File "$FichierWsb"
Start-Process -FilePath "$env:SystemRoot\System32\WindowsSandbox.exe" -ArgumentList "$FichierWsb"
Clear-Host
Write-Host "$FichierWsb lancé"
Start-Sleep -Seconds 5
Remove-Item -Path "$FichierWsb" -Recurse -Force | Out-Null
Clear-Host