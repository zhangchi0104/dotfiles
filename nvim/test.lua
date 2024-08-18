local function load_telescope()
  vim.api.nvim_set_hl(0, "TelescopeResultsDiffDelete", { fg = "#e36d76" })
  vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "#e36d76", fg = "#272822" })
  vim.api.nvim_set_hl(0, "TelescopeResultsDiffAdd", { fg = "#96c367" })
  vim.api.nvim_set_hl(0, "TelescopeResultsDiffChange", { fg = "#e6c181" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "NONE", fg = "#4D4E48" })
  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "#51afef", fg = "#272822" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE", fg = "#4D4E48" })
  vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "NONE", fg = "#e36d76" })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#2F302A", fg = "#f5f4f1" })
  vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE", fg = "#f5f4f1" })
  vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "#96c367", fg = "#272822" })
  vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "#363731", fg = "#51afef" })
end
load_telescope()