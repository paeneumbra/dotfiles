#  _                    _
# | |__ _ _  _ ___ _  _| |_ ___
# | / _` | || / _ \ || |  _(_-<
# |_\__,_|\_, \___/\_,_|\__/__/
#         |__/
# <https://docs.qtile.org/en/latest/manual/ref/layouts.html>

from libqtile import layout
from libqtile.config import Match

from settings.colors import color00, color02

layout_defaults = {
    "border_width": 2,
    "margin": 10,
    "border_focus": color02,
    "border_normal": color00,
}

layouts = [
    # TODO: Closer, but still no resize available - RTD
    layout.MonadThreeCol(**layout_defaults),
    layout.MonadTall(**layout_defaults),
    layout.Max(**layout_defaults),
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        # WIP: these are just examples
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
    ]
)
