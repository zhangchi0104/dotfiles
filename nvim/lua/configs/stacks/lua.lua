local M = {}
local utils = require('utils')
M.formatters = {
  lua = { "stylua" }
}

M.syntax_highlights = {
  "lua",
}

M.manson = {
  "stylua",
  "lua-language-server"
}

M.lsps = {
    lua_ls = {}
}

utils.augroup('setIndentLua', { clear = true })
utils.autocmd('Filetype', {
  group = 'setIndentLua',
  pattern = { "lua" },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

return M