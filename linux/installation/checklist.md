# Installation checklist

After a clean installation validate the following.

WIP: Requires cleanup

- migration of ranger: <https://github.com/itzalak/lectern/blob/main/notes/cookbook/git-remove-submodule.md>

## Generic

- [ ] Fix all DEPRECATED and WIP notes
- [ ] [!] Move path configuration to zshenv
    - Revisit <https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout>
- [x] Poetry & Commitizen
- [x] Intellij
- [ ] Revisit wezterm -> seems to have a error on the colorscheme
- [ ] Revisit images on ranger -> not working adequatly for wezterm and png large files
- [ ] Neovim select text to clipboard
- [x] ~~Ly configuration~~ Ly nis not configurable from $XDG_CONFIG
- [ ] Explore remapping with <https://github.com/rvaiya/keyd>
- [x] Bluetooth setup
- [x] Iosevka is present from nerd-fonts repos
    - [x] Alacritty shows glyphs - missing on git (e.g. workspace)
    - [x] urxvt font is reasonable, glyph are not necessary, since it's a last resort terminal
    - [x] wezterm does not complain in regards to glyphs
- [x] Battery dual setup works
- [x] Microphone
- [x] Camera
- [x] Slack and Skype
    - [x] Camera is working, microphone does not look like
    - [x] Microphone also works
- [x] Game accounts
- [x] Nvidia GPU
    - [x] nvidia-prime
- [x] Sdkman does not run from script, tweak it or replace it
    - [x] Consider that sdkman and neovim might be needed before running development
- [ ] Consider looking into gamemode: <https://wiki.archlinux.org/title/Gamemode>

## Awesomewm

- [ ] New layout menus
- [ ] Picom
    - [ ] Transparency is enabled in alacritty
- [ ] Sound works
    - [ ] On firefox
    - [ ] Changing sound in the sidebar
    - [x] Mute on the bottom bar
- [ ] Nvidia active button?
- [ ] Brightness

## Gnome

- [x] Nvidia prime
- [x] Steam and Proton
    - [x] Proton is enabled
    - [x] Games are installable correctly and run accordingly
- [x] MC launcher
    - [x] set the new runner using nvidia-prime
- [ ] Export keybindings: <https://askubuntu.com/questions/26056/where-are-gnome-keyboard-shortcuts-stored>
- [ ] Set background from configuration

## Qtile

- QTILE LOGS: `~/.local/share/qtile/qtile.log`
- [ ] Qtile updates
    - [ ] Kill redshift everytime refresh is pressed or set it in the xinitrc
    - [ ] Monitor unplugging is not working and blocks keybord for a bit
- [ ] Dual monitor setup (to review, unsure what is needed in qtile)
    - [ ] xrandr display names remain the same (eDP-1, DP-2, ...)
    - [ ] Second screen in the correct position
    - [ ] PC gets blocked after removal of 1 monitor
- [ ] Intellij is not responding to qtile commands
- [ ] Picom
    - [ ] Transparency is enabled in alacritty
- [ ] Sound works
    - [ ] On firefox
    - [ ] Changing sound in the sidebar
    - [ ] Mute on the bottom bar
- [ ] Brightness
