return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
        side="right",
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {
      noremap = true,
      silent = true,
      desc = "Toggle file explorer"
    })
  end,
}

