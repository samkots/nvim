
Plugins
===

- [x] Snacks explorer (alternatives? Oil, neo-tree)
- [x] lualine (alternatives?)
- [ ] check git integration
    - [ ] https://www.reddit.com/r/neovim/comments/16xa2q0/what_is_the_best_git_diff_and_merge_tool/
    - [ ] https://www.youtube.com/watch?v=K-FKqXj8BAQ
    - [ ] lazy-git? - TUI cmd not a plugin but looks good!
    - [x] git-signs
    - [ ] neogit > fugitive
    - [ ] diffview
    - [ ] search more
    - [ ] vim-flog
- [ ] LSP
    - [x] nvim-lspconfig plugin - data only repo that tells nvim, where the servers are, when to start them & config to pass
    - [x] mason?
    - what's cmp(vs blink)?
    - kickstarter has some cool functions (auto highlight on cursorhold)


## TIPS:

- neovim has builtin LSP client: `:help vim.lsp`, `:lua vim.lsp.<tab>` to see more
- Quick help: `:help lspconfig-all`
- `:echo executable('<executable-file>')` - checks if neovim can find it
- Omni-complition; `:help ins-completion`


## TODO

- [ ] Snacks.picker.explorer.Config
- [ ] Snacks.git.* & Snacks.gitbrowse.*
- [ ] Snacks picker preview `zt`
    - ~/.local/share/nvim/lazy/snacks.nvim/lua/snacks/picker/core/preview.lua
    - In `function M:loc()` > `local function show()` add line: `vim.cmd("norm! ztze")`


## Try:

Open while with cursor placed at the last position:

```
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end,
})
```


## General CLI

- [x] - fzf the fuzzy finder!
- [ ] - xargs
- [ ] - tldr
- [ ] - jq, yq, jqp


## See later:

- [ ] treesitter - how it works - queries, parsers
    - [ ] nvim-treesitter-textobject
    - [ ] where are the parsers installed?
    - [ ] what's the treesitter cli

