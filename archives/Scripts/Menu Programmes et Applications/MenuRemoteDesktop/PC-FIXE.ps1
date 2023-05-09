# Scripts Nono
# Remote Desktop PC-FIXE
# "V:\03.PC\01.WINDOWS\04.COMPILATION_SCRIPTS\Menu_ALL-v2\archives\Scripts\RemoteDesktop\PC-FIXE.ps1"
# For more info about he settings
# https://www.donkz.nl/overview-rdp-file-settings/

Clear-Host
$shortcutNameps1 = "PC-FIXE"
$shortcutName = "PC-FIXE"
$targetHost = "192.168.1.106"
$username = "Nono"

$template = @"
screen mode id:i:2
use multimon:i:0
desktopwidth:i:1920
desktopheight:i:1080
session bpp:i:32
winposstr:s:0,1,0,0,800,600
compression:i:1
keyboardhook:i:2
audiocapturemode:i:0
videoplaybackmode:i:1
connection type:i:7
networkautodetect:i:1
bandwidthautodetect:i:1
displayconnectionbar:i:0
username:s:$username
domain:s:WORKGROUP
full address:s:$targetHost
disable wallpaper:i:1
disable full window drag:i:1
disable menu anims:i:0
disable themes:i:0
disable cursor setting:i:0
bitmapcachepersistenable:i:1
redirectclipboard:i:1
redirectposdevices:i:0
drivestoredirect:s:*
autoreconnection enabled:i:1
authentication level:i:2
prompt for credentials:i:0
negotiate security layer:i:1
remoteapplicationmode:i:0
alternate shell:s:
shell working directory:s:
gatewayhostname:s:
gatewayusagemethod:i:4
gatewaycredentialssource:i:4
gatewayprofileusagemethod:i:0
promptcredentialonce:i:1
use redirection server name:i:0
"@
$template | Out-File $PSScriptRoot\$shortcutName.rdp
$targetPath = $PSCommandPath
$linkPath = "$env:userprofile\Documents\1.Scripts\2.RemoteDesktop\$shortcutNameps1.lnk"
if (Test-Path $linkPath) {
} else {
    if (Test-Path $env:userprofile\Documents\1.Scripts\2.RemoteDesktop) {
    } else {
        New-Item -Path $env:userprofile\Documents\1.Scripts\ -Name 2.RemoteDesktop -ItemType Directory -Force | Out-Null
    }
    $shell = New-Object -ComObject WScript.Shell
    # Créer le raccourci
    $link = $shell.CreateShortcut($linkPath)
    $link.TargetPath = $targetPath
    $link.Save()
}
Invoke-Item $PSScriptRoot\$shortcutName.rdp
Start-Sleep -Seconds 10
Remove-Item -Path $PSScriptRoot\$shortcutName.rdp -Force -Recurse