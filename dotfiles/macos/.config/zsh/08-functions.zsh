# Find directory with zoxide and fzf
function zd() {
	local dir
	dir=$(zoxide query -l "$1" | fzf)
	z "$dir" || exit
}

# Find file and move to directory with fzf
function zfiledir() {
	local file
	local dir
	file=$(fzf -q "$1")
	dir=$(dirname "$file")
	z "$dir" || exit
}

# Find command with fzf, pressing `ESC` aborts with the modified or incomplete command
function fcmd() {
	print -z "$(fc -rnl 1 | fzf -q "$1" --bind esc:print-query+abort)"
}

# Print envs with fzf
function envs() {
	printenv | fzf
}

function fif() {
	RG_PREFIX="rg --column --line-number --no-heading --color=always --hidden --glob=!.git --smart-case "
	INITIAL_QUERY="${*:-}"
	: | fzf --ansi --disabled --query "$INITIAL_QUERY" \
		--prompt 'Find in file> ' \
		--bind "start:reload:$RG_PREFIX {q}" \
		--bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
		--delimiter : \
		--preview 'bat --color=always {1} --highlight-line {2}' \
		--preview-window 'right,60%,border-bottom,+{2}+3/3,~3' \
		--bind 'enter:become(nvim {1} +{2})'
}

function fzfind() {
	fzf --prompt 'Files> ' \
		--header 'CTRL-T: Switch between Files/Directories' \
		--bind 'ctrl-t:transform:[[ ! $FZF_PROMPT =~ Files ]] &&
              echo "change-prompt(Files> )+reload(fd --hidden --no-ignore --ignore-case --type file)" ||
              echo "change-prompt(Directories> )+reload(fd --hidden --no-ignore --ignore-case --type directory)"' \
		--preview '[[ $FZF_PROMPT =~ Files ]] && bat --color=always {} || tree -C {}' \
		--bind 'enter:become(nvim {1})'
}

function ffile() {
	FD_PREFIX="fd --hidden --no-ignore --ignore-case --type file"
	INITIAL_QUERY="${*:-}"
	: | fzf --ansi --disabled --query "$INITIAL_QUERY" \
		--prompt 'Files> ' \
		--bind "start:reload:$FD_PREFIX {q}" \
		--bind "change:reload:sleep 0.1; $FD_PREFIX {q} || true" \
		--delimiter : \
		--preview 'bat --color=always {}' \
		--bind 'enter:become(nvim {1})'
}

function fdir() {
	FD_PREFIX="fd --hidden --no-ignore --ignore-case --type directory"
	INITIAL_QUERY="${*:-}"
	: | fzf --ansi --disabled --query "$INITIAL_QUERY" \
		--prompt 'Directory> ' \
		--bind "start:reload:$FD_PREFIX {q}" \
		--bind "change:reload:sleep 0.1; $FD_PREFIX {q} || true" \
		--delimiter : \
		--preview 'tree -C {}' \
		--bind 'enter:become(zoxide_z {1})'
}
