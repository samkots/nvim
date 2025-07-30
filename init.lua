
require("config.lazy")

vim.cmd.colorscheme "catppuccin" -- TODO: experiment apply in plugin's opt/config spec field

require("custom.options")
require("custom.keymaps")


-- Trial: word highlighting - by ChatGPT
require("custom.word-highlighting")
