
Neovim treesitter notes
===

Source: [Treesitter Basics and Installation](https://www.youtube.com/watch?v=MpnjYb-t12A&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=6&pp=iAQB) from the "Advent of Neovim" series.


Commands: start with `:TS*`

When cursor is on `require("")` statement in a lua file,

```vimscript
:Inspect
```

outputs:

```text
Treesitter
  - @variable.lua links to @variable   priority: 100   language: lua
  - @function.call.lua links to Function   priority: 100   language: lua
  - @function.builtin.lua links to @function.builtin   priority: 100   language: lua
```

This tells us that we have `@variable.lua` under the cursor that links to the `@variable` highlighting,
`@function.call.lua` links to `@Function` and `@function.builtin.lua` links to `@function.builtin`.

If we go to <https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/lua/highlights.scm> and search for
`"@function.builtin"`, there's the query that matches it and capture it in the `@function.builtin` capture group.

So you can now do this:

```vimscript
:hi @function.builtin guifg=pink                    " or
:hi @function.builtin.lua guifg=pink                " lua specific
```

And you can save the override in the "after" config like this:

```vimscript
vim.cmd [[hi @function.builtin.lua guifg=pink ]]
```

This displays the entire AST:

```vimscript
:InspectTree
```

Pressing `o` here opens query editor to write test queries!

