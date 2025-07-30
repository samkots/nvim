
-- Trial: word highlighting - by ChatGPT

-- Create a module-like table to keep state
local M = {}

-- Toggle state
M.highlight_on = false

-- Create an augroup for highlight autocommands
local hl_group = vim.api.nvim_create_augroup("AutoHighlight", { clear = true })

-- Function to enable highlighting of word under cursor on CursorHold
local function enable_highlight()
  -- Set up autocmd on CursorHold to set the search pattern to the word under cursor
  vim.api.nvim_create_autocmd("CursorHold", {
    group = hl_group,
    pattern = "*",
    callback = function()
      local word = vim.fn.expand("<cword>")
      if word == nil or word == '' then
        vim.fn.setreg('/', '')
      else
        -- Escape special chars for very literal search (\V) and whole word (\< \>)
        local escaped_word = vim.fn.escape(word, '\\')
        local search_pattern = "\\V\\<" .. escaped_word .. "\\>"
        vim.fn.setreg('/', search_pattern)
      end
    end,
  })
  -- Set options
  vim.opt.updatetime = 50
  vim.opt.hlsearch = true
  M.highlight_on = true
  print("Highlight current word: ON")
end

-- Function to disable highlighting autocommands and clear highlight
local function disable_highlight()
  -- Clear autocmds in the group
  vim.api.nvim_clear_autocmds({ group = hl_group })
  -- Reset search highlight
  vim.fn.setreg('/', '')
  -- Restore updatetime to default (4000ms)
  vim.opt.updatetime = 4000
  M.highlight_on = false
  print("Highlight current word: OFF")
end

-- Toggle function exposed to keymap
function M.toggle()
  if M.highlight_on then
    disable_highlight()
  else
    enable_highlight()
  end
end

-- Map z/ to toggle the highlighting
vim.keymap.set('n', '<leader>wh', M.toggle, { desc = "Toggle highlight current word" })

-- Return the module (optional if you want to require this from a separate Lua file)
return M



--[[

Further question about organizing it:

You saide:

I'm wondering what would be a good way to organize this code in the Vim configuration.
I'm using Lazy git package manager and following this structure:

```
You can create your plugin specs in ~/.config/nvim/lua/plugins/.
Each file should return a table with the plugins you want to install.

~/.config/nvim
├── lua
│   ├── config
│   │   └── lazy.lua
│   └── plugins
│       ├── spec1.lua
│       ├── **
│       └── spec2.lua
└── init.lua
```

But I don't yet have written a custom script like this.. So I'm wondering how to organize it


ChatGPT said:

Perfect — I’m glad it’s working smoothly! And you're already using Lazy.nvim and Lua modules — you're on a solid, modern Neovim track 🎯

💡 Your Goal
You’ve got a self-contained custom Lua module (word highlight toggler) and want to:

Keep it organized and reusable.

Integrate it cleanly into your existing Lazy.nvim and Lua config structure.

Possibly activate it conditionally or with lazy loading (optional).

✅ Recommended Structure
Here’s a simple and scalable way to organize your script:

arduino
Copy
Edit
~/.config/nvim
├── lua
│   ├── config
│   │   └── lazy.lua         <- your Lazy setup
│   ├── plugins
│   │   └── ...              <- your Lazy plugin specs
│   ├── custom
│   │   └── highlight_toggle.lua  <- your custom module
└── init.lua
✅ Step-by-Step Setup
1. Create Your Module File
~/.config/nvim/lua/custom/highlight_toggle.lua

Paste the Lua script we discussed into this file.

2. Autoload It via init.lua or a Plugin Spec
Since this is a self-contained tool and not an actual external plugin, you don’t need to list it in Lazy.nvim plugin specs. Instead, just require it somewhere appropriate.

You have two good options:

✅ Option A: Minimal — load eagerly in init.lua
lua
Copy
Edit
require("custom.highlight_toggle")
✅ This just loads the module at startup, and the z/ key will always be available.

✅ Option B: Cleaner — load inside a custom plugin spec (Lazy-style)
Create a custom Lazy plugin spec even though it's not a plugin. This is valid and Lazy.nvim supports it for organizing your config nicely.

~/.config/nvim/lua/plugins/highlight-toggle.lua

lua
Copy
Edit
return {
  {
    "highlight-toggle", -- just a dummy name
    lazy = false,
    config = function()
      require("custom.highlight_toggle")
    end,
  },
}
✅ This is more idiomatic if you want to keep your setup declarative and future-proof (e.g., maybe you turn it into a plugin later).

🧠 Bonus Tips
If you make more of these utilities, organize them under lua/custom/ or lua/modules/.

If you want to only load it for specific filetypes, you can wrap the require() in an autocmd.

You could even write a real Neovim plugin later based on this idea — you're already 90% of the way there.

Let me know if you want a template to turn this into a proper plugin someday — happy to help!

]]

