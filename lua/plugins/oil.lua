return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
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

		vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
