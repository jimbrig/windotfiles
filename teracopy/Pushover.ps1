write-host "Please get your own User Key and App Token on http://pushover.net"
write-host "Press any key to locate this file..."

[void][System.Console]::ReadKey($true)
Invoke-Expression "explorer /select,$PSCommandPath"

<# remove this line and everything above

$parameters = New-Object System.Collections.Specialized.NameValueCollection

$parameters.Add("token", "APP_TOKEN")
$parameters.Add("user", "USER_KEY")

$parameters.Add("message", "Transfer completed")
$client = New-Object System.Net.WebClient
$client.UploadValues("https://api.pushover.net/1/messages.json", $parameters)

remove this line #>

