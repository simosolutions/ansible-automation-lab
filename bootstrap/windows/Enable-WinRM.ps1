# SCRIPT TO RUN ON WINDOWS SERVER TO ENABLE WINRM MANAGEMENT #
# THIS IS RUN PRIOR TO CONVERTING VM TO TEMPLATE IN PROXMOX #

# Enable WinRM #
Enable-PSRemoting -Force
winrm quickconfig -q

Set-Item WSMan:\localhost\Service\AllowUnencrypted $true
Set-Item WSMan:\localhost\Service\Auth\Basic $true

# Windows Firewall allow WinRM" #
Enable-NetFirewallRule -Name "WINRM-HTTP-In-TCP"

New-NetFirewallRule `
  -DisplayName "Allow WinRM 5985" `
  -Direction Inbound `
  -Protocol TCP `
  -LocalPort 5985 `
  -Action Allow

# Set WinRM Service to start automatically #

Set-Service WinRM -StartupType Automatic
Start-Service WinRM