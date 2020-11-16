#!/usr/bin/env fish

switch $LS_SERVICE
    case exa
        alias ls "exa"
        alias ll "exa --long --git -hg"
        alias la "exa --long --git -ahg"
    case "*"
        alias ll "ls -l"
        alias la "ls -la"
end
