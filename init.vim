" GENERAL
" ------------------------------------------------------------------------------

" Line Numbers
set number
set relativenumber

" Columns
set colorcolumn=80
highlight ColorColumn ctermbg=8
set nowrap

" Syntax
syntax on

" Folding
set foldmethod=syntax
set foldlevel=99

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab

" Backups
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Search
set incsearch

" Don't use that weird nvim cursor
set guicursor=

" Don't start in replace mode fix
set t_u7=


" REMAPS
" ------------------------------------------------------------------------------
let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
" netrw tree
nnoremap <leader>pv :wincmd v<bar> :Explore <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>

nnoremap <leader>te :tabe<SPACE>
nnoremap <leader>tl :tabn<CR>
nnoremap <leader>th :tabp<CR>
nnoremap <leader>tq :tabclose<CR>

" PLUGINS
" ------------------------------------------------------------------------------
" Install vim-plug if not found
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin(stdpath('data') . '/plugged')
  Plug 'jremmen/vim-ripgrep'
  Plug 'tpope/vim-fugitive'
  Plug 'leafgarland/typescript-vim'
  Plug 'vim-utils/vim-man'
  Plug 'lyuts/vim-rtags'
  Plug 'kien/ctrlp.vim'
  Plug 'mbbill/undotree'
  Plug 'elmcast/elm-vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-sensible'
call plug#end()

" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGIN-SPECIFIC
" ------------------------------------------------------------------------------

" netrw (not actually a plugin)
" See https://shapeshed.com/vim-netrw/#netrw---the-unloved-directory-browser
let g:netrw_banner = 0       " Don't show banner
let g:netrw_browse_split = 4 " Open files in previous window
let g:netrw_liststyle = 3    " Tree view
let g:netrw_altv = 1

" Ripgrep
if executable('rg')
  let g:rg_derive_root='true'
endif

" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0 

" Tmux (not actually a plugin)
autocmd VimResized * :wincmd = " auto resize vim size on tmux size change
