source ~/.config/nvim/after/plugin/linter_fixer.vim
source ~/.config/nvim/plugins.vim

let g:python_highlight_all = 1

runtime macros/matchit.vim

" Basics Settings {{{
scriptencoding utf-8

filetype indent plugin on
syntax sync fromstart

" turn off bell on ESC
set noerrorbells visualbell t_vb=

" misc
set nostartofline
set directory=~/tmp
set foldmethod=syntax
set foldlevelstart=99
set incsearch
set number
set relativenumber
set showcmd
set virtualedit=block
" Case sensitivity
" I tried this while ignoring case and it was driving me crazy
set noignorecase
set smartcase
set nocursorcolumn
set cursorline

" Mouse in all but command mode.
set mouse=nvirh
" Use right click as a menu, not extending selection.
set mousemodel=popup_setpos

" No tmp or swp files
set nobackup
set nowritebackup
set noswapfile

" System clipboard
set clipboard+=unnamedplus

" allow unsaved buffers to be hidden
set hidden
" }}}

" Look and Feel {{{
set background=dark
" Make sure to set iTerm to xterm-256color
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" set fillchars=diff:⣿,vert:\│
set fillchars=diff:-,vert:\│
set listchars=nbsp:+,trail:*,precedes:<,extends:>,tab:>\
set splitbelow
set splitright

" Don't try to highlight lines longer than X
set synmaxcol=1000

" Sensible window sizes
set winheight=10
set winwidth=80
set winminheight=1
set winminwidth=5

" no background on vertical split
highlight VertSplit cterm=bold ctermfg=11 ctermbg=NONE

" text wrapping
set textwidth=80
set linebreak     " break at whitespace
set nolist        " list disables linebreak
set nowrap
set lazyredraw    " reduced screen flicker
set breakindent
set breakindentopt=sbr,shift:4
set showbreak=↪>\  " ↪ space
set autoindent smartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set whichwrap+=<,>,h,l,[,]

" make columns outside textwidth blanked out
let &colorcolumn=join(range(&textwidth+1,&textwidth+1),",")

" Sensible side scrolling, makes it like other editors.
" Reduce scroll jump with cursor goes off the screen.
set sidescroll=1
set sidescrolloff=3

" Completion options
"   current buffer, windowed buffers, other loaded bufferes, and tags.
"   different from default by NOT considering unloaded buffers.
"
" 	.	scan the current buffer ('wrapscan' is ignored)
"   w scan buffers from other windows
"   b scan other loaded buffers that are in the buffer list
"   k scan the files given with the 'dictionary' option
"   ] tag completion
set complete=.,w,b,],k
set completeopt=menuone,preview
" }}}

" Markdown Settings {{{
" }}}

if exists('+inccommand')
  set inccommand=nosplit
endif
" }}}

" Autocmds Settings  {{{
" File specific commands should go into ftplugins.
augroup basics_autocmd
  au!
  " set term title to current file
  autocmd BufEnter * let &titlestring=expand("%:t") | set title
  autocmd VimResized * let &previewheight=(winheight(0) * 1/3)

  autocmd WinEnter * if &previewwindow | setlocal nonumber norelativenumber colorcolumn=0 statusline='' | endif
augroup END
" }}}

" Key Mappings {{{
" Reset Leader
nnoremap <Space> <Nop>
let mapleader=" "

" Fix my common typos
command! W w    " write it
command! QQ qa! " quit I mean it!

" <C-@> is same as <S-Space>
inoremap <C-@> <C-n>

" Warning: Scroll 1 line at a time instead of default 3
noremap <ScrollWheelUp> <C-Y>
noremap <ScrollWheelDown> <C-E>
noremap <ScrollWheelLeft> zl
noremap <ScrollWheelRight> zh

" Warning: Faster schooling with C-e/y and keeps cursor in place.
" This is similar to <C-d/u> behavior
nnoremap <C-e> 3<C-e>3gj
nnoremap <C-y> 3<C-y>3gk

