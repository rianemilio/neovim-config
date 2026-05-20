return {
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				compile = false,
				undercurl = true,
				commentStyle = { italic = true, bold = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false,
				dimInactive = true,
				terminalColors = true,
				theme = "dragon",
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						TelescopeBorder = { fg = theme.ui.border, bg = "none" },
						TelescopeNormal = { bg = "none" },
						TelescopePromptNormal = { bg = "none" },
						TelescopePromptBorder = { fg = theme.ui.border, bg = "none" },
					}
				end,
			})

			vim.cmd("colorscheme kanagawa")
		end,
	},
}
