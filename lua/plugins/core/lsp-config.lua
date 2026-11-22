return {
	{
		"mason-org/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			-- Keymaps aplicados quando qualquer LSP se conecta ao buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
				callback = function(args)
					local bufnr = args.buf
					vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

					local function map(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
					end

					map("gD", vim.lsp.buf.declaration, "Ir para declaração")
					map("gd", vim.lsp.buf.definition, "Ir para definição")
					map("K", vim.lsp.buf.hover, "Hover")
					map("gi", vim.lsp.buf.implementation, "Ir para implementação")
					map("<C-k>", vim.lsp.buf.signature_help, "Signature help")
					map("<leader>wa", vim.lsp.buf.add_workspace_folder, "Adicionar workspace folder")
					map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remover workspace folder")
					map("<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, "Listar workspace folders")
					map("<leader>D", vim.lsp.buf.type_definition, "Ir para tipo")
					map("<leader>rn", vim.lsp.buf.rename, "Renomear símbolo")
					map("<leader>ca", vim.lsp.buf.code_action, "Code action")
					map("gr", vim.lsp.buf.references, "Referências")
					map("<leader>E", vim.diagnostic.open_float, "Diagnóstico da linha")
					map("[d", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, "Diagnóstico anterior")
					map("]d", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, "Próximo diagnóstico")
					map("<leader>q", vim.diagnostic.setloclist, "Diagnósticos na loclist")
				end,
			})

			-- Capabilities do nvim-cmp para todos os servidores
			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			-- mason-lspconfig v2 chama vim.lsp.enable() nos servidores instalados
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
				},
				automatic_enable = true,
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = true,
	},
}
