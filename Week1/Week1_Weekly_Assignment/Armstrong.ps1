$number = [int](Read-Host "Input a number")
$digits = $number.ToString().Length

$num = $number
$sum = 0

function Power {
    param (
        [int]$base, 
        [int]$exponent
    )
    $result = 1

    for ($i = 0; $i -lt $exponent; $i++) {
        $result *= $base
    }
    return $result
}

while ($num -ne 0) {
    $rem = $num % 10
    $sum += Power $rem $digits
    $num = [math]::Floor($num / 10)
}


if ($sum -eq $number) {
    Write-Host "$number is a Armstrong number"
}
else {
    Write-Host "$number is not a Armstrong number"
}