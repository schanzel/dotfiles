set shell=/bin/bash
let g:loaded_python_provider = 1
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin('~/.local/share/nvim/plugged')

Plug 'ericbn/vim-solarized'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim'
Plug 'vim-pandoc/vim-pandoc', { 'on_ft': 'markdown' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'on_ft': 'markdown' }
Plug 'dhruvasagar/vim-table-mode', { 'on_ft': 'markdown' }
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'christoomey/vim-tmux-navigator'
Plug 'aserebryakov/vim-todo-lists', { 'on_ft': 'todo' }

call plug#end()

set updatetime=100

" User Config
let mapleader = "\<Space>"
let maplocalleader = "\<Space>\<Space>"
nnoremap <leader>st :Startify<cr>
nnoremap <leader>ft :NERDTreeToggle<cr>

let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'}, 'paste': {'+': 'pbpaste', '*': 'pbpaste'}, 'name': 'pbcopy', 'cache_enabled': 0}
set clipboard+=unnamedplus
set number
set noshowmode

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
set termguicolors

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()

let g:table_mode_corner='|'

" by default, the indent is 2 spaces. 
set shiftwidth=2
set softtabstop=2
set tabstop=2
" set textwidth=79

" for specific files, 4 spaces
autocmd Filetype pandoc setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

function! GitBr()
	let branch = gitbranch#name()
	if branch == ''
		return ''
	else
		return ' ' . branch
	endif
endfunction

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'GitBr'
      \ },
      \ }

