#  __ _ _ _ ___ _  _ _ __ ___
# / _` | '_/ _ \ || | '_ (_-<
# \__, |_| \___/\_,_| .__/__/
# |___/             |_|
# <https://docs.qtile.org/en/latest/manual/config/groups.html>

from libqtile.command import lazy
from libqtile.config import DropDown, Group, Key, ScratchPad

from settings.keys import keys, mod, terminal

# //TODO: To use icons instead we need to first move out keys and mod and import them here
# also after using the icons - nerdfont icons like "" or "" we need to cycle through them
# unsure if we can assign numbers and represent them differently...
groups = [Group(i) for i in "12345"]

for i in groups:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
