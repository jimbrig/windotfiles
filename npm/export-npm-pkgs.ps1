If (!(Get-Command npm)) { 
    Write-Host "NPM not found. Exiting." -ForegroundColor Red 
    throw "No npm installation detected."
}

If (!($DOTDIR)) { $DOTDIR = "$HOME\.dotfiles" }

If (!(Test-Path "$DOTDIR\npm")) { New-Item -ItemType Directory "$DOTDIR\npm" -Force }

If (!(Get-Command jq)) {
    Write-Host "jq not found; will use native Convert-ToJson Cmdlet..." -ForegroundColor Cyan
    npm -g list -json > "$DOTDIR\npm\npm-packages.json"
}

npm -g list -json | jq > "$DOTDIR\npm\npm-packages.json"