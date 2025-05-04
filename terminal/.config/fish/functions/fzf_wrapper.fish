function fzf_wrapper --description "Wrapper with environment variables for fzf"
    # Make FZF use fish
    set -f --export SHELL (command --search fish)

    # See https://github.com/junegunn/fzf#environment-variables
    set --query FZF_DEFAULT_OPTS FZF_DEFAULT_OPTS_FILE
    if test $status -eq 2
        set --export FZF_DEFAULT_OPTS "--style full \
        --preview 'fzf-preview.sh {}' \
        --color=gutter:#1e2030 \
        --color=header:#ff966c \
        --color=marker:#ff007c \
        --color=pointer:#ff007c \
        --color=prompt:#828bb8 \
        --color=scrollbar:#82aaff \
        --color 'preview-border:#82aaff,preview-label:#82aaff' \
        --color 'list-border:#82aaff,list-label:#82aaff' \
        --color 'input-border:#82aaff,input-label:#82aaff' \
        --color 'header-border:#ffc777,header-label:#ffc777'\
        --info='inline-right' \
        --no-separator \
        --no-scrollbar \
        --padding 2%"

    end

    fzf $argv
end
