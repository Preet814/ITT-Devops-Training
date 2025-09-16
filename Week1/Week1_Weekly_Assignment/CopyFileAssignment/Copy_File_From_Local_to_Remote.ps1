# Prompt user for EC2 IPv4 Address
$EC2_IP = Read-Host "Enter the EC2 instance's public IPv4 address"

# Configure WinRM settings on the local machine
Write-Host "Configuring WinRM on the local machine..." -ForegroundColor Cyan
Set-Item -Path WSMan:\localhost\Client\AllowUnencrypted -Value $true
Set-Item -Path WSMan:\localhost\Client\Auth\Basic -Value $true
Restart-Service WinRM

# Establish a session with EC2
$Cred = Get-Credential -Message "Enter EC2 Administrator Credentials"
$Session = New-PSSession -ComputerName $EC2_IP -Credential $Cred -Authentication Basic

# Ask for file path to copy
$LocalFile = Read-Host "Enter the full path of the file to copy (from local machine)"
$RemoteDestination = "C:\Users\Administrator\Desktop"

# Copy file to EC2
Write-Host "Copying $LocalFile to EC2 Desktop..." -ForegroundColor Yellow
Copy-Item -Path $LocalFile -Destination $RemoteDestination -ToSession $Session

Write-Host "File copied successfully!" -ForegroundColor Green