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
set completeopt=menu,menuone,noselect

" >> load plugins
call plug#begin(stdpath('data') . 'vimplug')
    """""""""""
    " Themes  "
    """""""""""
    " gruvbox
    Plug 'morhetz/gruvbox'

    " Catppuccino 
    Plug 'Pocco81/Catppuccino.nvim'

    """""""""""
    " Plugins "
    """""""""""
    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Autocomplete
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/nvim-cmp'
    Plug 'f3fora/cmp-spell'
    Plug 'hrsh7th/cmp-path'

    " LSP
    Plug 'nvim-lua/popup.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'nvim-treesitter/nvim-treesitter'

    " comment
    Plug 'terrortylor/nvim-comment'

    " LaTeX
    Plug 'lervag/vimtex'

    " status bar
    Plug 'nvim-lualine/lualine.nvim'

    " nvim-gps
    Plug 'SmiteshP/nvim-gps'

    " web icons
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'yamatsum/nvim-nonicons'

    " navigation shortcut
    Plug 'christoomey/vim-tmux-navigator'

    "nvim tree
    Plug 'kyazdani42/nvim-tree.lua'

    " send buffer
    Plug 'esamattis/slimux'

    " insearch
    Plug 'haya14busa/incsearch.vim'

    " change surround
    Plug 'tpope/vim-surround'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'airblade/vim-gitgutter'
    Plug 'f-person/git-blame.nvim'

    " Easymotion
    Plug 'easymotion/vim-easymotion'

    " Harpoon
    Plug 'ThePrimeagen/harpoon'

    " Start dashboard
    Plug 'glepnir/dashboard-nvim'

    " Trouble
    Plug 'folke/trouble.nvim'

    " Symbols-outline
    Plug 'simrat39/symbols-outline.nvim'

    " Aerial
    Plug 'stevearc/aerial.nvim'

    " Glow
    Plug 'ellisonleao/glow.nvim'

call plug#end()


""""""""""""""
" Gruvbox
" autocmd vimenter * ++nested colorscheme gruvbox
" set background=dark

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

" Easymotion
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f)
nmap S <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

" Harpoon 
nnoremap <leader>` <cmd>lua require'harpoon.mark'.add_file()<CR>
nnoremap <leader>1 <cmd>lua require'harpoon.ui'.nav_file(1)<CR>
nnoremap <leader>2 <cmd>lua require'harpoon.ui'.nav_file(2)<CR>
nnoremap <leader>3 <cmd>lua require'harpoon.ui'.nav_file(3)<CR>
nnoremap <leader>4 <cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>

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
nnoremap <Leader>; <cmd>lua require'telescope.builtin'.buffers{}<CR>
" find in current buffer
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>
" bookmarks
nnoremap <Leader>' <cmd>lua require'telescope.builtin'.marks{}<CR>
" git files
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.git_files{}<CR>
" all files
nnoremap <Leader>F <cmd>lua require'telescope.builtin'.find_files{}<CR>
" ripgrep like grep through dir
nnoremap <Leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>
" pick color scheme
nnoremap <Leader>cs <cmd>lua require'telescope.builtin'.colorscheme{}<CR>

" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>

" global copy
noremap <leader>p "+p
noremap <leader>y "+y

" nvim tree binding
nnoremap <C-f> :NvimTreeToggle<CR>

" dashboard
let g:dashboard_default_executive = 'telescope'

" Trouble
nnoremap <C-t> :TroubleToggle<CR>

" Symbols-outline
nnoremap <C-y> :SymbolsOutline<CR>


lua <<EOF

-- Setup treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,                 -- false will disable the whole extension
    disable = {},                  -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
}


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
        -- ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        -- ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
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

-- setup nvim-comment
require('nvim_comment').setup({
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc",
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


local catppuccino = require("catppuccino")

-- configure it
catppuccino.setup(
    {
		colorscheme = "dark_catppuccino",
		transparency = true,
		term_colors = true,
		styles = {
			comments = "italic",
			functions = "italic",
			keywords = "italic",
			strings = "NONE",
			variables = "NONE",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				}
			},
			lsp_trouble = false,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = false,
			telescope = false,
			nvimtree = {
				enabled = true,
				show_root = false,
			},
			which_key = false,
			indent_blankline = {
				enabled = false,
				colored_indent_levels = false,
			},
			dashboard = false,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			bufferline = false,
			markdown = false,
			lightspeed = false,
			ts_rainbow = false,
			hop = false,
		}
	}
)

require("nvim-gps").setup()
local gps = require("nvim-gps")

-- lualine
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccino',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
                  lualine_c = {'filename', {gps.get_location, condition = gps.is_available}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
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

-- Trouble
require'trouble'.setup{}

-- Aerial
local aerial = require'aerial'

local custom_attach = function(client)
  aerial.on_attach(client)

  -- Aerial does not set any mappings by default, so you'll want to set some up
  -- Toggle the aerial window with <leader>a
  vim.api.nvim_buf_set_keymap(0, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
  -- Jump forwards/backwards with '{' and '}'
  vim.api.nvim_buf_set_keymap(0, 'n', '{', '<cmd>AerialPrev<CR>', {})
  vim.api.nvim_buf_set_keymap(0, 'n', '}', '<cmd>AerialNext<CR>', {})
  -- Jump up the tree with '[[' or ']]'
  vim.api.nvim_buf_set_keymap(0, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
  vim.api.nvim_buf_set_keymap(0, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
end

-- Set up your LSP clients here, using the custom on_attach method
require'lspconfig'.pylsp.setup{
  on_attach = custom_attach
}
require'lspconfig'.r_language_server.setup{
  on_attach = custom_attach
}
require'lspconfig'.texlab.setup{
  on_attach = custom_attach
  }
require'lspconfig'.vimls.setup{
  on_attach = custom_attach
}
require'lspconfig'.bashls.setup{
  on_attach = custom_attach
}
require'lspconfig'.dockerls.setup{
  on_attach = custom_attach
}
require'lspconfig'.jsonls.setup{
  on_attach = custom_attach
}

EOF

" Catppuccino
colorscheme catppuccino
