vim.g.mapleader = " "

-- Windows
vim.keymap.set("n", "<Leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Buffers
vim.keymap.set("n", "<leader><S-tab>", ":bprev<CR>")
vim.keymap.set("n", "<leader><tab>", ":bnext<CR>")
vim.keymap.set("n", "<leader>q", ":bd<CR>")

-- Misc
vim.keymap.set("n", "Q", "gq")
