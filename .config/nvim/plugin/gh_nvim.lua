if Internet == 1 then
    -- Better GitHub PR review in neovim
    require('litee.lib').setup()
    require('litee.gh').setup({icon_set="simple"})
end
