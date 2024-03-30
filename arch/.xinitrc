#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I $HOME ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec awesome 2>~/.cache/.awesome.err > ~/.cache/.awesome.out
