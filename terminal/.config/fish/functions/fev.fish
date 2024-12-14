# Find environment variable
function fev
    printenv | fzf -q "$argv"
end
