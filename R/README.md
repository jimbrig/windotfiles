# R

See also: [rstudio](../rstudio/) and [radian](../radian/).
## Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Contents](#contents)
- [Installation](#installation)
- [Setup and Configure](#setup-and-configure)
  - [Walkthrough Setting up R](#walkthrough-setting-up-r)
  - [R Packages](#r-packages)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
*Generated with [DocToc](https://github.com/thlorenz/doctoc)*

## Installation

Installs:

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

# install utils
cinst -y pandoc cmake tinytex hugo qpdf ghostscript
```
## Setup and Configure

All in one solution for R and RStudio: [r-setup-script.ps1](./.config/R/../../r-setup-script.ps1).

***

### Walkthrough Setting up R

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

## R Packages

R Packages are housed in my custom user library (i.e. `.libPaths()[1]`): [~/.config/R/lib/4.1](.config/R/lib/4.1).

Packages are bootstrapped using my [`installation.R`](.config/R/lib/installation.R) script in conjunction with the [`pkgs.yml`](.config/R/lib/pkgs.yml) configuration file.

Other scripts related to package management:
- [bootstrap_r_pkgs.R]()
- [reinstall_r_pkgs.R]()

Package installation results are cached under [~/.config/R/cache](./.config/R/cache).