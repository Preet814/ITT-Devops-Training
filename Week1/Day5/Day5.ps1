# Prompt user for EC2 instance IPv4 address
$EC2_IP = Read-Host "Enter the EC2 instance's public IPv4 address"

# Configure WinRM settings on the local machine
Write-Host "Configuring WinRM on the local machine..." -ForegroundColor Cyan
Set-Item -Path WSMan:\localhost\Client\AllowUnencrypted -Value $true
Set-Item -Path WSMan:\localhost\Client\Auth\Basic -Value $true
Restart-Service WinRM

# Test connectivity to the EC2 instance
Write-Host "Testing WinRM connection to $EC2_IP..." -ForegroundColor Yellow
Test-WSMan -ComputerName $EC2_IP

# Connect to EC2 instance using PowerShell Remoting
Write-Host "Attempting to connect to $EC2_IP..." -ForegroundColor Green
Enter-PSSession -ComputerName $EC2_IP -Credential (Get-Credential) -Authentication Basic