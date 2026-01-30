-- indent-blankline.lua
-- Description: Indent-blankline
-- Author: Chi Zhang
-- Date: 2022/05/05

local present, error = pcall(require, 'indent-blankline.nvim')
if not present then
  return
end

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
