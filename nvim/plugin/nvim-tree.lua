local utils = require("utils")

require("nvim-tree").setup()

utils.map("n", "<Leader>pv", ":NvimTreeToggle<CR>", { silent = true })
