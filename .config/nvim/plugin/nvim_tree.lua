require("nvim-tree").setup( {
    filters = { custom = { "^.git$" } },
    renderer = {
        icons = {
            git_placement = "after",
            show = {
                git = true,
                modified = true,
                diagnostics = false,
                folder = false,
                file = false,
                folder_arrow = false,
                bookmarks = false,
            },
            glyphs = {
                git = {
                    -- add in unstaged icon
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "",
                    untracked = "",
                    deleted = "",
                    ignored = "I",
                },
            },
        }
    }
} )
