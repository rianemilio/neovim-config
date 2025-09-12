return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        styles = {
          comments = { "italic", "bold" }
        },
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.15,
        },
        float = {
          transparent = true,
        },
        integrations = {
          treesitter = true,
          telescope = { enabled = true},
        },
      })
      vim.cmd.colorscheme "catppuccin-frappe"
    end
  }
}
