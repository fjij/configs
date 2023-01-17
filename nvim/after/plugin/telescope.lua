vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>ps", ":Telescope live_grep<CR>")

require("telescope").setup{
    defaults = {
        mappings = {
            i = { ["<esc>"] = require("telescope.actions").close },
        }
    }
}
