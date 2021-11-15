# Topgrade
> Topgrade is an awesome CLI library build with [Rust]() and available from [r-darwish/toprade](https://github.com/r-darwish/topgrade).

## Contents

- [Installation](#installation)
- [Configuration](#configuration)
	- [Configuration Path](#configuration-path)
- [From Repo](#from-repo)
	- [Usage](#usage)
	- [Customization](#customization)
	- [Remote Execution](#remote-execution)

## Installation

For Windows easiest way to install is using `scoop`: `scoop install topgrade`.

<details><summary>View Other Supported OS Installations</summary><p>

Arch Linux users can use the [AUR](https://aur.archlinux.org/packages/topgrade/) package.

On NixOS, use the `topgrade` package in `nixpkgs`.

macOS users can install topgrade via [Homebrew](https://brew.sh/) or [MacPorts](https://www.macports.org/install.php).

Other systems users can either use `cargo install` or use the compiled binaries from the release
page. The compiled binaries contain a self-upgrading feature.

Topgrade isn't guaranteed to work on Rust versions older than the latest stable release. If you
intend to install Topgrade using Cargo then you should either install Rust using rustup or use a
distribution which ships the latest version of Rust, such as Arch Linux.

</p></details>

## Configuration

See the [topgrade.toml]() configuration file for my personalized config's, or view the code below:

<details><summary>View config file:</summary><p>

```toml
# Don't ask for confirmations
assume_yes = true

# Do not ask to retry failed steps (default: false)
no_retry = true

# Do not set the terminal title
set_title = false

# Cleanup temporary or old files
cleanup = true

# Causes Topgrade to rename itself during the run to allow package managers
# to upgrade it. Use this only if you installed Topgrade by using a package
# manager such as Scoop to Cargo
# self_rename = true

# Ignore failures for these steps
ignore_failures = ["powershell"]

# Disable specific steps - same options as the command line flag
disable = ["winget", "gcloud", "git_repos"]

# Custom commands
[commands]
"Gcloud Components" = "sudo cmd.exe /c 'gcloud components update'" 
"R Packages" = "& Rscript -e \"update.packages(lib.loc = .libPaths()[[1]], repos = 'https://cloud.r-project.org/', ask = FALSE)\""
"Choco Package List Backup" = "cmd.exe /c 'cplb'"
"Choco Cleanup" = "sudo cmd.exe /c 'choco-cleaner'"
"System Cleanup" = "sudo cmd.exe /c 'cleanmgr'"
"SFC Scan" = "sudo cmd.exe /c 'sfc /scannow'"

# Run specific steps - same options as the command line flag
#only = ["system", "emacs"]

[windows]
# Manually select Windows updates
accept_all_updates = true
open_remotes_in_new_terminal = true

[linux]
# Arguments to pass yay when updating packages
#yay_arguments = "--nodevel"
#trizen_arguments = "--devel"
#enable_tlmgr = true
#emerge_sync_flags = "-q"
#emerge_update_flags = "-uDNa --with-bdeps=y world"
#redhat_distro_sync = false
#rpm_ostree = false

[git]
#max_concurrency = 5
# Additional git repositories to pull
#repos = [
#    "~/src/*/",
#    "~/.config/something"
#]

# Don't pull the predefined git repos
#predefined_repos = false

# Arguments to pass Git when pulling Repositories
#arguments = "--rebase --autostash"

[composer]
#self_update = true

# Commands to run before anything
[pre_commands]
#"Emacs Snapshot" = "rm -rf ~/.emacs.d/elpa.bak && cp -rl ~/.emacs.d/elpa ~/.emacs.d/elpa.bak"


#"Python Environment" = "~/dev/.env/bin/pip install -i https://pypi.python.org/simple -U --upgrade-strategy eager jupyter"

[brew]
#greedy_cask = true

[npm]
# Use sudo if the NPM directory isn't owned by the current user
#use_sudo = true

# Run inside tmux
#run_in_tmux = true

# List of remote machines with Topgrade installed on them
#remote_topgrades = ["toothless", "pi", "parnas"]

# Arguments to pass SSH when upgrading remote systems
#ssh_arguments = "-o ConnectTimeout=2"

# Path to Topgrade executable on remote machines
#remote_topgrade_path = ".cargo/bin/topgrade"

# Arguments to pass tmux when pulling Repositories
#tmux_arguments = "-S /var/tmux.sock"

[firmware]
# Offer to update firmware; if false just check for and display available updates
#upgrade = true

[flatpak]
# Use sudo for updating the system-wide installation
#use_sudo = true

```

</p></details>

### Configuration path

The configuration should be placed in the following paths depending by the operating system:

* **Windows** - `%APPDATA%/topgrade.toml`
* **Other Unix systems** - `~/.config/topgrade.toml`

## From Repo

Keeping your system up to date mostly involves invoking more than a single package manager. This
usually results in big shell one-liners saved in your shell history. Topgrade tries to solve this
problem by detecting which tools you use and run their appropriate package managers.

### Usage

Just run `topgrade`. See [the wiki](https://github.com/r-darwish/topgrade/wiki/Step-list) for the list of things Topgrade supports

### Customization

See `config.example.toml` for an example configuration file.

### Remote execution

You can specify a key called `remote_topgrades` in the configuration file. This key should contain a
list of hostnames that have topgrade installed on them. Topgrade will execute Topgrades on these
remote hosts. To limit the execution only to specific hosts use the `--remote-host-limit` parameter.

