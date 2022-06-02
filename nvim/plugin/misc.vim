" Color scheme
:colorscheme gruvbox
" Support transparent bg
" hi! Normal ctermbg=NONE guibg=NONE

" Ripgrep
if executable('rg')
  let g:rg_derive_root='true'
endif
" nnoremap <leader>ps :Rg<SPACE>

" CtrlP
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_use_caching = 0 

" Tmux (not actually a plugin)
autocmd VimResized * :wincmd = " auto resize vim size on tmux size change
