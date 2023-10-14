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
  "tpope/vim-rhubarb",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "itchyny/vim-qfedit",
  "Bekaboo/deadcolumn.nvim",
  {
    "dag/vim-fish",
    ft = "fish",
  },
  {
    "lifepillar/pgsql.vim",
    ft = "sql",
    config = function()
      vim.g.sql_type_default = "pgsql"
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup()
      vim.cmd("colorscheme kanagawa")
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
      defaults = {
        mappings = {
          i = {
            -- ["<esc>"] = require("telescope.actions").close,
            ["<CR>"] = function()
              -- treesitter fold fix
              -- https://github.com/nvim-telescope/telescope.nvim/issues/559#issuecomment-1195895807
              vim.cmd([[:stopinsert]])
              vim.cmd([[call feedkeys("\<CR>")]])
            end,
          },
        },
      },
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
      "hrsh7th/cmp-nvim-lua",
    },
    config = function()
      local lsp = require("lsp-zero")
      lsp.preset("recommended")
      lsp.setup()

      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end,
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
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      sections = {
        lualine_x = { "filetype" }
      },
      tabline = {
        lualine_a = { { "tabs", mode = 2 } },
      },
    },
  },
  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup({
        render = function(props)
          local path = vim.api.nvim_buf_get_name(props.buf)
          local helpers = require("helpers")
          return helpers.shorten_path_styled(path, {
            short_len = 1,
            tail_count = 2,
            head_max = 4,
            head_style = { group = "Comment" },
          })
        end,
      })
    end,
  },
})
