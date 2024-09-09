return {
  -- LINTING
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      -- https://github.com/codespell-project/codespell
      -- https://golangci-lint.run/
      go = { "codespell", "golangcilint" },
      -- https://htmlhint.com/
      -- https://www.html-tidy.org/
      html = { "htmlhint", "tidy" },
      -- https://github.com/mantoni/eslint_d.js
      javascript = { "eslint_d" },
      -- https://github.com/zaach/jsonlint
      json = { "jsonlint" },
      -- https://github.com/mpeterv/luacheck
      lua = { "luacheck" },
      -- https://github.com/mrtazz/checkmake
      make = { "checkmake" },
      -- https://alexjs.com/
      -- https://github.com/DavidAnson/markdownlint
      -- https://docs.getwoke.tech/
      markdown = { "alex", "markdownlint", "woke" },
      -- https://github.com/squizlabs/PHP_CodeSniffer
      php = { "phpcs" },
      -- https://github.com/rust-lang/rust-clippy
      rust = { "clippy" },
      -- https://www.shellcheck.net/
      sh = { "shellcheck" },
      -- https://github.com/terraform-linters/tflint
      -- https://github.com/aquasecurity/trivy (originally https://github.com/aquasecurity/tfsec)
      terraform = { "tflint", "trivy" },
      -- https://www.shellcheck.net/
      -- https://www.zsh.org/
      zsh = { "shellcheck", "zsh" }
    }

    -- WARNING: Removed luacheck linter due to problem with folke/neodev
    -- https://github.com/mpeterv/luacheck
    -- lua = { "luacheck" },

    -- Checkmake requires a ini file in the current directory
    -- Otherwise you have to specify a global one
    lint.linters.checkmake.args = {
      "--format='{{.LineNumber}}:{{.Rule}}:{{.Violation}}\n'",
      "--config", os.getenv("HOME") .. "/.config/checkmake.ini",
    }

    -- Spectral requires a ruleset in the current directory
    -- Otherwise you have to specify a global one
    lint.linters.spectral.args = {
      "lint", "-f", "json", "--ruleset", "~/.spectral.yaml",
    }

    -- NOTE: We need custom logic for handling YAML linting.
    --
    -- https://github.com/rhysd/actionlint
    -- https://github.com/adrienverge/yamllint (https://yamllint.readthedocs.io/en/stable/rules.html)
    -- https://github.com/stoplightio/spectral (`npm install -g @stoplight/spectral-cli`)
    vim.api.nvim_create_autocmd({
      "BufReadPost", "BufWritePost", "InsertLeave"
    }, {
      group = vim.api.nvim_create_augroup("Linting", { clear = true }),
      callback = function(ev)
        -- print(string.format('event fired: %s', vim.inspect(ev)))
        -- print(vim.bo.filetype)
        if (string.find(ev.file, ".github/workflows/") or string.find(ev.file, ".github/actions/")) and vim.bo.filetype == "yaml" then
          lint.try_lint("actionlint")
        elseif vim.bo.filetype == "yaml" then
          local first_line = vim.fn.getline(1)
          if string.find(first_line, "openapi:") then
            lint.try_lint("spectral")
          else
            lint.try_lint("yamllint")
          end
        else
          lint.try_lint()
        end
      end
    })
  end
}
