# Add a function that lists the aliases for any cmdlet
function Get-CmdletAlias ($cmdletname) {
  Get-Alias |
    Where-Object -FilterScript {$_.Definition -like "$cmdletname"} |
      Format-Table -Property Definition, Name -AutoSize
}

# Customize your console
function Color-Console {
  $Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'DarkBlue')
  $Host.UI.RawUI.ForegroundColor = 'White'
  $Host.PrivateData.ErrorForegroundColor = 'Red'
  $Host.PrivateData.ErrorBackgroundColor = $bckgrnd
  $Host.PrivateData.WarningForegroundColor = 'Magenta'
  $Host.PrivateData.WarningBackgroundColor = $bckgrnd
  $Host.PrivateData.DebugForegroundColor = 'Yellow'
  $Host.PrivateData.DebugBackgroundColor = $bckgrnd
  $Host.PrivateData.VerboseForegroundColor = 'Green'
  $Host.PrivateData.VerboseBackgroundColor = $bckgrnd
  $Host.PrivateData.ProgressForegroundColor = 'Cyan'
  $Host.PrivateData.ProgressBackgroundColor = $bckgrnd
  $hosttime = (Get-ChildItem -Path $PSHOME\pwsh.exe).CreationTime
  $hostversion="$($Host.Version.Major)`.$($Host.Version.Minor)"
  $Host.UI.RawUI.WindowTitle = "PowerShell $hostversion ($hosttime)"
  # Clear-Host
}

function my_home {
  Set-Location -Path $HOME\Desktop
}
function my_dropbox {
  Set-Location -Path $HOME\Desktop\Dropbox
}
function touch_file ($path) {
  New-Item -ItemType File -Path $path
}

function rm-item ($item) {
  Remove-Item -Confirm $item
}

Color-Console

Set-Alias -Name desktop -Value my_home
Set-Alias -Name dropbox -Value my_dropbox
Set-Alias -Name open -Value ii
Set-Alias -Name touch -Value touch_file
Set-Alias -Name rm -Value rm-item

# Refresh environment with `refreshenv`

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\M365Princess.omp.json" | Invoke-Expression
