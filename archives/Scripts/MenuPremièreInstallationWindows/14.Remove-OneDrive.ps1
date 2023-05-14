


Write-Host "1.Menu_ALL-v2"
Write-Host "2.Scripts"
$TelechargementGithub = Read-Host "Que faut-il téléchager?(1/2)"

if ($TelechargementGithub -eq "1") {
    $url = "https://github.com/ardelsaut/Menu_ALL-v2/archive/refs/heads/main.zip"
    $output = "$env:USERPROFILE\Desktop\main.zip"
    $destination = "$env:USERPROFILE\Desktop"
    $MenuFolder = (Get-ChildItem -Path $destination -Filter "*Menu_ALL*" -Directory).FullName
    if (Test-Path -Path "$MenuFolder") {
        Remove-Item -Path "$MenuFolder" -Force -Recurse
    }
    Invoke-WebRequest -Uri $url -OutFile $output
    Expand-Archive -LiteralPath $output -DestinationPath $destination
    Remove-Item -Path "$output"
    explorer.exe "$MenuFolder"
} elseif ($TelechargementGithub -eq "2") {
    $url = "https://github.com/ardelsaut/Menu_ALL-v2/archive/refs/heads/main.zip"
    $output = "$env:USERPROFILE\Desktop\main.zip"
    $destination = "$env:USERPROFILE\Desktop"
    $MenuFolder = (Get-ChildItem -Path $destination -Filter "*Menu_ALL*" -Directory).FullName
    if (Test-Path -Path "$MenuFolder") {
        Remove-Item -Path "$MenuFolder" -Force -Recurse
    }
    Invoke-WebRequest -Uri $url -OutFile $output
    Expand-Archive -LiteralPath $output -DestinationPath $destination
    Remove-Item -Path "$output"
    explorer.exe "$MenuFolder"

} else {
    
}




