#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I $HOME ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

case ${1} in
    awesome) exec awesome 2>~/.cache/.awesome.err > ~/.cache/.awesome.out ;;
    bspwm) exec bspwm 2>~/.cache/.bspwm.err > ~/.cache/.bspwm.out ;;
    gnome)
        export XDG_SESSION_TYPE=x11
        export GDK_BACKEND=x11
        exec gnome-session
    ;;
    *) exec awesome 2>~/.cache/.awesome.err > ~/.cache/.awesome.out ;;
esac

