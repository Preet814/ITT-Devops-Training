$input_year = [int](Read-Host "Enter a Year")
if($input_year % 4 -eq 0){
	if($input_year %100 -eq 0){
		if($input_year % 400 -eq 0){
			Write-Host "$input_year is a leap year."
		}
		else{
			Write-Host "$input_year is not a leap year."
		}
	}
	else{
		Write-Host "$input_year is a leap year."
	}
}
else{
	Write-Host "$input_year is not a leap year."
}