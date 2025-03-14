
--[[

---@type fun(opts: snacks.zen.Config): snacks.win
Snacks.zen()

---@param opts? snacks.zen.Config
Snacks.zen.zen(opts)

---@param opts? snacks.zen.Config
Snacks.zen.zoom(opts)

]] --

---@class snacks.zen.Config
local M = {
  -- You can add any `Snacks.toggle` id here.
  -- Toggle state is restored when the window is closed.
  -- Toggle config options are NOT merged.
  ---@type table<string, boolean>
  toggles = {
    dim = true,
    git_signs = false,
    mini_diff_signs = false,
    indent = false,
    diagnostics = false,
    -- inlay_hints = false,
  },
  show = {
    statusline = false, -- can only be shown when using the global statusline
    tabline = false,
  },
  ---@type snacks.win.Config
  win = { style = "zen" },
  --- Callback when the window is opened.
  ---@param win snacks.win
  on_open = function(win) end,
  --- Callback when the window is closed.
  ---@param win snacks.win
  on_close = function(win) end,
  --- Options for the `Snacks.zen.zoom()`
  ---@type snacks.zen.Config
  zoom = {
    toggles = {},
    show = { statusline = true, tabline = true },
    win = {
      backdrop = false,
      width = 0, -- full width
    },
  },
}

return M

