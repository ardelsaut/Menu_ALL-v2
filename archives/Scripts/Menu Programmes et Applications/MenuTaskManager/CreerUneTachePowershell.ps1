Clear-Host
$taskName = Read-Host "Quel est le nom de la Tâche à créer?"
Clear-Host
$FileToRun = Read-Host "Quel est l'emplacement du Fichier?"
Clear-Host
# cls
Clear-Host
$Frequencyprompt = Read-Host -Prompt "A quelle fréquence lancer le script? Startup/Once/Daily/Weekly/Monthly "
if($Frequencyprompt -eq "Daily")
{
$JourInterval = Read-Host "Quel est l'interval de jour pour la répétition "daily"?"
}
if(!(Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName }))
{        
    $actionparams = @{
        execute  = 'powershell.exe'
        argument = "-NoExit -WindowStyle Minimized -Executionpolicy Bypass -File $FileToRun"
    }
    $action = New-ScheduledTaskAction @actionparams -Verbose

    $settingsParams = @{
        RunOnlyIfIdle = $true
        RestartOnIdle = $true
        DontStopOnIdleEnd = $true
        AllowStartIfOnBatteries = $true
        DontStopIfGoingOnBatteries = $true
        StartWhenAvailable = $true
        IdleDuration = '00:15:00'
        IdleWaitTimeout = '00:00:00'
        ExecutionTimeLimit = '05:00:00'
        MultipleInstances  = 'IgnoreNew'
    }
    $settings = New-ScheduledTaskSettingsSet @settingsParams -Verbose
    $triggerParams = @{
        Startup  = @{AtStartup = $true}
        Once     = @{Once      = $true; At = '11am'}
        Daily    = @{Daily     = $true; DaysInterval = $JourInterval; At = '11am'}
        Weekly   = @{Weekly    = $true; WeeksInterval = 1; DaysOfWeek = 'Monday'; At = '11am'}
        Monthly  = @{Weekly    = $true; WeeksInterval = 4; DaysOfWeek = 'Monday'; At = '11am'}
        }
    $FrequencyParams = $triggerParams[$Frequencyprompt]
    $trigger = New-ScheduledTaskTrigger @FrequencyParams -Verbose

    $params = @{
        TaskName = $taskName
        TaskPath = "\Scripts-Persos"
        Trigger  = $trigger
        Action   = $action
        Runlevel = "Highest"
        Settings = $settings
    }
    
    Register-ScheduledTask @params -Force -Verbose
    pause
    }
