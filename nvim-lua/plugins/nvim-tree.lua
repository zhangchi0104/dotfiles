-- nvim-tree.lua
-- Author: Chi Zhang
-- Date: 25/12/2021
-- Description: Configuration for nvim-tree
local tree_cb = require('nvim-tree.config').nvim_tree_callback
local nnoremap = require('utils').nnoremap
local function tabnew()
  tree_cb('tabnew')
  tree_cb('close')
end
-- key map definitions
local keymappings = {
  { key = { 'o' }, cb = tree_cb('edit') },
  { key = { '<CR>', 't' }, cb = tree_cb('tabnew') },
  { key = {'vs', '<C-v>' }, cb = tree_cb('vsplit') },
  { key = {'sp', '<C-x>' }, cb = tree_cb('split') },
  { key = '..', cb = tree_cb('parent_node') },
  { key = 'I', cb = tree_cb('toggle_ignored') },
  { key = 'H', cb = tree_cb('toggle_dotfiles') },
  { key = 'n', cb = tree_cb('create') },
  { key = "d", cb = tree_cb("remove") },
  { key = "r", cb = tree_cb("rename") },
  { key = "x", cb = tree_cb("cut") },
  { key = "c", cb = tree_cb("copy") },
  { key = "p", cb = tree_cb("paste") },
  { key = "q", cb = tree_cb("close") },
  { key = "?", cb = tree_cb("toggle_help") },
}

-- nvim-tree setup
require('nvim-tree').setup({
  autoclose = true,
  view = {
    mappings = {
        list = keymappings
    }
  }
})

nnoremap('<Leader>ft', '<cmd>NvimTreeToggle<CR>')
