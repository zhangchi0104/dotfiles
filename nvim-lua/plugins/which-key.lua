-- which-key.lua
-- Description: config for which-key 
-- Author: Alex Zhang
-- Date: 2022/05/02

local present, err = pcall(require, "which-key")
if not present then
  return
end

-- parse config from keymappings
local keymap_tbl = require("keymappings").keymappings
local wk = require('which-key')

wk.setup()
wk.register(keymap_tbl)
