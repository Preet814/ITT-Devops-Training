$resourceGroupName = "myDemoRG"
$location = "eastus"
$templateFile = "azuredeploy.json"
$adminUsername = "preet"
$sshPublicKeyPath = "C:\Users\preet.mundra\.ssh\id_rsa.pub"

$sshPublicKey = Get-Content -Raw -Path $sshPublicKeyPath

Write-Host "Connecting azure account"
Connect-AzAccount -TenantId "a914501e-0e2c-4a6f-afc8-0ad900a63ea5"

Write-Host "Ensuring resource group exists..."
New-AzResourceGroup -Name $resourceGroupName -Location $location -Verbose

Write-Host "Deploying ARM template..."
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $templateFile `
    -adminUsername $adminUsername `
    -adminPublicKey $sshPublicKey `
    -Verbose