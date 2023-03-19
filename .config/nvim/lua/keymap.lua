-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- display current folder
vim.keymap.set("n", "<leader>'", vim.cmd.Ex)

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

-- delete without registry
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "gf", vim.lsp.buf.format)

vim.keymap.set("n", "]e", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[e", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "]E", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "[E", "<cmd>lprev<CR>zz")

-- terminal esacpe
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- tmux navigator
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
