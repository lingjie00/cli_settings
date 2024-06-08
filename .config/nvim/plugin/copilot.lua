if Internet == 1 then
	-- config for GitHub Co-pilot
	vim.g.copilot_no_tab_map = true
	vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

	-- chat UI
	local chat = require("CopilotChat")
	chat.setup({
		debug = false,
		mappings = {
			reset = {
				normal = "<C-\\>",
				insert = "<C-\\>",
			},
		},
	})
end
