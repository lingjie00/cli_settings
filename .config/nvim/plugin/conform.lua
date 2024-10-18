-- set up conform
local conform = require("conform")
conform.setup({
    formatters_by_ft = {
        -- Conform will run multiple formatters sequentially
        python = function(bufnr)
            local formatters = {}
            if conform.get_formatter_info("isort", bufnr).available then
                table.insert(formatters, "isort")
            end
            if conform.get_formatter_info("black", bufnr).available then
                table.insert(formatters, "black")
            end
            return formatters
        end,
    },
    format_on_save = {
        timeout_ms = 2500,
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
})
