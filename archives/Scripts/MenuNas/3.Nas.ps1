Clear-Host
while (-not(Test-NetConnection -ComputerName www.google.com -InformationLevel Quietl)) {
    Write-Host "En attente de Connection internet..."
}
Clear-Host
if((cmdkey /list | Select-String -Pattern "192.168.1.54") -eq "" -Or (cmdkey /list | Select-String -Pattern "nonobouli.myds.me") -eq "")
{
    Write-Warning -Message "-------------------------------------" -Verbose
    Write-Warning -Message "Entrez Vos informations de Connection" -Verbose
    Write-Warning -Message "-------------------------------------" -Verbose
    $credential = $host.ui.PromptForCredential("Authentification Au Nas", "Quel est le mot de passe?.", "Nono", "")
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($credential.Password)
    $PlainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
    $UserNas = ($credential.UserName)
    cmdkey /add:192.168.1.54 /user:$UserNas /pass:$PlainPassword | Out-Null
    cmdkey /add:nonobouli.myds.me /user:$UserNas /pass:$PlainPassword | Out-Null  
}
$computer = "192.168.1.54"
if( ( (test-path 'S:\','T:\','U:\','V:\','W:\','X:\','Y:\') -eq $false).Count )
{

@{
    WebApp         = 'S:\'
    Backup         = 'T:\'
    Downloads      = 'U:\'
    Drive          = 'V:\'
    Web            = 'W:\'
    Photo          = 'X:\'
    Vidéo          = 'Y:\'

}.GetEnumerator() | ForEach-Object {
    if (Test-Path -LiteralPath $_.Value) {
        '{0,-10} - Trouvé.' -f $_.Key
    }
    else {
        '{0,-10} - Erreur!! Pas Trouvé. Reconnection!' -f $_.Key
    }
}

if ( Test-Connection -ComputerName $computer -BufferSize 8 -Count 1 -ea 0 -quiet )
  {
  net use * /d /y | Out-Null

      Write-Host "Nas found on local wifi" -ForegroundColor DarkYellow
      Write-Host "using '192.168.1.54'..." -ForegroundColor DarkYellow
      Write-Host "Lecteur S:\ (Web_Packages)" -ForegroundColor Cyan
      net use s: \\192.168.1.54\web_packages /persistent:No
      Write-Host "Lecteur T:\ (Backup)" -ForegroundColor Cyan
      net use t: \\192.168.1.54\backup /persistent:No
      Write-Host "Lecteur U:\ (Downloads)" -ForegroundColor Cyan
      net use u: \\192.168.1.54\downloads /persistent:No
      Write-Host "Lecteur V:\ (Drive)" -ForegroundColor Cyan
      net use v: \\192.168.1.54\Drive /persistent:No
      Write-Host "Lecteur W:\ (Web)" -ForegroundColor Cyan
      net use w: \\192.168.1.54\web /persistent:No
      Write-Host "Lecteur X:\ (Photo)" -ForegroundColor Cyan
      net use x: \\192.168.1.54\photo /persistent:No
      Write-Host "Lecteur Y:\ (Video)" -ForegroundColor Cyan
      net use y: \\192.168.1.54\video /persistent:No
  }else
    {
      net use * /d /y | Out-Null
      Write-Host "Nas NOT found on local wifi" -ForegroundColor DarkYellow
      Write-Host "using 'nonobouli.myds.me'..." -ForegroundColor DarkYellow
      Write-Host "Lecteur S:\ (Web_Packages)" -ForegroundColor Cyan
      net use s: \\nonobouli.myds.me\web_packages /persistent:No
      Write-Host "Lecteur T:\ (Backup)" -ForegroundColor Cyan
      net use t: \\nonobouli.myds.me\backup /persistent:No
      Write-Host "Lecteur U:\ (Downloads)" -ForegroundColor Cyan
      net use u: \\nonobouli.myds.me\downloads /persistent:No
      Write-Host "Lecteur V:\ (Drive)" -ForegroundColor Cyan
      net use v: \\nonobouli.myds.me\Drive /persistent:No
      Write-Host "Lecteur W:\ (Web)" -ForegroundColor Cyan
      net use w: \\nonobouli.myds.me\web /persistent:No
      Write-Host "Lecteur X:\ (Photo)" -ForegroundColor Cyan
      net use x: \\nonobouli.myds.me\photo /persistent:No
      Write-Host "Lecteur Y:\ (Video)" -ForegroundColor Cyan
      net use y: \\nonobouli.myds.me\video /persistent:No
    }
   
 }else
 {
 write-host "Le Nas est déja connecté, rien á faire!" -ForegroundColor Green
 }
  $destinationFolder = "$env:userprofile\Documents\1.Scripts\1.Nas"
  if (!(Test-Path -path $destinationFolder\3.Nas.ps1 -ErrorAction SilentlyContinue))
  {  
    New-Item "$destinationFolder" -Type Directory -Force | Out-Null
    Copy-Item -Path "$PSCommandPath" -Destination "$destinationFolder\3.Nas.ps1"
    }
  if(!(Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" -ErrorAction SilentlyContinue | Select-Object -ExpandProperty "Nas" -ErrorAction SilentlyContinue))
  {
  New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "Nas" -PropertyType ExpandString -Value 'powershell.exe -ExecutionPolicy Bypass -File "%UserProfile%\Documents\1.Scripts\1.Nas\3.Nas.ps1"' -Force
  }
  
$error.clear()
try {
    Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableLinkedConnections' | Out-Null
    }
catch
{ 
    New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLinkedConnections -PropertyType DWord -Value 1 -Force | Out-Null
    stop-process -name explorer –force
    Start-Sleep -Seconds 5
}
if(!$error)
{ 
}
TIMEOUT /T 2 
Clear-Host


