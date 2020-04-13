function ls --wraps colorls
    if type -q colorls
        colorls $argv
    else
        /bin/ls $argv
    end
end
