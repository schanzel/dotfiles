set shell=/bin/bash
let g:loaded_python_provider = 1
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin('~/.local/share/nvim/plugged')

Plug '907th/vim-auto-save'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'aserebryakov/vim-todo-lists', { 'on_ft': 'todo' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'dhruvasagar/vim-table-mode', { 'on_ft': 'markdown' }
Plug 'mhinz/vim-janah'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim'
Plug 'justinmk/vim-sneak'
Plug 'lervag/vimtex', { 'on_ft': 'tex' }
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc', { 'on_ft': 'markdown' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'on_ft': 'markdown' }
Plug 'junegunn/fzf.vim'

source /usr/local/opt/fzf/plugin/fzf.vim

call plug#end()

set updatetime=100

" show substitute preview in split buffer
set icm=split

let mapleader = "\<Space>"
let maplocalleader = "\<Space>\<Space>"
nnoremap <leader>st :Startify<cr>
nnoremap <leader>ff :Files<cr>

let g:clipboard =
      \{
      \  'copy': {
      \    '+': 'pbcopy',
      \    '*': 'pbcopy'
      \  },
      \  'paste': {
      \    '+': 'pbpaste',
      \    '*': 'pbpaste'
      \  },
      \  'name': 'pbcopy',
      \  'cache_enabled': 0
      \}

set clipboard+=unnamedplus
set number
set relativenumber
set noshowmode

syntax enable
colorscheme janah
set termguicolors

" use minimalist airline theme
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1

let g:auto_save = 1
let g:auto_save_silent = 1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()
call deoplete#custom#var('omni', 'input_patterns', {
  \ 'pandoc': '@'
\})


let b:table_mode_corner="+"
let b:table_mode_corner_corner="+"
let b:table_mode_header_fillchar="="

let g:signify_vcs_list=['git']

" 2 spaces as default indent
set tabstop=4
set shiftwidth=2
set softtabstop=0
set expandtab
set smarttab

" 4 spaces for specific filetypes
autocmd Filetype python setlocal shiftwidth=4

let g:tex_flavor = 'latex'

let g:goyo_width = 100

autocmd BufWritePre *.yaml :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e

set undofile
