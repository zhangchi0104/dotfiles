-- nvim-tree.lua
-- Author: Chi Zhang
-- Date: 25/12/2021
-- Description: Configuration for nvim-tree
local exist, err = pcall(require, 'nvim-tree')

if exist then
  local nnoremap = require('utils').nnoremap
  -- key map definitions
  local keymappings = {
    { key = { 'o' },          action = 'edit' },
    { key = { '<CR>', 't' },  action = 'tabnew' },
    { key = {'vs', '<C-v>' }, action = 'vsplit' },
    { key = {'sp', '<C-x>' }, action = 'split' },
    { key = '..',             action = 'parent_node' },
    { key = 'I',              action = 'toggle_ignored' },
    { key = 'H',              action = 'toggle_dotfiles' },
    { key = 'n',              action = 'create' },
    { key = "d",              action = "remove" },
    { key = "r",              action = "rename" },
    { key = "x",              action = "cut" },
    { key = "c",              action = "copy" },
    { key = "p",              action = "paste" },
    { key = "q",              action = "close" },
    { key = "?",              action = "toggle_help" },
  }

  -- nvim-tree setup
  require('nvim-tree').setup({
    view = {
      mappings = {
          list = keymappings
      }
    },
    actions = {
      open_file = {
        quit_on_open = false,
      }
    }
  })

  nnoremap('<Leader>ft', '<cmd>NvimTreeToggle<CR>')
end
