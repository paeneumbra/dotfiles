# Installation

- Install Arch Linux using [archinstall](https://github.com/archlinux/archinstall).

## Anvil

Clone the anvil repository

```shell
mkdir -p foundry
git clone git@github.com:itzalak/anvil.git foundry/anvil
```

## Minimal setup

Run minimal linux installation setup manually

```shell
./foundry/anvil/installation/linux/minimal-setup.sh
```

or

```shell
curl -fsSL https://raw.githubusercontent.com/itzalak/anvil/refs/heads/main/installation/linux/minimal-setup.sh | bash
```

## Task

```shell
task: linux:awesome
task: linux:gnome
task: linux:qtile
```

Setup foundry

```shell
task: foundry:setup
```

## Other environments

For adding a new desktop create a new user and assign to wheel group. Don't forget to add the sudo config file
in the `sudoers.d` directory.

```shell
useradd -m -G wheel -s /bin/bash {{user}}
sudo passwd {{user}}
```
