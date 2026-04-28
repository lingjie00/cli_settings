if Internet == 1 then
	require("mason").setup({
		PATH = "append",
	})

	-- Note: mason-lspconfig's `handlers` option is no longer supported in the
	-- new API. Server configuration must be done via vim.lsp.config() directly.
	require("mason-lspconfig").setup({
		ensure_installed = { "julials" },
	})

	-- Per-server LSP configuration (must come after mason-lspconfig.setup so
	-- that automatic_enable has already registered the servers, and our calls
	-- here take final precedence via _configs merging).

	vim.lsp.config("pyright", {
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

	vim.lsp.config("basedpyright", {
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

	vim.lsp.config("ltex", {
		settings = {
			ltex = {
				logLevel = "warning",
			},
		},
	})

	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})

	-- Override mason-lspconfig's automatic `julia-lsp` wrapper with the
	-- manually installed LanguageServer.jl in the @lspconfig Julia environment.
	-- This must come AFTER mason-lspconfig.setup() so it wins the _configs merge.
	vim.lsp.config("julials", {
		cmd = {
			"/opt/homebrew/bin/julia",
			"--project=@lspconfig",
			"--startup-file=no",
			"--history-file=no",
			"-e",
			"using LanguageServer; runserver()",
		},
		settings = {
			julia = {
				format = {
					indent = 4,
				},
			},
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
