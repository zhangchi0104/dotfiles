" ############################
" #                          # 
" #      COMMOM SETTINGS     #
" #                          #
" ############################ 
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

" ####################
" #                  #
" #     PLUGINS      #
" #                  # 
" ####################
source ~/.vimrc.d/plugins.vim

let g:netrw_banner=0
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

" ### buffer manipulation ### 
nnoremap <Leader>bl :ls<CR>             
nnoremap <Leader>bd :bdelete<CR>        
nnoremap <Leader>bn :bnext<CR>          
nnoremap <Leader>bp :bprevious<CR>

for f in glob('$HOME/.vimrc.d/**/*.vim', 0, 1)
  execute 'source' f
endfor
