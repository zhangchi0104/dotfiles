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
utils.nnoremap('U', ':redo<CR>')

-- LSPSaga
utils.nnoremap('<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
utils.nnoremap('<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')
utils.tnoremap('<F3>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
utils.inoremap('<F3>', '<CMD>lua require("FTerm").toggle()<CR>')
-- Close float term

local keymap = {
  ["<leader>"] = {
    t = {
      name='+Tabs',
      p = { '<cmd>tabprevious<CR>', 'Previous tab' },
      n = { '<cmd>tabnext<CR>', 'Next tab' },
      o = { '<cmd>tabonly<CR>', 'Only this tab' },
      d = { '<cmd>tabclose<CR>', 'Close tab' },
      ['1'] = { '1gt<CR>', 'Go to tab 1' },
      ['2'] = { '2gt<CR>', 'Go to tab 2' },
      ['3'] = { '3gt<CR>', 'Go to tab 3' },
      ['4'] = { '4gt<CR>', 'Go to tab 4' },
      ['5'] = { '5gt<CR>', 'Go to tab 5' },
      ['6'] = { '6gt<CR>', 'Go to tab 6' },
      ['7'] = { '7gt<CR>', 'Go to tab 7' },
      ['8'] = { '8gt<CR>', 'Go to tab 8' },
      ['9'] = { '9gt<CR>', 'Go to tab 9' },
    },
    c = {
      name = "+Code actions",
      a = { '<cmd>Lspsaga code_action<CR>', 'Code action' },
      r = { '<cmd>Lspsaga rename<CR>', 'Rename' }, 
      f = {'<cmd>lua vim.lsp.buf.formatting_sync()<CR>', "Format buffer" }
    },
    f = {
      name = "+Find (Telescope)",
      f = { '<cmd>Telescope find_files<CR>', 'Find files' },
      g = { '<cmd>Telescope live_grep<CR>', 'Live grep' },
      b = { '<cmd>Telescope buffers<CR>', 'Buffers' },
      h = { '<cmd>Telescope help_tags<CR>', 'Help tags' }, 
      t = { '<cmd>Telescope<CR>', 'Open Telescope' },
    },
    g = {
      name = "+LSP",
      k = { '<cmd>Lspsaga hover_doc<CR>', 'Hover doc' },
      s = { '<cmd>Lspsaga signature_help<CR>', 'Signature help' },
      d = { '<cmd>Lspsaga preview_definition<CR>', 'Preview definition' },
      D = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Goto definition' },
      h = { '<cmd>Lspsaga lsp_finder<CR>', 'LSP finder' },  
    },
    p = {
      name = "+Problems",
      x = {"<cmd>TroubleToggle<CR>", "Toggle problems list"},
      d = {"<cmd>TroubleToggle document_diagnostics<CR>", "Toggle problems in document"},
      w = {"<cmd>TroubleToggle workspace_diagnostics<CR>", "Toggle problems in worksapce"},
      q = {"<cmd>TroubleToggle quickfix<CR>", "Toggle quickfix"},
      l = {"<cmd>TroubleToggle loclist<CR>", "Toggle loclist"},
    }

  },
  ["<leader>h"] = {'<C-w>h', 'Go to window left'},
  ["<leader>j"] = {'<C-w>j', 'Go to window down'},
  ["<leader>k"] = {'<C-w>k', 'Go to window up'},
  ["<leader>l"] = {'<C-w>l', 'Go to window right'},
  ["<leader>1"] = {'<cmd>lua require("utils").win_gotonr(1)<CR>', 'Go to window 1'},
  ["<leader>2"] = {'<cmd>lua require("utils").win_gotonr(2)<CR>', 'Go to window 2'},
  ["<leader>3"] = {'<cmd>lua require("utils").win_gotonr(3)<CR>', 'Go to window 3'},
  ["<leader>4"] = {'<cmd>lua require("utils").win_gotonr(4)<CR>', 'Go to window 4'},
  ["<leader>5"] = {'<cmd>lua require("utils").win_gotonr(5)<CR>', 'Go to window 5'},
  ["<leader>6"] = {'<cmd>lua require("utils").win_gotonr(6)<CR>', 'Go to window 6'},
  ["<leader>7"] = {'<cmd>lua require("utils").win_gotonr(7)<CR>', 'Go to window 7'},
  ["<leader>8"] = {'<cmd>lua require("utils").win_gotonr(8)<CR>', 'Go to window 8'},
  ["<leader>9"] = {'<cmd>lua require("utils").win_gotonr(9)<CR>', 'Go to window 9'},
  ["<leader>`"] = {"<cmd>NvimTreeToggle<CR>", "Toggle File Tree"},
}

local M = {
  keymappings = keymap
}

return M
