function SetCustomExecutionPolicy{
	param(
	[string]$ExecutionPolicy,
	[string]$Scope
	)
	if ($ExecutionPolicy -eq "Unrestricted" -and $Scope -eq "Process"){
	    Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process -Force
	    Write-Host "Execution Policy for Scope $Scope is set to $ExecutionPolicy"
	} 
	else{
	    Write-Host "Failed to set execution policy"
	}
}
$executionPolicy = [string](Read-Host "Enter Execution Policy")
$Scope = [string](Read-Host "Enter Scope")
SetCustomExecutionPolicy $executionPolicy $Scope