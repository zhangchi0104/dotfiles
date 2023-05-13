local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-cmdline",
		},
		event = { "InsertEnter", "CmdlineEnter" },
		init = function()
			require("custom.configs.cmp")
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
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
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
	{ "catppuccin/nvim", name = "catppuccin" },
	{
		"github/copilot.vim",
		name = "copilot",
		lazy = false,
		init = function()
			vim.g.copilot_assume_mapped = true
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		config = function()
			require("custom.configs.rust-tools")
		end,
	},
}

return plugins
