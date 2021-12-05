" ############################
" #                          # 
" #      COMMOM SETTINGS     #
" #                          #
" ############################ 
set runtimepath+=~/.vimrc.d
set number relativenumber 		    " show line number
set wildmenu		                " better command line completion 
set ruler                           " display cursor position
set nocompatible                    " must have
set showcmd                         " show partial commands in the last line
set hlsearch                        " highlight search
set ignorecase                      " search ignore case
set smartcase
syntax on                           " syntax highlight
set autoindent                      " Auto indent
set smartindent           
set sw=4                            " indent size = 4 
set tabstop=4
set expandtab
set backspace=indent,eol,start
set splitbelow
set splitright
set hidden
set nobackup
set nowritebackup
set updatetime=300
set stal=2          " Always show tabline
set laststatus=2
set termguicolors
if has('nvim')
  set noshowmode
else 
  set term=xterm-256color
endif 
" Always show signcolumn
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:netrw_banner=0
" ###################
" #                 #
" #     PLUGINS     #
" #                 # 
" ################### 
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    if has('nvim-0.6.0')
      Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}   " Advanced syntax highlight
    else
      Plug 'sheerun/vim-polyglot'                                   " Fallback highlight
    endif 
    Plug 'itchyny/lightline.vim'                                    " Status Line
    Plug 'tpope/vim-fugitive'                                       " For git
    Plug 'sbdchd/neoformat'                                         " Format
    Plug 'neoclide/coc.nvim', { 'branch': 'release',                
      \ 'do': ':CocInstall coc-json  coc-tsserver coc-pyright'
      \ }           
    if has('nvim')
      Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
      Plug 'akinsho/bufferline.nvim' 
    else
      Plug 'Shougo/defx.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'kristijanhusak/defx-icons'
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    Plug 'joshdick/onedark.vim'                                 " OneDark colorscheme
call plug#end()
filetype on
" ###########################
" #                         #
" #      COLOR SCHEME       #
" #                         #
" ###########################
colorscheme onedark


" ########################
" #                      # 
" #     KEY MAPPINGS     # 
" #                      #
" ########################


" Set leader to space
let mapleader = ' '
" Basic mapping
nnoremap <silent> qq :q<CR>
nnoremap <silent> ww :w<CR>
nnoremap <silent> QQ :q!<CR>
nnoremap <silent> qa :qa<CR>
nnoremap <silent> QA :qa!<CR>
nnoremap <silent> wa :wa<CR>
nnoremap <silent> U  :redo<CR> 
" ### Tab maipulation <leader>t ### 
nnoremap <silent> <Leader>tp :tabprevious<CR>
nnoremap <silent> <Leader>tt :tabnew<CR>
nnoremap <silent> <Leader>tn :tabnext<CR>
nnoremap <silent> <Leader>to :tabonly<CR>
nnoremap <silent> <Leader>td :tabclose<CR>

nnoremap <silent> <Leader>t1 gt1<cr>
nnoremap <silent> <Leader>t2 gt2<cr>
nnoremap <silent> <Leader>t3 gt3<cr>
nnoremap <silent> <Leader>t4 gt4<cr>
nnoremap <silent> <Leader>t5 gt5<cr>
nnoremap <silent> <Leader>t6 gt6<cr>
nnoremap <silent> <Leader>t7 gt7<cr>
nnoremap <silent> <Leader>t8 gt8<cr>
nnoremap <silent> <Leader>t9 gt9<cr>

" ### Window manipulation ### 
nnoremap <Leader>h <C-w>h               
nnoremap <Leader>j <C-w>j                   
nnoremap <Leader>k <C-w>k              
nnoremap <Leader>l <C-w>l              
nnoremap <Leader>wd <C-w>q              
nnoremap <Leader>wH <C-w>H              
nnoremap <Leader>wJ <C-w>J              
nnoremap <Leader>wK <C-w>K              
nnoremap <Leader>wL <C-w>L              

" ### File Tree manipulation ###
nnoremap <silent> <Leader>ft :Defx -columns=icons:indent:filename:type<CR>

" ### buffer manipulation ### 
nnoremap <Leader>bl :ls<CR>             
nnoremap <Leader>bd :bdelete<CR>        
nnoremap <Leader>bn :bnext<CR>          
nnoremap <Leader>bp :bprevious<CR>

" Uses Tab to trigger compeletion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
endfunction


" ### coc key-mapping ###
nnoremap <silent> <F1>  :CocCommand<CR> 
nnoremap <silent> <Leader>ce
  \ :CocList diagnostics<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <Leader>cr <Plug>(coc-rename)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" ### Neoformat key mapping ###
nnoremap <Leader>bf :Neoformat<CR>
" ############################
" #                          #
" #     PLUGIN SETTINGS      #
" #                          #
" ############################


" ### Defx - The File Manager ### 
call defx#custom#option('_', {
  \ 'winwidth':   30,
  \ 'split':      'vertical',
  \ 'direction':  'botright',
  \ 'toggle':     1,
  \ 'resume':     1,
  \ }) 

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
" Helper functions for vim lightline
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
  
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

" ### Neoformat ###
augroup neoformat
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
" #####################################
" #                                   # 
" #     LANGUAGE SPECIFIC SETTING     #
" #                                   #
" ##################################### 

" ### Go ###
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
for f in glob('$HOME/.vimrc.d/**/*.vim', 0, 1)
  execute 'source' f
endfor
