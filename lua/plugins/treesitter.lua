return {
  { "nvim-treesitter/nvim-tree-docs" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        tree_docs = {
          enable = true,
          spec_config = {
            jsdoc = {
              slots = {
                class = { author = true },
              },
              processors = {
                author = function()
                  return " * @author Ramsey Ramos <kewlburn@proton.me>"
                end,
              },
            },
          },
        },
        ensure_installed = { "lua", "javascript", "typescript", "php", "phpdoc", "markdown", "jsdoc" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
