function Install-Import-Module {
    param (
        [string]$ModuleName
    )
    if (Get-Module -ListAvailable -Name $ModuleName) {
        Write-Host "$ModuleName module is already installed."
    } 
    else {
        Write-Host "Installing module $ModuleName..."
        try {
            Install-Module -Name $ModuleName -Scope CurrentUser -Force
            Write-Host "$ModuleName module installed successfully."
        }
        catch {
            Write-Host "Failed to install $ModuleName module."
            return
        }
    }
    try {
        Import-Module -Name $ModuleName -Force
        Write-Host "$ModuleName module imported successfully."
    }
    catch {
        Write-Host "Failed to import $ModuleName module."
        return
    }
    Write-Host "Listing all commands in $ModuleName module"
    Get-Command -Module $ModuleName | Select-Object Name, CommandType
}
$moduleName = Read-Host "Enter the module name to install and import"
Install-Import-Module $moduleName
