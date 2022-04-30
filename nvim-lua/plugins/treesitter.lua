-- treesitter.lua
-- Author: Chi Zhang
-- Date 14/12/2021
-- Descriptions: configuration for treesitter
local present, err = pcall(require, 'nvim-treesitter')
if present then 
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
    'yaml',
    'dart'
  },
  highlight = {
    enable = true,
  },
  additional_vim_regex_highlighting = false
})
end 
