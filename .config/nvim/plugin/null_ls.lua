-- set up null ls
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        -- formatting
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.fish_indent,
        null_ls.builtins.formatting.latexindent,
        null_ls.builtins.formatting.yamlfix,
        -- diagostics
        null_ls.builtins.diagnostics.chktex,
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.flake8,
        -- code actions
        null_ls.builtins.code_actions.proselint.with({
            filetypes = { "markdown" }
        }),
    }
})

if internet == 1 then
    require("mason-null-ls").setup({ automatic_installation = true })
end
