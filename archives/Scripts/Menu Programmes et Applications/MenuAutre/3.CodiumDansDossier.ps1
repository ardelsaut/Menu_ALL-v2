Clear-Host
Write-Host "Ouvrir Codium dans un Dossier de Travail particulier." -ForegroundColor Cyan
Write-Host "Veuillez fournir le path complet du Dossier de Travail." -ForegroundColor Cyan
Write-Host "Laissez vide si vous voulez choisir en GUI" -ForegroundColor Cyan
$filePath = Read-Host "Quel est-il"    
if ($filePath -eq "") {
    $MenuFilePicker = Menu-Perso -MenuTitle "Menu: Sélection de Fichier ou Dossier" -MenuOptions "1.Fichier","2.Dossier","0.Retour..." -Columns 1 -MaximumColumnWidth 100 -ShowCurrentSelection $True
    do {
    Switch($MenuFilePicker){
        # Fichier
        0
        {
            Clear-Host
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
                Clear-Host
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
            $folderBrowserDialog.Description = "Choisissez un dossier"
            $folderBrowserDialog.SelectedPath = [System.Environment+SpecialFolder]::MyComputer
            $result = $folderBrowserDialog.ShowDialog()
            if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
                $folderPath = $folderBrowserDialog.SelectedPath
                Clear-Host
                codium "$folderPath" | Out-Null
                Pause
                Clear-Host
                exit
                        }
            else {
                Clear-Host
                Write-Output "No folder was selected."
                Pause
                Clear-Host
                Exit     
            }
        }
        # Retour
        2
        {
            Clear-Host
            exit
        }
    }}until ($MenuFilePicker -in "2")

} else {
                Clear-Host
                codium "$filePath" | Out-Null
                Clear-Host
            }
Pause
Clear-Host