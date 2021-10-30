sudo cinst azure-cli -y
refreshenv
az login
az config set auto-upgrade.enable=yes
