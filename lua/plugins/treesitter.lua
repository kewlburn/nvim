return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "javascript", "php", "phpdoc", "markdown" },
			auto_install = true,
			highlight = { enable = true },
			inded = { enable = true },
		})
	end,
}
