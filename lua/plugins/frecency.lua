return {
  "nvim-telescope/telescope-frecency.nvim",
  config = function()
    require("telescope").load_extension "frecency"

    vim.keymap.set("n", "<leader>fo", "<Cmd>Telescope frecency workspace=CWD<CR>")
  end,
}

