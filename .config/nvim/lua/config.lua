-- telescope
require('telescope').setup({
    defaults = {
        layout_strategy = 'center',
        layout_config = {
            width = 0.8
        }
    },
})
require('telescope').load_extension('dap')
require("telescope").load_extension('harpoon')

-- nvim tree
require('nvim-tree').setup {
    disable_netrw      = false,
    hijack_netrw       = true,
    open_on_setup      = false,
    ignore_ft_on_setup = {},
    open_on_tab        = false,
    hijack_cursor      = false,
    update_cwd         = false
}

-- show quickfix after runing AsyncRun
vim.g["asyncrun_open"] = 6

-- setup nvim-comment, auto convert code into comment
require('nvim_comment').setup({
    -- should comment out empty or whitespace only lines
    comment_empty = false,
    -- Normal mode mapping left hand side
    line_mapping = "gcc",
    -- Visual/Operator mapping left hand side
    operator_mapping = "gc",
})

-- Trouble, showcase all code issues at once
require('trouble').setup()

-- nvim surround
require("nvim-surround").setup()

-- LSP --
-- highlight TODO, FIX, HACK
require('todo-comments').setup {}

-- Setup nvim-cmp (autocomplete)
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<C-space>'] = cmp.mapping.confirm({ select = true }),
        ['<Up>'] = cmp.mapping.select_prev_item({ select = true }),
        ['<Down>'] = cmp.mapping.select_next_item({ select = true })
    },
    sources = cmp.config.sources({
        { name = 'nvim_diagnostic' },
    }, {
        { name = 'buffer' },
    }, {
        { name = 'path' },
    }, {
        { name = 'spell' },
    })
})
local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

-- LSP servers
require("nvim-lsp-installer").setup({})
local lsp_signature = require('lsp_signature')
lsp_signature.setup {
    bind = true,
    hint_prefix = "🤪 ",
    max_height = 30,
    handler_ops = {
        border = "rounded"
    }
}
local custom_attach = function(client, bufnr)
    lsp_signature.on_attach()
end

local lspconfig = require('lspconfig')
local requiredLsps = {
    pylsp = {},
    r_language_server = {},
    texlab = {},
    vimls = {},
    bashls = {},
    dockerls = {},
    jsonls = {},
    jdtls = {},
    eslint = {},
    yamlls = {},
    sumneko_lua = {},
    ltex = {
        filetypes = {
            "bib", "markdown", "org",
            "plaintex", "rst", "rnoweb", "tex"
        }
    }
}
for lspName, user_opts in pairs(requiredLsps) do
    local opts = {
        on_attach = custom_attach,
        capabilities = capabilities
    }

    opts = vim.tbl_deep_extend('force', opts, user_opts)

    lspconfig[lspName].setup(opts)
end

function EnableFlake8()
    -- ensures that only flake8 is enabled
    -- useful for projects that have customised .flake8
    require 'lspconfig'.pylsp.setup {
        on_attach = custom_attach,
        capabilities = capabilities,
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        enabled = false
                    },
                    mccabe = {
                        enabled = false
                    },
                    pyflakes = {
                        enabled = false
                    },
                    flake8 = {
                        config = ".flake8",
                        enabled = true
                    },
                }
            }
        }
    }
end

-- set up null ls
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        -- formatting
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.fish_indent,
        null_ls.builtins.formatting.latexindent,
        null_ls.builtins.formatting.eslint,
        null_ls.builtins.formatting.sqlfluff.with({
            extra_args = { "--dialect", "mysql" }
        }),
        -- diagostics
        null_ls.builtins.diagnostics.chktex,
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.mypy.with({
            extra_args = { "--ignore-missing-imports" }
        }),
        -- code actions
        null_ls.builtins.code_actions.proselint.with({
            filetypes = { "markdown" }
        }),
        -- hovers
    }
})


-- set up debugger
local dap, dapui = require("dap"), require("dapui")
dapui.setup({})
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- persist breakpoint
vim.api.nvim_create_autocmd(
    { "BufReadPost" },
    { callback = require('persistent-breakpoints.api').load_breakpoints }
)
require('persistent-breakpoints').setup({})

-- python debugger
-- will automatically set debugger based on the current
-- python in env
local handle = io.popen("which python")
local pythonPath = handle:read("*a"):gsub("%s+", "")
handle:close()
require('dap-python').setup(
    pythonPath
)
