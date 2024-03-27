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
