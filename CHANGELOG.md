# Changelog

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

## [3.0.1](https://github.com/simao-ferreira/workspace/compare/v3.0.0...v3.0.1) (2023-10-20)


### Changed

* Add decorator template for iterm - wip ([560fdb9](https://github.com/simao-ferreira/workspace/commit/560fdb94e2a9050789922b75b30d7e8f2814f5a7))
* Add nvim pallete based of thescream ([f404493](https://github.com/simao-ferreira/workspace/commit/f404493749ab88f8eeeea54e511be5c7d342151b))
* Add project the scream to workspace configuration ([9cdc3a8](https://github.com/simao-ferreira/workspace/commit/9cdc3a8dc4a553dd99dd6242be93498f457d5f35))
* Create alias for common folders, nvim update ([40e5b7f](https://github.com/simao-ferreira/workspace/commit/40e5b7f69765cba2c5efa6836fc06dbd05108a16))
* Fix printscreen configuration, update nvim version ([382ab75](https://github.com/simao-ferreira/workspace/commit/382ab755ecd8926a3a79f068c3c06561c4565862))
* **gnome:** Update installation script ([0e8b955](https://github.com/simao-ferreira/workspace/commit/0e8b9552fda11ee9810b981d4f3f80949c7e70a6))
* **infra:** Update neovim ([c3769e3](https://github.com/simao-ferreira/workspace/commit/c3769e390357d83b63db41f33c97fd993702ef6d))
* Refactor gnome installation ([f3e480b](https://github.com/simao-ferreira/workspace/commit/f3e480bcce36fb70986ee4f215e18039f263a884))
* remove cargo installation ([3fea72c](https://github.com/simao-ferreira/workspace/commit/3fea72cde4df39b6cac038609c746045214b1c07))
* Update brewfile intallation for tfsec ([0b80373](https://github.com/simao-ferreira/workspace/commit/0b8037372f8656dfbaa1393510b8eacfa42cbd42))
* Update decorator color schemes ([2772279](https://github.com/simao-ferreira/workspace/commit/2772279456cf8be4fd5e921167fcad85a685ea6a))
* Update nvim ([29dc53d](https://github.com/simao-ferreira/workspace/commit/29dc53de62c60018d69a759ecae91d91c50f2614))
* Update nvim and installation of nvim required packages ([76980a5](https://github.com/simao-ferreira/workspace/commit/76980a5f02c106c356008a5010a7787c70375b87))

## [3.0.0](https://github.com/simao-ferreira/workspace/compare/v2.0.1...v3.0.0) (2023-10-09)


### ⚠ BREAKING CHANGES

* Refactor installation scripts and include macos

### Added

* Refactor configuration ([2dbf9c2](https://github.com/simao-ferreira/workspace/commit/2dbf9c2a091949e57fc684f6e093416d60c7708b))
* Refactor installation scripts and include macos ([a464f77](https://github.com/simao-ferreira/workspace/commit/a464f77f397f540d0fd7d7d87177f218c5938974))
* Update readme files ([cffa443](https://github.com/simao-ferreira/workspace/commit/cffa443f491b89471690c7564390e4dd0f6ef1c5))


### Changed

* Add wallpaper ([7aa9af5](https://github.com/simao-ferreira/workspace/commit/7aa9af5e539790dd364a32ca74b4ddcac97b46cd))
* **infra:** Add submodules again ([d32d2af](https://github.com/simao-ferreira/workspace/commit/d32d2af7a73e8982bd852e33faffb4c73f853bcc))
* **infra:** Fix mac configurations ([24e2b72](https://github.com/simao-ferreira/workspace/commit/24e2b72738a0bbd12cb8d977969a94e615e7f961))
* **infra:** Fix workspace repository list ([ce37681](https://github.com/simao-ferreira/workspace/commit/ce37681e85bb17ba650434c6045696722171d9c0))
* **infra:** Update pre-commit config ([02e5f9f](https://github.com/simao-ferreira/workspace/commit/02e5f9fdcff31aed54e5466724932a1e606a5ad3))

## [2.0.1](https://github.com/simao-ferreira/workspace/compare/v2.0.0...v2.0.1) (2023-10-05)


### Changed

* **arch:** Move from flake8 to ruff, update nvim version ([66c8607](https://github.com/simao-ferreira/workspace/commit/66c8607fe7e8dfb0ffd4f0328542f95c855f285e))
* **arch:** Refactor development and java setup ([d3b0b60](https://github.com/simao-ferreira/workspace/commit/d3b0b608212e16e754b15761472646944fb96479))
* **nvim:** Update nvim setup ([3bfeb69](https://github.com/simao-ferreira/workspace/commit/3bfeb697ae84c15d594c33888b716131de599706))

## [2.0.0](https://github.com/simao-ferreira/workspace/compare/v1.0.2...v2.0.0) (2023-09-27)


### ⚠ BREAKING CHANGES

* Include login manager, add installation for gnome, refactor installation and awesome for graphical use

### Added

* Include login manager, add installation for gnome, refactor installation and awesome for graphical use ([eb7b603](https://github.com/simao-ferreira/workspace/commit/eb7b6036bbbc3b27a4ba8bc2221297a9f2374d12))


### Changed

* **arch:** Fix decorator script, add mc script ([9b6eea4](https://github.com/simao-ferreira/workspace/commit/9b6eea47416dad852412a8640d0ed0507e13ed9e))
* **arch:** Fix gdm awesome startup ([a4d991d](https://github.com/simao-ferreira/workspace/commit/a4d991d7e081bd7d836fc3e2b6661c2e2c72fc53))
* **arch:** Update arch installation with audio tools ([bdd550f](https://github.com/simao-ferreira/workspace/commit/bdd550fae1c4f3b3254e23321a70713a74827323))
* **awesome:** Add awesome bling module for layouts ([937a693](https://github.com/simao-ferreira/workspace/commit/937a693b08715cb3f7542eb8695cb46b6d07b3e2))
* **gnome:** Add gdm configuration manager ([19a28fc](https://github.com/simao-ferreira/workspace/commit/19a28fc50ffe8010f5c69fe04dea6154776b3944))
* **gnome:** Update configuration after launch in gnome ([1b7700e](https://github.com/simao-ferreira/workspace/commit/1b7700ed630474711a66f9d386de82c7c5e459a9))
* **gnome:** Update zsh config with alias for prime switching ([9203fb9](https://github.com/simao-ferreira/workspace/commit/9203fb92e427e82625aeccf10c8ff217d4bb2e65))
* **zsh:** Update zsh plugins with completions ([f3d17d2](https://github.com/simao-ferreira/workspace/commit/f3d17d2d1aed5fa22b54901d55811fa81b7ff4b0))

## [1.0.2](https://github.com/simao-ferreira/workspace/compare/v1.0.1...v1.0.2) (2023-09-22)


### Changed

* **arch:** Refactor arch installation scripts ([c2919ff](https://github.com/simao-ferreira/workspace/commit/c2919ff696239117ed63bf419b5f71e9a5c8fe1d))
* **arch:** Replace xdg-open for handlr, update starship, remove tlpui ([169d051](https://github.com/simao-ferreira/workspace/commit/169d05135b8665918b174dd53d45e3f7db0381d8))
* **infra:** Fix pre-commit configuration for markdown, apply pre commit suggestions ([d6af6fc](https://github.com/simao-ferreira/workspace/commit/d6af6fc6efdc0633748f4cb5b2b6d1fb99c241c1))
* **ranger:** Update ranger config replacing xdg-open for handlr ([efc0bbe](https://github.com/simao-ferreira/workspace/commit/efc0bbea9076ca3092b9e99e84e49608ddcea763))
* **workspace:** Update awesome config for handling new monitor ([e44a3c9](https://github.com/simao-ferreira/workspace/commit/e44a3c957dd7edbdd380ee566aa8d0ad06dd4dca))
* **workspace:** Update nvim ([ef647ce](https://github.com/simao-ferreira/workspace/commit/ef647ce61eb94391dfb3d0a2d65b2f3584fd167c))
* **workspace:** Update nvim ([eb6598a](https://github.com/simao-ferreira/workspace/commit/eb6598ab8e79a67ca6025ab00e8e3d452e5b1c94))
* **workspace:** Update workspace repository list ([c3245c2](https://github.com/simao-ferreira/workspace/commit/c3245c2cf8d5c6f32bf1670827f8cf7f5c75e2cc))

## [1.0.1](https://github.com/simao-ferreira/workspace/compare/v1.0.0...v1.0.1) (2023-09-16)


### Changed

* **arch:** Add tldr package to arch installation ([2ba53cb](https://github.com/simao-ferreira/workspace/commit/2ba53cb56f138817956c01f32bd6f1c12210bafa))

## 1.0.0 (2023-09-16)


### Changed

* **arch:** Add git extras to installation ([f09a8ba](https://github.com/simao-ferreira/workspace/commit/f09a8ba1bce9c0c34ea70c16bd2cd183ed94193a))
* **infra:** Add github workflow configuration ([5d30504](https://github.com/simao-ferreira/workspace/commit/5d30504d8799b97fe26366eee3974587940f37f7))
* **infra:** Add pre commit setup ([3d1ea68](https://github.com/simao-ferreira/workspace/commit/3d1ea68823a31fec4deffa8d7110b31fc120bddb))
* **infra:** Black automated refactor for quotes ([998b8e9](https://github.com/simao-ferreira/workspace/commit/998b8e91c1475a401f2bcd617a10975143e060f7))
* **infra:** Reconfig pre commit checks ([8402572](https://github.com/simao-ferreira/workspace/commit/84025723f6aade7e14cf38b91af3bd301308aeb3))
* **workspace:** Add new repositories to workspace ([02a4185](https://github.com/simao-ferreira/workspace/commit/02a41850ad3a17757db785a9ab0eb8fc2959a038))
* **workspace:** remove backlog ([7b32b1e](https://github.com/simao-ferreira/workspace/commit/7b32b1ee6b768407de261ee05edc103d3a9c3e8f))
