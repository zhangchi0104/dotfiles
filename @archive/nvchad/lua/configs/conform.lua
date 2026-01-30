local formatters = require("configs.stacks").formatters
local options = {
  formatters_by_ft = formatters,

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
