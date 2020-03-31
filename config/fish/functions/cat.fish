function cat --wraps bat
    if type -q bat
        bat $argv
    else
        /bin/cat $argv
    end
end
