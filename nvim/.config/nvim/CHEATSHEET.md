# Neovim Cheat Sheet

**Leader Key:** `<Space>` (spacebar)

---

## 🎯 File Explorer (Neo-tree)

| Key | Action |
|-----|--------|
| `<C-n>` | Toggle file explorer |
| `<leader>e` | Focus file explorer |
| `<C-w>h` | Move focus to file explorer (left) |
| `<C-w>l` | Move focus to code buffer (right) |

**In Neo-tree:**
- `Enter` - Open file/folder
- `a` - Add file/folder
- `d` - Delete file/folder
- `r` - Rename file/folder
- `c` - Copy file/folder
- `x` - Cut file/folder
- `p` - Paste file/folder

---

## 🔍 Telescope (Fuzzy Finder)

| Key | Action |
|-----|--------|
| `<C-p>` | Find files |
| `<leader>fg` | Live grep (search in files) |

**In Telescope:**
- `<C-n>` / `<C-p>` - Navigate results
- `<Enter>` - Open selected
- `<C-x>` - Open in vertical split (use instead of `<C-v>` which terminals intercept)
- `<C-o>` - Open in horizontal split (use instead of `<C-s>`/`<C-z>` which terminals intercept)
- `<C-t>` - Open in new tab
- `<Esc>` / `<C-c>` - Close Telescope
- `<C-b>` - Scroll docs up
- `<C-f>` - Scroll docs down

---

## 📝 Editing & Navigation

### Basic Movement
| Key | Action |
|-----|--------|
| `h`, `j`, `k`, `l` | Left, Down, Up, Right |
| `w` | Next word start |
| `e` | End of word |
| `b` | Previous word start |
| `0` | Start of line |
| `$` | End of line |
| `gg` | Top of file |
| `G` | Bottom of file |
| `50G` | Jump to line 50 |
| `%` | Jump to matching bracket/parenthesis |
| `{` / `}` | Previous/next paragraph |

### Text Selection (Visual Modes)
| Key | Action |
|-----|--------|
| `v` | Visual mode (character-wise) |
| `V` | Visual line mode (whole lines) |
| `<C-q>` | Visual block mode (column selection) |
| `o` | Jump to other end of selection (in visual mode) |

### Copy, Cut, Paste
| Key | Action |
|-----|--------|
| `y` | Yank (copy) selection |
| `yy` | Yank entire line |
| `Y` | Yank to end of line |
| `yiw` | Yank inner word |
| `yap` | Yank paragraph |
| `d` | Delete (cut) selection |
| `dd` | Delete entire line |
| `D` | Delete to end of line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |

### Undo/Redo
| Key | Action |
|-----|--------|
| `u` | Undo |
| `<C-r>` | Redo |

### Search
| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor (forward) |
| `#` | Search word under cursor (backward) |

---

