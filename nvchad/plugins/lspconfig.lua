-- lsp.lua
-- Author: Chi Zhang
-- Date 24/12/2021
-- Description: configuration for neovim/lsp-config
local M = {}
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>el', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { 
    "pyright",
    "solidity_ls", 
   }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end
end

return M
