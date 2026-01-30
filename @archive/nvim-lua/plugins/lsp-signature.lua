-- lsp-signature.lua
-- Description: Config for lsp-signature 
-- Date: 05/05/2022 
-- Author: Alex Zhang

local present, error = pcall(require, 'ray-x/lsp-signature')
if not present then
  return
end

require('ray-x/lsp-signature').setup()
