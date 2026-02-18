$repoUrl = "https://raw.githubusercontent.com/USERNAME/REPO/main/update.ps1"
$localPath = "$env:LOCALAPPDATA\MyUpdater\update.ps1"

try {
    Invoke-WebRequest -Uri $repoUrl -OutFile $localPath -UseBasicParsing
} catch {
    # Falls Download fehlschlägt, alten Code weiter benutzen
}

# ====== DEIN EIGENTLICHER CODE HIER ======
# Beispiel:
Start-Process "notepad.exe"
