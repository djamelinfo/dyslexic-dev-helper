# 💻 Windows Terminal Setup (Dyslexia-Friendly Guide)

## 1️⃣ Best Terminal App

Use **Windows Terminal** — it’s:

* Easy to use
* Looks great
* Supports tabs
* Can be customized

To open settings:
Press **Ctrl + ,**

Then choose **Windows Terminal** as your default terminal.

---

## 2️⃣ Make It Look Cool

In **Settings → Profiles → Defaults → Appearance**,
you can:

* Change colors
* Add background image
* Add blur

---

## 3️⃣ Install Scoop

Scoop makes installing tools easy (like apt or dnf).

In PowerShell, run:

```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
```

Now Scoop is ready!

---

## 4️⃣ Install NERD Fonts

NERD fonts show icons and symbols in your terminal.

Run these:

```
scoop bucket add nerd-fonts
scoop install Cascadia-Code
```

Then change your font:
**Settings → Defaults → Appearance → Font Face → Cascadia-Code**

---

## 5️⃣ Install Oh-My-Posh

Makes your PowerShell prompt beautiful!

Run:

```
scoop bucket add main
scoop install oh-my-posh
```

Then open your PowerShell profile:

```
notepad $profile
```

If there’s an error:

```
New-Item -Path $PROFILE -Type File -Force
```

Add this line:

```
oh-my-posh init pwsh --config "C:\Users\anitj\scoop\apps\oh-my-posh\17.12.0\themes\craver.omp.json" | Invoke-Expression
```

Save and restart PowerShell.

---

## 6️⃣ Add Terminal Icons

```
Install-Module -Name Terminal-Icons -Scope CurrentUser
Import-Module -Name Terminal-Icons
```

---

## 7️⃣ Add PSReadLine

```
Install-Module -Name PSReadLine -Scope CurrentUser
Import-Module -Name PSReadLine
```

This improves autocomplete and syntax colors.

---

## 8️⃣ Custom PowerShell Functions

### ⚙️ Utility Helpers

**Find a command**

```
function which($name) {
 Get-Command $name | Select-Object -ExpandProperty Definition
}
```

**Find command folder**

```
function whichdir($name) {
 $directory = Split-Path -Parent (Get-Command $name | Select-Object -ExpandProperty Definition)
 return $directory
}
```

---

✅ **Reload PowerShell** — close and reopen the terminal.
Now you have a clean, cool, and powerful setup!

---

Would you like me to **create and give you the .docx file** (with dyslexia-friendly formatting, large font, and spacing)?
