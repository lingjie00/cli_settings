local builtin = require('telescope.builtin')

require('telescope').setup({
    defaults = {
        layout_strategy = 'center',
        layout_config = {
            width = 0.8
        },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden'
        },
    },
})

vim.keymap.set('n', '<leader>F', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>t', builtin.help_tags, {})
vim.keymap.set('n', '<leader>m', builtin.marks, {})
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>;', builtin.live_grep, {})
vim.keymap.set({ 'n', 'v' }, '<leader>r', builtin.commands, {})
vim.keymap.set({ 'n', 'v' }, '<leader>e', builtin.builtin, {})

require("telescope").load_extension("ui-select")
require('telescope').load_extension('dap')
