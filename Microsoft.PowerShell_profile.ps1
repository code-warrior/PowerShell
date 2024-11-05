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

function tail_command ($file) {
  Get-Content $file -last 10 -Wait
}

function rm_item ($item) {
  Remove-Item -Confirm $item
}

function refresh_path {
  $env:Path =
    [System.Environment]::GetEnvironmentVariable("Path","Machine") +
      ";" +
        [System.Environment]::GetEnvironmentVariable("Path","User")
}

function run_my_sql {
  & "C:\Program Files\MySQL\MySQL Server 8.1\bin\mysql.exe" --defaults-file="C:\ProgramData\MySQL\MySQL Server 8.1\my.ini" -uroot -p
}

Color-Console

Set-Alias -Name tail -Value tail_command
Set-Alias -Name refreshPath -Value refresh_path
Set-Alias -Name desktop -Value my_home
Set-Alias -Name dropbox -Value my_dropbox
Set-Alias -Name open -Value ii
Set-Alias -Name mysql -Value run_my_sql
Set-Alias -Name touch -Value touch_file
Set-Alias -Name rm -Value rm_item -Option AllScope
Set-Alias -Name which -Value gcm

Set-Alias subl 'C:\Program Files\Sublime Text 3\subl.exe'
Set-Alias home 'cd'
Set-Alias c 'cd C:\'
Set-Alias d 'cd D:\'
Set-Alias e 'cd E:\'
Set-Alias f 'cd F:\'

# oh-my-posh init pwsh --config 'C:\Users\roy_v\AppData\Local\Programs\oh-my-posh\themes\catppuccin.omp.json' | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\catppuccin.omp.json" | Invoke-Expression
