#         _    _          _
# __ __ _(_)__| |__ _ ___| |_ ___
# \ V  V / / _` / _` / -_)  _(_-<
#  \_/\_/|_\__,_\__, \___|\__/__/
#               |___/
# < https://docs.qtile.org/en/latest/manual/ref/widgets.html>
# <https://docs.qtile.org/en/latest/manual/commands/api/widgets.html>

from libqtile import widget
from libqtile.lazy import lazy

from settings.colors import bg
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

bluetoot_icon = widget.TextBox(
    fmt=" 󰂯 ", mouse_callbacks={"Button1": lazy.spawn([terminal, "-e", "bluetuith"])}
)

wireless_icon = widget.TextBox(
    fmt=" 󰖩 ", mouse_callbacks={"Button1": lazy.spawn([terminal, "-e", "nmtui"])}
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
    widget.Systray(),
    widget.Volume(update_interval=0.1, emoji=True, volume_app="pavucontrol"),
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
]
