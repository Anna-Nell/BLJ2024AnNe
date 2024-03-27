Add-Type -assembly System.Windows.Forms
Add-Type -assembly System.Drawing
Import-Module ActiveDirectory 
function Create-Label {
    param(
        [string]$text,
        [int]$x,
        [int]$y,
        [int]$width,
        [int]$height
    )
    $label = New-Object System.Windows.Forms.Label
    $label.Text = $text
    $label.Location = New-Object System.Drawing.Point($x, $y)
    $label.Size = New-Object System.Drawing.Size($width, $height)
    return $label
}

function Create-TextBox {
    param(
        [int]$x,
        [int]$y,
        [int]$width
    )
    $textBox = New-Object System.Windows.Forms.TextBox
    $textBox.Location = New-Object System.Drawing.Point($x, $y)
    $textBox.Width = $width
    return $textBox
}

function Create-Button {
    param(
        [string]$text,
        [int]$x,
        [int]$y,
        [scriptblock]$OnClick
    )
    $button = New-Object System.Windows.Forms.Button
    $button.Text = $text
    $button.Location = New-Object System.Drawing.Point($x, $y)
    $button.Add_Click($OnClick)
    return $button
}

function Generate-Password {
    $length = 12
    $characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-="
    $password = -join ((1..$length) | ForEach-Object { Get-Random -InputObject $characters })
    return $password
}

$window = New-Object System.Windows.Forms.Form
$window.text = "Active Directory Benutzer erstellen"
$window.Width = 600
$window.Height = 400

# Label für Benutzerinformationen
$Label_firstName = Create-Label -text "Vorname:" -x 20 -y 20 -width 100 -height 20
$Label_lastName = Create-Label -text "Nachname:" -x 20 -y 50 -width 100 -height 20
$Label_description = Create-Label -text "Description:" -x 20 -y 80 -width 100 -height 20
$Label_office = Create-Label -text "Office:" -x 20 -y 110 -width 100 -height 20
$Label_phone = Create-Label -text "Telefonnummer:" -x 20 -y 140 -width 100 -height 20
$Label_jobTitle = Create-Label -text "Job Titel:" -x 20 -y 170 -width 100 -height 20
$Label_address = Create-Label -text "Adresse:" -x 20 -y 200 -width 100 -height 20
$window.Controls.Add($Label_firstName)
$window.Controls.Add($Label_lastName)
$window.Controls.Add($Label_description)
$window.Controls.Add($Label_office)
$window.Controls.Add($Label_phone)
$window.Controls.Add($Label_jobTitle)
$window.Controls.Add($Label_address)

# Textboxen für Benutzerinformationen
$TextBox_firstName = Create-TextBox -x 150 -y 20 -width 200
$TextBox_lastName = Create-TextBox -x 150 -y 50 -width 200
$TextBox_description = Create-TextBox -x 150 -y 80 -width 200
$TextBox_office = Create-TextBox -x 150 -y 110 -width 200
$TextBox_phone = Create-TextBox -x 150 -y 140 -width 200
$TextBox_jobTitle = Create-TextBox -x 150 -y 170 -width 200
$TextBox_address = Create-TextBox -x 150 -y 200 -width 200
$window.Controls.Add($TextBox_firstName)
$window.Controls.Add($TextBox_lastName)
$window.Controls.Add($TextBox_description)
$window.Controls.Add($TextBox_office)
$window.Controls.Add($TextBox_phone)
$window.Controls.Add($TextBox_jobTitle)
$window.Controls.Add($TextBox_address)

# Button für Erstellen und Schließen
$button_Create = Create-Button -text "Erstellen" -x 20 -y 250 -OnClick {
    $firstName = $TextBox_firstName.Text
    $lastName = $TextBox_lastName.Text
    $description = $TextBox_description.Text
    $office = $TextBox_office.Text
    $phone = $TextBox_phone.Text
    $jobTitle = $TextBox_jobTitle.Text
    $address = $TextBox_address.Text

    $email = "$firstName.$lastName@noseryoung.ch"
    $Global:username = "$firstName.$lastName"

    $password = Generate-Password
    $securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force

    # Erstelle den Benutzer im Active Directory
    New-ADUser  $username  $firstName  $lastName  $description  $office  $jobTitle  $address  $email  $phone  $securePassword  $true

    Write-Host "Benutzer $username erfolgreich im Active Directory erstellt. Passwort: $password"

    $csvData = "$firstName;$lastName;$address;$phone;$office;$jobTitle;$description"
    Add-Content -Path "Benutzer.csv" -Value $csvData
}


$button_Close = Create-Button -text "Schließen" -x 120 -y 250 -OnClick {
    $window.Close()
}

$window.Controls.Add($button_Create)
$window.Controls.Add($button_Close)

$window.ShowDialog()
