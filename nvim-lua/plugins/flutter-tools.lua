-- flutter-tools.lua
-- Author: Chi Zhang
-- Date: 06/01/2022 
local on_attach = require('plugins/lspconfig-keymappings').on_attach

-- configure keymap 
local function  flutter_on_attach(client, bufnr)
  local function buf_set_keymap_dart(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local opts = { noremap = true, silent = true }
  -- common settings
  on_attach(client, bufnr)
  
  -- flutter specific settings
  buf_set_keymap_dart('n', '<Leader>pf', '<cmd>FlutterRun<CR>', opts)
  buf_set_keymap_dart('n', '<Leader>pr', '<cmd>FlutterReload<CR>', opts)
  buf_set_keymap_dart('n', '<Leader>pR', '<cmd>FlutterRestart<CR>', opts)
  buf_set_keymap_dart('n', '<Leader>co', '<cmd>FlutterOutlineToggle<CR>', opts)
  buf_set_keymap_dart('n', '<Leader>pq', '<cmd>FlutterQuit<CR>', opts)
  buf_set_keymap_dart('n', '<Leader>pd', '<cmd>FlutterDetach<CR>', opts)
  buf_set_keymap_dart('n', '<Leader>pt', '<cmd>Telescope flutter commands<CR>', opts)
end

local ver = vim.version()
local version_str = require'string'.format('%s.%s.%s', 
  ver.major, ver.minor, ver.patch)
  
require('flutter-tools').setup({
  lsp = {
    cmd = {
      'dart', 
      'language-server', 
      '--client-id',
      'neovim.lsp',
      '--client-version',
      version_str
    },
    on_attach = flutter_on_attach,
  },
  dev_log = {
    open_cmd = '10new',
  }
})
