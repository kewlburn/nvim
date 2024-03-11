return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.phpcsfixer,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false, timeout = 5000 })
              end,
            })
          end
        end,
      })

      null_ls.register(require("none-ls.diagnostics.eslint_d"))
      vim.keymap.set("n", "<leader>gf", function()
        vim.lsp.buf.format({ timeout = 5000 })
      end, { desc = "Prettify" })
    end,
  },
}
