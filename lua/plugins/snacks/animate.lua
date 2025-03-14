
--[[

To disable scroll, indent, dim and all other animations:

vim.g.snacks_animate = false globally
vim.b.snacks_animate = false locally for the buffer

easing functions: https://github.com/EmmanuelOga/easing
easing functions overview: https://github.com/kikito/tween.lua?tab=readme-ov-file#easing-functions

]] --

---@class snacks.animate.Config
---@field easing? snacks.animate.easing|snacks.animate.easing.Fn
local M = {
  ---@type snacks.animate.Duration|number
  duration = 20, -- ms per step
  easing = "linear",
  fps = 60,      -- frames per second. Global setting for all animations
}

return M

