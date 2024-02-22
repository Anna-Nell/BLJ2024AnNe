# Recreate your calculator application from C in PowerShell.
function addition{
    param(
    [int] $num1,
    [int] $num2)
   $result = $num1 + $num2
    return $result
    
    
}
function subtraction{
    param( $num1,
   $num2)
   $result = $num1 - $num2
    return $result
     
        

}

function division{
    param( $num1,
    $num2)
    $result = $num1 / $num2
     return $result
     
}

function multipication{
    param( $num1,
    $num2)
    $result = $num1 * $num2
     return $result
     
    
}
#Use functions and try to avoid using redundant code as much as possible.

$oporator = Read-Host -Prompt " Geben die ein operator ein (+,-,/,*)" 
[int] $x = Read-Host -Prompt "Geben sie mir nr 1 an"
[int] $y = Read-Host -Prompt "Geben sie mir nr 2 an"

while ($oporator -ne "+" -and $oporator -ne "-" -and $oporator -ne "/" -and $oporator -ne "*") {
    wite Write-Host " PLeas use a number"
    $oporator = Read-Host -Prompt "give an oporater (+,-,*,/)"
}

switch ($oporator) {
 
    "+" {addition num1 $x num2 $y}
    "-" {subtraction num1 $x num2 $y}
    "/" {division num1 $x num2 $y}
    "*" {multipication num1 $x num2 $y} 
}

