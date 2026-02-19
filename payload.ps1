Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$notify = New-Object System.Windows.Forms.NotifyIcon
$notify.Icon = [System.Drawing.SystemIcons]::Information
$notify.BalloonTipTitle = "Status"
$notify.BalloonTipText = "Es hat funktioniert"
$notify.Visible = $true
$notify.ShowBalloonTip(5000)

