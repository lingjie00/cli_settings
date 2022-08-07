-- THEME and STATUS BAR --

-- telescope
require('telescope').setup({
  defaults = {
    layout_strategy='center',
    layout_config={
        width=0.8
    }
  },
})

-- nvim tree
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false
}


-- PLUGIN --

-- setup nvim-comment, auto convert code into comment
require('nvim_comment').setup({
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc",
})

-- Trouble, showcase all code issues at once
require'trouble'.setup{}

-- LSP --
-- highlight TODO, FIX, HACK
require'todo-comments'.setup{}

-- Setup nvim-cmp (autocomplete)
local cmp = require'cmp'
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
        ['<C-space>'] = cmp.mapping.confirm( {select = true} ),
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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup treesitter, highlights text and codes
require'nvim-treesitter.configs'.setup {
  ensure_installed = 
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  {
    "bash", "c", "cmake", "comment", "cpp",
    "dockerfile", "dot", "hjson", "java", "javascript",
    "json", "lua", "make", "markdown", "python", "r",
    "regex", "swift", "yaml", "vim"
      }, 
  highlight = {
    enable = true,                 -- false will disable the whole extension
    disable = {"zig", "godotResource"},     -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
    incremental_selection = {
    enable = false,
    keymaps = {
        init_selection = '<CR>',
        scope_incremental = '<CR>',
        node_incremental = '<TAB>',
        node_decremental = '<S-TAB>',
        },
    },
}

-- LSP servers
require("nvim-lsp-installer").setup{}
lsp_signature = require'lsp_signature'
lsp_signature.setup{
    bind = true,
    hint_prefix = "🤪 ",
    max_height = 30,
    handler_ops = {
        border = "rounded"
    }
}
custom_attach = function(client, bufnr)
    lsp_signature.on_attach()
end

-- disable inline error prompt
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

require'lspconfig'.pylsp.setup{
    on_attach = custom_attach,
    capabilities = capabilities
}
require'lspconfig'.r_language_server.setup{
    on_attach = custom_attach,
    capabilities = capabilities
}
require'lspconfig'.texlab.setup{
    on_attach = custom_attach,
    capabilities = capabilities
}
require'lspconfig'.vimls.setup{
    on_attach = custom_attach,
    capabilities = capabilities
}
require'lspconfig'.bashls.setup{
    on_attach = custom_attach,
    capabilities = capabilities
}
require'lspconfig'.dockerls.setup{
    on_attach = custom_attach,
    capabilities = capabilities
}
require'lspconfig'.jsonls.setup{
    on_attach = custom_attach,
    capabilities = capabilities
}
require'lspconfig'.ltex.setup{
    filetypes = {
        "bib", "markdown", "org",
        "plaintex", "rst", "rnoweb", "tex"
    },
    on_attach = custom_attach,
    capabilities = capabilities
}
require'lspconfig'.jdtls.setup{
    on_attach = custom_attach,
    capabilities = capabilities
}
require'lspconfig'.eslint.setup{
    on_attach = custom_attach,
    capabilities = capabilities
}
require'lspconfig'.yamlls.setup{
    on_attach = custom_attach,
    capabilities = capabilities
}

-- set up null ls
null_ls = require("null-ls")
null_ls.setup({
    sources = {
        -- formatting
        -- null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        -- null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.fish_indent,
        null_ls.builtins.formatting.latexindent,
        -- null_ls.builtins.formatting.format_r,
        -- diagostics
        null_ls.builtins.diagnostics.chktex,
        -- null_ls.builtins.diagnostics.codespell.with({
        --     filetypes={ "python", "r", "rmd" },
        --     }),
        -- null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.hadolint,
        -- null_ls.builtins.diagnostics.write_good.with({
        --     filetypes={ "markdown", "rmd" },
        --     }),
        null_ls.builtins.diagnostics.yamllint,
        -- code actions
        -- null_ls.builtins.code_actions.gitrebase,
        null_ls.builtins.code_actions.proselint.with({
            filetypes={"markdown", "tex", "rmd"}
            }),
        -- null_ls.builtins.code_actions.refactoring,
        -- hovers
        -- null_ls.builtins.hover.dictionary.with({
        --     filetypes={"text", "markdown", "rmd"}
        -- }),
    }
})


-- set up debugger
require('telescope').load_extension('dap')

local dap, dapui = require("dap"), require("dapui")
dapui.setup{}
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
vim.api.nvim_create_autocmd({"BufReadPost"},{ callback = require('persistent-breakpoints.api').load_breakpoints })
require('persistent-breakpoints').setup{}

-- python debugger
-- TODO: dynamically set python path
require('dap-python').setup('/opt/homebrew/Caskroom/miniconda/base/bin/python')
