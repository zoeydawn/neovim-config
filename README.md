# Neovim Setup for TypeScript & Frontend Development

This Neovim configuration is designed for **TypeScript** and **frontend web development** with:
- LSP support (TypeScript, ESLint)
- Auto-formatting with Prettier
- Git integration
- Split navigation
- Comment toggling
- Telescope for fuzzy finding
- Hart Foundation color scheme

---

## 📦 **Prerequisites** (Arch Linux)

### System Packages
Install with `pacman`:
```bash
sudo pacman -S neovim nodejs npm git ripgrep fd
```

- `neovim` → Core editor
- `nodejs` & `npm` → Required for LSP servers
- `git` → For plugin management
- `ripgrep` → Needed by Telescope for live grep
- `fd` → Better file searching for Telescope

---

### NPM Global Packages
Install globally:
```bash
npm install -g typescript typescript-language-server prettier eslint vscode-langservers-extracted
```

Or for `eslint-lsp`:
```bash
npm install -g eslint eslint-lsp
```

---

## 🎨 Theme
This config uses the **Hart Foundation** color scheme:
```lua
vim.o.background = "dark"
vim.cmd.colorscheme("hart-foundation")
```

---

## 🔌 Plugins Used
- [lazy.nvim](https://github.com/folke/lazy.nvim) → Plugin manager
- [hart-foundation](https://github.com/Integralist/hart-foundation) → Theme
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) → Fuzzy finding
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) → Syntax highlighting
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) → LSP configuration
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) → Autocompletion
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) → Snippets
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) → Status line
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) → Git integration
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) → File explorer
- [conform.nvim](https://github.com/stevearc/conform.nvim) → Formatting (Prettier)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) → Comment toggling

---

## ✅ LSP Setup
- **TypeScript** → `typescript-language-server` (`ts_ls`)
- **ESLint** → `eslint-lsp` (from `vscode-langservers-extracted`)
- **Prettier** → via `conform.nvim`

---

## 🛠 Features
- **Auto-format on save** (Prettier)
- **ESLint diagnostics** + `EslintFixAll` command
- **Telescope fuzzy finding**
- **Hart Foundation theme**
- **Comment toggling**
- **Git signs and diffs**
- **Split navigation & resizing**
- **Type definitions & imports**
- **Auto-imports via `<leader>oi`**

---

## 🔑 Keybindings Cheat Sheet

### 📁 Telescope
| Keys           | Action                      |
|----------------|-----------------------------|
| `<leader>ff`   | Find files                  |
| `<leader>fg`   | Live grep (search text)     |
| `<leader>fb`   | List open buffers           |
| `<leader>ld`   | Show diagnostics (Telescope)|

---

### 🔍 LSP Navigation
| Keys           | Action                      |
|----------------|-----------------------------|
| `gd`           | Go to definition            |
| `gr`           | Find references             |
| `gi`           | Go to implementation        |
| `K`            | Hover (documentation)       |
| `<leader>rn`   | Rename symbol               |
| `gt`           | Go to type definition       |
| `<leader>oi`   | Organize imports            |

---

### 🧼 Formatting & Linting
| Keys           | Action                               |
|----------------|--------------------------------------|
| `<leader>i`    | Format buffer (Prettier)            |
| `<leader>e`    | ESLint autofix (`EslintFixAll`)     |

---

### 🔀 Split Navigation
| Keys           | Action                      |
|----------------|-----------------------------|
| `Alt + h`      | Move to **left** split      |
| `Alt + l`      | Move to **right** split     |
| `Alt + j`      | Move to **below** split     |
| `Alt + k`      | Move to **above** split     |
| `gb`           | Go back to previous buffer  |

---

### 📏 Resize Splits
| Keys              | Action                          |
|-------------------|---------------------------------|
| `Alt + Shift + h` | Decrease split **width**        |
| `Alt + Shift + l` | Increase split **width**        |
| `Alt + Shift + j` | Increase split **height**       |
| `Alt + Shift + k` | Decrease split **height**       |

---

### 📝 Comments
| Keys             | Action                              |
|------------------|-------------------------------------|
| `<leader>/` (n)  | Toggle comment on current line      |
| `<leader>/` (v)  | Toggle comment on selection         |

---

### 🔍 Git Integration
| Keys           | Action                      |
|----------------|-----------------------------|
| `<leader>gp`   | Preview current hunk        |
| `<leader>gd`   | Show file diff              |
| `<leader>gq`   | Quit diff view              |
