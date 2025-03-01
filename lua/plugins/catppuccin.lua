
local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  -- TODO: experiment: set colorscheme here, so disabling it will automatically stop applying it
  --opts = function()
  --    vim.cmd.colorscheme "catppuccin"
  --end
}

local config = {
  flavour = "auto", -- latte, frappe, macchiato, mocha
  background = {    -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = false,        -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = true,           -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15,        -- percentage of the shade to apply to the inactive window
  },
  no_italic = false,          -- Force no italic
  no_bold = false,            -- Force no bold
  no_underline = false,       -- Force no underline
  styles = {                  -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" },  -- Change the style of comments
    conditionals = { "italic" },
    loops = { "italic" },
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
    -- miscs = {}, -- Uncomment to turn off hard-coded styles
  },
  color_overrides = {},
  --custom_highlights = {},
  custom_highlights = function(colors)
    return {
      -- example: Comment = { fg = colors.none },
      CursorLineNr = { fg = colors.peach },
      --Search = { fg =  "#c8f0c8", bg = "", style = { "underline" } },
      --CurSearch = { fg = colors.green, bg = "", style = { "bold", "undercurl" } },
    }
  end,
  default_integrations = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
        ok = { "undercurl" },
      },
      inlay_hints = {
        background = true,
      },
    },
    -- For more plugins integrations visit https://github.com/catppuccin/nvim#integrations
  },
}

M.config = function()
  require("catppuccin").setup(config) -- setup must be called before loading vim.cmd.colorscheme "catppuccin"
end

return M

