# Dotfiles

Personal laboratory mostly for development.

## Installation

Current installation is done with cachy.
Remainder is done through the taskfiles.

### Requirements

- go-task
- python
- stow
- zsh
- fish

## Configuration

### shell

Main shell is fish, a working setup exists for bash and zsh (with zimfw)

## Fish

Follow <https://github.com/kidonng/plug.fish#installation>

```shell
exec fish
plugin_update
```

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
