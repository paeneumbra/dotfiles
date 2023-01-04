# Workspace

Personal workspace mostly for development.

## Installation

This configuration is for an Arch Linux machine and installed
using [archinstall v2.5.2](https://github.com/archlinux/archinstall/tree/v2.5.2).

[//]: # 'TODO: Add installation settings - basic'

Clone [workspace](https://github.com/simao-ferreira/workspace) repository.

```shell
$ git clone https://github.com/simao-ferreira/workspace.git
```

Instructions are included in the makefile, it should be enough to run them in order.

## Configuratio

### Zsh

Configuration for zsh can be found under [sys folder](./sys) and can it can be setup by copying the files to the proper location, via symlink or [stow](https://www.gnu.org/software/stow/).

It uses a self installed, self managed plugin magaer called [zimfw](https://github.com/zimfw/zimfw) that will install itself and setup all needed plugins once zsh is started. Plugin configuration can be found in the [.zimrc file](./sys/.config/zsh/.zimrc), a folder will automatically be created as `.zim` to store all required files for `zimfw`.

#### Structure

Global variable `ZDOTDIR` is defined under `./zshenv` as `$HOME/.config/zsh`. This tells zsh to look for further configurations files in that directory.
In `./zshrc` we load all configuration files within the `ZDOTDIR` directory ending in `*.zsh`. This is not required but it facilitates managing special configurations and settings.

```
.
├── .config
│   └── zsh
│       ├── 00-path.zsh
│       ├── 02-aliases.zsh
│       ├── 04-history.zsh
│       ├── 05-git.zsh
│       ├── 08-fd-fzf-rg.zsh
│       ├── 98-worspace.zsh
│       ├── 99-starship.zsh
│       ├── .zimrc
│       └── .zshrc
└── .zshenv
```
