-- Debug Adapter Protocol
require('dap')
require('dapui').setup()
require('dap-python').setup('python', {})

if Internet == 1 then
    require('nvim-dap-repl-highlights').setup()
end

require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-plenary"),
  },
})
