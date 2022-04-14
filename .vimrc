" >> remap leader key
let mapleader = " "
nnoremap <SPACE> <Nop>

" >> remap bash escape
tnoremap <Esc> <C-\><C-n>

"""""""""""""""
" Preferences
syntax on
set number
set tabstop=4
set softtabstop=4
set textwidth=60
set colorcolumn=60
set nowrap
set autoindent
set fileformat=unix
set shiftwidth=4
set expandtab
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set cmdheight=1
set updatetime=300
set spell
set mouse=a
set completeopt=menu,menuone,preview,noinsert
set cmdheight=1
set termguicolors

"""""""""""""""""""
" Plugin
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
    " theme
    Plug 'dracula/vim'

    " status bar
    Plug 'vim-airline/vim-airline'
    " gruvbox
    Plug 'morhetz/gruvbox'

    " navigation shortcut
    Plug 'christoomey/vim-tmux-navigator'

    " insearch
    Plug 'haya14busa/incsearch.vim'

    " Git
    Plug 'tpope/vim-fugitive' " adds Git command to vim
    Plug 'airblade/vim-gitgutter' " shows git diff marks

" Initialize plugin system
call plug#end()

""""""""""""""
let g:dracula_colorterm = 0
colorscheme dracula
" Gruvbox
" autocmd vimenter * ++nested colorscheme gruvbox
" set background=dark
" let g:gruvbox_contrast_dark="hard"

"""""""""""""""
" map keys
" >> replace default search with insearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)zz
map N  <Plug>(incsearch-nohl-N)zz
map *  <Plug>(incsearch-nohl-*)zz
map #  <Plug>(incsearch-nohl-#)zz
map g* <Plug>(incsearch-nohl-g*)zz
map g# <Plug>(incsearch-nohl-g#)zz

" >> Functional remap
" keeping next line centered
nnoremap J mzJ`z
" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" Jump list mutation
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-1<CR>==
" copy word and after
nnoremap Y y$
" >> shortcut for global copy
noremap <leader>p "+p
noremap <leader>y "+y
noremap <leader>Y "+y$
