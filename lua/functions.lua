local function terminal_split()
  local file = vim.fn.expand("%:p")
  vim.cmd("term")
  vim.cmd("new" .. file)
end

vim.keymap.set("n", "<leader>s", terminal_split)
