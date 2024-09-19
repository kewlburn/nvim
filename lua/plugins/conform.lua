return {
    -- FORMATTING
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.setup({
            log_level = vim.log.levels.DEBUG, -- :ConformInfo to show log info
            formatters_by_ft = {
                -- https://www.gnu.org/software/gawk/manual/gawk.html
                awk = {"awk"},
                -- https://dart.dev/tools/dart-format
                dart = {"dart_format"},
                -- https://github.com/mvdan/gofumpt
                -- https://pkg.go.dev/golang.org/x/tools/cmd/goimports (auto imports)
                -- https://github.com/incu6us/goimports-reviser
                go = {"gofumpt", "goimports", "goimports-reviser"},
                -- https://github.com/threedaymonk/htmlbeautifier
                html = {"htmlbeautifier"},
                -- https://github.com/prettier/prettier
                javascript = {"prettier"},
                javascriptreact = {"prettier"},
                -- https://github.com/stedolan/jq
                jq = {"jq"},
                -- https://github.com/prettier/prettier
                json = {"prettier"},
                -- https://github.com/Koihik/LuaFormatter
                lua = {"lua-format"},
                -- https://github.com/prettier/prettier
                markdown = {"prettier"},
                -- https://github.com/PHP-CS-Fixer/PHP-CS-Fixer
                php = {"php_cs_fixer"},
                -- https://github.com/rust-lang/rustfmt
                rust = {"rustfmt"},
                -- https://github.com/koalaman/shellcheck
                sh = {"shellcheck"},
                -- https://www.terraform.io/docs/cli/commands/fmt.html
                -- https://opentofu.org/docs/cli/commands/fmt/  NOTE: This is an alternative `tofu_fmt`
                terraform = {"terraform_fmt"},
                -- https://github.com/tamasfe/taplo
                toml = {"taplo"},
                -- https://github.com/prettier/prettier
                xml = {"prettier"},
                -- https://github.com/mikefarah/yq
                yq = {"yq"},
                -- https://github.com/koalaman/shellcheck
                zsh = {"shellcheck"}
                -- Use the "*" filetype to run formatters on all filetypes.
            },
            -- NOTE: The gofumpt formatter isn't working properly.
            -- So although I have the below configured, I rely on an autocmd instead.
            -- See ../autocommands.lua
            -- It's also worth noting that I have gofumpt configured by gopls.
            -- So I'm not sure if that affects conform.nvim at all.
            -- See ./lsp.lua
            formatters = {
                gofumpt = {
                    command = "gofumpt",
                    args = {"$FILENAME"},
                    stdin = false -- https://github.com/stevearc/conform.nvim/issues/387
                }
            },
            format_after_save = function(bufnr)
                -- disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return {timeout_ms = 5000, lsp_format = "fallback"}
            end
        })

        vim.api.nvim_create_user_command("FormatDisable", function(args)
            if args.bang then
                -- FormatDisable! will disable formatting just for this buffer
                vim.b.disable_autoformat = true
            else
                vim.g.disable_autoformat = true
            end
        end, {desc = "Disable autoformat-on-save", bang = true})

        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, {desc = "Re-enable autoformat-on-save"})

        vim.keymap.set("n", "<leader><leader>fi", "<Cmd>ConformInfo<CR>",
                       {desc = "Show Conform log"})
        vim.keymap.set("n", "<leader><leader>fd", "<Cmd>FormatDisable<CR>",
                       {desc = "Disable autoformat-on-save"})
        vim.keymap.set("n", "<leader><leader>fe", "<Cmd>FormatEnable<CR>",
                       {desc = "Re-enable autoformat-on-save"})
        vim.keymap.set("n", "<leader><leader>fg",
                       function() vim.cmd("silent !gofumpt -w %") end,
                       {desc = "Format file with gofumpt"})

        -- DISABLED: in favour of format_on_save.
        --
        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --   group = vim.api.nvim_create_augroup("Formatting", { clear = true }),
        --   pattern = "*",
        --   callback = function(args)
        --     require("conform").format({ bufnr = args.buf })
        --   end
        -- })
    end
}
