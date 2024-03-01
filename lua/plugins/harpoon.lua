return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("harpoon").setup({
			tabline = true,
		})
		require("telescope").load_extension("harpoon")

		vim.keymap.set(
			"n",
			"<leader><leader>a",
			'<cmd>lua require("harpoon.mark").add_file()<CR>',
			{ desc = "Harpoon : Mark a file" }
		)

		vim.keymap.set(
			"n",
			"<leader><leader>`",
			'<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>',
			{ desc = "Harpoon Menu" }
		)
		vim.keymap.set(
			"n",
			"<leader>1",
			'<cmd>lua require("harpoon.ui").nav_file(1)<CR>',
			{ desc = "Harpoon : Switch to Mark 1" }
		)

		vim.keymap.set(
			"n",
			"<leader>2",
			'<cmd>lua require("harpoon.ui").nav_file(2)<CR>',
			{ desc = "Harpoon : Switch to Mark 2" }
		)

		vim.keymap.set(
			"n",
			"<leader>3",
			'<cmd>lua require("harpoon.ui").nav_file(3)<CR>',
			{ desc = "Harpoon : Switch to Mark 3" }
		)

		vim.keymap.set(
			"n",
			"<leader>4",
			'<cmd>lua require("harpoon.ui").nav_file(4)<CR>',
			{ desc = "Harpoon : Switch to Mark 3" }
		)

		vim.keymap.set(
			"n",
			"<leader>5",
			'<cmd>lua require("harpoon.ui").nav_file(5)<CR>',
			{ desc = "Harpoon : Switch to Mark 3" }
		)
	end,
}
