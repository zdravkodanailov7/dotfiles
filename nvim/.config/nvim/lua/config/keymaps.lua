local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find open buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help" })
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Search current file" })
vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume last search" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find document symbols" })
vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Find workspace symbols" })

vim.keymap.set("n", "<leader>fa", function()
  builtin.find_files({ follow = true, no_ignore = true, hidden = true })
end, { desc = "Find all files" })

vim.keymap.set("i", "<C-b>", "<Esc>^i", { desc = "Beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "End of line" })
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })

vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })

vim.keymap.set("n", "<leader>n", "<cmd>set number!<CR>", { desc = "Toggle line numbers" })
vim.keymap.set("n", "<leader>rn", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative numbers" })

vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
vim.keymap.set("x", "<leader>/", "gc", { desc = "Toggle selected comments", remap = true })

vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file tree" })

vim.keymap.set("n", "<leader>fm", function()
  vim.lsp.buf.format()
end, { desc = "Format file" })

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>b", "<cmd>enew<CR>", { desc = "New buffer" })

vim.keymap.set("n", "<leader>x", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Close buffer" })

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open Lazygit" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "File diagnostics" })



vim.keymap.set("n", "<leader>tw", function()
  vim.wo.wrap = not vim.wo.wrap
  vim.wo.linebreak = vim.wo.wrap
  vim.wo.breakindent = vim.wo.wrap
end, { desc = "Toggle word wrap" })

vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", { desc = "Move line up" })

vim.keymap.set("x", "<leader>j", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("x", "<leader>k", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
