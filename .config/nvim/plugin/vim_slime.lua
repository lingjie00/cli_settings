-- set tmux as the default slime target
vim.g.slime_target = "neovim"
-- vim.g.slime_target = "tmux"
-- use Ipython notation of %% for a new cell
vim.g.slime_cell_delimiter = "^# %%"

-- fix tmux auto spacing issue
vim.g.slime_bracketed_paste = 1
-- set default target location
-- vim.g.slime_default_config = { socket_name = "default", target_pane = ":.1" }
-- vim.g.slime_dont_ask_default = 1

-- change keymapping
vim.g.slime_no_mappings = 1
