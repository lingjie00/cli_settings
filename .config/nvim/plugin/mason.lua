if Internet == 1 then
    require("mason").setup({
        PATH = "append",
    })

    require("mason-lspconfig").setup({
        ensure_installed = { "julials" },
        handlers = {
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,

            pyright = function()
                require("lspconfig").pyright.setup({
                    settings = {
                        python = {
                            analysis = {
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticMode = "openFilesOnly",
                            },
                            venvPath = ".",
                            venv = ".venv",
                        },
                    },
                })
            end,

            basedpyright = function()
                require("lspconfig").basedpyright.setup({
                    settings = {
                        basedpyright = {
                            analysis = {
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticMode = "workspace",
                            },
                        },
                        python = {
                            venvPath = ".",
                            venv = ".venv",
                        },
                    },
                })
            end,

            ltex = function()
                require("lspconfig").ltex.setup({
                    autostart = false,
                    settings = {
                        ltex = {
                            logLevel = "warning",
                        },
                    },
                })
            end,

            lua_ls = function()
                require("lspconfig").lua_ls.setup({
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                })
            end,
        },
    })
end

-- custom python provider
local function use_if_defined(val, fallback)
    return val ~= nil and val or fallback
end

local function isempty(s)
    return s == nil or s == ""
end

local conda_prefix = os.getenv("CONDA_PREFIX")
if not isempty(conda_prefix) then
    vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, conda_prefix .. "/bin/python")
    vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, conda_prefix .. "/bin/python")
else
    vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, "python")
    vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, "python3")
end
