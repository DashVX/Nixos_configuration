return {
	"catppuccin/nvim",
	name = "catppuccin",
	opts = {
		flavour = "mocha",
		transparent_background = false,
		term_colors = true,
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
