-- utils.lua
-- Author: Chi Zhang
-- Date 24/12/2021
-- Description: helper functions
local M = {}

function M.nnoremap(src, dst, opts)
    opts = opts or {silent=true, expr=false} 
    vim.api.nvim_set_keymap('n', src, dst, opts)
end

return M 
