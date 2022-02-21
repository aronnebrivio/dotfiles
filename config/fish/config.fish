#
### GLOBAL VARIABLES
#
# Editor
set -x EDITOR vim
set -x GIT_EDITOR $EDITOR
set -x SUDO_EDITOR $EDITOR

# ls service (currently supports colorls/exa)
set -x LS_SERVICE exa

#
### PATHS
#
# rbenv
if not contains -- "$HOME/.rbenv/bin" $PATH
    set -gx PATH $HOME/.rbenv/bin $PATH
end


#
### ENV
#
if [ -f $HOME/.config/fish/env/index.fish ]
    source $HOME/.config/fish/env/index.fish
end


#
### ALIASES
#
# Main
if [ -f $HOME/.config/fish/aliases/index.fish ]
    source $HOME/.config/fish/aliases/index.fish
end


#
### OTHER
#
# Set locale
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8

# Fisher
if status is-interactive && ! functions -q fisher
  curl -sL https://git.io/fisher | source && fisher update
end

# Enable terminal Nerd Fonts
set -g theme_nerd_fonts yes

# Auto venv support
# __auto_source_venv

#
### THEME
#
# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Theme config
if [ -f $HOME/.config/fish/theme.fish ]
    source $HOME/.config/fish/theme.fish
end

#
### LOCAL CONFIGS OVERRIDE
#
# (local settings or computer specific config for example)
if [ -f $HOME/.config/fish/local.fish ]
    source $HOME/.config/fish/local.fish
end

# Deduplicate PATH entries
dedup_paths

# Created by `pipx` on 2021-12-16 10:15:00
set PATH $PATH /Users/aronne.brivio/.local/bin
