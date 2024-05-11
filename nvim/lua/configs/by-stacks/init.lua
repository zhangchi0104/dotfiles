local M = {}
M.plugins = {}
local stack_dir = vim.fn.stdpath('config')..'/lua/configs/by-stacks/stacks'

for _, file in ipairs(vim.fn.readdir(stack_dir, [[v:val =~ '\.lua$']])) do
  local stack_name = file:gsub('%.lua$', '')
  local stack_settings = require('configs.by-stacks.stacks.'..stack_name) or {}
  for key, value in pairs(stack_settings) do
    M[key] = vim.tbl_extend('keep', M[key] or {}, value)
  end
end

return M