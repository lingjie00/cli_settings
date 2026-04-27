return {
    -- fuzzy finder (lazy=false: keymaps reference telescope.builtin at startup)
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- native C-speed sorter (replaces default Lua sorter)
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    -- status line
    { "nvim-lualine/lualine.nvim" },

    -- indent guides
    { "lukas-reineke/indent-blankline.nvim" },

    -- inline diagnostic messages
    { "rachartier/tiny-inline-diagnostic.nvim" },

    -- theme
    { "dracula/vim", name = "dracula" },

    -- file explorer
    { "nvim-tree/nvim-tree.lua" },

    -- internet-dependent plugins
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = Internet == 1,
        lazy = false,
        build = ":TSUpdate",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                branch = "main",
                config = function()
                    require("nvim-treesitter-textobjects").setup({
                        select = { lookahead = true },
                        move   = { set_jumps = true },
                    })
                    local sel = require("nvim-treesitter-textobjects.select")
                    local mov = require("nvim-treesitter-textobjects.move")
                    local swp = require("nvim-treesitter-textobjects.swap")
                    -- select
                    vim.keymap.set({ "x", "o" }, "aa", function() sel.select_textobject("@parameter.outer", "textobjects") end)
                    vim.keymap.set({ "x", "o" }, "ia", function() sel.select_textobject("@parameter.inner", "textobjects") end)
                    vim.keymap.set({ "x", "o" }, "af", function() sel.select_textobject("@function.outer", "textobjects") end)
                    vim.keymap.set({ "x", "o" }, "if", function() sel.select_textobject("@function.inner", "textobjects") end)
                    vim.keymap.set({ "x", "o" }, "ac", function() sel.select_textobject("@class.outer", "textobjects") end)
                    vim.keymap.set({ "x", "o" }, "ic", function() sel.select_textobject("@class.inner", "textobjects") end)
                    -- move
                    vim.keymap.set({ "n", "x", "o" }, "]m", function() mov.goto_next_start("@function.outer", "textobjects") end)
                    vim.keymap.set({ "n", "x", "o" }, "]]", function() mov.goto_next_start("@class.outer", "textobjects") end)
                    vim.keymap.set({ "n", "x", "o" }, "]M", function() mov.goto_next_end("@function.outer", "textobjects") end)
                    vim.keymap.set({ "n", "x", "o" }, "][", function() mov.goto_next_end("@class.outer", "textobjects") end)
                    vim.keymap.set({ "n", "x", "o" }, "[m", function() mov.goto_previous_start("@function.outer", "textobjects") end)
                    vim.keymap.set({ "n", "x", "o" }, "[[", function() mov.goto_previous_start("@class.outer", "textobjects") end)
                    vim.keymap.set({ "n", "x", "o" }, "[M", function() mov.goto_previous_end("@function.outer", "textobjects") end)
                    vim.keymap.set({ "n", "x", "o" }, "[]", function() mov.goto_previous_end("@class.outer", "textobjects") end)
                    -- swap
                    vim.keymap.set("n", "<leader>a", function() swp.swap_next("@parameter.inner") end)
                    vim.keymap.set("n", "<leader>A", function() swp.swap_previous("@parameter.inner") end)
                end,
            },
            { "nvim-treesitter/nvim-treesitter-context", enabled = Internet == 1 },
            { "m-demare/hlargs.nvim",                    enabled = Internet == 1 },
        },
        config = function()
            -- Minimal setup: parsers installed/updated via :TSUpdate
            require("nvim-treesitter").setup()
            -- Enable treesitter highlighting for all filetypes
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
            require("hlargs").setup({})
            require("treesitter-context").setup({})
        end,
    },

    -- GitHub Copilot
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        dependencies = { "github/copilot.vim" },
        enabled = Internet == 1,
    },

    -- display history as a tree
    { "mbbill/undotree" },

    -- Git integration
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },          -- replaces airblade/vim-gitgutter
    { "f-person/git-blame.nvim" },
    { "rhysd/conflict-marker.vim" },

    -- navigate vim and tmux splits
    { "christoomey/vim-tmux-navigator" },

    -- send text to a REPL
    { "jpalardy/vim-slime" },
    { "klafyvel/vim-slime-cells", ft = { "julia", "python", "r" } },
    { "JuliaEditorSupport/julia-vim" },

    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Completion (blink.cmp replaces nvim-cmp + 6 source plugins)
    -- Rust-based fuzzy matching, built-in LSP/buffer/path/snippets sources
    {
        "saghen/blink.cmp",
        version = "1.*",    -- use pre-built Rust binaries from GitHub releases
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saghen/blink.compat",          -- bridges nvim-cmp community sources
            "hrsh7th/cmp-latex-symbols",    -- kept via compat layer
        },
    },

    -- Snippets
    { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },

    -- Python venv selector
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
        opts = { name = ".venv" },
    },

    -- formatting and linting
    { "stevearc/conform.nvim" },
    { "mfussenegger/nvim-lint" },

    -- commenting (replaces terrortylor/nvim-comment)
    { "numToStr/Comment.nvim" },

    -- surround motions
    { "tpope/vim-surround" },

    -- Markdown
    {
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup({ border = "single" })
        end,
    },
    { "mzlogin/vim-markdown-toc" },

    -- DAP (lazy=false: keymaps call require("dap")/require("dapui") eagerly)
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        dependencies = {
            { "rcarriga/nvim-dap-ui",              dependencies = { "nvim-neotest/nvim-nio" } },
            { "mfussenegger/nvim-dap-python" },
            { "LiadOz/nvim-dap-repl-highlights",   enabled = Internet == 1 },
            { "nvim-telescope/telescope-dap.nvim" },
            { "theHamsta/nvim-dap-virtual-text" },
        },
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            { "nvim-neotest/nvim-nio" },
            { "nvim-neotest/neotest-python" },
            { "nvim-neotest/neotest-plenary" },
        },
    },

    -- run/watch files
    { "Makaze/watch.nvim" },

    -- code snapshot (lazy: load only when commands are invoked)
    {
        "mistricky/codesnap.nvim",
        build = "make",
        lazy = true,
        cmd = { "CodeSnap", "CodeSnapSave", "CodeSnapHighlight", "CodeSnapSaveHighlight", "CodeSnapASCII", "CodeSnapCopyASCII" },
        config = function()
            require("codesnap").setup({
                has_line_number = true,
                bg_color = "#00000000",
                watermark = "",
                save_path = os.getenv("HOME") .. "/Downloads",
            })
        end,
    },

    -- floating terminal (renamed from nvim-toggleterm.lua)
    { "akinsho/toggleterm.nvim" },

    -- diagnostics / quickfix list UI (renamed from lsp-trouble.nvim)
    { "folke/trouble.nvim" },
}
