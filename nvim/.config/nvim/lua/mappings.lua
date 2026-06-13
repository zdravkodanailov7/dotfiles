require "nvchad.mappings"

-- add yours here

-- Markdown preview toggle (browser)
vim.api.nvim_set_keymap('n', '<leader>mp', ':MarkdownPreviewToggle<CR>', { noremap = true, silent = true })

local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- Terminal mappings - using simpler Ctrl combos that work in most terminals
map({ "n", "t" }, "<C-\\>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

map({ "n", "t" }, "<C-t>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<C-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

-- Lazygit
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- Telescope
map("n", "<leader>fr", "<cmd>Telescope resume<CR>", { desc = "telescope resume" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "telescope document symbols" })
map("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "telescope workspace symbols" })

-- LSP
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })

-- Move lines
map("n", "<leader>j", ":m .+1<CR>==", { desc = "move line down" })
map("n", "<leader>k", ":m .-2<CR>==", { desc = "move line up" })
map("v", "<leader>j", ":m '>+1<CR>gv=gv", { desc = "move selection down" })
map("v", "<leader>k", ":m '<-2<CR>gv=gv", { desc = "move selection up" })

-- Diagnostics
map("n", "gl", vim.diagnostic.open_float, { desc = "LSP diagnostic float" })

-- Word wrap
map("n", "<leader>tw", function()
  vim.wo.wrap = not vim.wo.wrap
  vim.wo.linebreak = vim.wo.wrap
  vim.wo.breakindent = vim.wo.wrap
end, { desc = "Toggle word wrap" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
