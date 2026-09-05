-- Load options before plugins so leader and editor defaults are available.
require("config.options")
require("config.lazy")
require("config.lsp")

vim.cmd.colorscheme("tokyonight")

require("config.keymaps")
require("config.autocmds")
