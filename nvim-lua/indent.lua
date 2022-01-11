-- indent.lua
-- Author: Chi Zhang
-- Date: 25/12/2021
-- Descriptions: indentation based on file types

local  string = require('string') 

local M = {}

local lang_indent = {
  typescript = 2,
  lua = 2,
  dart = 2,
  javascript= 2,
  javascriptreact = 2,
  typescriptreact = 2,
  html = 2,
  css = 2,
}

function M.set_ft_indent(ft, i)
  local cmd_str = string.format('autocmd FileType %s set sw=%d ts=%d', ft, i, i)
  vim.api.nvim_command(cmd_str)
end

function M.set_buf_indent(i)
  vim.b.sw = i
  vim.b.ts = i
end

for k, v in pairs(lang_indent) do
  M.set_ft_indent(k, v)
end

return M

