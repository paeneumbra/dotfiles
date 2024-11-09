# macos

MacOS dotfiles
Environment installation and configuration.
Unless stated otherwise installations are done via terminal.

## Mac Setup

Minimal installation (automatic)

For macos

```shell
curl -fsSL https://raw.githubusercontent.com/itzalak/anvil/refs/heads/main/installation/macos/minimal-setup.sh | bash
```

Setup ssh and git.
Clone the anvil repository.

```shell
mkdir -p foundry
git clone git@github.com:itzalak/anvil.git foundry/anvil
```

Follow up on [taskfile](/taskfiles/taskfile.macos.yml)

## Manual installation

### xcode

[xcode](https://developer.apple.com/xcode/) is Apple integrated development environment, if not present almost all
following instructions will fail.
Required for git.

```shell
xcode-select --install
```

### brew

- [Homebrew](https://brew.sh/) is Apple missing package manager, is my preferred method to maintain packages.

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Installing git through brew allows for better control.

### git

```shell
git --version
brew install git
```

### Rosetta

- [Rosetta](https://developer.apple.com/documentation/apple-silicon/about-the-rosetta-translation-environment) is the
  translator to Apple silicon

```shell
softwareupdate --install-rosetta
```

## Personal setup

Most instructions should be also present in [taskfile](/taskfile.yml) or [makefile](/installation/macos/makefile)

### Mac defaults

Settings for macos defaults can be found in [macos-defaults.sh](macos-defaults.sh)

### Nvim

Initiate git submodule

```shell
git submodule update --init "$HOME/foundry/anvil/nvim"

```

### Stow

Symlink configurations like nvim, ranger and zsh to the proper folders

Zsh should already be installed, but more complete installation setup can be found in [taskfile.zsh.yml](/taskfiles/taskfile.zsh.yml).

```shell
stow -v -d $HOME/foundry/anvil -t ~/ macos
stow -v -d $HOME/foundry/anvil -t ~/ terminal
stow -v -d $HOME/foundry/anvil -t ~/ nvim
```

Ranger requires initialization of submodules

```shell
git submodule update --init "$HOME/foundry/anvil/terminal/.config/ranger/plugins/ranger-devicons2/"

```

### Brew

Set up all required application through brew

```shell
brew bundle
```

Packages required for my personal setup can be found in the [brewfile](Brewfile) and can be run using the following command

```shell
brew bundle --file "$HOME/foundry/anvil/installation/macos/Brewfile""
```

### Sdkman

Used for installing java, kotlin, groovy, gradle, scala and maven. Instructions can be found in [02-sdkamn.zsh](legacy/02-sdkman.zsh)
