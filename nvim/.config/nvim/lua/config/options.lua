-- My Neovim configuration, built one feature at a time.
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.undofile = true
vim.opt.autoread = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  leadmultispace = "· ",
}
vim.opt.signcolumn = "yes"

vim.g.mapleader = " "
