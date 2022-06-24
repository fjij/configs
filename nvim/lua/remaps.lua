local utils = require("utils")

utils.set_var("mapleader", " ")

-- Windows
utils.map("n", "<Leader>h", ":wincmd h<CR>", { silent = true })
utils.map("n", "<leader>j", ":wincmd j<CR>", { silent = true })
utils.map("n", "<leader>k", ":wincmd k<CR>", { silent = true })
utils.map("n", "<leader>l", ":wincmd l<CR>", { silent = true })
utils.map("n", "<leader>q", ":q<CR>", { silent = true })

-- Tabs
utils.map("n", "<leader><S-tab>", ":tabprevious<CR>", { silent = true })
utils.map("n", "<leader><tab>", ":tabnext<CR>", { silent = true })
utils.map("n", "<leader>t", ":tabnew<CR>", { silent = true })
utils.map("n", "<leader>1", "1gt", { silent = true })
utils.map("n", "<leader>2", "2gt", { silent = true })
utils.map("n", "<leader>3", "3gt", { silent = true })
utils.map("n", "<leader>4", "4gt", { silent = true })
utils.map("n", "<leader>5", "5gt", { silent = true })
utils.map("n", "<leader>6", "6gt", { silent = true })
utils.map("n", "<leader>7", "7gt", { silent = true })
utils.map("n", "<leader>8", "8gt", { silent = true })
utils.map("n", "<leader>9", "9gt", { silent = true })
utils.map("n", "<leader>0", "10gt", { silent = true })

-- Misc
utils.map("n", "Q", "gq", { silent = true })
