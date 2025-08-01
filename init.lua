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
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- File Navigation
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",

  -- Syntax Highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Formatting (Prettier)
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

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
  }
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
vim.cmd.colorscheme "catppuccin-frappe"  -- or "latte", "pinkish" and soft

require("catppuccin").setup({
  flavour = "frappe",
  integrations = {
    treesitter = true,
    telescope = true,
    nvimtree = true,
    -- lualine = true, -- this causes an error. try removing the commment after the next catppuccin update 
  },
})

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
-- vim.keymap.set("n", "<leader>ld", require("telescope.builtin").diagnostics, { desc = "List diagnostics" })

-- Format code Keybinding
--vim.keymap.set("n", "<leader>fp", function()
--  vim.lsp.buf.format()
--end)


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
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

