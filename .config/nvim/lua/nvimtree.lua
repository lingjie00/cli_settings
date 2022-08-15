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

-- symbol outline
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'left',
    relative_width = true,
    width = 30,
    show_numbers = true,
    show_relative_numbers = true,
    show_symbol_details = true,
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    }
}
