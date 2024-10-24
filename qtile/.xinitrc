#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I $HOME ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
        for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
                [ -x "$f" ] && . "$f"
        done
        unset f
fi

# Export desktop session
export XDG_CURRENT_DESKTOP='qtile'

# Start qtile
exec qtile start 2>~/.cache/.qtile.err >~/.cache/.qtile.out
