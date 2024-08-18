
local M = {}

M.autocmd = vim.api.nvim_create_autocmd
M.augroup = vim.api.nvim_create_augroup
M.is_array = function(table)
  if type(table) ~= 'table' then
    return false
  end

  -- objects always return empty size
  if #table > 0 then
    return true
  end

  -- only object can have empty length with elements inside
  for k, v in pairs(table) do
    return false
  end

  -- if no elements it can be array and not at same time
  return true
end
M.closeOtherBufs = function()
  local tabufline = require('nvchad.tabufline')
  tabufline.closeBufs_at_direction("left")
  tabufline.closeBufs_at_direction("right")
end
return M