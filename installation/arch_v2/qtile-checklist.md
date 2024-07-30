# Installation checklist

After a clean installation validate the following.

WIP: Based on awesome, requires modification

- LOGS: `~/.local/share/qtile/qtile.log`

- [x] Zsh is loading completions out of order?
- [ ] [!] Move path configuration to zshenv
    - <https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout>
- [x] Poetry
- [x] Intellij
- [ ] Fix all DEPRECATED and WIP notes

- [ ] Dual monitor setup (to review, unsure what is needed in qtile)
    - [ ] xrandr display names remain the same (eDP-1, DP-2, ...)
    - [ ] Second screen in the correct position
    - [ ] PC gets blocked after removal of 1 monitor
- [ ] Sound works
    - [ ] On firefox
        - [ ] Changing sound in the sidebar
        - [ ] Mute on the bottom bar
- [x] Bluetooth setup
- [ ] Iosevka is present from nerd-fonts repos
    - [ ] Alacritty shows glyphs - missing on git (e.g. workspace)
    - [ ] urxvt font is reasonable and glyphs are present
    - [ ] wezterm does not complain in regards to glyphs
- [x] Battery dual setup works
- [ ] Brightness
- [ ] Steam
    - [ ] Proton is enabled
    - [ ] Games are installable correctly and run accordingly
- [ ] Picom
    - [ ] Transparency is enabled in alacritty
- [x] Microphone
- [x] Camera
- [ ] Neovim select text to clipboard
- [ ] Intellij is not responding to qtile commands
- [x] Slack and Skype
    - [x] Camera is working, microphone does not look like
    - [x] Microphone also works
- [x] Game accounts
- [x] Nvidia GPU
    - [x] nvidia-prime

- [ ] Qtile updates
    - [ ] Kill redshift everytime refresh is pressed or set it in the xinitrc
    - [ ] Monitor unplugging is not working and blocks keybord for a bit
