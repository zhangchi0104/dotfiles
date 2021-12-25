-- treesitter.lua
-- Author: Chi Zhang
-- Date 14/12/2021
-- Descriptions: configuration for treesitter

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'css', 
    'dockerfile', 
    'html', 
    'go', 
    'javascript', 
    'json',
    'lua',
    'toml', 
    'tsx',
    'typescript',
    'vim',
    'python',
    'yaml'
  },
  highlight = {
    enable = true,
  },
  additional_vim_regex_highlighting = false
})
