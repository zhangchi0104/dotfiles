---@type ChadrcConfig
--
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	theme = "tokyonight",
	theme_toggle = { "onedark", "one_light" },

	hl_override = highlights.override,
	hl_add = highlights.add,
	nvdash = {
		load_on_startup = true,
		buttons = {
			{ "  Find File", "Spc f f", "Telescope find_files" },
			{ "  Empty Buffer", "Spc b e", "enew" },
			{ "󰮗  Find Word", "Spc f w", "Telescope live_grep" },
			{ "  Bookmarks", "Spc b m", "Telescope marks" },
			{ "  Themes", "Spc t h", "Telescope themes" },
		},
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
