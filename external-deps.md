
External dependencies required (mainly for plugins)
===

From latest to oldest
---

- rust & rust-analyzer
    - install Rust and rust-analyzer (Rust language server) through `rustup` instead of doing it with Mason
- go
    - for gopls (Go LSP), but gopls is already configured to be auto installed through Mason
- ripgrep
    - for Snacks.picker
- fd
    - for Snacks.picker
- clang++ for clangd would most probably be required for, not sure as it was already installed(on Macbook)
    - configured to be auto installed through Mason(seems to be latest)
- Lua for Lua LSP should already be there as they comes with neovim


---

### Other Info

#### Rust installation

- Installed `rustup`:
    - `% curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
        - Rustup metadata and toolchains `RUSTUP_HOME` : `~/.rustup/`
        - The Cargo home directory `CARGO_HOME`: `~/.cargo/`
        - Cargo's bin directory for `cargo`, `rustc`, `rustup` and other commands: `~/.cargo/bin/`
        - Paths added to `PATH` env variable here:
            - `~/.profile`
            - `~/.zshenv`
            - `~/.tcshrc`
    - Installation check:
        - `% rustc --version`
            - -> `rustc 1.94.0 (4a4ef493e 2026-03-02)`
        - `% cargo --version`
            - -> `cargo 1.94.0 (85eff7c80 2026-01-15)`
        - `% rustup --version`
        - ->
            ```
            rustup 1.29.0 (28d1352db 2026-03-05)
            info: This is the version for the rustup toolchain manager, not the rustc compiler.
            info: the currently active `rustc` version is `rustc 1.94.0 (4a4ef493e 2026-03-02)`
            ```
    - Enabled tab completion for zsh
        - `% mkdir ~/.zfunc`
        - `% rustup completions zsh > ~/.zfunc/_rustup`
    - To uninstall: `% rustup self uninstall`
        - This should revert all the changes above
    - perplexity.ai: "Removing all changes is a matter of deleting the `~/.cargo/`, `~/.rustup/` directories and undoing the changes from your shell profile."
- Installed [rust-analyzer](https://rust-analyzer.github.io/book/index.html)
    - `% rustup component add rust-analyzer`
    - `% rust-analyzer --version`
        - -> `rust-analyzer 1.94.0 (4a4ef493 2026-03-02)`

