Clear-Host
choco export -o "$FileLocale\..\Chocolatey\packages.config" -v --skipcompatibilitychecks --allowunofficial -f
explorer.exe "$FileLocale\..\Chocolatey\"