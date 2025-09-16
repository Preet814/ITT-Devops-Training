**Assignment 1: Install Azure PowerShell and create an Azure resource using a PowerShell script.**

1. Install azure powershell on windows.

Run the following commands:

>> Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force

>> Update-Module -Name Az -Force 

>> Connect-AzAccount -DeviceCode

![alt text](image.png)


2. Create an azure resource using powershell

Run the following command : 

>> New-AzResourceGroup -Name azureCLIDemoRG -Location EastUS

![alt text](image-1.png)

![alt text](image-2.png)


**Assignment 2: List all VMs in your account using Azure CLI**

Step 1: Run the following command:

>> az vm list --output table

![alt text](image-3.png)


**Assignment 3: Access a Key Vault secret using Azure CLI.**

Step 1: Add secret to key vault.

![alt text](image-5.png)

Step 2: Run the following command on terminal:

>> az keyvault secret show --vault-name Preet --name secret --query value -o tsv

![alt text](image-4.png)