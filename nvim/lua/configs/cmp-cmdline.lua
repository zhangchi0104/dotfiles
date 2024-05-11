local cmp = require "cmp"
local M = {}
local mapping = cmp.mapping.preset.cmdline()
mapping["<Tab>"] = {
  c = function(fallback)
    if cmp.visible() then
      local entry = cmp.get_selected_entry()
      if not entry then
        cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
      end
      cmp.confirm()
    else
      fallback()
    end
  end,
}
mapping["<Up>"] = {
  c = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end,
}
mapping["<Down>"] = {
  c = function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
  end,
}
M.setup = function()
  cmp.setup.cmdline(":", {
    mapping = mapping,
    sources = cmp.config.sources {
      { name = "path" },
      {
        name = "cmdline",
        option = {
          ignore_cmds = { "Man", "!" },
        },
      },
    },
  })
end
return M

