
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number" -- "both"
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 20
vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

--vim.opt.backspace = "indent,eol,start"

vim.opt.syntax = "on"
vim.opt.termguicolors = true

vim.opt.signcolumn = "number"

vim.opt.mouse = "a"
vim.opt.mousescroll = "ver:1,hor:6"
--vim.opt.clipboard:append("unnamedplus") -- usees system clipboard as the default register

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } --vim.opt.listchars = "tab:» ,trail:·,nbsp:␣"
--vim.opt.listchars = { tab = "->" , trail = "-", eol = "$", nbsp = "!" }
vim.opt.matchpairs = "(:),{:},[:],<:>"
vim.opt.formatoptions:append("j")

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "topline" -- experiment

--opt.swapfile = false


