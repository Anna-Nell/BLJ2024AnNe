
# Wie erstelle ich eine neue Variable?
$var = 5
# Wie erstelle ich ein Array?
$arr = @("hund",37,"cat",38)
# Wie erstelle ich ein Mehrdimensionales Array?
$arr = 1,2,(1,2,3),3
$arr[0]
$arr[1]
$arr[2]
$arr[2][0]
$arr[2][1]

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
    default { code }
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


# Create a new folder
mkdir myfolder
 
# Create a new file
New-Item -Name "myfile.txt" -ItemType File
 
# Copy a file to a different location
Copy-Item -Path .\myfile.txt -Destination .\myfolder\
 
# Rename a file
Rename-Item -Path .\myfile.txt -NewName "my_file.txt"
 
# Delete a file
Remove-Item -Path .\my_file.txt
# Create a new text file and append some text to it
echo "text" >> sample_file