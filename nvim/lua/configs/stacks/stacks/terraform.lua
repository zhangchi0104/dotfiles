local M = {}
local utils = require "utils"
M.syntax_highlights = {
  "hcl",
  "terraform",
}
M.manson = {
  "terraform-ls",
}
M.lsps = {
  terraformls = {},
}
utils.augroup("setIndentTerraform", { clear = true })
utils.autocmd("Filetype", {
  group = "setIndentTerraform",
  pattern = {
    "tf",
    "hcl",
  },
  command = "setlocal shiftwidth=2 tabstop=2",
})

return M
