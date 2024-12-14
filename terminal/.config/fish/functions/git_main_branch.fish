# Check if main exists and use instead of master
function git_main_branch
    if not git rev-parse --git-dir &>/dev/null
        return
    end

    for ref in refs/heads/main refs/heads/master refs/heads/trunk refs/heads/mainline refs/heads/default \
                refs/remotes/origin/main refs/remotes/origin/master refs/remotes/origin/trunk refs/remotes/origin/mainline refs/remotes/origin/default \
                refs/remotes/upstream/main refs/remotes/upstream/master refs/remotes/upstream/trunk refs/remotes/upstream/mainline refs/remotes/upstream/default
        if git show-ref -q --verify "$ref"
            echo (basename "$ref") # Get the branch name
            return 0
        end
    end

    # If no main branch was found, fall back to master but return error
    echo master
    return 1
end
