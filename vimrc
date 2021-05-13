" Macros
" LaTex
let @t=":w \<cr> :!pdflatex -output-directory '%:p:h'  '%:p' \<cr> :!rm '%:p:r.aux' '%:p:r.log' '%:p:r.out' \<cr>"
let @1="i\\begin{lstlisting}[language=R]"
let @3="i\\begin{align*}\<cr>\\end{align*}"
" System
let @s=":!wakeonlan -i 192.168.86.255 9c:5c:8e:bf:fc:c3 \<cr> i ssh ling@222.164.164.230 -p 99 \<Esc> yydd"
" R
let @r=":term Rscript % \<cr>"
" Python
let @p=":term python % \<cr>"

let g:SimpylFold_docstring_preview=1
let python_highlight_all=1
let NERDTreeIgnore=['\~$']
let R_assign = 0

" Folder Tree options
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

""""""""""""""""""""
" Auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""
" set cursor always center
"augroup VCenterCursor
"  au!
"  au BufEnter,WinEnter,WinNew,VimResized *,*.*
"        \ let &scrolloff=winheight(win_getid())/2
"augroup END

"""""""""""""""
" Preferences
syntax on
set number
set tabstop=4
set softtabstop=4
"set textwidth=79
set autoindent
set fileformat=unix
set shiftwidth=4
set expandtab
"set clipboard=unnamed
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set ignorecase "ignore search case


"""""""""""""""
" map keys
" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"nnoremap <space> za

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

""""""""""""""""""
" R plug in
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect


"""""""""""""""""
" Python plug in
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'

"""""""""
" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

"send code to terminal
Plug 'erietz/vim-terminator'

" Theme
"Plug 'morhetz/gruvbox'

" LaTeX
Plug 'lervag/vimtex'
Plug 'vim-scripts/Latex-Text-Formatter'
            
" Folder Tree
Plug 'preservim/nerdtree'

" status bar
Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()

"colorscheme gruvbox
set background=dark

