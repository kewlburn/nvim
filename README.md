# Neovim Personal Configuration

This is my personal Neovim configuration tailored for development in multiple
languages with a focus on performance, ease of use, and extended functionality.
It leverages modern plugins to enhance Neovim’s built-in features.

## Plugins

-   [alpha-nvim](https://github.com/goolord/alpha-nvim) A fast and highly customizable
    greeter for Neovim.
-   [blink.cmp](https://github.com/Saghen/blink.cmp) Performant, batteries-included
    completion plugin for Neovim.
-   [catppuccin](https://github.com/catppuccin/nvim) A warm, soft-colored Neovim
    theme with various flavors.
-   [conform.nvim](https://github.com/stevearc/conform.nvim) Lightweight and fast
    autoformatting for Neovim.
-   [dressing.nvim](https://github.com/stevearc/dressing.nvim) Improve default Neovim
    UI elements, like `vim.ui.select` and `vim.ui.input`.
-   [flutter-tools.nvim](https://github.com/nvim-flutter/flutter-tools.nvim) Tools
    to help create and work on Flutter apps using Neovim.
-   [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) Set of
    preconfigured snippets for different languages for multiple snippet engines.
-   [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) Git integration
    for buffers, including signs, hunk navigation, and more.
-   [harpoon](https://github.com/ThePrimeagen/harpoon) Navigation tool that helps
    with quick access to files and buffers.
-   [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
    Adds indentation guides to Neovim.
-   [lazy.nvim](https://github.com/folke/lazy.nvim) A modern plugin manager for
    Neovim with performance-focused features.
-   [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) A Neovim wrapper for
    the `lazygit` command-line interface.
-   [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) A blazing ast and
    easily configurable statusline plugin.
-   [LuaSnip](https://github.com/L3MON4D3/LuaSnip) Snippet engine written in Lua
    for Neovim.
-   [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
    Bridges `mason.nvim` and `nvim-lspconfig` for easier management of LSP
    servers.
-   [mason.nvim](https://github.com/williamboman/mason.nvim) Portable package manager
    for Neovim to install LSP servers, DAP servers, linters, and formatters.
-   [nvim-lint](https://github.com/mfussenegger/nvim-lint) An asynchronous linting
    engine for Neovim.
-   [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) Quickstart configurations
    for the built-in Neovim LSP client.
-   [nvim-tree-docs](https://github.com/nvim-treesitter/nvim-tree-docs) A treesitter
    plugin that generates documentation comments for your code.
-   [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) Neovim
    treesitter configurations and abstraction layer for better syntax highlighting
    and code manipulation.
-   [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) Adds file
    type icons to Neovim.
-   [oil.nvim](https://github.com/stevearc/oil.nvim) A file explorer for Neovim
    that provides an efficient buffer-based interface.
-   [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) A Lua library with
    essential utilities for building Neovim plugins.
-   [telescope-frecency.nvim](https://github.com/nvim-telescope/telescope-frecency.nvim)
    Adds smart file sorting by frequency and recency to the Telescope plugin.
-   [telescope-project.nvim](https://github.com/nvim-telescope/telescope-project.nvim)
    Project management extension for Telescope.
-   [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
    Provides a Telescope-based UI replacement for Neovim's built-in `vim.ui.select`.
-   [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) A highly
    extendable fuzzy finder over lists for Neovim.
-   [vim-fugitive](https://github.com/tpope/vim-fugitive) A Git wrapper that
    integrates Git commands into Neovim.
-   [which-key.nvim](https://github.com/folke/which-key.nvim) A Neovim plugin
    that shows keybindings in a popup as you type.

## Requirements

-   [git](https://git-scm.com/) A free and open source distributed version control
    system.
-   [lazygit](https://github.com/jesseduffield/lazygit) Simple terminal UI for git
    commands.
-   neovim 0.10

## Screenshots

![Alpha](https://github.com/user-attachments/assets/d8778ea2-3ef8-4d64-ba26-2a68c70f5449)
![Lazygit](https://github.com/user-attachments/assets/88330a06-9874-44ff-9b08-48f8d1297121)
![Oil](https://github.com/user-attachments/assets/3b2d51bb-f6b8-482d-8970-d84332c2cb27)

> [!WARNING]
> Not everything on the list is up to date, use it at your own risk.

## LSP (Mason)

-   css-lsp cssls
-   eslint-lsp eslint
-   lua-language-server lua_ls
-   quick-lint-js quick_lint_js
-   typescript-language-server ts_ls

## Linter (Mason)

-   eslint_d
-   jsonlint
-   luacheck
-   markdownlint
-   oxlint
-   phpcs
-   phpstan
-   quick-lint-js quick_lint_js

## Formatters (Mason)

-   fixjson
-   htmlbeautifier
-   markdownlint
-   prettierd
-   stylua

This configuration aims to provide a fast, flexible, and feature-rich
environment for coding, while keeping Neovim’s minimalist philosophy intact.
