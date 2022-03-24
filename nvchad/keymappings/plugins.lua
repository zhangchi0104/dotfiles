-- plugins.lua
-- Author: Chi Zhang
-- keymappings for plugins

local utils = require("custom.utils")

if utils.has_module("nvim-tree") then
  utils.nnoremap('<leader>ft', ':NvimTreeToggle<cr>')
end

if utils.has_module("trouble") then
  utils.nnoremap("<leader>xx", "<cmd>TroubleToggle<CR>")
  utils.nnoremap("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>")
  utils.nnoremap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>")
  utils.nnoremap("<leader>xl", "<cmd>Tourble loclist<CR>")
  utils.nnoremap("<leader>xq", "<cmd>TroubleToggle quickfix<CR>")
end
