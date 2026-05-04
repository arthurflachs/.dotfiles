return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"fdschmidt93/telescope-egrepify.nvim",
			"folke/trouble.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			local trouble_telescope = require("trouble.sources.telescope")

			local open_in_trouble = function(bufnr)
				trouble_telescope.open(bufnr)
				vim.schedule(function()
					require("trouble").focus()
				end)
			end

			require("telescope").setup({
				defaults = {
					mappings = {
						i = { ["<c-t>"] = open_in_trouble },
						n = { ["<c-t>"] = open_in_trouble },
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", function()
				require("telescope").extensions.egrepify.egrepify({})
			end, { desc = "Grep (egrepify)" })

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("egrepify")
		end,
	},
}
