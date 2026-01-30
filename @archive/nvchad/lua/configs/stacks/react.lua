local M = {}
local utils = require "utils"

M.lsps = {
  ts_ls = {},
  tailwindcss = {},
  eslint = {},
}

M.formatters = {
  tsx = { "prettier" },
  jsx = { "prettier" },
  typescript = { "prettier" },
  javascript = { "prettier" },
  javascriptreact = { "prettier" },
  typescriptreact = { "prettier" },
  css = { "prettier" },
  html = { "prettier" },
}

M.syntax_highlights = {
  "css",
  "tsx",
  "javascript",
  "typescript",
  "html",
}

M.manson = {
  "typescript-language-server",
  "tailwindcss-language-server",
  "prettier",
  "eslint-lsp",
}
-- Set indentation to 2 spaces
utils.augroup("setIndentReact", { clear = true })
utils.autocmd("Filetype", {
  group = "setIndentReact",
  pattern = {
    "css",
    "html",
    "javascript",
    "markdown",
    "md",
    "typescript",
    "scss",
    "xml",
    "xhtml",
    "yaml",
    "javascriptreact",
    "typescriptreact",
    "tsx",
    "jsx",
  },
  command = "setlocal shiftwidth=2 tabstop=2",
})

return M
