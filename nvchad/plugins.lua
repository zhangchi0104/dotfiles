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
		opts = overrides.cmp,
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