" Search Replace Helpers {{{
" Allows use of '.' to change the next occurance of the same work. Totally Sweet!
nnoremap c* #*cgn
nnoremap c# *#cgn
nnoremap <Leader>*  /\v<<C-r><C-w>><CR><C-o>
nnoremap <Leader>// /\v<<C-r><C-w>><CR><C-o>
nnoremap <Leader>/w /\v<><left>
nnoremap <Leader>/s :%s/\v<<C-r><C-w>>//gce<left><left><left>
vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR><C-o>'
vnoremap s :s/\v//g<left><left><left>
" }}}

" easier @@
nnoremap \ @@

" Some terminals double hit C-o when only a single is typed.
" So I need to bind C-o to another key.
nnoremap <C-\> <C-o>

" cut/copy/paste helpers {{{
vnoremap <Leader>x d
vnoremap <Leader>c ygv
vnoremap <Leader>v "_p
nnoremap <Leader>y myyiw`y
nnoremap <Leader>p mp"_diwP`p
" visually select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" }}}

" Nerd Tree / Netrw {{{
let g:netrw_liststyle=3
let g:netrw_altfile=1
let g:netrw_winsize=25
" nnoremap <Leader>n :Lexplore<CR>
" nnoremap - :exe 'Lexplore' expand('%:h')<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap - :NERDTreeFind<CR>
" }}}

" Easy Command Mode
nnoremap <Leader>; :
" `<CR>` in normal buffer sends `:`
" Creative, but annoying. Too often I accidentally hit <CR> and was typing in
" command mode.
"    nnoremap <silent> <CR> :call feedkeys((&buftype == '' ? ':' : expand("\r")), 'n')<CR>

" Turn on paste mode, paste, turn off paste mode.
nnoremap <silent> <f5> :set paste <bar> exec('norm! p') <bar> set nopaste<cr>

" [c]lear [w]hitespace
function! ClearWhitespace()
  let winview = winsaveview()
  let _s=@/
  execute 'keepjumps %s/\s\+$//e'
  let @/=_s
  nohl
  update
  call winrestview(winview)
endfunction
nnoremap <Leader>cw :call ClearWhitespace()<CR>

" Copy current buffer path to system clipboard
" I picked 5 because it's also the '%' key.
nnoremap <silent> <Leader>5 :let @* = expand("%:p")<CR>:echom "copied: " . expand("%:p")<CR>

" Move through wrapped lines as default, with reverse mappings
" Warning: swapping k with gk and j with gj
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj
nnoremap gk k
nnoremap gj j

" Defaults to w, but should be e like the rest all other basic editors.
" Warning: make S-RIGHT because like the rest of the OS.
nnoremap <S-RIGHT> e

" Center screen after common jumps.
" Warning: This might make you mad, but makes my happy. I'm so selfish.
nnoremap } }zz
nnoremap { {zz
nnoremap zj zjzz
nnoremap zk zkzz

" Faster :ex commands
nnoremap <C-s> :write<CR>
inoremap <C-s> <ESC>:write<CR>
nnoremap <C-q> :close<CR>

" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest,full
set wildignore=
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.bak,*.exe,target,tags,gem.tags
set wildignore+=*.pyc,*.DS_Store,*.db,*.min.js
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.xc*,*.pbxproj,*.xcodeproj/**,*.xcassets/**
set wildignore+=*.js.map,ui/public/client/*,cassettes/**,node_modules/**
" }}}

" Startify {{{
let g:startify_change_to_dir=0
let g:startify_change_to_vcs_root=1
" }}}

" Nvim configurations in Vim
let g:is_nvim = has('nvim')
let g:is_vim8 = v:version >= 800 ? 1 : 0

" Reuse nvim's runtimepath and packpath in vim
if !g:is_nvim && g:is_vim8
  set runtimepath-=~/.vim
    \ runtimepath^=~/.local/share/nvim/site runtimepath^=~/.vim
    \ runtimepath-=~/.vim/after
    \ runtimepath+=~/.local/share/nvim/site/after runtimepath+=~/.vim/after
  let &packpath = &runtimepath
endif
