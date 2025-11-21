# Check for branches already merged to master
function git_list_merged_branches
    git branch --merged | grep -Ev '(^\*|^\s*(master|main)$)'
end
