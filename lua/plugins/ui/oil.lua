return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {

		default_file_explorer = true,
		columns = {
			"icon",
		},
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-s>"] = "actions.select_split",
			["<C-h>"] = "actions.select_vsplit",
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["-"] = "actions.parent",
			["g."] = "actions.toggle_hidden",
		},
		view_options = {
			show_hidden = false,
		},
	},
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Abrir diretório pai (Oil)" },
	},
}
