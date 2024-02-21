# number guessing game
$secret = Get-Random -Minimum 0 -Maximum 100

# ask the user repeatetly to enter a number until he gets it right. Tell the user if his number is too high or too low 
Write-Host "I'm thinking of a number between 1 and 100."

While ($secret -ne $Guess) {
    [int]$Guess = Read-Host -prompt "What is your guess?"

    If ($Guess -gt $secret) {
        Write-Host "$Guess is too high."
    } ElseIf ($Guess -lt $secret) {
        Write-Host "$Guess is too low."
    } ElseIf ($Guess -eq $secret) {
        Write-Host "Correct! $secret is the number I was thinking!"
        break
    }
}
