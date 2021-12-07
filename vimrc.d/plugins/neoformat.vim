" ### Neoformat key mapping ###
nnoremap <Leader>bf :Neoformat<CR>

" ### Neoformat ###
augroup neoformat
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
