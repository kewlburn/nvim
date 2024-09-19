vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>",
               {desc = "Disable Highlight Search"})
vim.keymap.set("n", "<leader>fn", ":ene<CR>", {desc = "New File"})
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", {desc = "LazyGit"})
vim.keymap.set("n", "<leader>w", ":bd<CR>", {desc = "Close current buffer"})

vim.keymap.set("n", "<Tab>", ">>",
               {desc = "Indent", noremap = true, silent = true})
vim.keymap.set("n", "<S-Tab>", "<<",
               {desc = "Unindent", noremap = true, silent = true})
vim.keymap.set("v", "<Tab>", ">gv",
               {desc = "Indent", noremap = true, silent = true})
vim.keymap.set("v", "<S-Tab>", "<gv",
               {desc = "Unindent", noremap = true, silent = true})

vim.opt.clipboard = "unnamedplus"
vim.wo.number = true
vim.opt.list = true
vim.opt.listchars:append("space:·")
