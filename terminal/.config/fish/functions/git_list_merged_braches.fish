# Check if main exists and use instead of master
function git_list_merged_branches
    git branch --merged | grep -Ev '(^\*|^\s*(master|main)$)'
end
