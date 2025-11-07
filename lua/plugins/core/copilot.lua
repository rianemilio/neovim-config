return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
          keymap = {
            open = "<leader>co",
          },
        },
        suggestion = {
          enabled = false,
          auto_show = true,
          keymap = {
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-g>",
          },
        },
        filetypes = {
          ["*"] = true,
        },
      })
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    dependencies = "zbirenbaum/copilot.lua",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
