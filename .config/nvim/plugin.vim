" Load plugins
call plug#begin(stdpath('data') . 'vimplug')
    """""""""""
    " Themes  "
    """""""""""
    " gruvbox, no longer used but used to love this
    " Plug 'morhetz/gruvbox'

    " Current theme
    Plug 'dracula/vim'

    " status bar
    Plug 'nvim-lualine/lualine.nvim' " status bar

    " indention marks
    Plug 'lukas-reineke/indent-blankline.nvim'

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
    Plug 'folke/trouble.nvim' " nav to code errors
    Plug 'simrat39/symbols-outline.nvim' " show symbol in statusbar
    Plug 'nvim-telescope/telescope-dap.nvim' " integration with dap

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
    Plug 'jose-elias-alvarez/null-ls.nvim' " null ls
    Plug 'neovim/nvim-lspconfig' " config lsp key maps
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " provide better code highlights
    Plug 'terrortylor/nvim-comment' " convert code into comments
    Plug 'tpope/vim-surround' " auto modify surround brackets
    Plug 'williamboman/nvim-lsp-installer' " LspInstall
    Plug 'folke/todo-comments.nvim' " Highlight TODO, FIX
    Plug 'ray-x/lsp_signature.nvim' " Provide lsp signature (prompt in function param)

    " Specific Language support
    Plug 'lervag/vimtex' " latex
    Plug 'ellisonleao/glow.nvim' " markdown
    Plug 'mzlogin/vim-markdown-toc' " generate TOC for markdown
    Plug 'rhysd/vim-grammarous' " Grammar check

    " Git
    Plug 'tpope/vim-fugitive' " adds Git command to vim
    Plug 'airblade/vim-gitgutter' " shows git diff marks
    Plug 'f-person/git-blame.nvim' " shows git blame
    Plug 'rhysd/conflict-marker.vim' " mark conflicts

    " Run terminal command async
    Plug 'skywind3000/asyncrun.vim'

    " Debugger
    Plug 'mfussenegger/nvim-dap'
    Plug 'Pocco81/dap-buddy.nvim'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'mfussenegger/nvim-dap-python'
    Plug 'Weissle/persistent-breakpoints.nvim'

    " Testing
    Plug 'nvim-neotest/neotest'

call plug#end()
