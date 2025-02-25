
local mode = {
  'mode',
  fmt = function(str)
    --       
    --  
    -- 󰥳 
    --return '  ' .. str
    --return ' ' .. str
    return '󰥳 ' .. str
    --return '󰥳 ' .. str:sub(1, 1) -- displays only the first character of the mode
  end,
}

local branch = {
  'branch',
  icon = { '' }
}

local filename = {
  'filename',
  file_status = true,
  path = 1, -- 0 => just file name, 1 => relative path, 2 => absolute path
}

local function window_not_too_short()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  'diagnostics',
  source = 'nvim-diagnostic',
  section = { 'error', 'warn' },
  symbols = { warn = ' ', info = ' ', hint = ' ' }, -- error = ' '
  colored = true, -- if false, symbols will have noramal color of the theme
  update_in_insert = false,
  always_visible = false, -- hidden by default
  cond = window_not_too_short
}

local diff = {
  'diff',
  colored = true, -- if false, symbols will have noramal color of the theme
  symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
  cond = window_not_too_short
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto', -- 'everforest', 'gruvbox-material', 'horizon', 'wombat' 'jellybeans'
        component_separators = { left = '', right = '' }, -- '' ''
        section_separators = { left = '', right = '' }, -- '' ''
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { branch, diff, diagnostics },
        lualine_c = { filename },
        lualine_x = { { 'encoding', cond = window_not_too_short }, { 'fileformat', cond = window_not_too_short }, 'filetype' },
        lualine_y = { 'location' },
        lualine_z = { 'progress' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end,
}

