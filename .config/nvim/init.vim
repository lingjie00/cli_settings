" >> remap leader key
let mapleader = " "
nnoremap <SPACE> <Nop>

""""""""""""""""""""""
" File specific key mappings and macros
" <Leader>c for compile
" LaTex: compile latex file, delete temp files, map syntax
au FileType tex     nnoremap <Leader>c :w <cr> :!pdflatex -output-directory '%:p:h'  '%:p' <cr>
au FileType tex     let @c=":!rm '%:p:r.aux' '%:p:r.log' '%:p:r.out' \<cr>""
au FileType tex     let @r="i\\begin{lstlisting}[language=R]\<cr>\\end{lstlisting}\<cr>"
au FileType tex     let @t="i\\begin{tabulary}{\linewidth}{l l}\<cr>\\end{tabulary}\<cr>"
au FileType tex     let @a="i\\begin{align*}\<cr>\\end{align*}\<cr>"
au FileType tex     let @i="i\\begin{itemize}\<cr>\\end{itemize}\<cr>"
au FileType tex     let @e="i\\begin{enumerate}\<cr>\\end{enumerate}\<cr>"

" R : run current script
au FileType R       nnoremap <Leader>c :w <cr> :!Rscript '%:p'<cr>
" Rmd: compile Rmd file
au FileType rmd     nnoremap <Leader>c :w <cr> :!Rscript -e "rmarkdown::render('%:p')"<cr>

" Markdown: compile to pdf
au FileType markdown nnoremap <Leader>c :w <cr> :!pandoc '%:p' -o '%:p:r.pdf' <cr>

" Python: run current python script
au FileType python  nnoremap <Leader>c :w <cr> :!python3 '%:p'<cr>
" Python: sort imports
au FileType python  let @s=":%!isort - \<cr>"
" >> shortcut to launch jupyter notebook
au FileType python  nmap <leader>e :w<CR><Plug>JupyterExecute<CR>
au FileType python  nmap <leader>E :w<CR><Plug>JupyterExecuteAll<CR>

" C++: compile the current file
au FileType C       nnoremap <Leader>c :w<cr>:!g++ '%' -o '%:r'<cr>

" Json: reformat json files
au FileType json    nnoremap <Leader>c :w<cr>:%!python -m json.tool<cr>

" Vim: source Vim config
au FileType vim    nnoremap <Leader>c :w<cr>:source %<cr>

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
au FileType tex,rmd         inoremap $ $<space><space>$<left><left>
au FileType python          inoremap % %<space>%
au FileType tex             inoremap { \left{<tab><tab>\right}

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
set cmdheight=2
set updatetime=300
set spell
set mouse=a
set completeopt=menu,menuone,preview,noinsert
set cmdheight=1


""""""""""""""""""
" Plugin Install
call plug#begin(stdpath('data') . 'vimplug')
    """""""""""
    " Themes  "
    """""""""""
    " gruvbox, no longer used but used to love this
    " Plug 'morhetz/gruvbox'

    " Catppuccino
    Plug 'catppuccin/nvim'

    " status bar
    Plug 'nvim-lualine/lualine.nvim' " status bar
    Plug 'SmiteshP/nvim-gps' " adds sub-loc to function name

    """""""""""
    " Plugins "
    """""""""""
    " Basic lua functions needed for many plugins
    Plug 'nvim-lua/plenary.nvim'

    " add list of web icons
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'yamatsum/nvim-nonicons'

    " navigation
    Plug 'nvim-telescope/telescope.nvim' " telescope
    Plug 'haya14busa/incsearch.vim' " adds partial search support
    Plug 'ThePrimeagen/harpoon' " adds perm bookmark to files
    Plug 'kyazdani42/nvim-tree.lua' " adds file browser
    Plug 'easymotion/vim-easymotion' " better jump word
    Plug 'folke/trouble.nvim' " nav to code errors
    Plug 'stevearc/aerial.nvim' " nav to code structure

    " tmux navigation
    Plug 'christoomey/vim-tmux-navigator' " nav shortcut for tmux
    Plug 'esamattis/slimux' " sends buffer to tmux

    " Autocomplete
	Plug 'hrsh7th/nvim-cmp' " main plugin
	Plug 'hrsh7th/cmp-nvim-lsp' " add lsp support
	Plug 'hrsh7th/cmp-buffer' " add buffer support
    Plug 'hrsh7th/cmp-path' " add path support
    Plug 'f3fora/cmp-spell' " add spelling support

    " LSP
    Plug 'neovim/nvim-lspconfig' " config lsp key maps
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " provide better code highlights
    Plug 'terrortylor/nvim-comment' " convert code into comments
    Plug 'tpope/vim-surround' " auto modify surround brackets
    Plug 'williamboman/nvim-lsp-installer' " LspInstall
    Plug 'folke/todo-comments.nvim' " Highlight TODO, FIX

    " Specific Language support
    Plug 'lervag/vimtex' " latex
    Plug 'ellisonleao/glow.nvim' " markdown
    Plug 'untitled-ai/jupyter_ascending.vim' " jupyter notebook

    " Git
    Plug 'tpope/vim-fugitive' " adds Git command to vim
    Plug 'airblade/vim-gitgutter' " shows git diff marks
    Plug 'f-person/git-blame.nvim' " shows git blame

call plug#end()


""""""""""""""
" Key mappings

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

" >> map Easymotion s{char}{char} to move to {char}{char}
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f)
nmap S <Plug>(easymotion-overwin-f2)

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

" >> shortcut to launch nvim tree
nnoremap <C-f> :NvimTreeToggle<CR>

" >> shortcut to launch Trouble
nnoremap <C-t> :TroubleToggle<CR>

" >> Telescope bindings
" find buffer
nnoremap <Leader>; <cmd>lua require'telescope.builtin'.buffers{}<CR>
" find in current buffer
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>
" search in git files
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.git_files{}<CR>
" search all files
nnoremap <Leader>F <cmd>lua require'telescope.builtin'.file_browser{}<CR>

" >> Lsp key bindings
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gd    <cmd>lua require'telescope.builtin'.lsp_definitions()<CR>
nnoremap <silent> gr    <cmd>lua require'telescope.builtin'.lsp_references()<CR>
nnoremap <silent> gi    <cmd>lua require'telescope.builtin'.lsp_implementations()<CR>

" >> shortcut to show var
nnoremap <C-y> <cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>

" >> Toggle the aerial window
nnoremap <C-w> <cmd>AerialToggle!<CR>


"""""""""""""""""
" Lua functions
lua <<EOF

