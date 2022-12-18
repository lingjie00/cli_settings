-- setup nvim-comment, auto convert code into comment
require('nvim_comment').setup({
    -- should comment out empty or whitespace only lines
    comment_empty = false,
    -- Normal mode mapping left hand side
    line_mapping = "gcc",
    -- Visual/Operator mapping left hand side
    operator_mapping = "gc",
})
