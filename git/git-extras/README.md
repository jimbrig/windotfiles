# Git Extras

## Installation

### Dependencies

Some commands require extra dependencies which are unavailable in some platforms.
You may need to install them manually.

Those dependencies are listed below:

* column

### Windows

First, please install `Git for Windows 2.x` from 'https://github.com/git-for-windows/git/releases'.
Second, clone the `git-extras` repo into any folder you like.
```bash
git clone https://github.com/tj/git-extras.git
# checkout the latest tag (optional)
git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
```

After that, execute the `install.cmd` in the command prompt. If you installed
git as admin, you need to run this prompt as admin, too. Per default, it finds
a `Git for Windows 2.x` if it's in the path (first path in `where git.exe` wins)
or installed in the default location `%ProgramFiles%\Git`. The fallback is
`C:\SCM\PortableGit`. If you didn't install git into one of these dirs, you have
to supply the path for the install location, e.g. if git is installed
in `c:\git`:

```batch
install.cmd "C:\git"
```

Last, to use `git summary` and `git ignore-io`, you need to copy
`column.exe` from a [msys2][1] installation from `folder-your-msys2-installed/usr/bin`
to `folder-your-git-installed/usr/bin` or wait for git 2.7.1, which will include column.exe.

### Arch Linux

* [git-extras](https://aur.archlinux.org/packages/git-extras/)
* [git-extras-git](https://aur.archlinux.org/packages/git-extras-git/)

### Homebrew

```bash
$ brew install git-extras
```

Installing from Homebrew will not give you the option omit certain `git-extras` if they conflict with existing git aliases. To have this option, build from source.

### Installing as Zsh plugin

[Zplugin](https://github.com/zdharma/zplugin) can install git-extras by using:

```zsh
zplugin ice as"program" pick"$ZPFX/bin/git-*" src"etc/git-extras-completion.zsh" make"PREFIX=$ZPFX"
zplugin light tj/git-extras
```

`$ZPFX` is `~/.zplugin/polaris` by default. Use `zplugin update tj/git-extras` to update.
This method installs in `$HOME`, so you don't need to ask administrator to install package.

### Updating

If you installed git-extras with a package manager, use that package manager's tools to update it.

If you installed git-extras from source, you can run `git-extras update` to update it to the latest release. Be aware that this may lose any configuration options you specified during the original installation.

