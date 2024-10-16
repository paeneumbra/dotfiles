#     _      __           _ _
#  __| |___ / _|__ _ _  _| | |_ ___
# / _` / -_)  _/ _` | || | |  _(_-<
# \__,_\___|_| \__,_|\_,_|_|\__/__/
#

from os import path
from libqtile.utils import guess_terminal

qtile_path = path.join(path.expanduser("~"), ".config", "qtile")

font = "IosevkaTerm Nerd Font"
font_size = 16
term1 = "wezterm"
term2 = "alacritty"

# Consider moving to EzKeys and using the proper name for keys
mod = "mod1"
terminal = guess_terminal(term1)
