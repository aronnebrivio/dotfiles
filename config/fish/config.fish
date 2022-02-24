#
### GLOBAL VARIABLES
#
# Editor
set -x EDITOR vim
set -x GIT_EDITOR $EDITOR
set -x SUDO_EDITOR $EDITOR

#
### OTHER
#
# Set locale
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8

# Enable terminal Nerd Fonts
set -g theme_nerd_fonts yes

#
### THEME
#
# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

#
### LOCAL CONFIGS OVERRIDE
#
# (local settings or computer specific config for example)
if [ -f $HOME/.config/fish/local.fish ]
    source $HOME/.config/fish/local.fish
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

# Theme config
if [ -f $HOME/.config/fish/theme.fish ]
    source $HOME/.config/fish/theme.fish
end

# Deduplicate paths
dedup_paths
