local M = { }
local cmp = require("cmp")
M.mapping =  {}
-- Mappings
M.mapping["<Tab>"] = cmp.mapping(function(fb)
  if not cmp.visible() then
    return fb()
  end
  local entry = cmp.get_selected_entry()
  if not entry then
    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
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
M.mapping["<CR>"] = nil

-- Sources

M.sources = {
  { name = "copilot" }
}

return M