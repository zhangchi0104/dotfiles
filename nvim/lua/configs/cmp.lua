local M = {}
local cmp = require "cmp"
M.mapping = {}
-- Mappings
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end
M.mapping["<Tab>"] = cmp.mapping(function(fb)
  if not cmp.visible() or not has_words_before() then
    return fb()
  end
  local entry = cmp.get_selected_entry()
  if not entry then
    cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
  end
  cmp.confirm()
end, { "i", "s" })

M.mapping["<Up>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  else
    fallback()
  end
end, { "i", "s" })

M.mapping["<Down>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    fallback()
  end
end, { "i", "s" })

M.mapping["<Esc>"] = cmp.mapping.abort()
M.mapping["<CR>"] = cmp.mapping(function(fallback)
  fallback()
end, { "i", "s" })

-- Sources

M.sources = {
  { name = "copilot" },
}

return M
