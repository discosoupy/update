Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$notify = New-Object System.Windows.Forms.NotifyIcon
$notify.Icon = [System.Drawing.SystemIcons]::Information
$notify.BalloonTipTitle = "mynigga"
$notify.BalloonTipText = "du schwuler esel"
$notify.Visible = $true
$notify.ShowBalloonTip(5000)
