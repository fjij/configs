local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "tpope/vim-sensible",
    "tpope/vim-fugitive",
    "tpope/vim-surround",
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup({ dark_variant = "moon" })
            vim.cmd('colorscheme rose-pine')
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<C-p>", ":Telescope find_files<cr>", desc = "Find files" },
            { "<leader>ps", ":Telescope live_grep<cr>", desc = "Live grep" },
        },
        opts = {
            defaults = { mappings = { i = { ["<esc>"] = require("telescope.actions").close } } },
        },
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",

            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },

        config = function()
            local lsp = require("lsp-zero")
            lsp.preset("recommended")

            lsp.set_preferences({
                set_lsp_keymaps = true,
                manage_nvim_cmp = true,
            })

            lsp.setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = { { "<leader>pv", "<cmd>Neotree<cr>", desc = "Neotree" } },
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        version = "3.x",
        config = true,
        opts = { options = { separator_style = "slant" } },
    },
})
