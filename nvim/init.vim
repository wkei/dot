let g:python3_host_prog = '/usr/bin/python3'


""""""""""""""""""""""""" plugins
call plug#begin('~/.local/share/nvim/plugged')

" color
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'

" editor
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'branch': 'release/1.x',
      \ 'for': [
      \ 'javascript',
      \ 'typescript',
      \ 'css',
      \ 'less',
      \ 'scss',
      \ 'stylus',
      \ 'json',
      \ 'graphql',
      \ 'markdown',
      \ 'vue',
      \ 'lua',
      \ 'python',
      \ 'html'] }

Plug 'editorconfig/editorconfig-vim'

" Plug 'Shougo/denite.nvim'
Plug 'Shougo/defx.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}

Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'

" input
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'

" code
Plug 'dense-analysis/ale'
  let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
  let g:ale_linters = {'vue': ['eslint', 'vls']}

call plug#end()
""""""""""""""""""""""""" plugins


""""""""""""""""""""""""" display
syntax on 
set number 
set cursorline
set colorcolumn=81

" colors
set termguicolors
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

""""""""""""""""""""""""" display


""""""""""""""""""""""""" keys
" leader
let mapleader = "," 

" split navgation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" find and replace
map <leader>h :%s///<left><left>

" resize split window
nmap ( :vertical res -1<CR>
nmap ) :vertical res +1<CR>
nmap & :res -1<CR>
nmap * :res +1<CR>
nmap + <C-W>=<CR>

" make < > indent repeatable
xnoremap < <gv
xnoremap > >gv

" make backspace behave properly in insert mode
set backspace=indent,eol,start

""""""""""""""""""""""""" keys


""""""""""""""""""""""""" editor
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
" remove search highlight
nnoremap <silent> ,<space> :noh<CR>

" share clipboard with os
set clipboard^=unnamed,unnamedplus

" new splits will be at the bottom or to the right side of the screen
set splitbelow
set splitright

" remember lastest line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
""""""""""""""""""""""""" editor


""""""""""""""""""""""""" plugin config
" defx
noremap <silent>- :Defx -show-ignored-files 
      \ -split=vertical -winwidth=30 -direction=topleft<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " mapping
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('open', 'wincmd w \| drop')
  nnoremap <silent><buffer><expr> v defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> l defx#do_action('open_or_close_tree')
  " navgation
  nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd', [getcwd()])
endfunction

" prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'

" fzf
map <c-p> :Files<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

"""""""""""""""""""""" plugin config
