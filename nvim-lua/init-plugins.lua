-- init-plugins.lua
-- Author: Chi Zhang
-- Date 24/12/2021
-- Description: Contains a list of plugins

-- Load Packer
vim.cmd([[packadd packer.nvim]])

return require('packer').startup({function()
    -- Let Packer manage itself
    use({'wbthomason/packer.nvim', opt = true})
    
    -- colorscheme
    use 'folke/tokyonight.nvim'

    -- status line
    use({
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
    })
    
    -- tabline 
    use {
      'seblj/nvim-tabline',
      requires = { 'kyazdani42/nvim-web-devicons'}
    }
    -- Syntax highlight
    use({
      'nvim-treesitter/nvim-treesitter',
      run='TSUpdate'
    })

    -- LSP 
    use 'neovim/nvim-lspconfig'


    -- auto compeletion
    use 'hrsh7th/nvim-cmp'
    use('hrsh7th/cmp-nvim-lsp')

    --snippets
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip' 

    -- finder
    use({
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    })
    use {'nvim-telescope/telescope-ui-select.nvim' }

    -- file tree
    use({
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
    })
    -- debugger
    use({
      "rcarriga/nvim-dap-ui",
      requires = {"mfussenegger/nvim-dap"}
    })

    -- Greeter
    use({
      'goolord/alpha-nvim',
    })
    -- identline 
    use "lukas-reineke/indent-blankline.nvim"
    -- formatter 
    use({'jose-elias-alvarez/null-ls.nvim'})

    -- Better LSP 
    use({'tami5/lspsaga.nvim'})
    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons"
    })
    use {
      "ray-x/lsp_signature.nvim",
    }


    -- Comment
    use 'numToStr/Comment.nvim'


    use({"folke/which-key.nvim"})
    
    -- Terminal Integration 
    use({"numToStr/FTerm.nvim"})
    
    use {"williamboman/nvim-lsp-installer"}

    use('MunifTanjim/nui.nvim')
    use('onsails/lspkind-nvim')

  end,
  config = {
    display = {
      open_fn = require('packer.util').float
    },
  }
})

