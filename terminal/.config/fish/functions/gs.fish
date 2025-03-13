function gs -d 'git switch/checkout branch using fzf'
    git for-each-ref --format='%(refname:short)' refs/heads | fzf --height 10% --layout=reverse --select-1 | xargs git switch
end
