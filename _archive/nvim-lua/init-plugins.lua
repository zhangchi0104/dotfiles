-- init-plugins.lua
-- Author: Chi Zhang
-- Date 24/12/2021
-- Description: Contains a list of plugins

-- Load Packer
vim.cmd([[packadd packer.nvim]])

return require('packer').startup({function()
    -- Let Packer manage itself
    use { 'wbthomason/packer.nvim', opt = true }

    -- Status-line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    
    -- Tabline 
    use {
      'seblj/nvim-tabline',
      requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- Syntax highlight
    use {
      'nvim-treesitter/nvim-treesitter',
      run='TSUpdate'
    }

    use 'folke/tokyonight.nvim' -- colorscheme

    -- LSP 
    use 'neovim/nvim-lspconfig'

    -- auto compeletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use "williamboman/nvim-lsp-installer"
    use "ray-x/lsp_signature.nvim"
    use 'onsails/lspkind-nvim'
    use 'tami5/lspsaga.nvim' -- Better LSP 

    --snippets
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip' 

    use 'numToStr/Comment.nvim' -- Comment
    use "folke/which-key.nvim" --key mappings

    use 'goolord/alpha-nvim' -- Greeter
    use "lukas-reineke/indent-blankline.nvim" --indent-line
    use 'jose-elias-alvarez/null-ls.nvim' -- formatter 
    use "numToStr/FTerm.nvim" -- Terminal Integration 

    -- finder
    use {
      'nvim-telescope/telescope.nvim',
      requires = 'nvim-lua/plenary.nvim'
    }
    use {'nvim-telescope/telescope-ui-select.nvim' }

    -- file tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons' ,
    }


    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons"
    }
    
    
    -- lua
    use {
      'simrat39/rust-tools.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'mfussenegger/nvim-dap',
        'neovim/nvim-lspconfig',
      }
    } 
  end,
  config = {
    display = {
      open_fn = require('packer.util').float
    },
  }
})

