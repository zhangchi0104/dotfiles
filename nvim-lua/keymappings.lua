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

-- LSP keymappingt
function M.lsp_on_attach(client, bufnr)
  local function buf_set_keymap(...) 
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...) 
    vim.api.nvim_buf_set_option(bufnr, ...) 
  end

  -- Mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vm.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  buf_set_keymap('n', '<Leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('i', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<Leader>ce', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<Leader>bf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<Leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end



return M
