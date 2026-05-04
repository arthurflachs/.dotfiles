vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "<Esc>", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>xx", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })


vim.diagnostic.config({
  virtual_text = true,  -- Enable inline diagnostics
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.numberwidth = 3
