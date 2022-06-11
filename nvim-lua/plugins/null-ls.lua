-- null-ls.lua
-- Descrption: Configuration for null-ls (fomatting)
-- Author: Alex Zhang
-- Date: 2022/04/30 

local present, err = pcall(require, 'null-ls')

if not present then
  return 
end
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
    }),
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
    end
  end,
})


