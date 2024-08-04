# Dotfiles

## TODO

- [ ] Installer scripts (python)
- [ ] Stow configuration based on installer/config scripts
- [ ] Backup script
- [ ] Rename workbench/workspace/dotfiles to a different name, singleword?, no work word, ideas
    - [ ] Bench, desk, forge
    - [ ] CodeBench, CodeForge, CodeHub
    - [ ] Dots, DotBench, Dotforge

## Structure

> **WIP**

```shell
├── base
│   ├── neovim
│   ├── decorator
│   ├── ...
│   └── makefile
├── bin
├── depository
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
    - Brew installation might need to be a script, for installing brew and installing the brewfile
- Update system via command
- Setup dotfiles per os
    - Restow by command
- Create a backup upon request
- Command for any action available everywhere (from bin)

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

> **WIP**
> I need to decide how to handle personal Repositories
> Options, ignore, symlink, etc - will symlinks work from a script?

```yaml
name: workbench/depository
repos:
  - git@github.com:itzalak/thescream.nvim.git
  - git@github.com:tldr-pages/tldr.git
  - name: archived
    repos:
      - git@github.com:itzalak/pi-dotfiles.git
  - name: templates
    repos:
      - git@github.com:itzalak/obsidian-template.git
      - git@github.com:itzalak/cookiecutter-base.git
```

## References

- [yas-bdsm](https://github.com/sebastiancarlos/yas-bdsm)
- [radm](https://github.com/robertarles/radm)
- [dotdrop](https://github.com/deadc0de6/dotdrop)
