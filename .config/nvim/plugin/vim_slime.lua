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
vim.keymap.set('n', '\\c', '<Plug>SlimeCellsSendAndGoToNext<CR>')
vim.keymap.set('n', '\\n', '<Plug>SlimeCellsNext<CR>')
vim.keymap.set('n', '\\p', '<Plug>SlimeCellsPrev<CR>')
vim.keymap.set('x', '\\S', '<Plug>SlimeRegionSend<CR>')
vim.keymap.set('n', '\\s', '<Plug>SlimeParagraphSend<CR>')
