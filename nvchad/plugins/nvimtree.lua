-- nvim-tree.lua
-- Author: Chi Zhang
-- Date: 25/12/2021
-- Description: Configuration for nvim-tree

local nvim_tree = require("nvim-tree")
local g = vim.g

g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

-- key map definitions
local keymappings = {
  { key = { 'o' }, action = 'edit'},
  { key = { '<CR>', 't' }, action = 'tabnew' },
  { key = {'vs', '<C-v>' }, action = 'vsplit' },
  { key = {'sp', '<C-x>' }, action = 'split' },
  { key = {'?', 'g?'}, action = 'toggle_help'},
  { key = { 'a', 'n'}, action = 'create'}
}

-- nvim-tree setup
local M = {
  toggle = "<leader>ft",
  view = {
    hide_root_folder = true,
    mappings = {
        list = keymappings
    }
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
}
return M
