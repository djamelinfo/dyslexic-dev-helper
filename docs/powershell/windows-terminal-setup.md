# Windows Terminal Setup (Dyslexia-Friendly Guide)

## 1) Best Terminal App

Use Windows Terminal — it's:

- Easy to use
- Looks great
- Supports tabs
- Customizable

Open settings with Ctrl + , and set Windows Terminal as the default terminal.

---

## 2) Make It Look Good

In Settings → Profiles → Defaults → Appearance, you can:

- Change colors
- Add a background image
- Add blur

---

## 3) Install Scoop

Scoop makes installing tools easy (similar to apt or dnf).

In PowerShell, run:

```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
```

---

## 4) Install Nerd Fonts

Nerd Fonts show icons and symbols in your terminal.

```
scoop bucket add nerd-fonts
scoop install Cascadia-Code
```

Then set the font:

Settings → Defaults → Appearance → Font Face → Cascadia Code

---

## 5) Install Oh My Posh

Oh My Posh makes your PowerShell prompt more readable and informative.

```
scoop bucket add main
scoop install oh-my-posh
```

Open your PowerShell profile:

```
notepad $PROFILE
```

If there's an error:

```
New-Item -Path $PROFILE -Type File -Force
```

Add this line (adjust the version/path as needed):

```
oh-my-posh init pwsh --config "C:\Users\<you>\scoop\apps\oh-my-posh\<version>\themes\craver.omp.json" | Invoke-Expression
```

Save and restart PowerShell.

---

## 6) Add Terminal Icons

```
Install-Module -Name Terminal-Icons -Scope CurrentUser
Import-Module -Name Terminal-Icons
```

---

## 7) Add PSReadLine

```
Install-Module -Name PSReadLine -Scope CurrentUser
Import-Module -Name PSReadLine
```

This improves autocomplete and syntax highlighting.

---

## 8) Custom PowerShell Functions

### Utility Helpers

Find a command:

```
function which($name) {
  Get-Command $name | Select-Object -ExpandProperty Definition
}
```

Find the folder of a command:

```
function whichdir($name) {
  $directory = Split-Path -Parent (Get-Command $name | Select-Object -ExpandProperty Definition)
  return $directory
}
```

---

Reload PowerShell by closing and reopening the terminal.

