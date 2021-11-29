# Microsoft Windows Package Manager - `winget`

## Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Settings](#settings)
  - [File Location](#file-location)
  - [My Settings:](#my-settings)
- [Scripts](#scripts)
- [Installations](#installations)
- [Resources](#resources)
- [Command Reference](#command-reference)
- [PowerShell Completion](#powershell-completion)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
*Generated with [DocToc](https://github.com/thlorenz/doctoc)*

## Settings

You can configure WinGet by editing the `settings.json` file. Running `winget settings` will open the file in the default json editor; if no editor is configured, Windows will prompt for you to select an editor, and Notepad is sensible option if you have no other preference.

### File Location

Settings file is located in %LOCALAPPDATA%\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json

If you are using the non-packaged WinGet version by building it from source code, the file will be located under %LOCALAPPDATA%\Microsoft\WinGet\Settings\settings.json

### My Settings:

- Path to [settings.json](./AppData/Local/Packages/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe/LocalState/settings.json): `%LOCALAPPDATA%\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json`

```powershell
{
    "$schema": "https://aka.ms/winget-settings.schema.json",
    "source": {
        "autoUpdateIntervalInMinutes": 3
    },
    "visual": {
        "progressBar": "rainbow"
    },
    "installBehavior": {
        "preferences": {
            "scope": "machine",
            "locale": ["en-US"]
        }
    },
    "telemetry": {
        "disable": true
    },
    "network": {
        "downloader": "default"
    },
    "experimentalFeatures": {
        "dependencies": true,
        "directMSI": true,
        "experimentalARG": true,
        "experimentalCMD": true
    }
}
```

## Scripts

- [Configure-WinGet.ps1](scripts/Configure-WinGet.ps1)
- [Export-WinGetPkgs.ps1](scripts/Export-WinGetPkgs.ps1)
- [Import-WinGetPkgs.ps1](scripts/Import-WinGetPkgs.ps1)
- [Sync-WinGetSettings.ps1](scripts/Sync-WinGetSettings.ps1)
## Installations

After installing a fresh new Windows OS, utilize winget for the initial installations of software because it should be built into the new OS out of the box:

- [`Install-WinGetPkgs.ps1` Script](scripts/Install-WinGetPkgs.ps1).

Common installations include:

- Obsidian
- VSCode
- Windows Terminal
- PowerToys
- Raindrop.io
- PowerShell / PowerShell Preview
- NTLite
- DBBrowserForSQLite
- Azure-CLI
- gcloudsdk

## Resources

- [Documentation on GitHub (microsoft/winget-cli)](https://github.com/microsoft/winget-cli/master/doc/)

- [Troubleshooting](https://github.com/microsoft/winget-cli/tree/master/doc/troubleshooting)
- [Settings](https://github.com/microsoft/winget-cli/blob/master/doc/Settings.md)
- [Completion](https://github.com/microsoft/winget-cli/blob/master/doc/Completion.md)

## Command Reference

```powershell
 ~\.dotfiles :: git(main)                                                                                   19:45:03
➜ winget --help
Windows Package Manager (Preview) v1.2.3131-preview
Copyright (c) Microsoft Corporation. All rights reserved.

The winget command line utility enables installing applications and other packages from the command line.

usage: winget [<command>] [<options>]

The following commands are available:
  install    Installs the given package
  show       Shows information about a package
  source     Manage sources of packages
  search     Find and show basic info of packages
  list       Display installed packages
  upgrade    Upgrades the given package
  uninstall  Uninstalls the given package
  hash       Helper to hash installer files
  validate   Validates a manifest file
  settings   Open settings or set administrator settings
  features   Shows the status of experimental features
  export     Exports a list of the installed packages
  import     Installs all the packages in a file

For more details on a specific command, pass it the help argument. [-?]

The following options are available:
  -v,--version  Display the version of the tool
  --info        Display general info of the tool

More help can be found at: https://aka.ms/winget-command-help
```

## PowerShell Completion

You can add the argument completer to your $PROFILE, which will enable it in all subsequent PowerShell sessions. For more information, see How to create your profile and Profiles and execution policy.

Here is the PowerShell command to add to your $PROFILE:

```powershell
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}
```

*See my [PowerShell Profile Completions](https://github.com/jimbrig/PowerShell/tree/main/Profile/completions)*.