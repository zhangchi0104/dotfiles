-- term.lua
-- Author: Chi Zhang
-- Date 06/01/2022
-- Description: Configuration for terminal
local present, err = pcall(require, 'FTerm')

if not present then
	return
end
require('FTerm').setup({
  cmd = os.getenv('SHELL') or 
    '"C:\\Program Files\\PowerShell\\7\\pwsh.exe"',
  auto_close = false
})
local opts = { silent=true, noremap=true }
local map_key = vim.api.nvim_set_keymap

local nnoremap = require('utils').nnoremap
local noremap = require('utils').noremap
local inoremap = require('utils').inoremap
local toggle_term_cmd = '<cmd>lua require"FTerm".toggle()<CR>'

