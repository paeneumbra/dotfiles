# Awesome

Awesome wm configuration files.

**NOTE:** This is a personal setup with a lot of coupling, might not work as expected for someone else.

## Details

Setup dependencies:

- OS: [arch](https://archlinux.org/)
- WM: [awesomewm](https://awesomewm.org/apidoc/index.html) using [aur/awesome-git](https://github.com/awesomeWM/awesome)
- Compositor: [picom](https://github.com/yshui/picom)
- Shell: [zsh](https://www.zsh.org/) with [zimfw](https://zimfw.sh/)
- Terminal: [wezterm](https://wezfurlong.org/wezterm/index.html), [alacritty](https://alacritty.org/) and [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html)
- Launcher: [rofi](https://davatorium.github.io/rofi/)
- File Manager: [ranger](https://ranger.github.io/)
- Editor [neovim](https://neovim.io/) with [my own config](https://github.com/itzalak/nvim)
- Font: [Iosevka](https://typeof.net/Iosevka/) via [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
- Glyphs: [Material Design Icons](https://pictogrammers.com/library/mdi/) and [Noto Color Emoji](https://github.com/googlefonts/noto-emoji)

<details>
<summary>Other dependencies</summary>
<br>

- redshift
- starship
- bluetuith
- brightnessctl
- nmtui via networkmanager
- xrandr
- pipewire

</details>

Instructions can be found in the [taskfile](/taskfiles/taskfile.linux.yml) and [installation scripts](/installation/linux)

### Color scheme

To set up correctly the color scheme please read [decorator](/terminal/.config/decorator/README.md) instructions.

## Issues

During setup, it can happen that some references have changed, this will most certainly happen for monitors and disk.
For getting new display namings run `xrandr` and replace all references in the project - e.g. `eDP-1`, `eDP-1-1`.

NOTE: Depending on the active graphics card the monitor names are different
TODO: Should be automated already?

```shell
xrandr -q
```

For disk setup run `lsblk -f` and replace the with new disk path.

TODO: Can this be automated?

## Acknowledgements

- [rklyz](https://github.com/rklyz/MyRice)
- [rxyhn](https://github.com/rxyhn/yoru)
