require("lint").linters_by_ft = {
    python = { "flake8", "mypy" },
}

vim.api.nvim_create_user_command("Lint", function()
    require("lint").try_lint()
end, {})
