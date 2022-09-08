" >> remap leader key
let mapleader = " "
nnoremap <SPACE> <Nop>

" >> remap bash escape
tnoremap <Esc> <C-\><C-n>

"""""""""""""""
" Preferences
syntax on
set number
set relativenumber
set tabstop=4
set softtabstop=4
set textwidth=80
set colorcolumn=80
set wrap
set autoindent
set fileformat=unix
set shiftwidth=4
set expandtab
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set ignorecase "ignore search case
set cmdheight=1
set updatetime=300
set spell
set mouse=a
set completeopt=menu,menuone,preview,noinsert
set cmdheight=1
set termguicolors

""""""""""""""""""
" Declare some checks
runtime ./check.vim

" Plugin Install
runtime ./plugin.vim

" >> theme
let g:dracula_colorterm = 0
colorscheme dracula

""""""""""""""
" Key mappings
runtime ./keymap.vim

"""""""""""""""""
" Lua functions
runtime ./lua/config.lua

" lualine
runtime ./lua/lualine_theme.lua

" nvim tree
runtime ./lua/nvimtree.lua
" if internet == 1
" endif

" Change spelling highlight"
hi SpellBad cterm=undercurl
