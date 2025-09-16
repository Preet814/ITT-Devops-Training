$string = [string](Read-Host "Enter a string")

$char_array = $string.ToCharArray()

$string_length = $char_array.Length

$start_index=0
$end_index=$string_length - 1

while($start_index -lt $end_index){
	$temp=$char_array[$start_index]
	$char_array[$start_index]=$char_array[$end_index]
	$char_array[$end_index]=$temp

	$start_index++
	$end_index--	
}
$reversed_string = -join $char_array
Write-Host "Reversed string : $reversed_string"