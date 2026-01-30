local M = {}
M.plugins = {}
M.manson = {}
M.syntax_highlights = {}
local stack_dir = vim.fn.stdpath "config" .. "/lua/configs/stacks"
local utils = require "utils"
for _, file in ipairs(vim.fn.readdir(stack_dir, [[v:val =~ '^[^init\.lua$]']])) do
  local stack_name = file:gsub("%.lua$", "")
  local stack_settings = require("configs.stacks." .. stack_name) or {}
  for key, value in pairs(stack_settings) do
    if utils.is_array(value) then
      vim.list_extend(M[key], value)
    else
      M[key] = vim.tbl_deep_extend("force", M[key] or {}, value)
    end
  end
end

return M

