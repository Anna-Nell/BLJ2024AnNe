$start_word = "Hello"
Write-Host "Start word: $start_word"
 
$valid_words = Get-Content -Path "C:\Users\Anna\BLJ2024AnNe\powershell\KW-9\wordlist.txt"
 
function Is-Valid {
    param(
        [string]$word,
        [char]$last_letter
    )
    $word = $word.Trim()
    if ($valid_words -like "*$word*" -and $word[0] -eq $last_letter) {
        return $true
    }
    return $false
}
 
function String-Concatenate {
    param(
        [string]$start_word
    )
    $last_letter = $start_word[-1]
    Write-Host "Last letter of the start word: $last_letter"
 
    while ($true) {
        $new_word = Read-Host "Enter another word (or end with CTRL+C)"
        if (Is-Valid -word $new_word -last_letter $last_letter) {
            Write-Host "Valid word: $new_word"
            $start_word += " $new_word"
            Write-Host "Current string: $start_word"
            $last_letter = $new_word[-1]
        }
        else {
            Write-Host "The word doesn't exist or has already been used."
        }
    }
}
 
String-Concatenate -start_word $start_word