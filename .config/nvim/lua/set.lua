-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false
vim.opt.incsearch = true

-- Make line numbers default
vim.wo.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'

-- Set colorscheme
-- vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noinsert,preview'

-- netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 10
vim.g.netrw_winsize = 25

-- spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.o.breakindent = true
vim.opt.textwidth = 79

-- store edit history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- viewing
vim.opt.scrolloff = 0
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "80"
vim.api.nvim_set_hl(0, "SpellBad", { cterm = undercurl, undercurl = true })
-- ensure window size is always sufficient to show all text
vim.opt.winwidth = 90
vim.opt.winheight = 20

-- encoding
vim.opt.fileformat = "unix"
vim.opt.encoding = "utf-8"

-- folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- file type indent is having some error in indentation
vim.cmd("filetype indent off")

-- change grep to ripgrep
vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
