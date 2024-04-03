#  ___ __ _ _ ___ ___ _ _  ___
# (_-</ _| '_/ -_) -_) ' \(_-<
# /__/\__|_| \___\___|_||_/__/
#
# <https://docs.qtile.org/en/latest/manual/config/screens.html>

from libqtile import widget, bar
from libqtile.config import Screen
from libqtile.lazy import lazy

from settings.keys import terminal

# TODO: for now I focused on utility but later would be nice to have color for states like no wireless or volume
# also, the damn icons don't have the same size - again.
launcher_icon = widget.TextBox(
    fmt=" 󱓞 ",
    mouse_callbacks={"Button1": lazy.spawn("rofi -theme base -modi drun -show drun")},
)

volume_icon = widget.TextBox(
    fmt="  ", mouse_callbacks={"Button1": lazy.spawn("pavucontrol")}
)

bluetoot_icon = widget.TextBox(
    fmt=" 󰂯 ", mouse_callbacks={"Button1": lazy.spawn([terminal, "-e", "bluetoothctl"])}
)

wireless_icon = widget.TextBox(
    fmt="󰖩 ", mouse_callbacks={"Button1": lazy.spawn([terminal, "-e", "nmtui"])}
)
screens = [
    Screen(
        # TODO: Move all this to bar.py
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # widget.StatusNotifier(),
                widget.Systray(),
                launcher_icon,
                volume_icon,
                bluetoot_icon,
                wireless_icon,
                # TODO: Is only considering one of the batteries
                widget.Battery(
                    format=" 󰁹 {percent:2.0%}",
                ),
                widget.Clock(format="%Y-%m-%d %a %H:%M"),
                widget.QuickExit(default_text="  ", countdown_start=10),
            ],
            24,
            # opacity=1,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]
