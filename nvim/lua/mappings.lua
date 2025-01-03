require "nvchad.mappings"
local nomap = vim.keymap.del
-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

map("n", "<leader>bd", ":lua require('nvchad.tabufline').close_buffer()<CR>", { desc = "buffer close current buffer" })

map("n", "<leader>bD", "<cmd> bdelete <CR>", { desc = "buffer close current buffer with its window" })
map("n", "<leader>ff", "<cmd>Telescope find_files  hidden=true<cr>", { desc = "telescope find files" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "nvim tree toggle" })
map("n", "<leader>bo", function()
  local tabufline = require('nvchad.tabufline')
  tabufline.closeBufs_at_direction("left")
  tabufline.closeBufs_at_direction("right")
end, { desc = "buffer close other buffers" })
-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
nomap('n', '<leader>b')
