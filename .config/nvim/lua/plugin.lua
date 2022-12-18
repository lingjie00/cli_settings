-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'nvim-lualine/lualine.nvim'

    use 'lukas-reineke/indent-blankline.nvim'

    use({
        'dracula/vim',
        as = 'dracula'
    })

    if internet == 1 then
        use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
        use('nvim-treesitter/playground')
        use 'm-demare/hlargs.nvim'
    end

    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use 'airblade/vim-gitgutter'
    use 'f-person/git-blame.nvim'
    use 'rhysd/conflict-marker.vim'
    use('christoomey/vim-tmux-navigator')

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use 'jose-elias-alvarez/null-ls.nvim'

    use 'terrortylor/nvim-comment'
    use 'kylechui/nvim-surround'
    use 'ray-x/lsp_signature.nvim'
    use("folke/zen-mode.nvim")

    use 'ellisonleao/glow.nvim'
    use 'mzlogin/vim-markdown-toc'

end)
