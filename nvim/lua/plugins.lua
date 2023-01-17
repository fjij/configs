vim.api.nvim_create_user_command('GitClonePacker', function()
  local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  vim.cmd('quitall')
end, {})

local ok, packer = pcall(require, 'packer')
if not ok then return end

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-sensible'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lua',

            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    }
    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
end)
