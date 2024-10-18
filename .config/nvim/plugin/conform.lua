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
    default_format_opts = {
        lsp_format = "first",
    },
})

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
