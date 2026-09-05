local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
  assert(vim.v.shell_error == 0, "Could not download lazy.nvim")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = require("plugins"),
})
