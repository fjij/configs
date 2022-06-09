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
set foldlevelstart=99
set foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))
set foldnestmax=3
set foldminlines=1
set fillchars=fold:\ 

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab

" Disable Modelines
set modelines=0
set nomodeline

" Disable hidden
set nohidden

" Specific filetypes
autocmd FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
autocmd FileType solidity setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
autocmd FileType markdown setlocal textwidth=80

" Backups
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Column errors/warnings
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

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
nnoremap <leader>q :q<CR>

" tabs
nnoremap <leader><S-tab> :tabprevious<CR>
nnoremap <leader><tab> :tabnext<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 10gt

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
  Plug 'mbbill/undotree'
  Plug 'elmcast/elm-vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-sensible'
  Plug 'gruvbox-community/gruvbox'
  Plug 'tpope/vim-surround'
  Plug 'TovarishFin/vim-solidity'
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'mhinz/vim-startify'
call plug#end()

" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
