-- disable default mappings
vim.g.jukit_mappings = 0

-- opens output and history splits
vim.keymap.set('n', '\\os', '<cmd>call jukit#splits#output_and_history()<cr>')
vim.keymap.set('n', '\\Os', '<cmd>call jukit#splits#close_output_and_history(1)<cr>')

-- show current cell output
vim.keymap.set('n', '\\h', '<cmd>call jukit#splits#show_last_cell_output(1)<cr>')

-- runs current cell
vim.keymap.set('n', '\\<space>', '<cmd>call jukit#send#section(0)<cr>')
-- runs current selection
vim.keymap.set('v', '\\<space>', '<cmd>call jukit#send#line()<cr>')
-- runs all cells
vim.keymap.set('n', '\\all', '<cmd>call jukit#send#all()<cr>')

-- create new cell (code cell and text cell), and delete them
vim.keymap.set('n', '\\co', '<cmd>call jukit#cells#create_below(0)<cr>')
vim.keymap.set('n', '\\cO', '<cmd>call jukit#cells#create_above(0)<cr>')
vim.keymap.set('n', '\\ct', '<cmd>call jukit#cells#create_below(1)<cr>')
vim.keymap.set('n', '\\cT', '<cmd>call jukit#cells#create_above(1)<cr>')
vim.keymap.set('n', '\\cd', '<cmd>call jukit#cells#delete()<cr>')

-- navigate cells
vim.keymap.set('n', ']j', '<cmd>call jukit#cells#jump_to_next_cell()<cr>')
vim.keymap.set('n', '[j', '<cmd>call jukit#cells#jump_to_previous_cell()<cr>')
