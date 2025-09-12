return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
    })

    local wk = require("which-key")
    wk.add({
      { "<leader>f", group = "file" },
      { "<leader>f1", hidden = false },
    })
  end,
}

