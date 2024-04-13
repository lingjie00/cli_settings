local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gS", require('telescope.builtin').lsp_workspace_symbols, opts)
    vim.keymap.set("n", "gs", require('telescope.builtin').lsp_document_symbols, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gn", vim.lsp.buf.rename, opts)
end)
vim.keymap.set("n", "ge", vim.diagnostic.open_float)

lsp.setup()

vim.diagnostic.config({
    virtual_text = false,
})

require('mason-lspconfig').setup({
    ensure_installed = {
        'pyright'
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,

        ltex = function()
            require('lspconfig').ltex.setup({
                autostart = false,
            })
        end,

        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
        end
    }
})
