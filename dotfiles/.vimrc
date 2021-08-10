" lightweight .vimrc for servers

set number
set relativenumber

set colorcolumn=80
highlight ColorColumn ctermbg=8
set nowrap

set foldmethod=syntax
set foldlevelstart=99

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab

set noswapfile
set nobackup

set incsearch

set t_u7=

nnoremap <Space>h :wincmd h<CR>
nnoremap <Space>j :wincmd j<CR>
nnoremap <Space>k :wincmd k<CR>
nnoremap <Space>l :wincmd l<CR>

autocmd VimResized * :wincmd = " auto resize vim size on tmux size change

set updatetime=300
set shortmess+=c