## 🔧 LSP (Language Server Protocol)

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gr` | List references |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |

**Available LSPs:**
- `lua_ls` - Lua
- `ts_ls` - TypeScript/JavaScript
- `html` - HTML
- `cssls` - CSS
- `tailwindcss` - Tailwind CSS

---

## 🎨 Formatting

| Key | Action |
|-----|--------|
| `<leader>gf` | Format buffer |

**Formatters:**
- `stylua` - Lua
- `prettier` - JS/TS/HTML/CSS
- `black` - Python
- `isort` - Python imports
- `eslint_d` - JS/TS diagnostics

---

## 🐛 Debugging (DAP)

| Key | Action |
|-----|--------|
| `<leader>dt` | Toggle breakpoint |
| `<leader>dc` | Start/Continue debugging |
| `<leader>dq` | Terminate debugging |
| `<leader>du` | Toggle DAP UI |
| `<leader>dr` | Run last debug session |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |

**Supported Languages:**
- Python (via `debugpy`)
- Go (via `nvim-dap-go`)
- C# / Unity (via `netcoredbg`)

---

## 🪟 Window Management

### Moving Between Windows
| Key | Action |
|-----|--------|
| `<C-h>` | Move focus left (easier than `<C-w>h`) |
| `<C-j>` | Move focus down (easier than `<C-w>j`) |
| `<C-k>` | Move focus up (easier than `<C-w>k`) |
| `<C-l>` | Move focus right (easier than `<C-w>l`) |
| `<C-w>w` | Cycle through windows |
| `<C-w>p` | Go to previous window |
| `<C-w>t` | Go to top-left window |
| `<C-w>b` | Go to bottom-right window |

### Creating/Closing Windows
| Key | Action |
|-----|--------|
| `<C-w>s` | Split horizontally |
| `<C-w>v` | Split vertically |
| `<C-w>q` | Close current window |
| `:sp <file>` | Open file in horizontal split |
| `:vsp <file>` | Open file in vertical split |

### Resizing Windows
| Key | Action |
|-----|--------|
| `<C-w>=` | Make all windows equal size |
| `<C-w>+` / `<C-w>-` | Increase/decrease height |
| `<C-w>>` / `<C-w><` | Increase/decrease width |

## 📑 Tab Management

| Key | Action |
|-----|--------|
| `gt` | Next tab |
| `gT` | Previous tab |
| `1gt`, `2gt`, `3gt` | Go to tab 1, 2, 3, etc. |
| `<leader>tn` | New tab |
| `<leader>tc` | Close current tab |
| `<leader>to` | Close all other tabs |
| `:tabnew` | Create new tab |
| `:tabclose` | Close current tab |
| `:tabonly` | Close all other tabs |

---

## 📋 Clipboard & Paste

| Key | Action |
|-----|--------|
| `<leader>p` | Toggle paste mode |
| `"+y` | Yank to system clipboard |
| `"+p` | Paste from system clipboard |

**Note:** Your config uses `unnamedplus`, so `y`/`p` already use system clipboard by default.

---

## 🚀 Other Commands

| Key | Action |
|-----|--------|
| `:Lazy` | Open plugin manager |
| `:Mason` | Open Mason (LSP/tool installer) |
| `:Alpha` | Open dashboard |
| `:q` | Quit |
| `:w` | Write (save) |
| `:wq` | Write and quit |
| `:q!` | Quit without saving |
| `:e <file>` | Edit file |
| `:bd` | Close buffer |
| `:bn` / `:bp` | Next/previous buffer |

---

## 💡 Pro Tips

### Quick Line Operations
- `dd` - Delete line
- `yy` - Copy line
- `>>` - Indent line right
- `<<` - Indent line left
- `=` - Auto-format line

### Visual Mode Power Moves
- `V` → `}` - Select to end of paragraph
- `V` → `%` - Select to matching bracket
- `<C-q>` → `j` → `I` → type → `<Esc>` - Insert at start of multiple lines
- `<C-q>` → `j` → `A` → type → `<Esc>` - Append at end of multiple lines

### Search & Replace
- `:%s/old/new/g` - Replace all in file
- `:%s/old/new/gc` - Replace with confirmation
- `:s/old/new/g` - Replace in current line

### Working with Multiple Files
- `:e <file>` - Open file
- `:sp <file>` - Open in horizontal split
- `:vsp <file>` - Open in vertical split
- `:tabe <file>` - Open in new tab
- `gt` / `gT` - Next/previous tab

---

## 🎯 Leader Key Combinations Summary

| Key | Action |
|-----|--------|
| `<leader>e` | Focus file explorer |
| `<leader>fg` | Live grep (Telescope) |
| `<leader>gf` | Format buffer |
| `<leader>p` | Toggle paste mode |
| `<leader>tn` | New tab |
| `<leader>tc` | Close current tab |
| `<leader>to` | Close all other tabs |
| `<leader>ca` | Code actions (LSP) |
| `<leader>rn` | Rename symbol (LSP) |
| `<leader>dt` | Toggle breakpoint (DAP) |
| `<leader>dc` | Start/Continue debugging (DAP) |
| `<leader>dq` | Terminate debugging (DAP) |
| `<leader>du` | Toggle DAP UI |
| `<leader>dr` | Run last debug session (DAP) |

---

**Remember:** Leader key is `<Space>`, so `<leader>fg` means press Space, then `f`, then `g`.

