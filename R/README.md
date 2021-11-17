# R



## Installation

Install:

- R (64-bit)
- RStudio
- rtools
- Utilities
  - Pandoc
  - CMake
  - Tinytex
  - Hugo
  - qPDF
  - Ghostscript

```powershell
# ensure R, RStudio, and RTools installed
cinst -y R.Project R.Studio rtools
```

R Packages

## Setup and Configure

First, set some environment variables:

```powershell
# ensure R binaries in system %PATH%
$rpath = "$env:programfiles\R\R-*\bin\x64" | Convert-Path
$regexpath = [regex]::Escape($rpath)
$arrpath = $env:Path -split ';' | Where-Object { $_ -notMatch "^$regexpath\\?" }
$pathout = ($arrpath + $rpath) -join ';'
[System.Environment]::SetEnvironmentVariable("Path", $pathout, "Machine") 

# Environment Variables
# Note on initial setup of R need to manually set location of .Renviron
$userhome = [System.Environment]::GetEnvironmentVariable("USERPROFILE")
$rconfigdir = "$userhome\.config\R"
$renvironpath = "$rconfigdir\.Renviron"
$rprofilepath = "$rconfigdir\.Rprofile"
$rlibspath = "$rconfigdir\lib\4.1"
# $rhistpath = "$rconfigdir\.Rhistory"

[System.Environment]::SetEnvironmentVariable("HOME", $userhome, "User")
[System.Environment]::SetEnvironmentVariable("R_ENVIRON_USER", $renvironpath, "User")
[System.Environment]::SetEnvironmentVariable("R_PROFILE_USER", $rprofilepath, "User")
[System.Environment]::SetEnvironmentVariable("R_LIBS_USER", $rlibspath, "User")
```

