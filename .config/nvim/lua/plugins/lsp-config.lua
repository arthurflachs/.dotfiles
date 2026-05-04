return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "gopls", "jsonls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("gopls")
			vim.lsp.enable("jsonls")

      vim.lsp.config("*", { capabilities = capabilities })

			vim.keymap.set("n", "grf", vim.lsp.buf.format, {})
		end,
	},
}
