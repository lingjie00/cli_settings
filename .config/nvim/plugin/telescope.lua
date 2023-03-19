local builtin = require('telescope.builtin')

require('telescope').setup({
    defaults = {
        layout_strategy = 'center',
        layout_config = {
            width = 0.8
        }
    },
})

vim.keymap.set('n', '<leader>F', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.git_files, {})
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>;', builtin.live_grep, {})
vim.keymap.set({ 'n', 'v' }, '<leader>R', builtin.commands, {})
vim.keymap.set({ 'n', 'v' }, '<leader>r', builtin.builtin, {})

require("telescope").load_extension("ui-select")
