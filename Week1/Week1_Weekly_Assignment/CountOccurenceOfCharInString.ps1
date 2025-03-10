$string = [string](Read-Host "Enter a String")

$char_count = @{}

foreach ($char in $string.ToCharArray()){
	if($char_count.ContainsKey($char)){
		$char_count[$char]++
	}
	else{
		$char_count[$char]=1
	}
}

Write-Host "Char : Count"

foreach ($key in $char_count.keys){
	Write-Host "  $key  :   $($char_count[$key])  "
}