-- THEME and STATUS BAR --
-- configure theme: catppuccin
local catppuccino = require("catppuccin")
catppuccino.setup({
    colorscheme = "dark_catppuccino",
    transparency = true,
    term_colors = true,
    styles = {
        variables = "bold"
    },
    integrations = {
        native_lsp = {
            underlines = {
                errors = "undercurl",
                warnings = "undercurl"
            }
        },
        lsp_trouble = true,
        lsp_saga = true,
        gitgutter = true,
        gitsigns = true,
        telescope = true,
        markdown = true,
        nvimtree = { enabled = true }
    }
})
vim.cmd[[colorscheme catppuccin]]

-- configure gps: show function within file
require("nvim-gps").setup()
local gps = require("nvim-gps")

-- lualine
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin'
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
                  lualine_c = {'filename', {gps.get_location, condition = gps.is_available}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
    }
  }

-- nvim tree
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
    }
}


-- PLUGIN --

-- setup nvim-comment, auto convert code into comment
require('nvim_comment').setup({
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc",
})

-- Trouble, showcase all code issues at once
require'trouble'.setup{}

-- Aerial, showcase code base structure
local aerial = require'aerial'
local custom_attach = function(client)
  aerial.on_attach(client)
end


-- LSP --
-- highlight TODO, FIX, HACK
require'todo-comments'.setup{}

-- Setup nvim-cmp (autocomplete)
local cmp = require'cmp'
cmp.setup({
snippet = {
    expand = function(args)
end,
},
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<C-space>'] = cmp.mapping.confirm( {select = true} ),
        ['<Up>'] = cmp.mapping.select_prev_item({ select = true }),
        ['<Down>'] = cmp.mapping.select_next_item({ select = true })
        },
    sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    }, {
    { name = 'buffer' },
    }, {
    { name = 'path' },
    }, {
    { name = 'spell' },
    })
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup treesitter, highlights text and codes
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,                 -- false will disable the whole extension
    disable = {},                  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
}

-- LSP servers
require'lspconfig'.pylsp.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
require'lspconfig'.r_language_server.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
require'lspconfig'.texlab.setup{
  on_attach = custom_attach,
  capabilities = capabilities
  }
require'lspconfig'.vimls.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
require'lspconfig'.bashls.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
require'lspconfig'.dockerls.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
require'lspconfig'.jsonls.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
require'lspconfig'.ltex.setup{
filetypes = {
    "bib", "markdown", "org",
    "plaintex", "rst", "rnoweb", "tex"
    },
  on_attach = custom_attach,
  capabilities = capabilities
}

EOF
