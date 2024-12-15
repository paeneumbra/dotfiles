# TODO

## Notes

- checklist
- steps taken
- etc
- Look for [!] or #INP to monitor what is in progress
- Alternatives to gnome?
- Scratchpad, from the top, with a local only todo/wip list like raycast but using python, bash and gum
- Revisit readme files

## Generic

- [ ] Fix all DEPRECATED, TODO and WIP notes
- [x] Add anvil package and add poetry to it
- [x] Design the new clone repositories script
- [x] Move path configuration to zshenv
- [ ] Revisit <https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout>
- [ ] Wezterm config
    - [ ] Colorscheme error
    - [ ] Keybindings
    - [ ] Glyphs and Fonts
- [ ] Ranger revisit images preview
    - [ ] Not working on wezterm for large png files
    - [ ] webp is not recognized
    - [ ] not workin on alacritty
- [ ] Neovim select text to clipboard
- [ ] Ly configuration
    - [ ] Document on readme?
- [x] Games
- [x] Nvidia GPU
    - [x] ~~nvidia-prime~~
- [ ] Consider looking into gamemode: <https://wiki.archlinux.org/title/Gamemode>
- [ ] Explore remapping with <https://github.com/rvaiya/keyd>
- [x] Explore raycast alternatives
    - [x] <https://ulauncher.io/>
        - looks a nice half way between raycast and rofi
        - uses python and some js
        - lots of plugins
    - [x] <https://albertlauncher.github.io/>
    - [x] Why not Rofi/ it has the functionality and allows bash scripts
        - very complex ui config
        - crappy documentation
        - few good examples
- [x] Picom revisit animations
- [x] Installation scripts
    - [x] Figure out how to run a raw github script
        - [x] Automate creation of folder structure
        - [x] Automate repository installation
    - [x] Automate installation scripts
        - [x] Automate stow configuration
- [ ] How to setup dual boot?
- [ ] Give Hyprland a chance again?
- [ ] Give bspwm a chance again?
- [ ] Keybindings (sync use cases between machines)
    - [ ] Consider floating with specific bindings for placement
    - [x] Move screens
    - [x] Rotate between screens
    - [ ] Sync generic keybindings and generate default list
    - [ ] Add application keybindings
        - [ ] Wezterm
        - [ ] Test/validate keybindings are in configuration
    - [ ] Update [keybindings.md](keybindings.md)

## Awesomewm

- [x] Revisit layouts
    - [x] Consider floating layout with keybindings to snap to side, similar to rectangle/raycast config
- [x] Revisit keybindings, many are unused
- [ ] Revisit dashboards
- [ ] Move shutdowm menu to Rofi (can be reused on other wm)

## Gnome

- [ ] How to figure out required packages
- [ ] Export keybindings: <https://askubuntu.com/questions/26056/where-are-gnome-keyboard-shortcuts-stored>
- [ ] Set background from configuration

## Qtile

- QTILE LOGS: `~/.local/share/qtile/qtile.log`
- [ ] Qtile updates
    - [ ] Kill redshift everytime refresh is pressed or set it in the xinitrc
    - [ ] Monitor unpluging is not working and blocks keybord for a bit
- [ ] Dual monitor setup (to review, unsure what is needed in qtile)
    - [ ] xrandr display names remain the same (eDP-1, DP-2, ...)
    - [ ] Second screen in the correct position
    - [ ] PC gets blocked after removal of 1 monitor
- [ ] Intellij is not responding to qtile commands
- [ ] Picom
    - [ ] Works as awsome
- [ ] Sound works
    - [ ] On firefox
    - [ ] Changing sound in the sidebar
    - [ ] Mute on the bottom bar
- [ ] Brightness

## Bspwm

- [ ] Evaluate requirements
    - [ ] Dunst
    - [ ] Polybar (or alternative)
    - [ ] EWW

## Step by step installation

Revisit and update. Look for automation opportunities.

- Create installation flash drive
- Launch archlinux installation from flash drive
- Run archinstall
    - Select Desktop + WM, depending on the configuration some extra packages need to be installed
    - Don't encrypt with LUKS
    - Extra packages to install (git, neovim, bluez, bluez-utils, firefox, zsh, wezterm)
    - Use ly
    - [ ] Explore partitions (2 linux partitions + windows)
- Setup ssh key and add it to git
    - [ ] Write down instructions
- Clone dotfiles (or just copy installation files)
- Run installation scripts in order
- Follow checklist
