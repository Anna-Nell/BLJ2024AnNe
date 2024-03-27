Add-Type -assembly System.Windows.Forms
Add-Type -assembly System.Drawing

$Global:username = "$firstName.$lastName"
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

