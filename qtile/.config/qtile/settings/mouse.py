#  _ __  ___ _  _ ___ ___
# | '  \/ _ \ || (_-</ -_)
# |_|_|_\___/\_,_/__/\___|
#
# <https://docs.qtile.org/en/latest/manual/config/mouse.html>

from libqtile.config import Click, Drag
from libqtile.lazy import lazy

from settings.keys import mod

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
