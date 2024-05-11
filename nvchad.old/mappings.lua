---@type MappingsTable
local M = {}
local map = vim.keymap.set
local nomap = function(modes, keymap)
    if not pcall(vim.keymap.del, modes, keymap) then
        print("Error deleting mapping: ", keymap)
    end
end

-- disabled



-- Telescope
map(
  "n",
  "<leader>gc",
  "<cmd> Telescope git_commits <CR>", 
  { desc = "Telescope git commits" }
)

-- buffers
map(
  "n",
  "<leader>bd",
  ":lua require('nvchad.tabufline').close_buffer()<CR>",
  { desc = "buffer close current buffer" }
)

map(
  "n",
  "<leader>bD",
  "<cmd> bdelete <CR>",
  { desc="buffer close current buffer with its window" }
)

map(
  "n",
  "<leader>bo",
  ":lua require('nvchad.tabufline').closeOtherBufs()<CR>",
  { desc="buffer close other buffers" }
)

-- buffers

M.lspconfig = {
  n = {
    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "lsp rename",
    },
    ["<F2>"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "lsp rename",
    },
  },
  i = {
    ["<F2>"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "lsp rename",
    },
  },
}

-- more keybinds!
M.trouble = {
  n = {
    ["<leader>xx"] = { "<cmd>TroubleToggle<cr>", "toggle Diagnostics" },
    ["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "toggle workspace diagnostics" },
    ["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "toggle document diagnostics" },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", "toggle quickfix" },
    ["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", "toggle loclist" },
  },
}
M.nvterm = {
  n = {
    ["<A-f>"] = {
      function()
        require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
      end,
    },
  },
} 


-- disabled
nomap("n", "<leader>b")
nomap("n", "<leader>q")
nomap("n", "<leader>x") 
return M
