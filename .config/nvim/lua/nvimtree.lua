-- Setup treesitter, highlights text and codes
require('nvim-treesitter.configs').setup {
    ensure_installed =
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    {
        "bash", "c", "cmake", "comment", "cpp",
        "dockerfile", "dot", "hjson", "java", "javascript",
        "json", "lua", "make", "markdown", "python", "r",
        "regex", "swift", "yaml", "vim"
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "zig", "godotResource" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = false,
        keymaps = {
            init_selection = '<CR>',
            scope_incremental = '<CR>',
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
        },
    },
}

-- show context
require("treesitter-context").setup({})

-- hlargs, highlight args
require('hlargs').setup({})

-- annotation generator
require('neogen').setup({})

