local M = {}
M.plugins = {}
M.manson = {}
M.syntax_highlights = {}
local stack_dir = vim.fn.stdpath "config" .. "/lua/configs/stacks/stacks"
local utils = require "utils"
for _, file in ipairs(vim.fn.readdir(stack_dir, [[v:val =~ '\.lua$']])) do
  local stack_name = file:gsub("%.lua$", "")
  local stack_settings = require("configs.stacks.stacks." .. stack_name) or {}
  for key, value in pairs(stack_settings) do
    if utils.is_array(value) then
      for _, item in ipairs(value) do
        table.insert(M[key], item)
      end
    else
      M[key] = vim.tbl_deep_extend("force", M[key] or {}, value)
    end
  end
end

return M

