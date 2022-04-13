" Plugin manager provided by: https://github.com/junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/chriskempson/base16-vim.git'
Plug 'https://github.com/vim-scripts/dbext.vim'
Plug 'https://github.com/gcavallanti/vim-noscrollbar'
Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/jeetsukumaran/vim-indentwise'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/styled-components/vim-styled-components.git', { 'branch': 'main' }
Plug 'https://github.com/plasticboy/vim-markdown'
Plug 'https://github.com/Quramy/vim-js-pretty-template'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/ddrscott/vim-fugitive'
if has('nvim') == 0
  Plug 'https://github.com/tpope/vim-sensible'
endif
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-vinegar'
Plug 'https://github.com/tommcdo/vim-exchange'

Plug 'https://github.com/mhinz/vim-startify'


Plug 'https://github.com/ddrscott/vim-side-search'
Plug 'https://github.com/ddrscott/vim-window'

" Code Completion
" Plug 'https://github.com/neoclide/coc.nvim', {'tag': '*', 'branch': 'release', 'do': { -> coc#util#install()}}
" Linting
Plug 'https://github.com/w0rp/ale'

" Keep this at the end!
call plug#end()
