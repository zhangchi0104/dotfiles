" ### Lightline - Status ###
let g:lightline = {
  \ 'colorshceme': 'onedark',
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['bufnum'],
  \             ['git_branch', 'iconrelpath', 'modified'] ],
  \   'right': [ ['my_lineinfo'],
  \              ['my_percent'],
  \              ['fileformat', 'fileencoding'] ]
  \ },
  \ 'inactive': {
  \   'left': [ ['bufnum'],
  \             ['iconrelpath',  'modified'] ],
  \   'right': [ ['fileformat', 'fileencoding'] ]
  \ },
  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
  \ 'component_function': {
  \   'iconrelpath': 'IconRelPath',
  \   'filetype': 'MyFiletype',
  \   'fileformat': 'MyFileformat',
  \   'my_percent': 'MyPercent',
  \   'my_lineinfo': 'MyLineInfo',
  \ },
  \ 'component': {
  \   'git_branch': "\ue725 %{FugitiveHead()}",
  \ },
  \ 'tab': {
  \   'active': [ 'tabnum', 'iconfilename', 'modified' ],
  \   'inactive': [ 'tabnum', 'iconfilename', 'modified' ]
  \ },
  \ 'tabline': {
  \   'right': []
  \ },
  \ 'tab_component_function': {
  \   'iconfilename': 'IconFileName'
  \ }
  \}

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! IconFileName(n)
  return WebDevIconsGetFileTypeSymbol(). ' ' . lightline#tab#filename(a:n)
endfunction 

function! IconRelPath()
  if &filetype == 'startify'
    return 'Startify'
  elseif &filetype == 'defx'
    return 'Defx'
  elseif strlen(expand('%'))== 0
    return 'no name'
  endif
  
  let s:absPaths = split(expand('%:p'), '/')
  let s:displayFilePath = len(s:absPaths) < 2
    \ ? s:absPaths[0]
    \ : join(s:absPaths[-2:-1], '/')
  return WebDevIconsGetFileTypeSymbol() . ' ' . s:displayFilePath
endfunction

function! LightlineReadonly()
  return &readonly && &filetype !~# '\v(help|vimfiler|unite|defx|startify)'
endfunction

function! MyPercent()
    if LightlineReadonly() || winwidth(0) < 70
        return ''
    else
        return line('.') * 100 / line('$') . '%'
    endif
endfunction


function! MyLineInfo()
    if LightlineReadonly() || winwidth(0) < 70
        return ''
    else
        return line('.') . ':' . col('.')
    end
endfunction


function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
