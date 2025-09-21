local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap({"n", "v"}, "<Up>", "<Nop>", opts)
keymap({"n", "v"}, "<Down>", "<Nop>", opts)
keymap({"n", "v"}, "<Left>", "<Nop>", opts)
keymap({"n", "v"}, "<Right>", "<Nop>", opts)

keymap("t", "<C-x>", "<C-\\><C-n>", opts)
keymap("i", "jj", "<ESC>", opts)
keymap("i", "jk", "<ESC>", opts)
