local M = {}
M.syntax_highlights = {
    "rust",
    'toml',
}
M.manson = {
    'codelldb',
}

M.formatters = {
    rust = { "rustfmt" },
}

M.lsps = {
    rust_analyzer = {},
}

return M