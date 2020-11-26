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
nnoremap <leader>u :UndotreeShow<CR>
" netrw tree
nnoremap <leader>pv :wincmd v<bar> :Explore <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>

" coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" tabs
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
  Plug 'kien/ctrlp.vim'
  Plug 'mbbill/undotree'
  Plug 'elmcast/elm-vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-sensible'
  Plug 'arcticicestudio/nord-vim'
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

" Nord
:colorscheme nord

" Ripgrep
if executable('rg')
  let g:rg_derive_root='true'
endif

" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0 

" Tmux (not actually a plugin)
autocmd VimResized * :wincmd = " auto resize vim size on tmux size change

" coc
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set updatetime=300
set shortmess+=c
