function cat --wraps bat
    if type -q bat
        bat $argv
    else
        cat $argv
    end
end
