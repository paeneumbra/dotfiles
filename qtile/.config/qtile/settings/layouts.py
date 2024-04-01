#  _                    _
# | |__ _ _  _ ___ _  _| |_ ___
# | / _` | || / _ \ || |  _(_-<
# |_\__,_|\_, \___/\_,_|\__/__/
#         |__/
# <https://docs.qtile.org/en/latest/manual/ref/layouts.html>

from libqtile import layout
from libqtile.config import Match

layouts = [
    # TODO: Spiral behavior is not what I expected - actually none of them are
    # For weird reasons can't enlarge, or resize, always spawns on the largest size
    # layout.Spiral(
    #     border_focus="#5f981a", border_normal="#1F1D2E", border_width=5, margin=10
    # ),
    # TODO: Closer, but still no resize available - RTD
    layout.MonadTall(
        border_focus="#5f981a", border_normal="#1F1D2E", border_width=5, margin=10
    ),
    layout.Bsp(
        border_focus="#5f981a", border_normal="#1F1D2E", border_width=5, margin=10
    ),
    layout.Max(),
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
    ]
)
