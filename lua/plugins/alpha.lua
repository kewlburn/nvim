return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local button = dashboard.button

    dashboard.section.header.val = {
      [[  ███▄▄▄▄    ▄██████▄  ▀█████████▄   ▄██████▄  ████████▄  ▄██   ▄    ]],
      [[  ███▀▀▀██▄ ███    ███   ███    ███ ███    ███ ███   ▀███ ███   ██▄  ]],
      [[  ███   ███ ███    ███   ███    ███ ███    ███ ███    ███ ███▄▄▄███  ]],
      [[  ███   ███ ███    ███  ▄███▄▄▄██▀  ███    ███ ███    ███ ▀▀▀▀▀▀███  ]],
      [[  ███   ███ ███    ███ ▀▀███▀▀▀██▄  ███    ███ ███    ███ ▄██   ███  ]],
      [[  ███   ███ ███    ███   ███    ██▄ ███    ███ ███    ███ ███   ███  ]],
      [[  ███   ███ ███    ███   ███    ███ ███    ███ ███   ▄███ ███   ███  ]],
      [[   ▀█   █▀   ▀██████▀  ▄█████████▀   ▀██████▀  ████████▀   ▀█████▀   ]],
    }

    dashboard.section.header.opts.hl = "Comment"

    dashboard.section.buttons.val = {
      button("<leader>fp", " Open Project"),
      button("<leader>fn", " New File"),
      button("<leader>ff", "󰈞 Find File"),
      button("<leader>fo", "󰊄 Recents"),
      button("<leader>fg", "󰈬 Find Word"),
    }

    dashboard.config.layout = {
      { type = "padding", val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }) },
      dashboard.section.header,
      { type = "padding", val = 5 },
      dashboard.section.buttons,
      { type = "padding", val = 3 },
      dashboard.section.footer,
    }

    dashboard.config.opts.noautocmd = true

    local stats = require("lazy").stats()
    local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
    dashboard.section.footer.val = { "Neovim loaded " .. stats.count .. " plugins  in " .. ms .. "ms" }

    alpha.setup(dashboard.opts)
  end,
}
