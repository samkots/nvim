
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup {
      -- A list of parser names, or "all" (the listed parsers MUST always be installed)
      ensure_installed = {
        "cpp", "c", "python", "rust", "lua", "luadoc", "vim", "vimdoc", "diff", "query",
        "markdown", "markdown_inline", "mermaid",
        "bash", "ssh_config", "make", "cmake",
        "html", "css", "javascript", "json", "json5", "xml", "yaml",
        "csv",
        "cuda",
        "disassembly",
        "dockerfile",
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
        "go", "gomod", "gosum", "gotmpl", "gowork", -- goctl
        "jinja", "jinja_inline",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      -- List of parsers to ignore installing (or "all")
      --ignore_install = { "javascript" },

      ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
      -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

      highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        --disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false, -- TODO: experiment setting to true
      },

      indent = {
        enable = true
      },

      -- TODO: experiment in progress
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "<C-p>", -- "grn" was default
          scope_incremental = "<C-i>", -- "grc" was default
          node_decremental = "<C-n>", -- "grm" was default
        },
      }
    }
  end
}

-- TODO: experiment foldign later:
--vim.wo.foldmethod = 'expr'
--vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

