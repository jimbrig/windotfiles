# NOTE: Requires either `gh-cli` or `lastversion` pip package

If ((!(Get-Command gh) -and !(Get-Command lastversion))) {
    throw "Must have either gh-cli or last version installed."
}

# If (!(Get-Command gh)) {
#     Write-Host "Using lastversion" -ForegroundColor Cyan
#     last version
# }

Write-Host "Installing 'git-cliff' from repo: 'orhun/git-cliff' via gh-cli into ~/Downloads..." -ForegroundColor Yellow
gh release download -R "orhun/git-cliff" --pattern "windows-gnu" -D "$HOME\Downloads"

Write-Host "Unzipping and adding to ~/bin" -ForegroundColor Yellow
Expand-Archive "$HOME\Downloads\*cliff*.zip" -DestinationPath "$HOME\Downloads"
Set-Location "$HOME\Downloads\*git-cliff*"
Copy-Item .\git-cliff.exe "$HOME\bin" -Force

If (!($env:PATH -split ";" -contains "$HOME\bin")) {
    Write-Host "Detected that ~/bin is not included in user's %PATH%..." -ForegroundColor Red
}

Write-Host "Copying Shell Completion to PowerShell Profile" -ForegroundColor Yellow
$prodir = (Split-Path -Parent $profile)
If (!(Test-Path "$prodir\Profile\completions")) { New-Item "$prodir\Profile\completions" -ItemType Directory -Force }
Copy-Item "completions\_git-cliff.ps1" -Destination "$prodir\Profile\completions" -Force
