return {

	{ "ellisonleao/gruvbox.nvim" },

	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		config = function()
			vim.o.background = "dark"
			require("everforest").setup({
				background = "hard",
				italics = true,
			})
		end,
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "everforest",
		},
	},
}
