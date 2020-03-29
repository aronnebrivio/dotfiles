#
### GLOBAL VARIABLES
#
# Editor
set -x EDITOR vim
set -x GIT_EDITOR $EDITOR
set -x SUDO_EDITOR $EDITOR


#
### PATHS
#
# Composer
# set -gx PATH ~/.config/composer/vendor/bin $PATH

# Npm
# set -gx PATH ~/.npm-global/bin $PATH

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

# Oh My Fish
if [ -f $HOME/.config/fish/omf.fish ]
    source $HOME/.config/fish/omf.fish
end

# Enable terminal Nerd Fonts
set -g theme_nerd_fonts yes

# Colorls
# source (dirname (gem which colorls))/tab_complete.sh

# Fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

#
### THEME
#
# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
    source $HOME/.config/base16-shell/profile_helper.fish
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
