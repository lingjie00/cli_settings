-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd.packadd('packer.nvim')

return require("packer").startup(function(use)
    -- Packer can manage itself
    use({ "wbthomason/packer.nvim" })

    -- fuzzy finder
    use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
    -- replace vim ui select with telescope
    use({ "nvim-telescope/telescope-ui-select.nvim" })

    -- status line
    use({ "nvim-lualine/lualine.nvim" })

    -- display dots to blankline
    use({ "lukas-reineke/indent-blankline.nvim" })

    -- display diagnostic messages inline
    use({ "rachartier/tiny-inline-diagnostic.nvim" })

    -- theme
    use({ "dracula/vim", as = "dracula" })

    -- file explorer
    use({ "nvim-tree/nvim-tree.lua" })

    -- these package will only work if there is external network connection
    if Internet == 1 then
        -- treesitter, and plugins that require treesitter
        use({ "nvim-treesitter/nvim-treesitter" })
        use({ "nvim-treesitter/nvim-treesitter-context" })
        use({ "m-demare/hlargs.nvim" })
        -- GitHub copilot
        use({ "CopilotC-Nvim/CopilotChat.nvim", requires = { "github/copilot.vim" }, branch = "main" })
    end

    -- display history as a tree
    use({ "mbbill/undotree" })
    -- runs Git command in Vim
    use({ "tpope/vim-fugitive" })
    -- shows Git diff
    use({ "airblade/vim-gitgutter", branch = "main" })
    -- display Git Blame
    use({ "f-person/git-blame.nvim" })
    -- resolve Git conflict
    use({ "rhysd/conflict-marker.vim" })
    -- navigate vim and tmux
    use({ "christoomey/vim-tmux-navigator" })
    -- sends text from vim to tmux buffer
    use({ "jpalardy/vim-slime" })
    use({
        "klafyvel/vim-slime-cells",
        ft = { "julia", "python", "r" },
    })

    -- easy set-up LSPs
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-latex-symbols" },

            -- Snippets
            { "L3MON4D3/LuaSnip",                   requires = { { "rafamadriz/friendly-snippets" } } },
        },
    })

    -- enable non LSP server with LSP features
    use({ "stevearc/conform.nvim" })
    use({ "mfussenegger/nvim-lint" })

    -- convert code to comments
    use({ "terrortylor/nvim-comment" })
    -- change surround parentheses
    use({ "tpope/vim-surround" })

    -- preview Markdown files
    use({
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup({ border = "single" })
        end,
    })
    -- generate Markdown TOC
    use({ "mzlogin/vim-markdown-toc" })

    -- DAP
    use({
        "mfussenegger/nvim-dap",
        requires = {
            { "rcarriga/nvim-dap-ui" },
            { "mfussenegger/nvim-dap-python" },
            { "LiadOz/nvim-dap-repl-highlights" },
            { "nvim-telescope/telescope-dap.nvim" },
            { "theHamsta/nvim-dap-virtual-text" },
        },
    })
    use({
        "nvim-neotest/nvim-nio",
        requires = {
            { "nvim-neotest/neotest" },
            { "nvim-neotest/neotest-python" },
            { "nvim-neotest/neotest-plenary" },
        },
    })

    -- write, compile, and run codes
    use({ "Makaze/watch.nvim" })

    -- codesnap: take code snapshot
    use({ "mistricky/codesnap.nvim", run = "make" })

    -- interact with terminal
    use({ "akinsho/nvim-toggleterm.lua" })

    -- show lsp troubles
    use({ "folke/lsp-trouble.nvim" })
end)
