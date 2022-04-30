-- null-ls.lua
-- Descrption: Configuration for null-ls (fomatting)
-- Author: Alex Zhang
-- Date: 2022/04/30 

local present, err = pcall(require, 'null-ls')

if present then

local builtins = require('null-ls').builtins

require('null-ls').setup({
  sources = {
    builtins.formatting.yapf,
    builtins.formatting.prettier.with({
      filetypes = {
        'typescript',
        'javascript',
        'json',
        'javascriptreact',
        'typescriptreact',
        'css'
      }
    })
  }
})

end
