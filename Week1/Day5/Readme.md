Create a EC2 instance(Windows OS):

1. Log in to AWS Console: Go to AWS Management Console and sign in.
2. Navigate to EC2 Dashboard: In the search bar, type EC2 and open the EC2 service.
3. Launch a New Instance:
    Click Launch Instance.
    Provide an instance name.
    Select Windows Server AMI (Amazon Machine Image).
    Choose an instance type (e.g., t2.micro for free-tier usage).
    Configure key pair (Download it if you don’t have one).
    Click Launch Instance.
4. Wait for Instance to be Ready: It may take a few minutes.
5. Go to instances and select your instance and perform following steps:
    Click on security and then click on security groups.
    Enable RDP (3389) and WinRM (5985 & 5986) in security group and click on save button.


RDP Connection to run EC2 instance:

1. Go to instances and select your instance.
2. Click on connect button and navigate to RDP client.
3. Click on get password and copy the keypair .pem file from downloads.
4. Click on decrypt password.


Run following commands on powershell of EC2 instance:

1. Enable-PSRemoting -Force
2. winrm quickconfig -q
3. winrm set winrm/config/service '@{AllowUnencrypted="true"}'
4. winrm set winrm/config/service/auth '@{Basic="true"}'
5. New-NetFirewallRule -DisplayName "WinRM HTTP" -Direction Inbound -Protocol TCP -LocalPort 5985 -Action Allow
6. Restart-Service WinRM 