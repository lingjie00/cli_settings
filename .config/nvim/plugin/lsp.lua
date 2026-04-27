vim.diagnostic.config({
    virtual_text = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN]  = "W",
            [vim.diagnostic.severity.HINT]  = "H",
            [vim.diagnostic.severity.INFO]  = "I",
        },
    },
})
