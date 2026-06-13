require "nvchad.autocmds"

vim.api.nvim_create_autocmd("User", {
  pattern = "NvThemeReload",
  callback = function()
    require("configs.ghostty_sync").sync()
  end,
})

-- Watch for theme changes from other Neovim instances
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("configs.theme_watcher").start()
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    require("configs.theme_watcher").stop()
  end,
})
