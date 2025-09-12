local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap({"n", "v", "i"}, "<Up>", "<Nop>", opts)
keymap({"n", "v", "i"}, "<Down>", "<Nop>", opts)
keymap({"n", "v", "i"}, "<Left>", "<Nop>", opts)
keymap({"n", "v", "i"}, "<Right>", "<Nop>", opts)

keymap("t", "<C-x>", "<C-\\><C-n>", opts)
keymap("i", "jj", "<ESC>", opts)
keymap("i", "jk", "<ESC>", opts)
