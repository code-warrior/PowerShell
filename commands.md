## Refreshing Environment

To refresh changes to the PATH or making changes to aliases, use `refreshenv` at the PowerShell terminal.

---

## Path to Profile File

Windows — `$PSHOME\Profile.ps1`
macOS — `/usr/local/microsoft/powershell/7/profile.ps1`

--

## Setting Aliases

```powershell
Function my-home {
  Set-Location -Path $HOME\Desktop
}

Set-Alias -Name desktop -Value my-home

Set-Alias -Name which -Value gcm
```

---

## Removing an Existing Alias

```powershell
Remove-Alias -Name desktop
```

---

```powershell
Export-Alias -Path "alias.ps1" -As Script
Add-Content -Path $Profile -Value (Get-Content alias.ps1)
```

set-alias -Name:"desktop" -Value:"cd C:\Users\roy_v\Desktop" -Description:"" -Option:"None"
set-alias -Name:"dropbox" -Value:"cd C:\Users\roy_v\Desktop\Dropbox" -Description:"" -Option:"None"

Import-Alias -Path

Run `$PROFILE` in the shell to see the path to your profile, which will likely be under `Documents\PowerShell`. To test whether the file exists, run `Test-Path $PROFILE`, which will return a Boolean indicating whether the file exists.
