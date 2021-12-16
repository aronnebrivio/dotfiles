#!/usr/bin/env fish

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

#
### base16 theme for Vim
#
if functions -q base16-monokai
    base16-monokai
end

# Oh-My-Posh
oh-my-posh --init --shell fish --config ~/.omp.json | source
