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
set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths


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

# Bobthefish config
set -g theme_display_git_master_branch yes


#
### LOCAL CONFIGS OVERRIDE
#
# (local settings or computer specific config for example)
if [ -f $HOME/.config/fish/local.fish ]
    source $HOME/.config/fish/local.fish
end
