vim.g.mapleader = " "

-- Windows
vim.keymap.set("n", "<Leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Tabs
vim.keymap.set("n", "<leader><S-tab>", ":tabprevious<CR>")
vim.keymap.set("n", "<leader><tab>", ":tabnext<CR>")
vim.keymap.set("n", "<leader>t", ":tabnew<CR>")
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>0", "10gt")

-- Misc
vim.keymap.set("n", "Q", "gq")
