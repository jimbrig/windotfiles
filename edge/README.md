# Microsoft Edge

> This directory houses various settings, configurations, setup notes, and back-ups for the Edge Chromium Web Browser.

## Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Microsoft Edge](#microsoft-edge)
  - [Contents](#contents)
  - [Various Versions of Edge](#various-versions-of-edge)
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Backup User Preferences](#backup-user-preferences)
    - [Important Files](#important-files)
    - [Search Engines](#search-engines)
  - [Restoring User Preferences](#restoring-user-preferences)
  - [Scripts](#scripts)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
*Generated with [DocToc](https://github.com/thlorenz/doctoc)*

## Various Versions of Edge

Note that Microsoft Edge can have various versions and the location of the user preferences varies depending on the version installed:

| Edge Version | Profile Directory |
| :--: | :--: |
| Edge Stable | `%LOCALAPPDATA%\Microsoft\Edge\User Data\Default` |
| Edge Dev | `%LOCALAPPDATA%\Microsoft\Edge Dev\User Data\Default` |
| Edge Beta | `%LOCALAPPDATA%\Microsoft\Edge Beta\User Data\Default`
| Edge Canary | `%LOCALAPPDATA%\Microsoft\Edge SxS\User Data\Default` |

## Installation

The easiest method for installing the latest version(s) of Microsoft Edge is through a package manager of choice:

```powershell
# install via winget
winget install Microsoft.Edge
winget install Microsoft.Edge.Dev
winget install Microsoft.Edge.Beta

# install via chocolatey
choco install -y microsoft-edge
choco install -y microsoft-edge-insider
choco install -y microsoft-edge-insider-dev
```

*Note: Package Managers do not usually have [Edge Canary]() included, however, if interested you can install with my [Install-EdgeCanary.ps1](scripts/Install-EdgeCanary.ps1) script.*

## Configuration

## Backup User Preferences

### Important Files

### Search Engines

## Restoring User Preferences

## Scripts
