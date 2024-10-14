# Refactoring - shogun

<!-- TOC -->
- [Refactoring - shogun](#refactoring---shogun)
    - [TODO](#todo)
    - [Structure](#structure)
    - [Installer](#installer)
        - [Macos](#macos)
        - [Awesomewm](#awesomewm)
    - [Repositories](#repositories)
    - [References](#references)
<!-- TOC -->

## TODO

Naming:

- projects, foundry, codebank, codeforge
- workspace, dotfiles, depository, codeforge

Maybe I could move them all to a blacksmith theme

- anvil
- foundry
- forge

Another idea is to create a single directory to hold everything.

- Can workspace work from there?
- what scripts or makefile I need or want

```shell
├── foundry
    ├── forge
    ├── depository
    ├── lectern (scratchpad)
    └── anvil
```

- [ ] Installer scripts (maybe more python)
- [ ] Stow configuration based on installer/config scripts
    - [ ] Revisit stow config, to diminish number of nested folders
- [ ] Reconsider breaking macos to its own repository
    - macos has limitations because of the ssh setup (prevent personal commits with company email)
        - user and email config per repository
            - heavy manual work
            - error prone
        - double ssh key config
            - stricter config
            - possibly harder to use the project outside the workspace
        - maintaining configurations between multiple (possibly 4!) repositories
        - os specific configurations are growing
            - zsh
            - wezterm (might need a split - specially because of fonts and keybindings)
            - functions (maybe can be transformed in a bash script)
            - brew
            - nvm (maybe can be added to linux?)
        - raycast use might increase even more the need for a split configuration
- [ ] Backup script
- [ ] Rename workbench/anvil/dotfiles to a different name, singleword?, no work word, ideas
    - [x] ~~Bench, desk, forge~~
    - [x] ~~CodeBench, CodeForge, CodeHub~~
    - [x] ~~Dots, DotBench, Dotforge~~
- [ ] Consider gum use cases to simplify configurations

## Structure

> **WIP**

```shell
├── base
│   ├── neovim
│   ├── decorator
│   ├── ...
│   └── makefile
├── bin
├── projects
│   └── ...
├── lectern
├── linux
│   ├── bin
│   │   └── (system scripts)
│   ├── awesomewm
│   ├── bspwm
│   ├── dotfiles
│   ├── qtile
│   └── installation
│       └── (installation scripts)
├── macos
│   ├── bin
│   │   └── (system scripts)
│   ├── brewfile
│   ├── dotfiles
│   ├── installation
│   │   └── (installation scripts)
├── neovim
├── wallpapers
├── workbench
└── zsh
```

## Installer

> **WIP**
> Using stow there are 2 different behaviors to consider.
> Packages like neovim need to be fully symlinked, for zsh folder creation is required
> Also, files like installation scripts and makefile are not to be stowed

Note: I am not satisfied, this is more confusing than before

Objective:

- Install via scripts per os
    - Single script is not very helpful in case of failures, step by step might be better (maybe with input?)
    - Brew installation might need to be a script, for installing brew and installing the brewfile
- Update system via command
- Setup dotfiles per os
    - Restow by command
- Create a backup upon request
- Command for any action available everywhere (from bin)

The installation should be completed by running something akin to the following line

```shell
curl -fsSL https://raw.githubusercontent.com/itzalak/anvil/refs/heads/main/bin/cloneworkspace.py | python
```

### Macos

```yaml
profile: macos
installation:
  scripts:
    - ~/workbench/macos/installation/00-brew.sh
    - ~/workbench/macos/installation/01-defaults.sh
  update:
    command: {{brewfile command}}
config:
  backup: true
  os: macos
  source: ~/workbench
  create_folders:
    - ~/.config/zsh
  base: all
  macos: all
```

### Awesomewm

```yaml
profile: awesome
installation:
  scripts:
    - ~/workbench/linux/installation/00-script.sh
    - ~/workbench/linux/installation/02-script.sh
  update:
    command: {{pacman/yay command}}
config:
  backup: true
  os: linux
  source: ~/workbench
  create_folders:
    - ~/.config/zsh
  base: all
  linux:
    - common
    - awesome
```

## Repositories

> WIP: State of the idea

```shell
$HOME
├── projects
│   └── ...
├── personal (TODO: Rename)
│   ├── neovim
│   ├── notes
│   └── lab
└── work
```

> Considering the limitations of the professional setup I need to rethink the structure
> All repositories must be under directories personal and work
> ...
> Maybe it's time to split macos from linux

```yaml
dotfiles:
  - git@github.com:itzalak/lectern.git

projects:
  - git@github.com:itzalak/pyresume.git
  - git@github.com:itzalak/thescream.nvim.git
  - git@github.com:tldr-pages/tldr.git
  - git@github.com:sherlock-project/sherlock.git
  - archived:
      - git@github.com:itzalak/pi-dotfiles.git
      - git@github.com:itzalak/deprecated-static-site.git
  - templates:
      - git@github.com:itzalak/gradle-template.git
      - git@github.com:itzalak/obsidian-template.git
      - cookiecutter:
          - git@github.com:itzalak/cookiecutter-base.git
          - git@github.com:itzalak/cookiecutter-python.git
          - git@github.com:itzalak/cookiecutter-kotlin.git
```

## References

- [yas-bdsm](https://github.com/sebastiancarlos/yas-bdsm)
- [radm](https://github.com/robertarles/radm)
- [dotdrop](https://github.com/deadc0de6/dotdrop)
