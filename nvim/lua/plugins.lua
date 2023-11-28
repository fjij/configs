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
    "simrat39/symbols-outline.nvim",
    config = true,
  },
  {
    "hashivim/vim-terraform",
    ft = "terraform",
  },
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
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = require("telescope.actions").close,
              ["<CR>"] = function()
                -- treesitter fold fix
                -- https://github.com/nvim-telescope/telescope.nvim/issues/559#issuecomment-1195895807
                vim.cmd([[:stopinsert]])
                vim.cmd([[call feedkeys("\<CR>")]])
              end,
            },
          },
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()
      luasnip.config.setup()
      ---@diagnostic disable-next-line: missing-fields
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "path" },
        },
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Down>"] = cmp.mapping.select_next_item(),
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "j-hui/fidget.nvim", tag = "legacy", config = true },
      { "folke/neodev.nvim", config = true },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          lua_ls = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
      })

      local lspconfig = require("lspconfig")
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = lsp_capabilities,
          })
        end,
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
        lualine_x = { "filetype" },
      },
      tabline = {
        lualine_a = { {
          "tabs",
          mode = 2,
          max_length = function()
            return vim.o.columns
          end,
        } },
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
