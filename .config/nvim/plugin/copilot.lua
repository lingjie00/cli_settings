if Internet == 1 then
    -- config for GitHub Co-pilot
    vim.g.copilot_no_tab_map = true

    -- chat UI
    local chat = require("CopilotChat")
    chat.setup({
        debug = false,
        mappings = {
            reset = {
                normal = "<C-\\>",
                insert = "<C-\\>",
            },
        },
    })
end
