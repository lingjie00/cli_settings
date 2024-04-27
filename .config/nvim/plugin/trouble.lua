-- trouble: displaying issues at once
require('trouble').setup({
    -- settings without a patched font or icons
    icons = false,
    fold_open = "v",      -- icon used for open folds
    fold_closed = ">",    -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
    },
    use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
    mode = "document_diagnostics"
})

-- todo-comments: display TODO
require('todo-comments').setup({
    signs = false,
    -- highlight TODO, FIXME, etc.
    keywords = {
        FIX = { icon = "F ", color = "error" },
    },
    TODO = { icon = "@ ", color = "info" },
    HACK = { icon = "H ", color = "warning" },
    WARN = { icon = "W ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = "P ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = "N ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "T ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
})
