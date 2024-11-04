-- Debug Adapter Protocol
require("dap")
require("dapui").setup({
    controls = {
        icons = {
            disconnect = "disc",
            pause = "pause",
            play = "run",
            run_last = "last",
            step_back = "back",
            step_into = "into",
            step_out = "out",
            step_over = "over",
            terminate = "term",
        },
    },
})
require("dap-python").setup("python", {})

if Internet == 1 then
    -- requires treesitter
    require("nvim-dap-repl-highlights").setup()
end

require("neotest").setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
        }),
        require("neotest-plenary"),
    },
    icons = {
        failed = "F",
        notify = "N",
        passed = "P",
        running = "R",
        skipped = "S",
        unknown = "?",
        watching = "W",
    },
})

require("nvim-dap-virtual-text").setup({
    virt_text_pos = "eol"
})
