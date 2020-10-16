call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'kyazdani42/nvim-tree.lua'

Plug 'ayu-theme/ayu-vim'

call plug#end()

let g:lua_tree_auto_open = 1
let g:lua_tree_icons = {
    \ 'folder': {
    \   'default': "└─",
    \   'open': "└─"
    \   }
    \ }

lua require("lsp")
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c


" ui
syntax on
set number
set cursorline
set termguicolors
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" make < > indent repeatable
xnoremap < <gv
xnoremap > >gv

" make backspace behave properly in insert mode
set backspace=indent,eol,start

" enable mouse
set mouse=a

" tab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" ingore case when searching
set ignorecase
set smartcase


" share clipboard with os
set clipboard^=unnamed,unnamedplus

" remember lastest line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


:set noswapfile
