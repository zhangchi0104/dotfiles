-- init-plugins.lua
-- Author: Chi Zhang
-- Date 24/12/2021
-- Description: Contains a list of plugins

-- Load Packer
vim.cmd([[packadd packer.nvim]])

return require('packer').startup({function(use)
    -- Let Packer manage itself
    use({'wbthomason/packer.nvim', opt = true})
    
    -- colorscheme
    use 'folke/tokyonight.nvim'

    -- status line
    use({
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    })
    
    -- tabline
     use({
      'noib3/nvim-cokeline',
      requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
    })

    -- Syntax highlight
    use({
      'nvim-treesitter/nvim-treesitter',
      run='TSUpdate'
    })

    -- LSP 
    use 'neovim/nvim-lspconfig'


    -- auto compeletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'

    --snippets
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip' 

    -- finder
    use({
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    })

    -- file tree
    use({
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
    })

    -- Greeter
    use({
      'goolord/alpha-nvim',
    })

    -- formatting
    use 'sbdchd/neoformat'

    -- sessions
    use 'Shatur/neovim-session-manager'
    
    -- dart / flutter
    use 'akinsho/flutter-tools.nvim'

  end,
  config = {
    display = {
      open_fn = require('packer.util').float
    },
  }
})

