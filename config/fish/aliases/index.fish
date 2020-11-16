#!/usr/bin/env fish

# (dirname (status -f)) give the current script directory
# see https://github.com/fish-shell/fish-shell/issues/1818
for f in (/bin/ls (dirname (status -f))/*.fish | grep -Ev "index|local")
    source $f
end

# Local add/overrides
if [ -f $HOME/.config/fish/aliases/local.fish ]
    source $HOME/.config/fish/aliases/local.fish
end
