-- ~/.config/nvim/init.lua

vim.g.mapleader = " "  -- ✅ Set leader key to spacebar

-- Plugin manager: Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins Setup
require("lazy").setup({
  -- UI & Themes
  {
    "Integralist/hart-foundation",
    lazy = false,
    priority = 1000,
  },

  -- File Navigation
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",

  -- Syntax Highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- LSP & Autocomplete
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",

  -- Status line
  "nvim-lualine/lualine.nvim",

  -- Git
  "lewis6991/gitsigns.nvim",

  -- File Explorer
  "nvim-tree/nvim-tree.lua",

  -- conform (for ESLint and Prettier)
  {
  'stevearc/conform.nvim',
  opts = {},
  },

  { "numToStr/Comment.nvim", opts = {} }
})

-- Autocomplete Setup
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

-- Theme Setup
vim.o.background = "dark"
vim.cmd.colorscheme("hart-foundation")


-- TypeScript Setup:
-- make sure to install ts and ts-server globally:
-- `npm install -g typescript typescript-language-server`
local lspconfig = require("lspconfig")

-- lspconfig.tsserver.setup = nil -- safety check, optional
-- lspconfig.tsserver = nil        -- safety check, optional
lspconfig.ts_ls.setup({})


-- Telescope Keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>ld", require("telescope.builtin").diagnostics, { desc = "List diagnostics" })
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })

-- Git Keybindings
vim.keymap.set("n", "<leader>gp", require("gitsigns").preview_hunk, { desc = "Preview git hunk" })
vim.keymap.set("n", "<leader>gd", require("gitsigns").diffthis, { desc = "Show file diff" })

vim.keymap.set("n", "<leader>gq", function()
  vim.cmd("diffoff!")   -- turn off diff mode in all windows
  vim.cmd("only")       -- close all other splits, keep current one
end, { desc = "Quit diff view" })

-- Format code Keybinding
vim.keymap.set("n", "<leader>i", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- Keybinding to run EslintFixAll
vim.keymap.set("n", "<leader>e", function()
  vim.cmd("EslintFixAll")
end, { desc = "Run ESLint autofix" })

-- Navigation keybindings:
-- Split navigation with Alt + h/j/k/l
vim.keymap.set('n', '<A-h>', '<C-w>h', { desc = "Move to left split" })
vim.keymap.set('n', '<A-j>', '<C-w>j', { desc = "Move to below split" })
vim.keymap.set('n', '<A-k>', '<C-w>k', { desc = "Move to above split" })
vim.keymap.set('n', '<A-l>', '<C-w>l', { desc = "Move to right split" })

-- Resize splits with Alt + Shift + h/j/k/l
vim.keymap.set('n', '<A-H>', ':vertical resize -2<CR>', { desc = "Decrease split width" })
vim.keymap.set('n', '<A-L>', ':vertical resize +2<CR>', { desc = "Increase split width" })
vim.keymap.set('n', '<A-K>', ':resize -2<CR>', { desc = "Decrease split height" })
vim.keymap.set('n', '<A-J>', ':resize +2<CR>', { desc = "Increase split height" })

-- Go back to previous buffer
vim.keymap.set('n', 'gb', '<C-^>', { desc = "Go back to previous buffer" })

-- Auto-import
vim.keymap.set("n", "<leader>oi", function()
  vim.lsp.buf.execute_command({
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  })
end, { desc = "Organize imports" })

-- commenting
require("Comment").setup()
vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment on line" })

vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment on selection" })


-- Prettier
require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    css = { "prettier" },
  },
})

-- Format on save:
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})


-- ESLint
require("lspconfig").eslint.setup({
  on_attach = function(client, bufnr)
    -- optional: auto-fix on save
    --vim.api.nvim_create_autocmd("BufWritePre", {
    --  buffer = bufnr,
    --  command = "EslintFixAll",
    --})

    -- disable formatting because we're using Prettier for that
    client.server_capabilities.documentFormattingProvider = false
  end,
})


-- Virtual text for errors and warnings 
--vim.diagnostic.config({
--  virtual_text = true,
--  signs = true,
--  underline = true,
--  update_in_insert = false,
--})

