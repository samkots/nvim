
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number" -- "both"
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 20

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } --vim.opt.listchars = "tab:» ,trail:·,nbsp:␣"
--vim.opt.listchars = { tab = "->" , trail = "-", eol = "$", nbsp = "!" }
vim.opt.matchpairs = "(:),{:},[:],<:>"
vim.opt.formatoptions:append("j")

vim.opt.syntax = "on"

