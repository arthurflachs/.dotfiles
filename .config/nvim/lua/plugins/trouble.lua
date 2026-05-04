return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		indent_guides = true,
		modes = {
			telescope = {
				win = {
					position = "right",
					size = { width = 60 },
				},
				preview = { type = "none" },
				groups = {
					{ "dirname", format = " {dirname} {count}" },
					{ "filename", format = "{file_icon} {basename} {count}" },
				},
				sort = { "filename", "pos" },
				format = "{text:ts} {pos}",
			},
		},
	},
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
	},
}
