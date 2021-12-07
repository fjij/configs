nnoremap <C-p> :Telescope find_files<CR>
nnoremap <leader>ps :Telescope live_grep<CR>

lua << EOF
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}
EOF
