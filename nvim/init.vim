" ================================================
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ayu-theme/ayu-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'

Plug 'posva/vim-vue'
let g:vue_pre_processors = ['sass', 'scss', 'typescript']

Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()
" ================================================


" ================================================
" Coc Config
nmap <C-l> :CocList<CR>
nmap <C-p> :CocList files<CR>
nmap <C-e> :CocCommand explorer<CR>

let g:coc_global_extensions = [
  \'coc-json',
  \'coc-explorer',
  \'coc-git',
  \'coc-eslint',
  \'coc-lists',
  \'coc-vetur',
  \'coc-tsserver',
  \'coc-tabnine',
  \'coc-css'
  \]

autocmd FileType scss setl iskeyword+=@-@
" ================================================


" ================================================
syntax on 
if exists('+termguicolors')
  set termguicolors
  " let ayucolor="mirage"
  " let ayucolor="light"
  let ayucolor="dark"
  colorscheme ayu
endif
" ================================================


" ================================================
set number 
" set cursorline
set colorcolumn=81
set mouse=a
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set clipboard^=unnamed,unnamedplus
" ================================================


" ================================================
let mapleader = "," 

" make < > indent repeatable
xnoremap < <gv
xnoremap > >gv
" ================================================
