local cmp = require("cmp")
-- Use cmdline & path source for ':'
-- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline({
		["<Tab>"] = {
			c = function(fallback)
				-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
				if cmp.visible() then
					local entry = cmp.get_selected_entry()
					if not entry then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					end
					cmp.confirm()
				else
					fallback()
				end
			end,
		},
		["<Down>"] = {
			c = function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end,
		},
		["<Up>"] = {
			c = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end,
		},
		["<Esc>"] = {
			c = function(fallback)
				if cmp.visible() then
					cmp.close()
				else
					fallback()
				end
			end,
		},
	}),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})


local mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(function(fallback)
        -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
        if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            end
            cmp.confirm()
        else
            fallback()
        end
    end, { "i", "s" }),
    ["<Esc>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.close()
        else
            fallback()
        end
    end),
}),

cmp.setup({
    mapping = mappings 
})