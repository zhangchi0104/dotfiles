-- treesitter.lua
-- Author: Chi Zhang
-- Date 14/12/2021
-- Descriptions: configuration for treesitter
local present, err = pcall(require, 'nvim-treesitter')
if not present then 
  return
end

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'css', 
    'dockerfile', 
    'html', 
    'javascript', 
    'json',
    'lua',
    'toml', 
    'tsx',
    'typescript',
    'vim',
    'python',
    'yaml',
    'dart', 
    'rust',
  },
  highlight = {
    enable = true,
  },
  additional_vim_regex_highlighting = false
})
 
