vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
local opts = {}

require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript"},
  highlight = { enable = true },
  indent = { enable = true },  
})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin-frappe"

require("oil").setup({
  use_default_keymaps = false,
  view_options = {
    show_hidden = true,
    is_hidden_file = function(name) return vim.startswith(name, ".") and name ~= ".DS_Store" and name ~= ".git" end,
    is_always_hidden = function(name) return name == ".DS_Store" or name == ".git" end,
  },
  keymaps = {
    ["<Esc>"] = "actions.close",
    ["q"] = "actions.close",
    ["<CR>"] = "actions.select",
    ["g"] = "actions.select",
    ["b"] = "actions.parent",
    ["?"] = "actions.show_help",
    ["<C-p>"] = "actions.preview",
    ["<C-r>"] = "actions.refresh",
    ["<C-t>"] = "actions.select_tab",

    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["<C-f>"] = "actions.change_sort",
    ["<C-e>"] = "actions.open_external",
    ["<C-.>"] = "actions.toggle_hidden",
  },
})
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })


