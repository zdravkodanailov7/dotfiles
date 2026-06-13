require "nvchad.options"

-- add yours here!

vim.o.background = "dark"
-- NOTE: never `colorscheme solarized-osaka` here — the plugin is installed only as
-- lualine's theme donor; base46 (chadrc) owns the editor colorscheme.

local o = vim.o
o.guicursor = "" -- block cursor in all modes
o.number = true
o.relativenumber = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
-- o.cursorlineopt ='both' -- to enable cursorline!
