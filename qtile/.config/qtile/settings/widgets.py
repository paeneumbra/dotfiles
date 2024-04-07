#         _    _          _
# __ __ _(_)__| |__ _ ___| |_ ___
# \ V  V / / _` / _` / -_)  _(_-<
#  \_/\_/|_\__,_\__, \___|\__/__/
#               |___/
# < https://docs.qtile.org/en/latest/manual/ref/widgets.html>
# <https://docs.qtile.org/en/latest/manual/commands/api/widgets.html>

from libqtile import widget
from libqtile.lazy import lazy

from settings.colors import bg, red
from settings.defaults import font, font_size, terminal

widget_defaults = dict(font=font, fontsize=font_size, padding=3, background=bg)

extension_defaults = widget_defaults.copy()

# TODO: for now I focused on utility but later would be nice to have color for states like no wireless or volume
# also, the damn icons don't have the same size - again.
launcher_icon = widget.TextBox(
    fmt=" 󱓞 ",
    mouse_callbacks={"Button1": lazy.spawn("rofi -theme base -modi drun -show drun")},
)

volume_icon = widget.TextBox(
    fmt="  ", mouse_callbacks={"Button1": lazy.spawn("pavucontrol")}
)

bluetooth_icon = widget.TextBox(
    # TODO: There is a bluetooth widget but I cannot understand it
    fmt=" 󰂯 ",
    mouse_callbacks={"Button1": lazy.spawn([terminal, "-e", "bluetuith"])},
)

bar_widgets = [
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
    # widget.Clipboard(
    #     # background=1
    #     # foreground=2
    # ),
    ###
    widget.Battery(
        battery=0,
        charge_char="",
        discharge_char="󰁽",
        full_char="󰁹",
        unknow_char="󰁹",
        not_charging_char="󰁹",
        low_percentage=0.2,
        low_background=red,
        notify_bellow=20,
        show_short_text=False,
        update_interval=1,
        format=" {char} {percent:2.0%}",
    ),
    widget.Battery(
        battery=1,
        charge_char="",
        discharge_char="󰁽",
        full_char="󰁹",
        unknow_char="󰁹",
        not_charging_char="󰁹",
        low_percentage=0.2,
        low_background=red,
        notify_bellow=20,
        show_short_text=False,
        update_interval=1,
        format=" {char} {percent:2.0%}",
    ),
    ###
    widget.Volume(update_interval=0.1, emoji=True, volume_app="pavucontrol"),
    launcher_icon,
    volume_icon,
    bluetooth_icon,
    widget.Wlan(
        update_interval=1,
        interface="wlp3s0",
        format=" 󰖩 ",
        disconnected_message=" 󰖪 ",
        mouse_callbacks={"Button1": lazy.spawn([terminal, "-e", "nmtui"])},
    ),
    ###
    widget.Spacer(
        length=10,
    ),
    widget.Systray(),
    widget.Clock(format="%Y-%m-%d %a %H:%M"),
    widget.QuickExit(default_text="  ", countdown_start=10),
]
