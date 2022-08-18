"""""""""""""""""""
" Functional remap
"""""""""""""""""""
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
" shortcut for global copy
noremap <leader>p "+p
noremap <leader>y "+y
noremap <leader>Y "+y$
" copy file name to clipboard
nnoremap <Leader>+ :let @+=expand('%:p')<CR>
" Map <Leader>q as :q for qutting
nnoremap <Leader>q :q<cr>
" Navigate Quickfix list
nnoremap ]e :cnext<cr>
nnoremap [e :cprevious<cr>
" cancel highlight with escape
nnoremap <silent> <Esc> <Esc>:noh<CR>

""""""""""""
" insearch
""""""""""""
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

""""""""""
" Harpoon
""""""""""
" >> adds perm bookmark with Harpoon
nnoremap <leader>~ <cmd>lua require'harpoon.mark'.add_file()<CR>
nnoremap <leader>1 <cmd>lua require'harpoon.ui'.nav_file(1)<CR>
nnoremap <leader>2 <cmd>lua require'harpoon.ui'.nav_file(2)<CR>
nnoremap <leader>3 <cmd>lua require'harpoon.ui'.nav_file(3)<CR>
nnoremap <leader>4 <cmd>lua require'harpoon.ui'.nav_file(4)<CR>
nnoremap <leader>5 <cmd>lua require'harpoon.ui'.nav_file(5)<CR>
nnoremap <leader>6 <cmd>lua require'harpoon.ui'.nav_file(6)<CR>
nnoremap <leader>7 <cmd>lua require'harpoon.ui'.nav_file(7)<CR>
nnoremap <leader>8 <cmd>lua require'harpoon.ui'.nav_file(8)<CR>
nnoremap <leader>9 <cmd>lua require'harpoon.ui'.nav_file(9)<CR>
nnoremap <leader>0 <cmd>lua require'harpoon.ui'.nav_file(10)<CR>
nnoremap <leader>` <cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>

"""""""""""""""""""""
" Telescope bindings
"""""""""""""""""""""
" find grep
nnoremap <Leader>; <cmd>Telescope live_grep<CR>
" find in current buffer
nnoremap <Leader>/ <cmd>Telescope current_buffer_fuzzy_find<CR>
" search in git files
nnoremap <Leader>f <cmd>Telescope git_files<CR>
" search all files
nnoremap <Leader>F <cmd>Telescope find_files<CR>
" search all available helps
nnoremap <Leader>? <cmd>Telescope help_tags<CR>
" search all available functions
nnoremap <Leader>r <cmd>Telescope commands<CR>
" search all Telescope functions
nnoremap <Leader>R <cmd>Telescope builtin<CR>

""""""""""""""""""""
" Lsp key bindings
""""""""""""""""""""
nnoremap K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <C-p> <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <C-n> <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap gn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap gd    <cmd>Telescope lsp_definitions<CR>
nnoremap gr    <cmd>Telescope lsp_references<CR>
nnoremap gi    <cmd>Telescope lsp_implementations<CR>
nnoremap gs    <cmd>Telescope lsp_document_symbols<CR>

"""""""""""""""""""""""""""""""
" DAP - Debug Adapter Protocol
"""""""""""""""""""""""""""""""
nnoremap <silent> <Bslash>i  <cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <Bslash>o  <cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Bslash>p  <cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <Bslash>c  <cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <Bslash>b  <cmd>lua require'persistent-breakpoints.api'.toggle_breakpoint()<CR>
