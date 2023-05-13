local cmp = require("cmp")
local mapping = cmp.mapping.preset.insert({
	["<C-d>"] = cmp.mapping.scroll_docs(-4),
	["<CR>"] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	}),
	["<Tab>"] = cmp.mapping(function(fallback)
		local copilot_keys = vim.fn["copilot#Accept"]()
		if copilot_keys ~= "" and type(copilot_keys) == "string" then
			vim.api.nvim_feedkeys(copilot_keys, "i", true)
		elseif cmp.visible() then
			cmp.select_next_item()
		elseif require("luasnip").expand_or_jumpable() then
			vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
		else
			fallback()
		end
	end, { "i", "s", "c" }),
})

cmp.setup({
	mapping = mapping,
})

-- Use cmdline & path source for ':'
-- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
