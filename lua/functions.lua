local function terminal_split()
  local file = vim.fn.expand("%:p")
  vim.cmd("term")
  vim.cmd("new" .. file)
end

local function open_ex()
  vim.cmd("Ex")
end


vim.keymap.set("n", "<leader>s", terminal_split)
vim.keymap.set("n", "<leader>e", open_ex)


