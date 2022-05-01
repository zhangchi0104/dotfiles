-- keymappings.lua
-- Author: Chi Zhang
-- Date 24/12/2021
-- Description: Basic key mappings

local utils = require('utils')
local M = {}
-- save & quit
utils.nnoremap('qq', ':q<CR>')
utils.nnoremap('zz', ':w<CR>')
utils.nnoremap('QQ', ':q!<CR>')
utils.nnoremap('qa', ':qa<CR>')
utils.nnoremap('za', ':wa<CR>')
utils.nnoremap('U', 'redo<CR>')

-- tab manipulations
utils.nnoremap('<Leader>tp', ':tabprevious<CR>')
utils.nnoremap('<Leader>tt', ':tabnew<CR>')
utils.nnoremap('<Leader>tn', ':tabnext<CR>')
utils.nnoremap('<Leader>to', ':tabonly<CR>')
utils.nnoremap('<Leader>td', ':tabclose<CR>') 

-- tab selection
utils.nnoremap('<Leader>t1', '1gt')
utils.nnoremap('<Leader>t2', '2gt')
utils.nnoremap('<Leader>t3', '3gt')
utils.nnoremap('<Leader>t4', '4gt')
utils.nnoremap('<Leader>t5', '5gt')
utils.nnoremap('<Leader>t6', '6gt')
utils.nnoremap('<Leader>t7', '7gt')
utils.nnoremap('<Leader>t8', '8gt')
utils.nnoremap('<Leader>t9', '9gt')

-- window manipulation
utils.nnoremap('<Leader>h', '<C-w>h')
utils.nnoremap('<Leader>j', '<C-w>j')
utils.nnoremap('<Leader>k', '<C-w>k')
utils.nnoremap('<Leader>l', '<C-w>l')
utils.nnoremap('<Leader>wd', '<C-w>q')
utils.nnoremap('<Leader>wH', '<C-w>H')
utils.nnoremap('<Leader>wJ', '<C-w>J')
utils.nnoremap('<Leader>wK', '<C-w>K')
utils.nnoremap('<Leader>wL', '<C-w>L')

-- Telescope mappings
utils.nnoremap('<F3>', '<cmd>Telescope<CR>')
utils.inoremap('<F1>', '<cmd>Telescope<CR>')
utils.nnoremap('<Leader>f', '<cmd>Telescope<CR>')
utils.nnoremap('<Leader>ff', '<cmd>Telescope find_files<CR>')
utils.nnoremap('<Leader>fg', '<cmd>Telescope live_grep<CR>')
utils.nnoremap('<Leader>fb', '<cmd>Telescope buffers<CR>')
utils.nnoremap('<Leader>fh', '<cmd>Telescope help_tags<CR>')
utils.nnoremap('<Leader>fs', '<cmd>Telescope sessions<CR>')

-- Window Navigation 
utils.nnoremap('<Leader>1', '<cmd>lua require("utils").win_gotonr(1)<CR>')
utils.nnoremap('<Leader>2', '<cmd>lua require("utils").win_gotonr(2)<CR>')
utils.nnoremap('<Leader>3', '<cmd>lua require("utils").win_gotonr(3)<CR>')
utils.nnoremap('<Leader>4', '<cmd>lua require("utils").win_gotonr(4)<CR>')
utils.nnoremap('<Leader>5', '<cmd>lua require("utils").win_gotonr(5)<CR>')
utils.nnoremap('<Leader>6', '<cmd>lua require("utils").win_gotonr(6)<CR>')
utils.nnoremap('<Leader>7', '<cmd>lua require("utils").win_gotonr(7)<CR>')
utils.nnoremap('<Leader>8', '<cmd>lua require("utils").win_gotonr(8)<CR>')
utils.nnoremap('<Leader>9', '<cmd>lua require("utils").win_gotonr(9)<CR>')


-- lspsaga
utils.nnoremap('gh', ':Lspsaga lsp_finder<CR>')
utils.nnoremap('ca', ':Lspsaga code_action<CR>')
utils.nnoremap('K', ':Lspsaga hover_doc<CR>')
utils.nnoremap('<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
utils.nnoremap('<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')
utils.nnoremap('gs', ':Lspsaga signature_help<CR>')
utils.nnoremap('cr', ':Lspsaga rename<CR>')
utils.nnoremap('gd', ':Lspsaga preview_definition<CR>') 

utils.tnoremap("<leader>'", ':Lspsaga open_floaterm<CR>')
utils.tnoremap("<leader>'", ':Lspsage close_floaterm<CR>')

return M
