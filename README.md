# README

Installing and configuring PowerShell

## 1. Create a Profile

Running the following `if` command in the PowerShell prompt creates a folder (`PowerShell`) and profile file (`Microsoft.PowerShell_profile.ps1`):

```powershell
if (!(Test-Path -Path $PROFILE)) {
  New-Item -ItemType File -Path $PROFILE -Force
}
```

The result might look something like:
`C:\Users\roy_v\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`

---

## 2. Update Execution Policy

Run `Get-ExecutionPolicy -List`. If `CurrentUser` shows anything other than `Unrestricted`, type `Set-ExecutionPolicy Unrestricted -Scope CurrentUser`, then run `Get-ExecutionPolicy -List` again.

---

## 3. Install Oh My Posh

1. Install `CaskaydiaCove Nerd Font`
https://www.nerdfonts.com/font-downloads

2. Install Oh My Posh:
`winget install "oh my posh"`

3. Run as Administrator:
`Install-Module -Name Terminal-Icons -Repository PSGallery`

4. Install Missing Oh My Posh Icons
`oh-my-posh font install`

5. Finish Configuring
Visit the following URL for instructions to make some simple changes to the Command Prompt’s settings:
https://docs.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup

---

## 4. Add Profile File

Move `Microsoft.PowerShell_profile.ps1` to the `PowerShell` folder noted above.
