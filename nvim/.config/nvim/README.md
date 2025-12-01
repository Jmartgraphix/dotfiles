# Neovim config

This is a minimal, Lua-first Neovim configuration designed to work the same on WSL, Arch Linux, and other Linux distributions.  
It uses `lazy.nvim` for plugin management and keeps language tooling behind `mason.nvim`/LSP so it is easy to reproduce on new machines.

## Requirements

- Neovim **0.9+** (recommended: latest stable)
- Git
- A Nerd Font (for icons in `alpha`, `lualine`, `telescope`, `neo-tree`)
- Optional but recommended:
  - `ripgrep` and `fd` for better Telescope performance
  - `python3` with `debugpy` installed (for Python DAP)
  - `node` / `npm` or `pnpm` for some LSP/formatters
  - `.NET` debugger `netcoredbg` at `~/tools/netcoredbg/netcoredbg` (for C#/Unity DAP)

## Installation

1. Clone the dotfiles repository:

   ```bash
   git clone https://github.com/Jmartgraphix/dotfiles.git ~/dotfiles
   ```

2. Use GNU Stow to symlink the Neovim configuration:

   ```bash
   cd ~/dotfiles
   stow nvim
   ```

   This will create a symlink from `~/.config/nvim` to `~/dotfiles/.config/nvim`.

   On WSL, this is typically the same path (`~/.config/nvim`) inside your Linux home.

3. Start Neovim:

   ```bash
   nvim
   ```

   The first launch will:

   - Install `lazy.nvim` automatically (see `init.lua`)
   - Install and configure all plugins declared under `lua/plugins/`

4. Open Mason to install language servers you care about:

   ```vim
   :Mason
   ```

   By default, `mason-lspconfig` is set to ensure the following LSPs:

   - `lua_ls`
   - `ts_ls` (TypeScript/JavaScript)
   - `html`
   - `cssls`
   - `tailwindcss`

## Keymaps overview

The **leader key** is set to space:

- **`<leader>`**: space
- **`<localleader>`**: space

Core plugin mappings (all defined with `vim.keymap.set` and `desc` where helpful):

- **Telescope**
  - **`<C-p>`**: find files
  - **`<leader>fg`**: live grep

- **Neo-tree**
  - **`<C-n>`**: open file explorer on the left

- **LSP (buffer-local, active when a server attaches)**
  - **`K`**: hover docs
  - **`gd`**: go to definition
  - **`gr`**: list references
  - **`<leader>ca`**: code action
  - **`<leader>rn`**: rename symbol

- **Formatting**
  - **`<leader>gf`**: format buffer via LSP/null-ls

- **Tabs**
  - **`gt`**: next tab
  - **`gT`**: previous tab
  - **`<leader>tn`**: new tab
  - **`<leader>tc`**: close current tab
  - **`<leader>to`**: close all other tabs

- **Window Navigation**
  - **`<C-h>`**, **`<C-j>`**, **`<C-k>`**, **`<C-l>`**: move focus left/down/up/right

- **Debugging (nvim-dap / dap-ui / dap-go / python / C#)**
  - **`<leader>dt`**: toggle breakpoint
  - **`<leader>dc`**: start/continue
  - **`<leader>dq`**: terminate
  - **`<leader>du`**: toggle DAP UI
  - **`<F10>`**: step over
  - **`<F11>`**: step into
  - **`<F12>`**: step out
  - **`<leader>dr`**: run last debug configuration

## Structure

- `init.lua`: bootstraps `lazy.nvim`, sets runtime path, and loads:
  - `lua/vim-options.lua`: core editor options and leader keys
  - `lua/plugins/`: plugin specs for `lazy.nvim`
- `lua/plugins/*.lua`: one (or small groups of) plugins per file, each returning a lazy.nvim spec table.

## Portability notes

- No absolute user-specific paths are used except for the optional `netcoredbg` location, which is resolved via `~` so it works across different usernames and distros.
- `lazy.nvim` uses Neovim’s standard `stdpath("data")` for plugin installation, so you can freely move this config between WSL/Arch/other Linux systems.
- If a feature seems missing on a fresh machine, check:
  - `:Lazy` for plugin install status
  - `:Mason` for LSP/formatter/debugger installs

## License

This configuration is licensed under the MIT License. See the [LICENSE](../LICENSE) file for details.
