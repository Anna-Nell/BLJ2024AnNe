
# Wie erstelle ich eine neue Variable?
$var = 5
# Wie erstelle ich ein Array?
$arr = @("hund")
# Wie erstelle ich ein Mehrdimensionales Array?
$arr = @(("hund"),("cat"))
# Wie funktionieren bekannte Kontrollstrukturen? (If/Else, Switch, While, DoWhile, For, ForEach)
if(10 -eq $i){
    #code
   }
   elseif (9 -eq $i) {
    #code
   }
   elseif (8 -eq $i) {
    #code
   }
   else{
    # other code
   }

   switch($i){
    1 { code ;break}
    2 { code ;break}
    3 { code ;break }
    4 { code ;break }
    default { #code }
    }

    while($val -ne 10){
        $val++
        Write-Host $val
       }
       
 Do{ 
     $val++ 
      Write-Host $val
     }while($val -ne 10)

for($i=0; $i -lt 10; $i++){
    Write-Host $i
       }

$arr=@(1, 2, 3, 4 ,5 ,6)
foreach($element in $arr){
    Write-Host $element
     }
     
        
# Wie vergleiche ich Dinge -> Operators (AND, OR, NOT, ==, <, >, <=, >=)
AND --> -and
OR --> -or
NOT --> -ne
== --> -eq
< --> -gt
> --> -lt
<= --> -ge
>= --> -le

# ---Bash like tasks---
# Display the current date and time
Get-date
# Display a list of all the files in the current directory
ls
# Display a list of all the files in a specific directory
ls /path/to/directory
# Display the contents of a file
cat
# Create a new folder
mkdir
# Create a new file
touch
# Copy a file to a different location
>>
# Rename a file 
mv
# Delete a file
rm
# Create a new text file and append some text to it
echo "text" >> sample_file