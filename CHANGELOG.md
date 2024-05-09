# Changelog

## v6.0.16 (2024-05-09)

### Tools

- Update brewfile and makefile

## v6.0.15 (2024-05-01)

### Tools

- add zimfw update to makefile

## v6.0.14 (2024-04-29)

### Changed

- Add gradle wrapper alias
- tweak zsh history configuration

### Fixed

- Correct commitizen bump definition

## v6.0.13 (2024-04-17)

### Changed

- Add commitizen to pipx installation

### Tools

- Update brewfile

## v6.0.12 (2024-04-16)

### Tools

- Introduce poetry
- Update pre commit hooks
- Update github checkout version

## v6.0.11 (2024-04-13)

### Patch

- Tweaks to installation scripts
- Qtile test some widgets
- Qtile cleanup and colors playout
- Qtile split widgets, add default settings
- Correct audio pipewire makefile steps
- Qtile introduce scratchpad
- Qtile tweaks and tryouts
- Qtile add new wallpaper, tweak bar
- Qtile splitiing
- make mod key alt in qtile

## v6.0.10 (2024-04-10)

### Patch

- Remove xresources from terminal config, not needed for macos

## v6.0.9 (2024-04-09)

### Patch

- add archinstall extra packages
- Tweak installation scripts
- Tweak modkey config to depend on  alt instead of meta

## v6.0.8 (2024-04-04)

### Patch

- Update nvim with telescope changes

## v6.0.7 (2024-04-01)

### Patch

- Clean makefiles

## v6.0.6 (2024-04-01)

### Patch

- WIP qtile

## v6.0.5 (2024-03-31)

### Fix

- correct makefile logiops installation, move some gnome files

## v6.0.4 (2024-03-31)

### Fix

- Correct yay installation

### Patch

- WIP qtile config

## v6.0.3 (2024-03-31)

### Patch

- Continue refactoring to include qtile
- Move awesome configuration to a separate folder to facilitate using other wm

## v6.0.2 (2024-03-31)

### Fix

- broken local config for nvim

## v6.0.1 (2024-03-31)

### Fix

- Move scripts to local bin, fix compatibility of fonts

## v6.0.0 (2024-03-30)

### Breaking Change

- Restructuring, update installation files

### Patch

- Split arch and macos specific scripts
- Pre commit update

## v5.0.2 (2024-03-28)

### Patch

- Update nvim to 10.20
- tweak terminal config

## v5.0.1 (2024-03-24)

### Patch

- Refactor workspace json

## v5.0.0 (2024-03-24)

### Breaking Change

- update all links and submodules

### Fix

- Remove commit links from changelog

## v4.1.31 (2024-03-19)

### Fix

- Refactor git alias

### Patch

- Tweak zsh config alias, update nvim

## v4.1.30 (2024-03-17)

### Fix

- Rename terminals folder to terminal

### Patch

- Move and reconfigure ranger
- Move common zsh to terminals folder

## v4.1.29 (2024-03-17)

### Patch

- Adjust configuration for terminals
- tweak wezterm config
- improve git log alias config

## v4.1.28 (2024-03-17)

### Patch

- refresh macos configuration
- refresh git alias config

## v4.1.27 (2024-03-09)

### Fix

- Nvim gitmodule directory

### Patch

- Prettify makefile
- Refactor update git repos script to ignore given directories

## v4.1.26 (2024-03-08)

### Patch

- refactor nvim directory and makefiles
- update to latest nvim config

## v4.1.25 (2024-03-06)

### Patch

- Start using editorconfig, apply suggestions

## v4.1.24 (2024-03-05)

### Patch

- Remove unused zsh config files
- Refactor for macos installation scripts
- Add macos defaults script

## v4.1.23 (2024-03-05)

### Patch

- Tryout warp
- Add icons to ranger config
- Fix changelog description

## v4.1.22 (2024-03-03)

### Patch

- Update alacritty to toml format

## v4.1.21 (2024-03-02)

### Patch

- Add sketchybar and amethyst initial config

## v4.1.20 (2024-03-02)

### Fix

- Fix python security pre commit hook

## v4.1.19 (2024-03-01)

### Fix

- Refactor wezterm config to not clash with neovim

### Patch

- Update neovim to lastest
- Introduce checkmake validation to pre-commit config
- Update pre commit configuration
- Adjustments to the fzf functions

## v4.1.18 (2024-02-21)

### Patch

- Continue the refactor of fzf functions

## v4.1.17 (2024-02-20)

### Patch

- Refactor fzf functions

## v4.1.16 (2024-02-17)

### Patch

- Update wezterm configuration

## v4.1.15 (2024-02-17)

### Patch

- Update pre commit configuration

## v4.1.14 (2024-02-17)

### Patch

- Refactor makefiles, add sdkman installation

