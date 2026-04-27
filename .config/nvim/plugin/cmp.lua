-- blink.cmp: replaces nvim-cmp + cmp-buffer/path/nvim-lsp/nvim-lsp-signature-help/cmp_luasnip/cmp-nvim-lua
require("blink.cmp").setup({
    keymap = {
        preset = "default",
        -- preserve the same doc-scroll bindings as the old nvim-cmp setup
        ["<C-b>"] = { "scroll_documentation_up",   "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-e>"] = { "hide",                      "fallback" },
    },
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer", "latex_symbols" },
        providers = {
            -- latex_symbols bridged via blink.compat from hrsh7th/cmp-latex-symbols
            latex_symbols = {
                name   = "latex_symbols",
                module = "blink.compat.source",
                score_offset = -3,
            },
        },
    },
    snippets  = { preset = "luasnip" },
    signature = { enabled = true },    -- replaces cmp-nvim-lsp-signature-help
})
