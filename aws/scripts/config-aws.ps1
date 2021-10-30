# AWS-CLI configuration
If (!(Get-Command aws)) {
    throw "AWS CLI must be installed."
}

$DotPath = "$HOME\.dotfiles\aws"
Set-Location $DotPath

aws configure import --csv "file://aws-credentials.csv"

$AWSCompleterPath = (where.exe aws_completer)

aws complete -C $AWSCompleterPath
