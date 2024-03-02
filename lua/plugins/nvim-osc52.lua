return {
  "ojroques/nvim-osc52",
  config = function()
    vim.keymap.set("v", "<leader>c", '<cmd>lua require("osc52").copy_visual()<CR>', { desc = "Copy (to clipboard)" })
    vim.keymap.set("n", "<leader>cc", "<leader>c_", { remap = true })
    vim.keymap.set("n", "<leader>c", require("osc52").copy_operator, { expr = true })
  end,
}
