return {
	"saghen/blink.cmp",
	-- Versões estáveis (1.x) baixam o binário pronto do fuzzy matcher em Rust
	version = "1.*",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"fang2hou/blink-copilot",
	},
	---@module "blink.cmp"
	---@type blink.cmp.Config
	opts = {
		-- Mesmos atalhos que você usava no nvim-cmp
		keymap = {
			preset = "none",
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 300 },
		},

		signature = { enabled = true },

		sources = {
			default = { "copilot", "lsp", "snippets", "buffer", "path" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
