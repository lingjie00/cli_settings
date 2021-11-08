""""""""""""""""""""""
" Macros
" LaTex: compile latex file
let @t=":w \<cr> :!pdflatex -output-directory '%:p:h'  '%:p' \<cr> :!rm '%:p:r.aux' '%:p:r.log' '%:p:r.out' \<cr>"
let @1="i\\begin{lstlisting}[language=R]"
" R : run current script
let @r=":term Rscript % \<cr>"
" Python: run current python script
let @p=":term python3 % \<cr>"
" C++: compile the current file
let @c=":!g++ '%' -o '%:r' \<cr>"
" Json: reformat json files
let @j=":%!python -m json.tool \<cr>"

"""""""""""""""
" Preferences
syntax on
set number
set relativenumber
set tabstop=4
set softtabstop=4
set textwidth=70
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

" Autopairs in Latex
au FileType tex      let b:AutoPairs = AutoPairsDefine({'$' : '$'})
au FileType python   let b:AutoPairs = AutoPairsDefine({'%' : '%'})

""""""""""""""""""
" Plugin Install
call plug#begin(stdpath('data') . 'vimplug')
    """""""""""
    " Themes  "
    """""""""""
    " gruvbox, no longer used but used to love this
    " Plug 'morhetz/gruvbox'

    " Catppuccino 
    Plug 'Pocco81/Catppuccino.nvim'

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
    Plug 'glepnir/lspsaga.nvim' " adds diagnostics jumps
    Plug 'nvim-treesitter/nvim-treesitter' " provide better code highlights
    Plug 'terrortylor/nvim-comment' " convert code into comments
    Plug 'tpope/vim-surround' " auto add brackets etc
    Plug 'williamboman/nvim-lsp-installer' " LspInstall
    Plug 'jiangmiao/auto-pairs' " Insert bracket in pairs
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
map <Leader>b :SlimuxREPLSendBuffer<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>

" >> shortcut to launch nvim tree
nnoremap <C-f> :NvimTreeToggle<CR>

" >> shortcut to launch Trouble
nnoremap <C-t> :TroubleToggle<CR>

" >> shortcut to launch jupyter notebook
nmap <leader>e :w<CR><Plug>JupyterExecute<CR>
nmap <leader>E :w<CR><Plug>JupyterExecuteAll<CR>

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
nnoremap <silent> gn    <cmd>Lspsaga rename<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gh    <cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> gd    <cmd>lua require'telescope.builtin'.lsp_definitions{}<CR>
nnoremap <silent> gr    <cmd>lua require'telescope.builtin'.lsp_references{}<CR>

" >> shortcut to show var
nnoremap <C-y> <cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>


"""""""""""""""""
" Lua functions
lua <<EOF

-- THEME and STATUS BAR --
-- configure theme: catppuccino
local catppuccino = require("catppuccino")
catppuccino.setup(
    {
		colorscheme = "dark_catppuccino",
		transparency = true,
		term_colors = true,
		integrations = {
			lsp_trouble = true,
			lsp_saga = true,
			gitgutter = true,
			gitsigns = true,
			telescope = true,
			markdown = true
		}
	}
)

-- configure gps: show function within file
require("nvim-gps").setup()
local gps = require("nvim-gps")

-- lualine
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccino'
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
  -- Toggle the aerial window with <leader>a
  vim.api.nvim_buf_set_keymap(0, 'n', '<leader>q', '<cmd>AerialToggle!<CR>', {})
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
--require'lspconfig'.ltex.setup{
--  on_attach = custom_attach,
--  capabilities = capabilities
--}

EOF

" Catppuccino, has to happen after config in Lua
colorscheme catppuccino
