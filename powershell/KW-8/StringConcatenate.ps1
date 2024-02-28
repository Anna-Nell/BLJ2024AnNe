$wordList = Get-Content -Path "C:\Users\Anna\Downloads\wordlist.txt"

$usedWords = @()

while ($true) {
    
    $startWordIndex = Get-Random -Minimum 0 -Maximum $wordList.Count
    $startwort = $wordList[$startWordIndex]

    
    if ($usedWords -contains $startwort) {
        continue
    }
    
   
    $usedWords += $startwort

    $nextWort = Read-Host "Enter another word (or press Ctrl+C to exit)"
    
    $startwortEndbuchstabe = $startwort[-1]

    if ($nextWortWort -eq "") {
        Write-Host "No further word entered. Game over"
        break
    }
    elseif ($nextWort -in $wordList -and $nextWort[0] -eq $startwortEndbuchstabe) {
        
        $startwort += " $nextsWort"
        Write-Host $startwort
    }
    else {
        Write-Host "The word entered does not match or is not valid. Game over"
        break
    }
}

