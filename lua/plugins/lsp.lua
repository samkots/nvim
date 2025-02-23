
local deps_for_lua_ls = {
  {
    "folke/lazydev.nvim", -- this snippet is taken partially from here
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  }
}

local clangd_config = {
  cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
  fallbackFlags = { "--std=c++20" },
}

--

-- Order matters:
-- "williamboman/mason.nvim",
-- "williamboman/mason-lspconfig.nvim",
-- "neovim/nvim-lspconfig"
M = {
  {
    "williamboman/mason.nvim", -- using only for conveniently installing LSPs
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim", -- using only for "ensure_installed" for auto installation
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd" }, -- Mason's clangd version is newer than system one's, so keeping it
        automatic_installation = false,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig", -- manually configuring everything else here
    dependencies = deps_for_lua_ls,
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup {}
      lspconfig.clangd.setup { init_options = clangd_config }
    end,
  }
}

-- This works too:
--
--M[3].config = function()
--  local lspconfig = require("lspconfig")
--  lspconfig.lua_ls.setup {}
--  lspconfig.clangd.setup { init_options = clangd_config }
--end

return M

