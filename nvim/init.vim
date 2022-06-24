lua << EOF
require("options")
require("remaps")
EOF

" TODO fix this in lua
set undodir=~/.vim/undodir

" Folding
set foldmethod=syntax
set foldlevelstart=99
set foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))
set foldnestmax=3
set foldminlines=1
set fillchars=fold:\ 

" Specific filetypes
autocmd FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
autocmd FileType solidity setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
autocmd FileType markdown setlocal textwidth=80

" Plugins ----------------------------------------------------------------------

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
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'tpope/vim-surround'
  Plug 'TovarishFin/vim-solidity'
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'whatyouhide/vim-lengthmatters'
  Plug 'preservim/nerdcommenter'
call plug#end()

" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
