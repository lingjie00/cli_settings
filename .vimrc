" >> remap leader key
let mapleader = " "
nnoremap <SPACE> <Nop>

" >> remap bash escape
tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""
" File specific key mappings and macros
" <Leader>c for compile
" LaTex: compile latex file, delete temp files, map syntax
au FileType tex     nnoremap <buffer> <Leader>c :w <cr> :!pdflatex -output-directory '%:p:h'  '%:p' <cr>
au FileType tex     let @c=":!rm '%:p:r.aux' '%:p:r.log' '%:p:r.out' \<cr>""
au FileType tex     let @r="i\\begin{lstlisting}[language=R]\<cr>\\end{lstlisting}\<cr>"
au FileType tex     let @t="i\\begin{tabulary}{\linewidth}{l l}\<cr>\\end{tabulary}\<cr>"
au FileType tex     let @a="i\\begin{align*}\<cr>\\end{align*}\<cr>"
au FileType tex     let @i="i\\begin{itemize}\<cr>\\end{itemize}\<cr>"
au FileType tex     let @e="i\\begin{enumerate}\<cr>\\end{enumerate}\<cr>"

" R : run current script
au FileType R       nnoremap <buffer> <Leader>c :w <cr> :!Rscript '%:p'<cr>
" Rmd: compile Rmd file
au FileType rmd     nnoremap <buffer> <Leader>c :w <cr> :!Rscript -e "rmarkdown::render('%:p')"<cr>

" Markdown: compile to pdf
au FileType markdown nnoremap <buffer> <Leader>c :w <cr> :!pandoc '%:p' -o '%:p:r.pdf' <cr>

" Python: run current python script
au FileType python  nnoremap <buffer> <Leader>c :w <cr> :!python3 '%:p'<cr>
" Python: sort imports
au FileType python  let @s=":%!isort - \<cr>"
" >> shortcut to launch jupyter notebook
au FileType python  nmap <buffer> <leader>e :w<CR><Plug>JupyterExecute<CR>
au FileType python  nmap <buffer> <leader>E :w<CR><Plug>JupyterExecuteAll<CR>

" C++: compile the current file
au FileType C       nnoremap <buffer> <Leader>c :w<cr>:!g++ '%' -o '%:r'<cr>

" Json: reformat json files
au FileType json    nnoremap <buffer> <Leader>c :w<cr>:%!python -m json.tool<cr>

" Vim: source Vim config
au FileType vim    nnoremap <buffer> <Leader>c :w<cr>:source %<cr>

" Git related commands
nnoremap <Leader>w :w<cr> :!git add '%:p'<cr>
nnoremap <Leader>d :Git diff %:p<cr>

" Map <Leader>q as :q for qutting
nnoremap <Leader>q :q<cr>

" Navigate Quickfix list
nnoremap <Leader>[ :cnext<cr>
nnoremap <Leader>] :cprevious<cr>

" Auto close brackets in specific languages
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
au FileType tex,rmd         inoremap <buffer> $ $<space><space>$<left><left>
au FileType python          inoremap <buffer> % %%
au FileType tex             inoremap <buffer> \{ \left\{<space><space>\right\}

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
set ignorecase "ignore search case
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
