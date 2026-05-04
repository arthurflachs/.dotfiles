return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      layout = {
        default_direction = "right",
      },
      -- sort by position in file (default behavior)
      post_parse_symbol = nil,
    })

    vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle right<CR>")
  end,
}
