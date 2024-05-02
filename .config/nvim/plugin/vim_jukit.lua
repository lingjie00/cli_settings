-- disable default mappings
vim.g.jukit_mappings = 0

-- change layout
vim.g.jukit_layout = {
    split = "horizontal",
    p1 = 0.7,
    val = {
        "file_content",
        {
            split = "vertical",
            p1 = 0.7,
            val = {
                "output",
                "output_history"
            }
        }
    }
}
