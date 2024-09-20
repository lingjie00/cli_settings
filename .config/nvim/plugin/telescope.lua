local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		layout_strategy = "center",
		layout_config = {
			width = 0.8,
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
		mappings = {
			i = { ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist },
			i = { ["<C-l>"] = actions.smart_send_to_loclist + actions.open_loclist },
		},
	},
})

require("telescope").load_extension("ui-select")
require("telescope").load_extension("dap")
