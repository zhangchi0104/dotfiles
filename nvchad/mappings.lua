---@type MappingsTable
local M = {}
M.disabled = {
	n = {
		["<leader>b"] = "",
		["<leader>q"] = "",
		["<leader>x"] = "",
	},
}

M.telescope = {
	n = {
		["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
	},
}

M.buffer = {
	n = {
		["<leader>bd"] = { ":lua require('nvchad.tabufline').close_buffer()<CR>", "close current buffer" },
		["<leader>bo"] = { ":lua require('nvchad.tabufline').closeOtherBufs()<CR>", "close other buffers" },
        ["<leader>1"] = {":lua vim.api.nvim_set_current_buf(vim.t.bufs[1])<CR>", "Move to Buffer 1"},
        ["<leader>2"] = {":lua vim.api.nvim_set_current_buf(vim.t.bufs[2])<CR>", "Move to Buffer 2"},
        ["<leader>3"] = {":lua vim.api.nvim_set_current_buf(vim.t.bufs[3])<CR>", "Move to Buffer 3"},
        ["<leader>4"] = {":lua vim.api.nvim_set_current_buf(vim.t.bufs[4])<CR>", "Move to Buffer 4"},
        ["<leader>5"] = {":lua vim.api.nvim_set_current_buf(vim.t.bufs[5])<CR>", "Move to Buffer 5"},
        ["<leader>6"] = {":lua vim.api.nvim_set_current_buf(vim.t.bufs[6])<CR>", "Move to Buffer 6"},
        ["<leader>7"] = {":lua vim.api.nvim_set_current_buf(vim.t.bufs[7])<CR>", "Move to Buffer 7"},
        ["<leader>8"] = {":lua vim.api.nvim_set_current_buf(vim.t.bufs[8])<CR>", "Move to Buffer 8"},
        ["<leader>9"] = {":lua vim.api.nvim_set_current_buf(vim.t.bufs[9])<CR>", "Move to Buffer 9"},
        

	},  
}

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
    }
    
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
return M
