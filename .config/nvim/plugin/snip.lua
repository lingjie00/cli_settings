require("luasnip").setup({})

-- adding in vscode snippets
require("luasnip.loaders.from_vscode").lazy_load()
-- add in custom snippets
require("luasnip.loaders.from_vscode").lazy_load({
    paths = { "./custom_snip" }
})

