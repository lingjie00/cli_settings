local trouble = require("trouble.providers.telescope")

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
        mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
        },
    },
})

require("telescope").load_extension("ui-select")
require('telescope').load_extension('dap')
