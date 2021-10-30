# AWS-CLI configuration
If (!(Get-Command aws)) {
    throw "AWS CLI must be installed."
}



$AccessKeyID = "AKIAYU6CG7CCOOMMMHVW"
$SecretAccessKey = "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"
$DefaultRegion = "us-east-1"

$DotPath = "$HOME\.dotfiles\aws"
Set-Location $DotPath

aws configure import --csv "file://aws-credentials.csv"

$AWSCompleterPath = (where.exe aws_completer)

aws complete -C $AWSCompleterPath