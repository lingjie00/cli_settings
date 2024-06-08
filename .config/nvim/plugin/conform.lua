-- set up conform
if Internet == 1 then
	require("mason-conform").setup({ automatic_installation = true })
end
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "darker", "usort" },
		yaml = { "yamlfix" },
		latex = { "latexindent" },
		fish = { "fish_indent" },
	},
	format_on_save = {
		timeout_ms = 2500,
		lsp_fallback = true,
	},
})
