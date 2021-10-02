""""""""""""""""""""""
" Macros
" LaTex
let @t=":w \<cr> :!pdflatex -output-directory '%:p:h'  '%:p' \<cr> :!rm '%:p:r.aux' '%:p:r.log' '%:p:r.out' \<cr>"
let @1="i\\begin{lstlisting}[language=R]"
" R
let @r=":term Rscript % \<cr>"
" Python
let @p=":term python % \<cr>"
" C++
let @c=":!g++ '%' -o '%:r' \<cr>"
" Json
let @j=":%!python -m json.tool \<cr>"

let g:SimpylFold_docstring_preview=1
let python_highlight_all=1
let R_assign = 0

"""""""""""""""
" Preferences
syntax on
set number
set relativenumber
set tabstop=4
set softtabstop=4
set textwidth=120
set autoindent
set fileformat=unix
set shiftwidth=4
set expandtab
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set ignorecase "ignore search case
set cmdheight=2
set updatetime=300
set spell
set mouse=a

" Don't redraw while executing macros (good performance config)
set lazyredraw

" >> load plugins
call plug#begin(stdpath('data') . 'vimplug')
    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " LSP
    Plug 'nvim-lua/popup.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'

    " LaTeX
    Plug 'lervag/vimtex'

    " status bar
    Plug 'vim-airline/vim-airline'

    " gruvbox
    Plug 'morhetz/gruvbox'

    " navigation shortcut
    Plug 'christoomey/vim-tmux-navigator'

    "Nerd tree
    Plug 'preservim/nerdtree'

    " send buffer
    Plug 'esamattis/slimux'

    " insearch
    Plug 'haya14busa/incsearch.vim'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'airblade/vim-gitgutter'
call plug#end()


""""""""""""""
" Gruvbox
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
" let g:gruvbox_contrast_dark="hard"

" insearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" send to buffer
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>b :SlimuxREPLSendBuffer<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>

" >> Telescope bindings
nnoremap <Leader>pp <cmd>lua require'telescope.builtin'.builtin{}<CR>

" most recently used files
nnoremap <Leader>m <cmd>lua require'telescope.builtin'.oldfiles{}<CR>

" find buffer
nnoremap ; <cmd>lua require'telescope.builtin'.buffers{}<CR>

" find in current buffer
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" bookmarks
nnoremap <Leader>' <cmd>lua require'telescope.builtin'.marks{}<CR>

" git files
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.git_files{}<CR>

" all files
nnoremap <Leader>bfs <cmd>lua require'telescope.builtin'.find_files{}<CR>

" ripgrep like grep through dir
nnoremap <Leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>

" pick color scheme
nnoremap <Leader>cs <cmd>lua require'telescope.builtin'.colorscheme{}<CR>


" >> setup nerdcomment key bindings
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

xnoremap <Leader>ci <cmd>call NERDComment('n', 'toggle')<CR>
nnoremap <Leader>ci <cmd>call NERDComment('n', 'toggle')<CR>


" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>

lua <<EOF
require'lspconfig'.pylsp.setup{}
require'lspconfig'.r_language_server.setup{}
EOF
