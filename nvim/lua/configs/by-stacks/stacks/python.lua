local M = {}
local utils = require('utils')
M.formatters = {
  python = { "black", "isort" },
}

M.syntax_highlights = {
  "python",
}

M.manson = {
  "black",
  "isort",
  "pyright"
}

M.lsps = {
  pyright = {},
}

utils.augroup('setIndentPython', { clear = true })
utils.autocmd('Filetype', {
  group = 'setIndentPython',
  pattern = { "python" },
  command = 'setlocal shiftwidth=4 tabstop=4'
})

return M