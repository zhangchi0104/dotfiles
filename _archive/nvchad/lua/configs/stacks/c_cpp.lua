local M = {}
local utils = require('utils')
M.formatters = {
  c = { "clang-format" },
  cpp = { "clang-format" },
}

M.syntax_highlights = {
  "c",
  "cpp",
}

M.manson = {
  "clangd",
  "clang-format",
}

M.lsps = {
  clangd = {}
}

utils.augroup('setIndentPython', { clear = true })
utils.autocmd('Filetype', {
  group = 'setIndentPython',
  pattern = { "python" },
  command = 'setlocal shiftwidth=4 tabstop=4'
})

return M
