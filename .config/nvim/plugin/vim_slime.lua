-- set tmux as the default slime target
vim.g.slime_target = "tmux"
-- use Ipython notation of %% for a new cell
vim.g.slime_cell_delimiter = "^\\s*# %%"
-- fix tmux auto spacing issue
vim.g.slime_bracketed_paste = 1
-- set default target location
vim.g.slime_default_config = { socket_name = "default", target_pane = ":.1" }
vim.g.slime_dont_ask_default = 1

-- change keymapping
vim.g.slime_no_mappings = 1
vim.keymap.set('n', '\\s', '<Plug>SlimeCellsSendAndGoToNext<CR>')
vim.keymap.set('x', '\\s', '<Plug>SlimeRegionSend<CR>')
vim.keymap.set('n', '\\]', '<Plug>SlimeCellsNext<CR>')
vim.keymap.set('n', '\\[', '<Plug>SlimeCellsPrev<CR>')
vim.keymap.set('n', '\\p', '<Plug>SlimeParagraphSend<CR>')

-- run the cell like a jupyter notebook
vim.keymap.set('n', '\\r', '<CMD>MagmaEvaluateLine<CR>')
vim.keymap.set('x', '\\r', ':<C-u>MagmaEvaluateVisual<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '\\R', '<CMD>MagmaReevaluateCell<CR>')
vim.keymap.set('n', '\\rd', '<CMD>MagmaDelete<CR>')
vim.keymap.set('n', '\\rq', '<CMD>noautocmd MagmaEnterOutput<CR>')

-- ensure magma plots are displayed in the terminal
vim.g.magma_image_provider = "kitty"
