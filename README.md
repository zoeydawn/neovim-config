# Neovim Config - Prerequisites & Keybindings

## ✅ Prerequisites

### 🔧 System Packages
| Tool                | Install Command                                                | Notes                                |
|---------------------|----------------------------------------------------------------|--------------------------------------|
| **Neovim** ≥ 0.9    | `sudo apt install neovim` (or your system's package manager)   | Make sure it’s a recent version      |
| **Node.js + npm**   | `sudo apt install nodejs npm` (or use `nvm`)                   | Required for language servers        |
| **git**             | `sudo apt install git`                                         | Needed for cloning Lazy.nvim plugins |

### 🧩 Neovim Plugins (auto-installed via Lazy.nvim)
These are handled by your config:
- `folke/lazy.nvim` (plugin manager)
- `catppuccin/nvim` (theme)
- `nvim-telescope/telescope.nvim`
- `nvim-lua/plenary.nvim`
- `nvim-treesitter/nvim-treesitter`
- `neovim/nvim-lspconfig`
- `hrsh7th/nvim-cmp`
- `hrsh7th/cmp-nvim-lsp`
- `L3MON4D3/LuaSnip`
- `nvim-lualine/lualine.nvim`
- `lewis6991/gitsigns.nvim`
- `nvim-tree/nvim-tree.lua`
- `stevearc/conform.nvim`

### 📦 NPM Packages (Global or Local)
Install globally for simplicity, or locally in each project:

```bash
npm install -g \
  typescript \
  typescript-language-server \
  prettier \
  eslint \
  vscode-langservers-extracted
```

Or for `eslint-lsp`:

```bash
npm install -g eslint eslint-lsp
```

---

## 🧠 Keybindings Cheat Sheet

### 📁 Telescope
| Keys           | Action                      |
|----------------|-----------------------------|
| `<leader>ff`   | Find files                  |
| `<leader>fg`   | Live grep (search text)     |
| `<leader>fb`   | List open buffers           |
| `<leader>ld`   | Show diagnostics (Telescope)|

### 🔍 LSP Navigation
| Keys           | Action                      |
|----------------|-----------------------------|
| `gd`           | Go to definition            |
| `gr`           | Find references             |
| `gi`           | Go to implementation        |
| `K`            | Hover (documentation)       |
| `<leader>rn`   | Rename symbol               |

### 🧼 Formatting & Linting
| Keys           | Action                      |
|----------------|-----------------------------|
| `<leader>i`    | Format buffer (Prettier)    |
| `<leader>e`    | ESLint autofix (`EslintFixAll`) |
