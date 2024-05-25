require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

map("n", "<leader>bd", ":lua require('nvchad.tabufline').close_buffer()<CR>", { desc = "buffer close current buffer" })

map("n", "<leader>bD", "<cmd> bdelete <CR>", { desc = "buffer close current buffer with its window" })

map("n", "<leader>bo", ":lua require('nvchad.tabufline').closeOtherBufs()<CR>", { desc = "buffer close other buffers" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
