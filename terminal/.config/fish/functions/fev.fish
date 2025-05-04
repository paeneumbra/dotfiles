function fev --description 'Find environment variables'
    printenv | fzf_wrapper -q "$argv"
end
