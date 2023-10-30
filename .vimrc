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
set ignorecase "ignore search case
set updatetime=50
set nospell
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
    " Plug 'morhetz/gruvbox'

    " navigation shortcut
    Plug 'christoomey/vim-tmux-navigator'
    " Send command to tmux buffer
    Plug 'jpalardy/vim-slime'

    " insearch
    Plug 'haya14busa/incsearch.vim'

    " Git
    Plug 'tpope/vim-fugitive' " adds Git command to vim
    Plug 'airblade/vim-gitgutter' " shows git diff marks
    Plug 'rhysd/conflict-marker.vim' " resolve Git conflict

    " surround
    Plug 'tpope/vim-surround'

    " generate markdown TOC
    Plug 'mzlogin/vim-markdown-toc'

    " lsp
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'

    " Auto-complete
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'

    " DAP
    Plug 'puremourning/vimspector'


" Initialize plugin system
call plug#end()

""""""""""""""
let g:dracula_colorterm = 0
colorscheme dracula
" Gruvbox
" autocmd vimenter * ++nested colorscheme gruvbox
" set background=dark
" let g:gruvbox_contrast_dark="hard"

" >> vim-slime config
" set tmux as the default slime target
let g:slime_target = 'tmux'
" use Ipython notation of %% for a new cell
let g:slime_cell_delimiter = '^\\s*# %%' 
" fix tmux auto spacing issue
let g:slime_bracketed_paste = 1
" set default target location
let g:slime_default_config = { 'socket_name': 'default', 'target_pane': ':.1' }
let g:slime_dont_ask_default = 1

" >> change edit history
set noswapfile
let undodir = "/.vim/undodir"

"""""""""""""""
" map keys
" >> replace default search with insearch
set nohlsearch
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
" >> view folders
nnoremap <leader>' :Ex<CR>
" >> navigate quickfix
nnoremap ]e :cnext<CR>zz
nnoremap [e :cprev<CR>zz

" >> vim-slime keymap
let g:slime_no_mappings = 1
nnoremap \c <Plug>SlimeCellsSendAndGoToNext<CR>
nnoremap \n <Plug>SlimeCellsNext<CR>
nnoremap \p <Plug>SlimeCellsPrev<CR>
nnoremap \s <Plug>SlimeRegionSend<CR>
nnoremap \S <Plug>SlimeParagraphSend<CR>
