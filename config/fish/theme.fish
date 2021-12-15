#!/usr/bin/env fish

#
### BOBTHEFISH CONFIG
#
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

set -g theme_display_git_master_branch yes
set -g theme_color_scheme base16-dark
set -g theme_title_display_process yes
set -g theme_title_use_abbreviated_path yes
set -g theme_display_virtualenv yes

#
### base16 theme
#
if functions -q base16-monokai
    base16-monokai
end
