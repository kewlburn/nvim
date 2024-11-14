return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.intelephense.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          intelephense = {
            -- possible values: stubs.txt
            stubs = {
              "Core",
              "SPL",
              "imap",
              "imagick",
              "standard",
              "pcre",
              "date",
              "json",
              "ctype",
              "SimpleXML",
              "Reflection",
              "exif",
              "redis",
              "pdo",
              "curl",
              "mbstring",
            },
          },
        },
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
