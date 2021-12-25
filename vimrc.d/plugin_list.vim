" ###################
" #                 #
" #     PLUGINS     #
" #                 # 
" ################### 
if !exists('g:SOURCE_PLUGINS_VIM')
    let g:SOURCE_PLUGINS_VIM = 1
    call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
        if has('nvim-0.6.0')
            Plug 'nvim-lua/plenary.nvim'
            Plug 'nvim-telescope/telescope.nvim'
            Plug 'goolord/alpha-nvim'
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
        Plug 'ryanoasis/vim-devicons'
        Plug 'kyazdani42/nvim-web-devicons'
        Plug 'joshdick/onedark.vim'                                 " OneDark colorscheme
    call plug#end()
endif
