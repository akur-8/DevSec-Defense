#  ===============================================================
#  /    Author: Marcus L. Farmer
#  /    Script: createRandomStrings.ps1
#  /      Date: 2-04-2009
#  /   Purpose: generate psedorandomly generated strings for passwords or other uses
#  /     Usage: ./createRandomStrings.ps1
#  /     Reqs.: none
#  /    Output: text file containing output - default file is 
#  /  Comments: none
#  ===============================================================

function createRandomString($charset)
{
	$lblResults.text = "Hello now!"
	[string]$outputString = ""
	for ($i=1; $i -lt ([int]$txtGenerateThisManyNumbers.text + 1); $i++)
	{
		$lblResults.text = "in the first loop enumerating i"
		for ($x=1; $x -lt ([int]$txtLengthOfEachNumber.text + 1); $x++)
		{
			$lblResults.text = "in the second loop enumerating x"
			$outputString = $outputString + $charset.substring((get-random $charset.length), 1)
			
		}
#	$lblResults.text = $outputString
	Add-Content -Path $txtFileName.text -Value $outputString
	$outputString = ""
	}
	$lblResults.text = "Your really cool and super randomly generated strings can be found in " + $txtFileName.text
}

$btnGenerateNumbers_OnClick= 
{
#TODO: Place custom script here
	createRandomString($txtCreateCharacterSet.Text)
}

$btnResetCharacterSet_OnClick= 
{
#TODO: Place custom script here
	$txtCreateCharacterSet.Text = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
}

