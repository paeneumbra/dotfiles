#  _
# | |_____ _  _ ___
# | / / -_) || (_-<
# |_\_\___|\_, /__/
#          |__/
# <https://docs.qtile.org/en/latest/manual/config/keys.html>

from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.core.manager import Qtile

mod = "mod1"
terminal = guess_terminal("wezterm")

keys = [
    # //TODO: Take a deeper look into the commands available
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Focus left"),
    Key([mod], "l", lazy.layout.right(), desc="Focus right"),
    Key([mod], "j", lazy.layout.down(), desc="Focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Focus up"),
    Key([mod], "n", lazy.layout.next(), desc="Next focus"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow up"),
    Key([mod, "control"], "n", lazy.layout.normalize(), desc="Reset window sizes"),
    # Spawn a terminal, will guess one if not available
    Key([mod], "Return", lazy.spawn(terminal), desc="Terminal"),
    # Toggle between different layouts as defined below
    Key([mod, "control"], "space", lazy.next_layout(), desc="Toggle layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    # Rofi + drun
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "space", lazy.spawn("rofi -theme base -modi drun -show drun")),
    Key([mod], "Tab", lazy.spawn("rofi -theme base -modi window -show window")),
]

# TODO: I have no clue how to setup wayland
# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: Qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )
