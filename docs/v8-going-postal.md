# TODO

Revision named after Sir Terry Pratchett Discworld book [Going Postal](https://en.wikipedia.org/wiki/Going_Postal).

## Objective

I have to set up a new machine with very different settings and requirements.

The current setup exists in a uneasy balance between the limitations of the machines I use and a desire to avoid
duplication of configuration/code. Although the initialization is fast(ish), there is still a significant amount
of manual work in configurations that cannot be automated, also considering the differences in hardware and OS
there is a growing number of constraints that make both systems setup subpair in what they could achieve.

Linux is also growing and changing constantly and experimentation comes at a cost in stability and workflow
disruption, that hinders me personally and diminishes the effectiveness of this configuration.

For this new machine the expectation are different, from hardware to usability and that will reflect in the
refactoring happening for v8.

WARN: There is too many unknowns, probably I will create another repository to handle all the testing, and merge
it here at a later date.

## Goals and Ideas

- XFCE, start clean, without making use of the current scripts
- Assert I can  use XFCE as a base stable desktop environment
- Assert I can  use XFCE as a game center
- Assert I can  use XFCE as a code forge
- Dual boot to allow isolated experimentation of new features of linux (e.g. wayland, hyprland, bspwm, etc.)
- Revisit splitting macos, awesome, qtile, zsh and bash, decorator, other common configurations to a different repository
- Revisit ZSH configuration, explore zimfw alternatives
    - Try miso instead of pyenv and sdkamn
- Refactor Awesome configuration to work in tandem with XFCE
- Revisit gnome tools and replace if possible with XFCE tools
- Revisit backup tools

Ideas

- Add installation instructions to neovim for arch and macos (make it not dependent on anvil but still runnable from anvil)
- Try [LibreWolf](https://librewolf.net/) as a privacy driven alternative to firefox
- Try [Vivaldi](https://vivaldi.com/) when a chrome based browser is needed
- Add firefox configuration profile
- Make Thunar usable for XFCE, currently missing some configurations/packages
    - Can I export thunar config? Do I need it?
        - <https://forum.endeavouros.com/t/anyway-to-move-config-settings-for-thunar/56596/7>
    - Unsure if the extraction is working, validate wit zip, rar, tar.gz, etc
    - Read <https://docs.xfce.org/xfce/thunar/start>
- Explore the tilling capabilities of Xfwm
- Test [asusctl](https://wiki.archlinux.org/title/Asusctl)
- Revisit <https://asus-linux.org/> and <https://github.com/bayasdev/envycontrol>
    - <https://wiki.archlinux.org/title/Asusctl>
    - <https://gitlab.com/asus-linux/asusctl>
    - <https://asus-linux.org/manual/asusctl-manual/>
    - <https://asus-linux.org/manual/supergfxctl-manual/>

Other cleanup

- [refactoring](/docs/refactoring.md)
- [keybindings](/docs/keybindings.md)
- [v7](/docs/v7-shogun.md)

### Set up steps

- [ ] Create partitions to enable dual boot
- [ ] Install LTS kernel

## Checklist

Check if the following tools work for XFCE

- [ ] Neovim
- [ ] Browser
- [ ] Bluetooth
    - [ ] Mouse
    - [ ] Headphones
- [ ] Poetry
- [ ] Commitizen
- [ ] Sdkman and Java
- [ ] Intellij
- [ ] Dual monitor
    - [ ] Xrandr
    - [ ] Arandr
- [ ] Alacritty shows glyphs
- [ ] Wezterm has no warning
- [ ] Iosevka
- [ ] Sound
    - [ ] Browser
    - [ ] Spotify
- [ ] Microphone
- [ ] Camera
- [ ] Slack, Skype, Team
    - [ ] Camera
    - [ ] Onboard microphone
    - [ ] Headset microphone
- [ ] Nvidia GPU
- [ ] Games
- [ ] Ranger
- [ ] Keybindings
- [ ] Hardware buttons

### Open Questions

- [ ] Is urxvt needed for base configuration of XFCE or awesome?
- [ ] Does an alternative exists for redshift?
    - [ ] Revisit the configuration
- [ ] Nvidia prime is still required?
