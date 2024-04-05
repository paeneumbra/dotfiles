#                  _      _                  _
#  ___ __ _ _ __ _| |_ __| |_  _ __  __ _ __| |
# (_-</ _| '_/ _` |  _/ _| ' \| '_ \/ _` / _` |
# /__/\__|_| \__,_|\__\__|_||_| .__/\__,_\__,_|
#                             |_|
# <https://docs.qtile.org/en/latest/manual/config/groups.html#scratchpad-and-dropdown>

from libqtile.command import lazy
from libqtile.config import ScratchPad, DropDown, Group, Key
from settings.groups import groups
from settings.groups import keys, mod

groups.extend(
    [
        ScratchPad(
            "scratchpad",
            [
                DropDown("term", "alacritty", opacity=0.8, on_focus_lost_hide=True),
            ],
        ),
        # Group("a"),
    ]
)

keys.extend(
    [
        # Toggle dropdown scratchpad with a terminal
        Key([mod], "s", lazy.group["scratchpad"].dropdown_toggle("term")),
    ]
)
