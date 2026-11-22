-- nvim-treesitter (branch main): não suporta lazy-loading e não tem mais
-- `nvim-treesitter.configs`. Highlight/indent são ligados por FileType.
-- Instalar parsers exige o `tree-sitter` CLI (>= 0.26.1) e um compilador C.
local ensure_installed = {
	"bash",
	"c",
	"cpp",
	"dockerfile",
	"html",
	"java",
	"javascript",
	"json",
	"kotlin",
	"lua",
	"markdown",
	"markdown_inline",
	"php",
	"python",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			ts.setup({})

			local has_cli = vim.fn.executable("tree-sitter") == 1
			if has_cli then
				-- Só instala o que falta; não faz nada se já estiver instalado
				ts.install(ensure_installed)
			end

			local function start(buf, lang)
				if pcall(vim.treesitter.start, buf, lang) then
					vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
				callback = function(args)
					local lang = vim.treesitter.language.get_lang(args.match)
					if not lang then
						return
					end

					if vim.tbl_contains(ts.get_installed("parsers"), lang) then
						start(args.buf, lang)
					elseif has_cli and vim.tbl_contains(ts.get_available(), lang) then
						-- Equivalente ao antigo `auto_install = true`
						ts.install(lang):await(function()
							vim.schedule(function()
								if vim.api.nvim_buf_is_valid(args.buf) then
									start(args.buf, lang)
								end
							end)
						end)
					else
						-- Parsers que já vêm com o Neovim (lua, markdown, vim, c...)
						start(args.buf, lang)
					end
				end,
			})
		end,
	},
}