## v4.1.13 (2024-02-17)

### Patch

- Update nvim config
- Refresh brewfile installation
- Refresh zsh config

## v4.1.12 (2024-01-23)

### Fix

- Configure zoxide as zimfw module

## v4.1.11 (2024-01-13)

### Patch

- Add zoxide to experimental tools

## v4.1.10 (2023-12-14)

### Patch

- Update mac installation files

## v4.1.9 (2023-12-05)

### Patch

- Update macos installation and configuration

## v4.1.8 (2023-12-04)

### Patch

- Replace macos spectacle with rectangle

## v4.1.7 (2023-12-01)

### Fix

- Update workspace repos

## v4.1.6 (2023-12-01)

### Patch

-  Update installation steps for mac

## v4.1.5 (2023-11-29)

### Fix

- Adjust makefile for gtk-3.0 to symlink only the files

## v4.1.4 (2023-11-12)

### Patch

- Update paths for macos
- Add bat to installation scripts

## v4.1.3 (2023-11-05)

### Fix

- Remove jre installation from scripts for archlinux to avoid conflict

## v4.1.2 (2023-11-02)

### Patch

- Add productivity tools to installation scripts
- Update workspace repos

## v4.1.1 (2023-10-31)

### Patch

- Refactor brew installation file

## v4.1.0 (2023-10-29)

### Feature

- Add github action for automatic bump

### Fix

- Reverting tag test, it will push a tag pointing to no commit

## v4.0.2 (2023-10-29)

### Fix

- Test pushing tags on bump

## v4.0.1 (2023-10-29)

### Fix

- Refactor makefile
- Fix installation scripts for commitizen, add pipx

## v4.0.0 (2023-10-28)

### Breaking Change

- Migrate to commitizen

### Patch

- Include cookiecutter project for python, add commitizen to installation
- Clean workspace setup repositories
- Update decorator script, include iterm colors generation
- Apply starship confiog schema
- Add poetry to tools, refactor workspace json
- Add cookiecutter to installation scripts, include cookiecutter base in workspace
- Add lazygit to installation scripts
- Apply stylua formatting
- Update nvim
- Add precommit, linting and formatting config for lua

## v3.0.1 (2023-10-20)


### Changed

* Add decorator template for iterm - wip
* Add nvim pallete based of thescream
* Add project the scream to workspace configuration
* Create alias for common folders, nvim update
* Fix printscreen configuration, update nvim version
* **gnome:** Update installation script
* **infra:** Update neovim
* Refactor gnome installation
* remove cargo installation
* Update brewfile intallation for tfsec
* Update decorator color schemes
* Update nvim
* Update nvim and installation of nvim required packages

## v3.0.0 (2023-10-09)


### ⚠ BREAKING CHANGES

* Refactor installation scripts and include macos

### Added

* Refactor configuration
* Refactor installation scripts and include macos
* Update readme files


### Changed

* Add wallpaper
* **infra:** Add submodules agai
* **infra:** Fix mac configurations
* **infra:** Fix workspace repository list
* **infra:** Update pre-commit config

## v2.0.1 (2023-10-05)


### Changed

* **arch:** Move from flake8 to ruff, update nvim version
* **arch:** Refactor development and java setup
* **nvim:** Update nvim setup

## v2.0.0 (2023-09-27)


### ⚠ BREAKING CHANGES

* Include login manager, add installation for gnome, refactor installation and awesome for graphical use

### Added

* Include login manager, add installation for gnome, refactor installation and awesome for graphical use


### Changed

* **arch:** Fix decorator script, add mc script
* **arch:** Fix gdm awesome startup
* **arch:** Update arch installation with audio tools
* **awesome:** Add awesome bling module for layouts
* **gnome:** Add gdm configuration manager
* **gnome:** Update configuration after launch in gnome
* **gnome:** Update zsh config with alias for prime switching
* **zsh:** Update zsh plugins with completions

## v1.0.2 (2023-09-22)


### Changed

* **arch:** Refactor arch installation scripts
* **arch:** Replace xdg-open for handlr, update starship, remove tlpui
* **infra:** Fix pre-commit configuration for markdown, apply pre commit suggestions
* **ranger:** Update ranger config replacing xdg-open for handlr
* **workspace:** Update awesome config for handling new monitor
* **workspace:** Update nvim
* **workspace:** Update nvim
* **workspace:** Update workspace repository list

## v1.0.1 (2023-09-16)


### Changed

* **arch:** Add tldr package to arch installation

## v1.0.0 (2023-09-16)


### Changed

* **arch:** Add git extras to installation
* **infra:** Add github workflow configuration
* **infra:** Add pre commit setup
* **infra:** Black automated refactor for quotes
* **infra:** Reconfig pre commit checks
* **workspace:** Add new repositories to workspace
* **workspace:** remove backlog
