# ================================
# WINDOWS SERVER STAGE 1 BOOTSTRAP
# ================================

Write-Host "=== Stage 1 Bootstrap Starting ==="

# ----------------
# Hostname
# ----------------
$Hostname = Read-Host "Enter hostname (e.g. DC01)"
Rename-Computer -NewName $Hostname -Force

# ----------------
# Network config
# ----------------
$IP = Read-Host "Static IP (e.g. 192.168.99.10)"
$Prefix = Read-Host "Prefix (e.g. 24)"
$Gateway = Read-Host "Gateway (e.g. 192.168.99.1)"
$DNS1 = Read-Host "DNS1 (e.g. 192.168.99.10)"
$DNS2 = Read-Host "DNS2 (e.g. 192.168.99.11)"

$NIC = Get-NetAdapter | Where-Object Status -eq "Up" | Select-Object -First 1

New-NetIPAddress `
  -InterfaceAlias $NIC.Name `
  -IPAddress $IP `
  -PrefixLength $Prefix `
  -DefaultGateway $Gateway

Set-DnsClientServerAddress `
  -InterfaceAlias $NIC.Name `
  -ServerAddresses @($DNS1, $DNS2)

Write-Host "Network configured. Rebooting..."
Restart-Computer