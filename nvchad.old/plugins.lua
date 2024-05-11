local overrides = require("custom.configs.overrides")
-- local lsp
---@type NvPluginSpec[]
local plugins = {
	
	{
		"stevearc/conform.nvim",
		cmd = { "ConformInfo" },
		event = { "BufWritePre" },
		opts = {
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				-- javascript = { { "prettierd", "prettier" } },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
			},
		},
	},
	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
		dependencies = { "zbirenbaum/copilot-cmp" },
	},
	{
		"hrsh7th/cmp-cmdline",
		dependencies = { "hrsh7th/nvim-cmp" },
		event = { "CmdlineEnter" },
		config = function()
			require("custom.configs.cmp-cmdline").setup()
		end,
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },
	-- {
	--   "folke/which-key.nvim",
	--   config = function(_, opts)
	--     -- default config function's stuff
	--     dofile(vim.g.base46_cache .. "whichkey")
	--     require("which-key").setup(opts)
	--     local keymaps = require("custom.keymaps")
	--     -- your custom stuff
	--     require("which-key").register({
	--       b = { name = "+buffer" },
	--       g = { name = "+git" }
	--     }, {prefix = {'<leader>'}})
	--   end,
	-- },
	{
		"zbirenbaum/copilot.lua",
		cmd = { "Copilot" },
		event = { "InsertEnter" },
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
		event = { "InsertEnter" },
		dependencies = { "zbirenbaum/copilot.lua" },
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		cmd = { "TroubleToggle", "Trouble", "TroubleClose", "TroubleRefresh" },
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		event = { "LspAttach" },
		config = function()
			require("custom.configs.lsp-inlayhints")
		end,
	},
	-- {
	-- 	"simrat39/rust-tools.nvim",
	-- 	enabled = false,
	-- 	config = function()
	-- 		require("custom.configs.rust-tools")
	-- 	end,
	-- 	ft = "rust",
	-- },
}

return plugins
