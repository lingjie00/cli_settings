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

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gS", require('telescope.builtin').lsp_workspace_symbols)
vim.keymap.set("n", "gs", require('telescope.builtin').lsp_document_symbols)
vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gn", vim.lsp.buf.rename)
vim.keymap.set("n", "ge", vim.diagnostic.open_float)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

vim.diagnostic.config({
    virtual_text = false,
})
