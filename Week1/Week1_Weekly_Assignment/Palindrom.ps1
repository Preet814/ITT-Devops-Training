$number = [int](Read-host "Input a Number")
$num = $number
$reversed_number = 0
while($num -ne 0){
	$rem = $num%10
	$reversed_number = $reversed_number * 10 + $rem
	$num = [int]($num/10)
}
if($reversed_number -eq $number){
	Write-Host "$number is a palindrome number"
}
else{
	Write-Host "$number is not a palindrome number"
}