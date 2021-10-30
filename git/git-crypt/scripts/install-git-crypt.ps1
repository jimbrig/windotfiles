if (!(Get-Command scoop)) {
    throw "Scoop must be installed."
}

scoop install git-crypt
