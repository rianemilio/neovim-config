return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewFileHistory",
	},
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Abrir Diffview" },
		{ "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Fechar Diffview" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Histórico do arquivo atual" },
	},
	config = true,
}
