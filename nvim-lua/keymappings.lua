-- keymappings.lua
-- Author: Chi Zhang
-- Date 24/12/2021
-- Description: Basic key mappings

local utils = require('utils')

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
utils.nnoremap('<Leader>t1', 'gt1')
utils.nnoremap('<Leader>t2', 'gt2')
utils.nnoremap('<Leader>t3', 'gt3')
utils.nnoremap('<Leader>t4', 'gt4')
utils.nnoremap('<Leader>t5', 'gt5')
utils.nnoremap('<Leader>t6', 'gt6')
utils.nnoremap('<Leader>t7', 'gt7')
utils.nnoremap('<Leader>t8', 'gt8')
utils.nnoremap('<Leader>t9', 'gt9')

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


