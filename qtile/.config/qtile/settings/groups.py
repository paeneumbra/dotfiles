#  __ _ _ _ ___ _  _ _ __ ___
# / _` | '_/ _ \ || | '_ (_-<
# \__, |_| \___/\_,_| .__/__/
# |___/             |_|
# <https://docs.qtile.org/en/latest/manual/config/groups.html>

from libqtile.config import Group

# //TODO: To use icons instead we need to first move out keys and mod and import them here
# also after using the icons - nerdfont icons like "" or "" we need to cycle through them
# unsure if we can assign numbers and represent them differently...
groups = [Group(i) for i in "12345"]
