## Neovim config – post-install checklist

This file is a reminder of the extra steps/tools needed on a **new machine** to fully match this setup.

After you clone the repo to `~/.config/nvim` and run `nvim` once (plugins will install via `lazy.nvim`), follow this checklist.

---

### 1. Install OS-level tools

These are **not** installed by Neovim or Mason:

- **Python 3**
  - Required for Python LSP tooling and debugging.
  - Install via your package manager, e.g. on Arch:
    ```bash
    sudo pacman -S python
    ```

- **debugpy** (Python debugger for DAP)
  - Used by the Python debug adapter config:
    ```bash
    python3 -m pip install --user debugpy
    ```

- **.NET debugger: `netcoredbg`** (for C#/Unity)
  - Download or build `netcoredbg`.
  - Place the binary at:
    ```text
    ~/tools/netcoredbg/netcoredbg
    ```
  - The DAP config assumes that exact path and uses:
    ```text
    --interpreter=vscode
    ```

- **CLI helpers (for Telescope and general workflow)**
  - `ripgrep`:
    ```bash
    sudo pacman -S ripgrep
    ```
  - `fd` (called `fd` on Arch, `fd-find` on some distros):
    ```bash
    sudo pacman -S fd
    ```

- **Language runtimes you actually use**
  - **Node.js** (for JS/TS tooling, ESLint, etc.)
  - **Go** (for `nvim-dap-go` and Go tooling)
  - Any others you need (Rust, etc.).

---

### 2. Install LSP servers, formatters, and linters via Mason

Mason and mason-lspconfig are installed automatically as plugins, but **you still choose what to install**.

Inside Neovim:

```vim
:Mason
```

From the UI (or via Mason commands), install:

#### LSP servers (from `lsp-config.lua`)

- `lua_ls` – Lua
- `ts_ls` – TypeScript / JavaScript
- `html` – HTML
- `cssls` – CSS
- `tailwindcss` – Tailwind CSS (class name intelligence in templates/JSX/TSX, etc.)

You can add more later and wire them in `lsp-config.lua` if needed.

#### Formatters / linters (from `none-ls.lua`)

Install the tools that back these null-ls sources:

- `stylua` – Lua formatter
- `prettier` – JS/TS/HTML/CSS/etc formatter
- `black` – Python formatter
- `isort` – Python import sorter
- `eslint_d` – JS/TS diagnostics

Mason has packages for these; once installed, `none-ls` will pick them up.

---

### 3. Verify debugging works

In Neovim:

1. **Python DAP**
   - Open a Python file.
   - Set a breakpoint: `<leader>dt`.
   - Start debugging: `<leader>dc`.
   - If it fails, check:
     - `python3` is on `$PATH`.
     - `python3 -m debugpy` works.

2. **Go DAP**
   - Open a Go file (with a `main`).
   - Use the same DAP keymaps (`<leader>dt`, `<leader>dc`, etc.).
   - Make sure Go and the Go debugger (installed via Mason or your package manager) are present.

3. **C#/Unity DAP**
   - Ensure `~/tools/netcoredbg/netcoredbg` exists and is executable.
   - Use the C# debug configuration; it will prompt for `Assembly-CSharp.dll`.

---

### 4. Quick sanity checks

- Run `:Lazy` to verify all plugins are installed and up to date.
- Run `:Mason` to confirm LSPs/formatters/debuggers you want are installed.
- Open a Lua / TS / HTML / CSS file and verify:
  - LSP actions (`K`, `gd`, `gr`, `<leader>ca`, `<leader>rn`) work.
  - `<leader>gf` formats using the expected tool.
  - Telescope mappings (`<C-p>`, `<leader>fg`) work and use `rg`/`fd`.

If something feels off on a new machine, this checklist is the place to start.  
You can update it over time as you add new languages or tools.


