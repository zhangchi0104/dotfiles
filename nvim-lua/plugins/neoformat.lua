-- neoformat
-- Author: Chi Zhang
-- Date: 27/12/2021
-- Description: configuration for formatters

vim.api.nvim_exec([[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup end 
]], true)
