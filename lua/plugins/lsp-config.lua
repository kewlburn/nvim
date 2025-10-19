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
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local on_attach = function(client, bufnr)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
      end

      vim.lsp.config.ts_ls = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      vim.lsp.config.html = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      vim.lsp.config.lua_ls = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      vim.lsp.config.intelephense = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          intelephense = {
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
              "bcmath",
              "filter",
              "random",
              "hash",
            },
          },
        },
      }

      vim.lsp.enable({ "ts_ls", "html", "lua_ls", "intelephense" })
    end,
  },
}
