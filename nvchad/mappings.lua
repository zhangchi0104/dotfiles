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
		["<leader>bd"] = { "<cmd> bd <CR>", "close current buffer" },
		["<leader>bo"] = { ":%bd|e#<CR>", "close other buffers" },
		["<leader>be"] = { ":enew<CR>", "new empty buffer" },
	},
}

M.lspconfig = {
	n = {
		["<leader>lr"] = {
			function()
				require("nvchad_ui.renamer").open()
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
return M
