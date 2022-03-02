-- keymappings.lua
-- Author: Chi Zhang
-- Date 24/12/2021
-- Description: Basic key mappings

local utils = require('custom.utils')

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

utils.nnoremap('<leader>ft', ':NvimTreeToggle<cr>')
