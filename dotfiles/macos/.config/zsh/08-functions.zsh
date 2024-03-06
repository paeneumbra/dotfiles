# Find directory with zoxide and fzf
function zd() {
  local dir
  dir=$(zoxide query -l "$1" | fzf)
  cd "$dir" || exit
}

# Find file and move to directory with fzf
function zfiledir() {
  local file
  local dir
  file=$(fzf -q "$1")
  dir=$(dirname "$file")
  cd "$dir" || exit
}

# Find command with fzf, pressing `ESC` aborts with the modified or incomplete command
function fcmd() {
  print -z "$(fc -rnl 1 | fzf -q "$1" \
    --prompt 'ESC to keep modified cmd> ' \
    --bind esc:print-query+abort)"
}

# Print envs with fzf
function envs() {
  printenv | fzf -q "$1"
}

# Find in file with fzf, rg and bat
function fif() {
  RG_PREFIX="rg --column --line-number --no-heading --color=always --hidden --glob='!.git' --smart-case "
  INITIAL_QUERY="${*:-}"
  : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --prompt 'Find in file (ctrl-y to clipboard) > ' \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}' \
    --preview-window 'right,60%,border-bottom,+{2}+3/3,~3' \
    --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort,enter:become(nvim {1} +{2})'
}

# find file or directory with fzf - does not work as expected
function fzfind() {
  fzf --prompt 'Files> ' \
    --header 'CTRL-T: Switch between Files/Directories' \
    --bind 'ctrl-t:transform:[[ ! $FZF_PROMPT =~ Files ]] &&
              echo "change-prompt(Files> )+reload(fd --hidden --no-ignore --ignore-case --type file)" ||
              echo "change-prompt(Directories> )+reload(fd --hidden --no-ignore --ignore-case --type directory)"' \
    --preview '[[ $FZF_PROMPT =~ Files ]] && bat --color=always {} || tree -C {}' \
    --bind 'enter:become(nvim {1})'
}

# Find file with fd, fzf and open in nvim
function ffile() {
  FD_PREFIX="fd --hidden --no-ignore --ignore-case --type file"
  INITIAL_QUERY="${*:-}"
  : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --prompt 'Files (ctrl-y to clipboard) > ' \
    --bind "start:reload:$FD_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $FD_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {}' \
    --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort,enter:become(nvim {1})'
}

# Find directory and move to it or copy to clipboard
function fdir() {
  FD_PREFIX="fd --hidden --no-ignore --ignore-case --type directory"
  INITIAL_QUERY="${*:-}"
  DIR="$(: | fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --prompt 'Directory (ctrl-y to clipboard) > ' \
    --bind "start:reload:$FD_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $FD_PREFIX {q} || true" \
    --delimiter : \
    --preview 'tree -C {}' \
    --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort')"
  cd "$DIR" || exit
}

# Find by extension with fd, fzf and open in nvim
function fde() {
  FD_PREFIX="fd --hidden --no-ignore --ignore-case --extension"
  INITIAL_QUERY="${*:-}"
  : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --prompt 'Extention (ctrl-y to clipboard) > ' \
    --bind "start:reload:$FD_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $FD_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {}' \
    --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort,enter:become(nvim {1})'
}

# Find directory and open it with IDE
function zide() {
  FD_PREFIX="zoxide query -l "
  INITIAL_QUERY="${*:-}"
  : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --prompt 'enter idea, ctrl-n nvim, ctrl-o code, ctrl-y pycharm> ' \
    --bind "start:reload:$FD_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $FD_PREFIX {q} || true" \
    --delimiter : \
    --preview 'tree -C {}' \
    --bind 'enter:become(idea {1})' \
    --bind 'ctrl-n:become(nvim {1})' \
    --bind 'ctrl-o:become(code {1})' \
    --bind 'ctrl-y:become(pycharm {1})'
}
