" ### File Tree manipulation ###
nnoremap <silent> <Leader>ft :Defx -columns=icons:indent:filename:type<CR>


call defx#custom#option('_', {
  \ 'winwidth':   30,
  \ 'split':      'vertical',
  \ 'direction':  'botright',
  \ 'toggle':     1,
  \ 'resume':     1,
  \ }) 
" ### Defx key mapping ### 
autocmd FileType defx call s:ConfigKeyMap()
" autocmd VimEnter * Defx -no-focus -columns=icons:indent:filename:type
function! s:ConfigKeyMap() abort
  " open selected file in new buffer
  nnoremap <silent><buffer><expr> <CR>
    \ bufname('$') == '[defx] default-0' && !strlen(bufname(1))
    \ ? defx#do_action('drop')
    \ : defx#do_action('drop', 'tabnew')
  nnoremap <silent><buffer><expr> vs
    \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> s
    \ defx#do_action('drop', 'split') 
  nnoremap <silent><buffer><expr> o
    \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> p
    \ defx#do_action('cd', ['..']) 
  nnoremap <silent><buffer><expr> n
    \ defx#do_action('new_file') 
  nnoremap <silent><buffer><expr> DD
    \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> .. 
    \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> cd
    \ defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> h
    \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> f
    \ defx#do_action('call', 'DefxGoto')
endfunction

function DefxGoto(ctx) abort
    let dir = input('Please enter a directory: ')
    let dir = fnamemodify(dir, ':p:h')
    call defx#call_action('cd', dir)
endfunction

