# Dotfiles

Personal laboratory mostly for development.

WIP: Ongoing refactorings
TODO: outdated, must be refactored

## Installation

Current installation is done with cachy.
Remainder is done through the taskfiles.

### Requirements

- go-task
- python
- stow
- zsh

## Configuration

### shell

Main shell is fish, a working setup exists for bash and zsh (with zimfw)
Configuration through taskfiles using stow

## Dotfiles setup

Clone the dotfiles repository

```shell
mkdir -p depository
cd depository
git clone git@github.com:paeneumbra/dotfiles.git dotfiles
```

## Minimal setup

Run minimal linux installation setup manually

```shell
./depository/dotfiles/taskfiles/scripts/00-cachy-minimal.sh
```

or

```shell
curl -fsSL https://raw.githubusercontent.com/paeneumbra/dotfiles/refs/heads/main/taskfiles/scripts/00-cachy-minimal.sh | bash
```

## Other environments

For adding a new desktop create a new user and assign to wheel group. Don't forget to add the sudo config file
in the `sudoers.d` directory.

```shell
useradd -m -G wheel -s /bin/bash {{user}}
sudo passwd {{user}}
```
