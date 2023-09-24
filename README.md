# Workspace

Personal workspace mostly for development.

## Installation

This configuration is for an Arch Linux machine and installed
using [archinstall v2.5.2](https://github.com/archlinux/archinstall/tree/v2.5.2).

**NOTE:** Setup was designed for `bspwm`, however in the meantime I got a bit curious
about `lua` and started playing around with `awesomewm`.
All configurations pertaining to `bspwm` were removed.

Clone the workspace repository.

```shell
git clone https://github.com/simao-ferreira/workspace.git
```

Instructions are included in the [makefile](./makefile), run them will do the trick.

## Awesomewm

Take look into [awesome readme](./sys/.config/awesome/README.md)

## Configuration

### Color scheme

This setup is designed for integrating the same colorscheme as smoothly as I had opportunity to make it.
Was initially designed for `bspwm` but it works similarly for `awesomewm`.

The color settings are heavily dependent on the `.Xresources` file, including `awesomewm`.

More information and details can be found in [decorator](./sys/.config/decorator), inside scripts can be
found for using a json color scheme file - I personally use [terminal.sexy](https://terminal.sexy/) - and
porting the result for `.Xresources` and other required formats.

### Zsh

Configuration for zsh can be found under [sys folder](./sys) and can it can be setup by copying the files to the proper
location, via symlink or [stow](https://www.gnu.org/software/stow/).

It uses a self-installed, self-managed plugin manager called [zimfw](https://github.com/zimfw/zimfw) that will install
itself and setup all needed plugins once zsh is started.
Plugin configuration can be found in the [.zimrc file](./sys/.config/zsh/.zimrc).
A folder will automatically be created as `.zim` to store all required files for `zimfw`.

Global variable `ZDOTDIR` is defined under `./zshenv` as `$HOME/.config/zsh`. This tells zsh to look for further
configurations files in that directory.
In `./zshrc` we load all configuration files within the `ZDOTDIR` directory ending in `*.zsh`. This is not required but
it facilitates managing special configurations and settings.

<details>
<summary>Structure</summary>
<br>

```shell
.
├── .config
│   └── zsh
│       ├── 00-path.zsh
│       ├── 02-aliases.zsh
│       ├── 04-history.zsh
│       ├── 05-git.zsh
│       ├── ..
│       ├── 99-starship.zsh
│       ├── .zimrc
│       └── .zshrc
└── .zshenv
```

</details>

## Gnome

For using a full gnome desktop create a new user and assign to wheel group.

```shell
useradd -m -G wheel -s /bin/bash {{user}}
sudo passwd {{user}}
```

For installation follow instructions in [makefile](./arch-installation/makefile) setup-gnome instead of setup-awesome.

## Issues

Some issues might arise while configuring this application, initializing submodules and cloning uses ssh and for it to
work ssh must be configured with github.
