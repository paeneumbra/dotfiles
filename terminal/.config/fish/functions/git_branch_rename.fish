# Rename local branch
function git_branch_rename
    if test (count $argv) -ne 2
        echo "Use: git_branch_rename old_branch_name new_branch_name"
        return 1
    end
    git branch -m $argv[1] $argv[2]
end
