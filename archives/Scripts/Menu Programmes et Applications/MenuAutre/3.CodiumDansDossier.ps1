Clear-Host
Write-Host "Ouvrir Codium dans un Dossier de Travail particulier." -ForegroundColor Cyan
Write-Host "Veuillez fournir le path complet du Dossier de Travail." -ForegroundColor Cyan
Write-Host "Laissez vide si vous voulez choisir en GUI" -ForegroundColor Cyan
$DossierDeTravail = Read-Host "Path du dossier"
if ($DossierDeTravail -eq ""){
    $MenuFilePicker = Menu-Perso -MenuTitle "Menu: Sélection de Fichier ou Dossier" -MenuOptions "1.Fichier","2.Dossier","0.Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
    do {
    Switch($MenuFilePicker){
        # Fichier
        0
        {
            Add-Type -AssemblyName System.Windows.Forms
            $openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
            $openFileDialog.Title = "Select a file or folder"
            $openFileDialog.InitialDirectory = [Environment]::GetFolderPath('Desktop')
            $openFileDialog.Multiselect = $false
            $result = $openFileDialog.ShowDialog()

            if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
                $filePath = $openFileDialog.FileName
                Clear-Host
                codium "$filePath" | Out-Null
                Pause
                Clear-Host
                Exit     
            }
            else {
                Write-Output "No file was selected."
                Pause
                Clear-Host
                Exit     
            }
        }
        # Dossier
        1
        {
            Add-Type -AssemblyName System.Windows.Forms
            $folderBrowserDialog = New-Object System.Windows.Forms.FolderBrowserDialog
            $folderBrowserDialog.Description = "Select a folder"
            $folderBrowserDialog.SelectedPath = [Environment]::GetFolderPath('Desktop')
            $result = $folderBrowserDialog.ShowDialog()

            if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
                $folderPath = $folderBrowserDialog.SelectedPath
                codium "$filePath" | Out-Null
                Pause
                Clear-Host
                exit
                        }
            else {
                Write-Output "No folder was selected."
                Pause
                Clear-Host
                Exit     
            }
            codium "$folderPath" | Out-Null
            Pause
            Clear-Host
            Exit        
        }
        # Retour
        2
        {
            Clear-Host
            exit
        }
    }}until ($MenuFilePicker -in "2")
}else {
    Write-Host "Ouverture du dossier de Travail $DossierDeTravail" -ForegroundColor Cyan
    codium "$DossierDeTravail" | Out-Null
    Pause
    Clear-Host
    exit
}
Pause
Clear-Host
exit