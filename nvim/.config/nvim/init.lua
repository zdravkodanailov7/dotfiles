-- Load options before plugins so leader and editor defaults are available.
require("config.options")
require("config.lazy")
require("config.lsp")

require("config.appearance").setup()
vim.cmd.colorscheme("tokyonight")

require("config.keymaps")
require("config.autocmds")
