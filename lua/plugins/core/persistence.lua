return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	keys = {
		{
			"<leader>qs",
			function()
				require("persistence").load()
			end,
			desc = "Restaurar sessão do diretório atual",
		},
		{
			"<leader>ql",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Restaurar última sessão ativa",
		},
		{
			"<leader>qd",
			function()
				require("persistence").stop()
			end,
			desc = "Não salvar sessão ao sair",
		},
	},
}
