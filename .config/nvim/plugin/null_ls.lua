local null_ls = require("null-ls")
-- create a custom formatting for null-ls using darker
null_ls.builtins.formatting.darker = {
	method = require("null-ls.methods").internal.FORMATTING,
	filetypes = { "python" },
	generator = require("null-ls.helpers").formatter_factory({
		args = {
			"--stdout",
			"$FILENAME",
			"-i",
		},
		command = "darker",
	}),
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- set up null ls
null_ls.setup({
	sources = {
		-- formatting
		null_ls.builtins.formatting.darker,
		null_ls.builtins.formatting.fish_indent,
		null_ls.builtins.formatting.latexindent,
		null_ls.builtins.formatting.yamlfix,
		null_ls.builtins.formatting.stylua,
		-- diagostics
		null_ls.builtins.diagnostics.flake8,
		-- code actions
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})

if Internet == 1 then
	require("mason-null-ls").setup({ automatic_installation = true })
end
