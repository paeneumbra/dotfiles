# macos

MacOS dotfiles & setup
Environment installation and configuration.
Unless stated otherwise installations are done via terminal.

## Mac Setup

These instruction must be added manually before using the makefile

### xcode

[xcode](https://developer.apple.com/xcode/) is Apple integrated development environment, if not present almost all
following instructions will fail.
Required for git.

```shell
xcode-select --install
```

### brew

- [homebrew](https://brew.sh/) is Apple missing package manager, is my preferred method to maintain packages.

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Git is git. Installing it through brew allows for better control.

### git

```shell
git --version
brew install git
```

- [Rosetta](https://developer.apple.com/documentation/apple-silicon/about-the-rosetta-translation-environment) is the
  translator to Apple silicon

### Rosetta

```bash
softwareupdate --install-rosetta
```

## My setup

Should be mainly related to this repository.
Most instructions should be also present in [makefile](./makefile)

### Nvim

Initiate git submodule with [nvim configuration](terminal/.config/nvim)

```shell
git submodule init
git submodule update

```

### Stow

Symlink configurations like nvim, ranger and zsh to the proper folders

```shell
stow -v -d $HOME/workspace -t ~/ macos
stow -v -d $HOME/workspace -t ~/ terminal
stow -v -d $HOME/workspace -t ~/ neovim
```

### Brew

Set up all required application through brew

```shell
brew bundle
```

### Sdkman

WIP: Used for installing java, kotlin, groovy, gradle, scala and maven
