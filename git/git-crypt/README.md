<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Git Crypt](#git-crypt)
  - [Installation](#installation)
    - [Scoop](#scoop)
    - [Experimental Windows Support](#experimental-windows-support)
  - [Usage](#usage)
    - [Gitattributes File](#gitattributes-file)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Git Crypt

`git-crypt` enables transparent encryption and decryption of files in a git repository. Files which you choose to protect are encrypted when committed, and decrypted when checked out. 

`git-crypt` lets you freely share a repository containing a mix of public and private content. git-crypt gracefully degrades, so developers without the secret key can still clone and commit to a repository with encrypted files. 

This lets you store your secret material (such as keys or passwords) in the same repository as your code, without requiring you to lock down your entire repository.

## Installation

### Scoop

```powershell
scoop install git-crypt
```

### Experimental Windows Support

git-crypt should build on Windows with MinGW, although the build system is not yet finalized so you will need to pass your own CXX, CXXFLAGS, and LDFLAGS variables to make. Additionally, Windows support is less tested and does not currently create key files with restrictive permissions, making it unsuitable for use on a multi-user system. Windows support will mature in a future version of git-crypt. Bug reports and patches are most welcome!

## Usage

Configure a repository to use git-crypt:

```bash
cd repo
git-crypt init
```

Specify files to encrypt by creating a .gitattributes file:

```bash
secretfile filter=git-crypt diff=git-crypt
*.key filter=git-crypt diff=git-crypt
secretdir/** filter=git-crypt diff=git-crypt
```

Like a `.gitignore` file, it can match wildcards and should be checked into the repository.  See below for more information about `.gitattributes`.

Make sure you don't accidentally encrypt the `.gitattributes` file itself
(or other git files like `.gitignore` or `.gitmodules`).  

Make sure your `.gitattributes` rules are in place *before* you add  sensitive files, or those files won't be encrypted!

Share the repository with others (or with yourself) using GPG:

```bash
git-crypt add-gpg-user USER_ID
```

`USER_ID` can be a key ID, a full fingerprint, an email address, or
anything else that uniquely identifies a public key to GPG (see "HOW TO
SPECIFY A USER ID" in the gpg man page).  Note: `git-crypt add-gpg-user`
will add and commit a GPG-encrypted key file in the .git-crypt directory
of the root of your repository.

Alternatively, you can export a symmetric secret key, which you must
securely convey to collaborators (GPG is not required, and no files
are added to your repository):

```bash
git-crypt export-key /path/to/key
```

After cloning a repository with encrypted files, unlock with GPG:

```bash
git-crypt unlock
```

Or with a symmetric key:

```bash
git-crypt unlock /path/to/key
```

That's all you need to do - after `git-crypt` is set up (either with
`git-crypt init` or `git-crypt unlock`), you can use git normally -
encryption and decryption happen transparently.

### Gitattributes File

The `.gitattributes` file is documented in the gitattributes(5) man page.
The file pattern format is the same as the one used by `.gitignore`,
as documented in the gitignore(5) man page, with the exception that
specifying merely a directory (e.g. `/dir/`) is *not* sufficient to
encrypt all files beneath it.

Also note that the pattern `dir/*` does not match files under
sub-directories of dir/.  To encrypt an entire sub-tree dir/, use `dir/**`:

```bash
dir/** filter=git-crypt diff=git-crypt
```

The `.gitattributes` file must not be encrypted, so make sure wildcards don't match it accidentally.  If necessary, you can exclude `.gitattributes` from encryption like this:

```bash
.gitattributes !filter !diff
```

See the provided [.gitattributes-example](./.gitattributes-example) file or [this repo's utilized .gitattributes file](../../.gitattributes) for reference.
