return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope-project.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"-L",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = { "node_modules" },
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = { "truncate" },
					winblend = 0,
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					-- Developer configurations: Not meant for general override
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
					mappings = {
						n = { ["q"] = require("telescope.actions").close },
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files"})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find text in File" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List all open Buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help" })

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("project")

			vim.keymap.set("n", "<leader>fp", "<CMD>lua require'telescope'.extensions.project.project{}<CR>", { desc = "Find Projects" })
		end,
	},
}
