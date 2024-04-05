#  ___ __ _ _ ___ ___ _ _  ___
# (_-</ _| '_/ -_) -_) ' \(_-<
# /__/\__|_| \___\___|_||_/__/
#
# <https://docs.qtile.org/en/latest/manual/config/screens.html>
# <https://docs.qtile.org/en/latest/manual/config/screens.html#bar>
# <https://docs.qtile.org/en/latest/manual/commands/api/bars.html>

from libqtile import bar
from libqtile.config import Screen

from settings.widgets import bar_widgets


screens = [
    Screen(
        top=bar.Bar(bar_widgets, 24),
    ),
]
