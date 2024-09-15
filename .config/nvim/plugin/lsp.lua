local lsp_zero = require("lsp-zero")

lsp_zero.ui({
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

vim.diagnostic.config({
	virtual_text = false,
})

require("lsp_signature").setup({})
