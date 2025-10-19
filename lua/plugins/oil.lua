return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      float = {
        padding = 5,
        max_width = 155,
        max_height = 32,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        preview_split = "right",
        override = function(conf)
          return conf
        end,
      },
      preview_win = {
        update_on_cursor_moved = true,
        preview_method = "fast_scratch",
        disable_preview = function(filename)
          return true
        end,
        win_options = {},
      },
      confirmation = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = 0.9,
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        minimized_border = "none",
        win_options = {
          winblend = 0,
        },
      },
      use_default_keymaps = false,
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name)
          return vim.startswith(name, ".") and name ~= ".DS_Store" and name ~= ".git"
        end,
        is_always_hidden = function(name)
          return name == ".DS_Store" or name == ".git"
        end,
      },
      keymaps = {
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

    vim.keymap.set("n", "<leader>e", function()
      require("oil").open_float()
    end, { desc = "Open Explorer in floating mode" })
  end,
}
