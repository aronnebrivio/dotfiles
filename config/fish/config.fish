# Enable terminal Nerd Fonts
set -g theme_nerd_fonts yes

# Composer
# set -gx PATH ~/.config/composer/vendor/bin $PATH

# Npm
# set -gx PATH ~/.npm-global/bin $PATH

# rbenv
set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths
status --is-interactive; and source (rbenv init -|psub)

# Colorls
# source (dirname (gem which colorls))/tab_complete.sh

# Bobthefish config
set -g theme_display_git_master_branch yes
