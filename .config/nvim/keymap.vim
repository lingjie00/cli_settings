""""""""""""""""""""""
" File specific key mappings and macros
" <Leader>c for compile
" LaTex: compile latex file, delete temp files, map syntax
au FileType tex     nnoremap <buffer> <Leader>c :w <cr> :AsyncRun pdflatex -output-directory '%:p:h'  '%:p' <cr>
au FileType tex     let @c=":AsyncRun rm '%:p:r.aux' '%:p:r.log' '%:p:r.out' \<cr>""
au FileType tex     let @r="i\\begin{lstlisting}[language=R]\<cr>\\end{lstlisting}\<cr>"
au FileType tex     let @t="i\\begin{tabulary}{\linewidth}{l l}\<cr>\\end{tabulary}\<cr>"
au FileType tex     let @a="i\\begin{align*}\<cr>\\end{align*}\<cr>"
au FileType tex     let @i="i\\begin{itemize}\<cr>\\end{itemize}\<cr>"
au FileType tex     let @e="i\\begin{enumerate}\<cr>\\end{enumerate}\<cr>"

" R : run current script
au FileType R       nnoremap <buffer> <Leader>c :w <cr> :AsyncRun Rscript '%:p'<cr>
" Rmd: compile Rmd file
au FileType rmd     nnoremap <buffer> <Leader>c :w <cr> :AsyncRun Rscript -e "rmarkdown::render('%:p')"<cr>

" Markdown: compile to pdf
au FileType markdown nnoremap <buffer> <Leader>c :w <cr> :AsyncRun pandoc '%:p' -o '%:p:r.pdf' <cr>

" Python: run current python script
au FileType python  nnoremap <buffer> <Leader>c :w <cr> :AsyncRun python3 '%:p'<cr>
" Python: run jupyter ascending sync (a bit buggy at this moment)
au FileType python  nnoremap <buffer> <Leader>e :w <cr> :AsyncRun python3 -m jupyter_ascending.requests.sync --filename '%:p'<cr>

" C++: compile the current file
au FileType C       nnoremap <buffer> <Leader>c :w<cr>:AsyncRun g++ '%' -o '%:r'<cr>

" Json: reformat json files
au FileType json    nnoremap <buffer> <Leader>c :w<cr>:%AsyncRun python -m json.tool<cr>

" Vim: source Vim config
au FileType vim    nnoremap <buffer> <Leader>c :w<cr>:source %<cr>

" Java: compile
au FileType java   nnoremap <buffer> <Leader>c :w<cr>:AsyncRun javac %<cr>

" Git related commands
nnoremap <Leader>w :w<cr> :! git add '%:p'<cr>
nnoremap <Leader>d :Git diff %<cr>

" Map <Leader>q as :q for qutting
nnoremap <Leader>q :q<cr>

" Navigate Quickfix list
nnoremap <Leader>] :cnext<cr>
nnoremap <Leader>[ :cprevious<cr>

" change working drive
nnoremap <Leader>cd :cd %:p:h<cr>

" cancel highlight with escape
nnoremap <silent> <Esc> <Esc>:noh<CR>

" copy file name to clipboard
:nnoremap <Leader>+ :let @+=expand('%:p')<CR>

" Auto close brackets in specific languages
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
au FileType tex,rmd         inoremap <buffer> $ $$<left>
au FileType python          inoremap <buffer> % %%
au FileType tex             inoremap <buffer> \{ \left\{<space><space>\right\}

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
" copy word and after
nnoremap Y y$
" >> shortcut for global copy
noremap <leader>p "+p
noremap <leader>y "+y
noremap <leader>Y "+y$

" >> map Easymotion s{char}{char} to move to {char}{char}
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-f2)
nmap S <Plug>(easymotion-s2)

" >> adds perm bookmark with Harpoon
nnoremap <leader>` <cmd>lua require'harpoon.mark'.add_file()<CR>
nnoremap <leader>1 <cmd>lua require'harpoon.ui'.nav_file(1)<CR>
nnoremap <leader>2 <cmd>lua require'harpoon.ui'.nav_file(2)<CR>
nnoremap <leader>3 <cmd>lua require'harpoon.ui'.nav_file(3)<CR>
nnoremap <leader>4 <cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>

" >> send to tmux buffer
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>a :SlimuxShellLast<CR>

" >> shortcut to launch Trouble
nnoremap <C-t> :TroubleToggle<CR>

" >> Zoom nvim window
nnoremap <Leader><CR> :NeoZoomToggle<CR>

" >> Telescope bindings
" find buffer
nnoremap <Leader>; <cmd>lua require'telescope.builtin'.buffers{}<CR>
" find in current buffer
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>
" search in git files
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.git_files{}<CR>
" search all files
nnoremap <Leader>F <cmd>lua require'telescope.builtin'.find_files{}<CR>

" >> Lsp key bindings
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gd    <cmd>lua require'telescope.builtin'.lsp_definitions()<CR>
nnoremap <silent> gr    <cmd>lua require'telescope.builtin'.lsp_references()<CR>
nnoremap <silent> gi    <cmd>lua require'telescope.builtin'.lsp_implementations()<CR>

" >> shortcut to show var
nnoremap <C-y> <cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>

" show quickfix after runing AsyncRun
let g:asyncrun_open = 6

" DAP
nnoremap <silent> <Bslash>i  <cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <Bslash>o  <cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Bslash>p  <cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <Bslash>c  <cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <Bslash>b  <cmd>lua require'persistent-breakpoints.api'.toggle_breakpoint()<CR>
