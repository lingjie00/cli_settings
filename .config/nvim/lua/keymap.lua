-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- display current folder
vim.keymap.set("n", "<leader>'", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", '<leader>"', "<cmd>NvimTreeFindFile<CR>")

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better position after search
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste from clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.keymap.set("n", "Q", "<nop>")

-- terminal esacpe
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- [[ Nagivation ]]
-- navigate cells
vim.keymap.set("n", "]j", "<cmd>call jukit#cells#jump_to_next_cell()<cr>")
vim.keymap.set("n", "[j", "<cmd>call jukit#cells#jump_to_previous_cell()<cr>")
-- LSP diagnostics
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
-- quickfix
vim.keymap.set("n", "]e", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[e", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "]E", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "[E", "<cmd>lprev<CR>zz")
-- Slime
vim.keymap.set("n", "]s", "<Plug>SlimeCellsNext<CR>")
vim.keymap.set("n", "[s", "<Plug>SlimeCellsPrev<CR>")

-- tmux navigator
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")

-- [[Debugging, Testing]]
-- DAP and Neotest
vim.keymap.set("n", "\\dr", require("dapui").toggle)
vim.keymap.set("n", "\\de", require("dapui").eval)
vim.keymap.set("x", "\\de", require("dapui").eval)
vim.keymap.set("n", "\\b", require("dap").toggle_breakpoint)
vim.keymap.set("n", "\\dt", require("dap").repl.toggle)
vim.keymap.set("n", "\\dc", require("dap").continue)
vim.keymap.set("n", "\\dr", require("dap").restart)
vim.keymap.set("n", "\\do", require("dap").step_over)
vim.keymap.set("n", "\\di", require("dap").step_into)
vim.keymap.set("n", "\\tr", function()
	require("neotest").run.run()
end)
vim.keymap.set("n", "\\td", function()
	require("neotest").run.run({ strategy = "dap" })
end)
vim.keymap.set("n", "\\ts", function()
	require("neotest").summary.toggle()
end)
vim.keymap.set("n", "\\to", function()
	require("neotest").output.open({ enter = true })
end)

-- [[ LSP ]]
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gS", telescope_builtin.lsp_workspace_symbols)
vim.keymap.set("n", "gs", telescope_builtin.lsp_document_symbols)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gn", vim.lsp.buf.rename)
vim.keymap.set("n", "ge", vim.diagnostic.open_float)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- [[ Plugins ]]
-- git-fugitive
vim.keymap.set("n", "<leader>gh", "<cmd>Git diff<CR>")
vim.keymap.set("n", "<leader>gd", "<cmd>GitGutterDiffOrig<CR>")

-- undo tree
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")

-- telescope
local function telescope_find_files()
	telescope_builtin.find_files({
		hidden = true,
		no_ignore = true,
		no_ignore_parent = true,
		follow = true,
	})
end

local function telescope_find_git_files()
	-- determine to use git_files or find_files based if current directory is a git repo

	-- check if current directory is a git repo
	local handle = io.popen("git rev-parse --is-inside-work-tree --show-toplevel")
	local is_git_repo = handle:read("*a"):match("true")
	handle:close()

	if is_git_repo then
		telescope_builtin.git_files()
	else
		telescope_find_files()
	end
end
vim.keymap.set("n", "<leader>f", telescope_find_git_files, {})
vim.keymap.set("n", "<leader>F", telescope_find_files, {})
vim.keymap.set("n", "<leader>b", telescope_builtin.buffers, {})
vim.keymap.set("n", "<leader>m", telescope_builtin.marks, {})
vim.keymap.set("n", "<leader>/", telescope_builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>;", telescope_builtin.live_grep, {})
vim.keymap.set({ "n", "v" }, "<leader>r", telescope_builtin.commands, {})
vim.keymap.set({ "n", "v" }, "<leader>e", telescope_builtin.builtin, {})

-- slime
vim.keymap.set("n", "\\s", "<Plug>SlimeCellsSendAndGoToNext<CR>")
vim.keymap.set("x", "\\s", "<Plug>SlimeRegionSend<CR>")
vim.keymap.set("n", "\\p", "<Plug>SlimeParagraphSend<CR>")

-- jukit
-- opens output and history splits
vim.keymap.set("n", "\\os", "<cmd>call jukit#splits#output_and_history()<cr>")
vim.keymap.set("n", "\\Os", "<cmd>call jukit#splits#close_output_and_history(1)<cr>")

-- show current cell output
vim.keymap.set("n", "\\h", "<cmd>call jukit#splits#show_last_cell_output(1)<cr>")

-- runs current cell
vim.keymap.set("n", "\\<space>", "<cmd>call jukit#send#section(0)<cr>")
-- runs current selection
vim.keymap.set("v", "\\<space>", "<cmd>call jukit#send#line()<cr>")
-- runs all cells
vim.keymap.set("n", "\\all", "<cmd>call jukit#send#all()<cr>")

-- preview git changes
vim.keymap.set("n", "<leader>v", "<cmd>GitGutterPreviewHunk<CR>")

-- toggle term
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>")
vim.keymap.set("v", "<leader>t", "<cmd>ToggleTermSendVisualLine<CR>")
vim.keymap.set("v", "<leader>T", "<cmd>ToggleTermSendVisualSelection<CR>")

-- outline
vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>")
