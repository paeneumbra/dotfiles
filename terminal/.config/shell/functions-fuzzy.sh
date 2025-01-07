#!/bin/bash

case "$(uname)" in
Linux)
  if command -v wl-copy &>/dev/null; then
    # Wayland
    CLIPBOARD_CMD="wl-copy"
  elif command -v xclip &>/dev/null; then
    # X11
    CLIPBOARD_CMD="xclip -selection clipboard"
  fi
  ;;
Darwin)
  CLIPBOARD_CMD="pbcopy"
  ;;
*)
  echo "Unsupported OS: $(uname)"
  exit 1
  ;;
esac

export FZF_DEFAULT_OPTS="--preview-window='right,60%,border-bold,+{2}+3/3,~3' --color 'header:#ffc700,border:#ffc700' --info='inline-right' --no-separator --no-scrollbar --padding 2%"

# Find command
# Pressing `ESC` aborts, printing the modified or incomplete command
fcmd() {
  printf '%s\n' "$(fc -rnl 1 | fzf -q "$1" \
    --header 'Options >>> Press ESC to keep modified command ' \
    --prompt 'Find Command> ' \
    --bind 'esc:print-query+abort')"
}

# Find environment variable
fev() {
  printenv | fzf -q "$1"
}

# Find in file with fzf, rg and bat
fif() {
  RG_PREFIX="rg --column --line-number --no-heading --color=always --hidden --glob='!.git' --smart-case"
  INITIAL_QUERY="${*:-}"
  : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --header 'Options >>> CTRL-Y: Copy filepath to clipboard' \
    --prompt 'Find in file > ' \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}' \
    --bind "ctrl-y:execute-silent(echo {1} | '$CLIPBOARD_CMD')+abort" \
    --bind 'enter:become(nvim {1} +{2})+abort'
}

# Find file with fd, fzf and open in nvim
ffile() {
  FD_PREFIX="fd --hidden --no-ignore --ignore-case --type file"
  INITIAL_QUERY="${*:-}"
  : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --header 'Options >>> CTRL-Y: Copy filepath to clipboard' \
    --prompt 'Find File > ' \
    --bind "start:reload:$FD_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $FD_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {}' \
    --bind "ctrl-y:execute-silent(echo {1} | '$CLIPBOARD_CMD')+abort" \
    --bind 'enter:become(nvim {1})+abort'
}

# Find directory and move to it or copy to clipboard
fdir() {
  FD_PREFIX="fd --hidden --no-ignore --ignore-case --type directory"
  INITIAL_QUERY="${*:-}"
  DIR="$(: | fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --header 'Options >>> CTRL-Y: Copy filepath to clipboard' \
    --prompt 'Find Directory > ' \
    --bind "start:reload:$FD_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $FD_PREFIX {q} || true" \
    --delimiter : \
    --preview 'tree -C {}' \
    --bind "ctrl-y:execute-silent(echo {} | '$CLIPBOARD_CMD')+abort")"
  cd "$DIR" || exit
}

# Find by extension with fd, fzf and open in nvim
fde() {
  FD_PREFIX="fd --hidden --no-ignore --ignore-case --extension"
  INITIAL_QUERY="${*:-}"
  : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --header 'Options >>> CTRL-Y: Copy filepath to clipboard' \
    --prompt 'Find by Extension > ' \
    --bind "start:reload:$FD_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $FD_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {}' \
    --bind "ctrl-y:execute-silent(echo {} | '$CLIPBOARD_CMD')+abort" \
    --bind 'enter:become(nvim {1})'
}

# Find directory and open it with IDE
fide() {
  FD_PREFIX="zoxide query -l"
  INITIAL_QUERY="${*:-}"
  : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --header 'Options >>> ENTER: idea / CTRL-N nvim / CTRL-Y pycharm' \
    --prompt 'Open in IDE > ' \
    --bind "start:reload:$FD_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $FD_PREFIX {q} || true" \
    --delimiter : \
    --preview 'tree -C {}' \
    --bind 'enter:become(nvim {1})' \
    --bind 'ctrl-n:become(pycharm {1})' \
    --bind 'ctrl-y:become(idea {1})'
}
