# Importiere das Modul für das Arbeiten mit Excel
Import-Module Import-Excel

# Leeres Array für die Anmeldeinformationen
$Credentials = @()

# Funktion zum Hinzufügen von Benutzern und Passwörtern zum Hash-Array
function Add-Credential {
    param(
        [string]$Username,
        [string]$Password
    )
    $Credential = @{
        Username = $Username
        Password = (Get-FileHash -Algorithm SHA256 -LiteralPath $Password).Hash
    }
    $Credentials += New-Object PSObject -Property $Credential
}

# Funktion zum Hinzufügen eines neuen Benutzers
function New-User {
    param(
        [string]$Username,
        [string]$Password
    )
    if ($Credentials | Where-Object { $_.Username -eq $Username }) {
        Write-Host "User already exist please enter the username"
    } else {
        Add-Credential -Username $Username -Password $Password
        Write-Host "Username '$Username' succsessfull  added"
    }
}

# Füge vordefinierte Benutzer hinzu
Add-Credential -Username "user1" -Password "password1"
Add-Credential -Username "user2" -Password "password2"


 

