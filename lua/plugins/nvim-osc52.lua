return {
	"ojroques/nvim-osc52",
	config = function()
		vim.keymap.set(
			"v",
			"<leader>c",
			'<cmd>lua require("osc52").copy_visual()<CR>',
			{ desc = "Copy (to clipboard)" }
		)
	end,
}