#Generated Form Function
function GenerateForm {
########################################################################
# Code Generated By: SAPIEN Technologies PrimalForms v1.0.1.0
# Generated On: 2/3/2009 4:55 PM
# Generated By: Marcus L. Farmer
########################################################################

#region Import the Assembles
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
#endregion

#region Generated Form Objects
$frmMain = New-Object System.Windows.Forms.Form
$btnGenerateNumbers = New-Object System.Windows.Forms.Button
$txtFileName = New-Object System.Windows.Forms.TextBox
$lblSaveAsFile = New-Object System.Windows.Forms.Label
$txtGenerateThisManyNumbers = New-Object System.Windows.Forms.TextBox
$lblGenerateThisManyNumbers = New-Object System.Windows.Forms.Label
$txtLengthOfEachNumber = New-Object System.Windows.Forms.TextBox
$lblLengthOfEachNumber = New-Object System.Windows.Forms.Label
$btnResetCharacterSet = New-Object System.Windows.Forms.Button
$txtCreateCharacterSet = New-Object System.Windows.Forms.TextBox
$lblCreateCharacterSet = New-Object System.Windows.Forms.Label
$lblResults = New-Object System.Windows.Forms.Label
#endregion Generated Form Objects

#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------
#Provide Custom Code for events specified in PrimalForms.


#----------------------------------------------
#region Generated Form Code
$frmMain.BackColor = [System.Drawing.Color]::FromArgb(255,40,46,34)
$frmMain.Text = 'Random Number Generator'
$frmMain.Name = 'frmMain'
$frmMain.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 326
$System_Drawing_Size.Height = 299
$frmMain.ClientSize = $System_Drawing_Size

$btnGenerateNumbers.TabIndex = 10
$btnGenerateNumbers.BackColor = [System.Drawing.Color]::FromArgb(255,212,208,200)
$btnGenerateNumbers.Name = 'btnGenerateNumbers'
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 142
$System_Drawing_Size.Height = 23
$btnGenerateNumbers.Size = $System_Drawing_Size
$btnGenerateNumbers.UseVisualStyleBackColor = $False

$btnGenerateNumbers.Text = 'Generate Numbers'

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 169
$System_Drawing_Point.Y = 191
$btnGenerateNumbers.Location = $System_Drawing_Point
$btnGenerateNumbers.DataBindings.DefaultDataSourceUpdateMode = 0
$btnGenerateNumbers.add_Click($btnGenerateNumbers_OnClick)

$frmMain.Controls.Add($btnGenerateNumbers)

$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 142
$System_Drawing_Size.Height = 20
$txtFileName.Size = $System_Drawing_Size
$txtFileName.DataBindings.DefaultDataSourceUpdateMode = 0
$txtFileName.Text = 'randomStrings.txt'
$txtFileName.Name = 'textBox4'
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 169
$System_Drawing_Point.Y = 164
$txtFileName.Location = $System_Drawing_Point
$txtFileName.TabIndex = 9

$frmMain.Controls.Add($txtFileName)

$lblSaveAsFile.TabIndex = 8
$lblSaveAsFile.TextAlign = 64
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 100
$System_Drawing_Size.Height = 23
$lblSaveAsFile.Size = $System_Drawing_Size
$lblSaveAsFile.Text = 'Save as file'
$lblSaveAsFile.ForeColor = [System.Drawing.Color]::FromArgb(255,240,221,22)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 61
$System_Drawing_Point.Y = 162
$lblSaveAsFile.Location = $System_Drawing_Point
$lblSaveAsFile.DataBindings.DefaultDataSourceUpdateMode = 0
$lblSaveAsFile.Name = 'lblSaveAsFile'

$frmMain.Controls.Add($lblSaveAsFile)

$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 142
$System_Drawing_Size.Height = 20
$txtGenerateThisManyNumbers.Size = $System_Drawing_Size
$txtGenerateThisManyNumbers.DataBindings.DefaultDataSourceUpdateMode = 0
$txtGenerateThisManyNumbers.Text = '10'
$txtGenerateThisManyNumbers.Name = 'txtGenerateThisManyNumbers'
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 169
$System_Drawing_Point.Y = 137
$txtGenerateThisManyNumbers.Location = $System_Drawing_Point
$txtGenerateThisManyNumbers.TabIndex = 7

$frmMain.Controls.Add($txtGenerateThisManyNumbers)

$lblGenerateThisManyNumbers.TabIndex = 6
$lblGenerateThisManyNumbers.TextAlign = 64
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 154
$System_Drawing_Size.Height = 23
$lblGenerateThisManyNumbers.Size = $System_Drawing_Size
$lblGenerateThisManyNumbers.Text = 'Generate this many numbers'
$lblGenerateThisManyNumbers.ForeColor = [System.Drawing.Color]::FromArgb(255,240,221,22)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 8
$System_Drawing_Point.Y = 135
$lblGenerateThisManyNumbers.Location = $System_Drawing_Point
$lblGenerateThisManyNumbers.DataBindings.DefaultDataSourceUpdateMode = 0
$lblGenerateThisManyNumbers.Name = 'lblGenerateThisManyNumbers'

$frmMain.Controls.Add($lblGenerateThisManyNumbers)

$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 141
$System_Drawing_Size.Height = 20
$txtLengthOfEachNumber.Size = $System_Drawing_Size
$txtLengthOfEachNumber.DataBindings.DefaultDataSourceUpdateMode = 0
$txtLengthOfEachNumber.Text = '9'
$txtLengthOfEachNumber.Name = 'txtLengthOfEachNumber'
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 170
$System_Drawing_Point.Y = 108
$txtLengthOfEachNumber.Location = $System_Drawing_Point
$txtLengthOfEachNumber.TabIndex = 5

$frmMain.Controls.Add($txtLengthOfEachNumber)

$lblLengthOfEachNumber.TabIndex = 4
$lblLengthOfEachNumber.BackColor = [System.Drawing.Color]::FromArgb(255,40,46,34)
$lblLengthOfEachNumber.TextAlign = 64
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 155
$System_Drawing_Size.Height = 23
$lblLengthOfEachNumber.Size = $System_Drawing_Size
$lblLengthOfEachNumber.Text = 'Length of each number'
$lblLengthOfEachNumber.ForeColor = [System.Drawing.Color]::FromArgb(255,240,221,22)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 8
$System_Drawing_Point.Y = 108
$lblLengthOfEachNumber.Location = $System_Drawing_Point
$lblLengthOfEachNumber.DataBindings.DefaultDataSourceUpdateMode = 0
$lblLengthOfEachNumber.Name = 'lblLengthOfEachNumber'

$frmMain.Controls.Add($lblLengthOfEachNumber)

$btnResetCharacterSet.TabIndex = 3
$btnResetCharacterSet.BackColor = [System.Drawing.Color]::FromArgb(255,212,208,200)
$btnResetCharacterSet.Name = 'btnResetCharacterSet'
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 141
$System_Drawing_Size.Height = 23
$btnResetCharacterSet.Size = $System_Drawing_Size
$btnResetCharacterSet.UseVisualStyleBackColor = $False

$btnResetCharacterSet.Text = 'Reset Character Set'

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 170
$System_Drawing_Point.Y = 66
$btnResetCharacterSet.Location = $System_Drawing_Point
$btnResetCharacterSet.DataBindings.DefaultDataSourceUpdateMode = 0
$btnResetCharacterSet.add_Click($btnResetCharacterSet_OnClick)

$frmMain.Controls.Add($btnResetCharacterSet)

$txtCreateCharacterSet.Multiline = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 141
$System_Drawing_Size.Height = 44
$txtCreateCharacterSet.Size = $System_Drawing_Size
$txtCreateCharacterSet.DataBindings.DefaultDataSourceUpdateMode = 0
$txtCreateCharacterSet.Text = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
$txtCreateCharacterSet.Name = 'txtCreateCharacterSet'
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 170
$System_Drawing_Point.Y = 15
$txtCreateCharacterSet.Location = $System_Drawing_Point
$txtCreateCharacterSet.TabIndex = 2

$frmMain.Controls.Add($txtCreateCharacterSet)

$lblCreateCharacterSet.TabIndex = 1
$lblCreateCharacterSet.TextAlign = 64
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 156
$System_Drawing_Size.Height = 23
$lblCreateCharacterSet.Size = $System_Drawing_Size
$lblCreateCharacterSet.Text = 'Create Character Set'
$lblCreateCharacterSet.ForeColor = [System.Drawing.Color]::FromArgb(255,240,221,22)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 8
$System_Drawing_Point.Y = 15
$lblCreateCharacterSet.Location = $System_Drawing_Point
$lblCreateCharacterSet.DataBindings.DefaultDataSourceUpdateMode = 0
$lblCreateCharacterSet.Name = 'lblCreateCharacterSet'
$lblCreateCharacterSet.add_Click($handler_label2_Click)
$lblCreateCharacterSet.add_MouseHover($CreateCharacterSet_onhover)

$frmMain.Controls.Add($lblCreateCharacterSet)

$lblResults.TabIndex = 0
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 327
$System_Drawing_Size.Height = 51
$lblResults.Size = $System_Drawing_Size
$lblResults.ForeColor = [System.Drawing.Color]::FromArgb(255,240,221,22)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = -1
$System_Drawing_Point.Y = 249
$lblResults.Location = $System_Drawing_Point
$lblResults.DataBindings.DefaultDataSourceUpdateMode = 0
$lblResults.Name = 'lblResults'

$frmMain.Controls.Add($lblResults)

#endregion Generated Form Code

#Show the Form
$frmMain.ShowDialog()| Out-Null

} #End Function

#Call the Function
GenerateForm

