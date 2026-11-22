return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				-- Painel e ghost text desligados: o Copilot aparece no menu do blink.cmp
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
}
