local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"c",
		"markdown",
		"markdown_inline",
		"python",
		"rust",
		"haskell",
		"typescript",
		"tsx",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- Python stuff
		"pyright",
		"yapf",
		"ruff",
		-- rust analyzer
		"rust-analyzer",
		"rustfmt",

		-- Typescript
		"prettier",
		"typescript-language-server",
		"emmet-ls",
		"tailwindcss-language-server",
		"eslint_d",

		-- haskell
		"hls",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}
M.cmp = function()
	local cmp = require("cmp")
	local conf = require("plugins.configs.cmp")
	local has_words_before = function()
		if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
			return false
		end
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
	end
	conf.mapping["<Tab>"] = cmp.mapping(function(fallback)
		-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
		if cmp.visible() and has_words_before() then
			local entry = cmp.get_selected_entry()
			if not entry then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			end
			cmp.confirm()
		else
			fallback()
		end
	end, { "i", "s" })
	conf.mapping["<S-CR>"] = cmp.mapping(function(fallback)
		if not cmp.visible() then
			return fallback()
		end
		local entry = cmp.get_selected_entry()
		if not entry then
			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		end
		cmp.confirm()
	end, { "i", "s" })
	conf.mapping["<Up>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		else
			fallback()
		end
	end, { "i", "s" })
	conf.mapping["<Down>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		else
			fallback()
		end
	end, { "i", "s" })
	conf.mapping["<Esc>"] = cmp.mapping.abort()
	conf.mapping["<CR>"] = nil
	conf.sources = {
		-- Copilot Source
		{ name = "copilot", group_index = 2 },
		-- Other Sources
		{ name = "nvim_lsp", group_index = 2 },
		{ name = "path", group_index = 2 },
		{ name = "luasnip", group_index = 2 },
	}
	return conf
end
return M
