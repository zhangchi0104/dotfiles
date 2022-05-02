-- lsasaga.lua 
-- Deccription: configuration for lspsaga 
-- Author: Chi Zhang
-- Date: 2022/04/30 

local present, err = pcall(require, 'lspsaga')

if not present then
  return 
end
local saga = require('lspsaga')
saga.init_lsp_saga({
  code_action_keys = {
    quit = '<esc>',
  },
  rename_action_keys = { 
    quit = '<esc>'
  }
})


