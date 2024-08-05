# Awesome

Awesome wm configuration files.

**NOTE:** Ongoing process, it has a lot of quirks, I am still getting the hang of it.

## Details

Setup dependencies:

- OS: [arch](https://archlinux.org/)
- WM: [awesomewm](https://awesomewm.org/apidoc/index.html) using [aur/awesome-git](https://github.com/awesomeWM/awesome)
- Compositor: [picom](https://github.com/yshui/picom)
- Shell: [zsh](https://www.zsh.org/) with [zimfw](https://zimfw.sh/)
- Terminal: [alacritty](https://alacritty.org/) and [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html)
- Launcher: [rofi](https://davatorium.github.io/rofi/)
- File Manager: [ranger](https://ranger.github.io/)
- Editor [neovim](https://neovim.io/) with [my own config](https://github.com/itzalak/nvim)
- Font: [Iosevka](https://typeof.net/Iosevka/) via [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
- Icons: [Material Design Icons](https://pictogrammers.com/library/mdi/)

<details>
<summary>Other dependencies</summary>
<br>

- redshift
- starship
- bluetuith
- brightnessctl
- nmtui via networkmanager
- xrandr
- ttf-nerd-fonts-symbols-2048-em-mono
- ttf-material-design-icons-webfont
- pipewire

</details>

Instructions can be found in [installation-scrips](./../../../installation)

### Color scheme

To have the intended colors running, please update `.Xresources` file.

To set up correctly the color scheme please read [decorator](../../../../base/.config/decorator/README.md) instructions.

## Issues

During setup it can happen that some references have changed, this will most certainly happen for monitors and disk.
For getting new display namings run `xrandr` and replace all references in the project - e.g. `eDP-1`, `eDP-1-1`.

NOTE: Depending on the active graphics card the monitor names are different

```shell
xrandr -q
```

For disk setup run `lsblk -f` and replace the with new disk path.

## Acknowledgements

- [rklyz](https://github.com/rklyz/MyRice)
- [rxyhn](https://github.com/rxyhn/yoru)
