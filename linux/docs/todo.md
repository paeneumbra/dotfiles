# TODO

- checklist
- steps taken
- etc

## Notes

- Look for #INP to monitor what is in progress
- migration of ranger: <https://github.com/itzalak/lectern/blob/main/notes/cookbook/git-remove-submodule.md>

## Generic

- [ ] Fix all DEPRECATED and WIP notes
- [ ] Design the new clone workspace script
- [ ] Move path configuration to zshenv
    - Revisit <https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout>
- [ ] Wezterm config
    - [ ] Colorscheme error
    - [ ] Keybindings
    - [ ] Glyphs and Fonts
- [ ] Ranger revisit images preview
    - [ ] Not working on wezterm for large png files
    - [ ] webp is not recognized
- [ ] Neovim select text to clipboard
- [ ] Ly configuration
- [ ] Microphone works on Slack, Skype and Teams
    - [ ] Onboard
    - [ ] Headphones
- [ ] Games
- [ ] Nvidia GPU
    - [ ] nvidia-prime
- [ ] Consider looking into gamemode: <https://wiki.archlinux.org/title/Gamemode>
- [ ] Explore remapping with <https://github.com/rvaiya/keyd>
- [ ] Explore raycast alternatives
    - [ ] <https://ulauncher.io/>
    - [ ] <https://albertlauncher.github.io/>
    - [ ] Add Rofi functionality and scripts
- [ ] Picom revisit animations
    - [ ] Rofi looks clunky
- [ ] Use Rofi for other common uses
    - [ ] Explore desktop
    - [ ] Explore microphone and camera activation
    - [ ] Consider another smaller and cleaner config
    - [ ] Brightness
    - [ ] Use desktop to bring functionality to rofi
    - [ ] Add tabs to main menu (e.g. open )
- [ ] Installation scripts
    - [ ] Figure out how to run a raw github script
        - [ ] Automate creation of folder structure
        - [ ] Automate repository installation
    - [ ] Automate installation scripts
        - [ ] Automate stow configuration
- [ ] How to setup dual boot?
- [ ] Give Hyprland a chance again?
- [ ] Give bspwm a chance again?
- [ ] Keybindings (sync use cases between mchines)
    - [ ] Consider floating with specific bindings for placement
    - [ ] Move screens
    - [ ] Rotate between screens
    - [ ] Sync generic keybindings and generate default list
    - [ ] Add application keybindings
        - [ ] Wezterm
        - [ ] Test/validate keybindings are in configuration
    - [ ] Update [keybindings.md](keybindings.md)

## Awesomewm

- [ ] Revisit layouts
    - [ ] Consider floating layout with keybindings to snap to side, similar to rectangle/raycast config #INP
- [ ] Revisit keybindings, many are unused
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
    - [ ] Monitor unplugging is not working and blocks keybord for a bit
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
