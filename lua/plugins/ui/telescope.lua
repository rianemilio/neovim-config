-- Pastas que o Telescope ignora (continuam visíveis no Oil)
local ignored_dirs = { ".git", "node_modules", "target", "build", ".gradle", ".idea" }

-- Lista pastas do projeto e abre a escolhida no Oil
local function find_dirs()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local cmd = { "find", ".", "-mindepth", "1", "(" }
	for i, dir in ipairs(ignored_dirs) do
		if i > 1 then
			table.insert(cmd, "-o")
		end
		vim.list_extend(cmd, { "-name", dir })
	end
	vim.list_extend(cmd, { ")", "-prune", "-o", "-type", "d", "-print" })

	pickers
		.new({}, {
			prompt_title = "Pastas",
			finder = finders.new_oneshot_job(cmd, {
				entry_maker = function(line)
					local path = line:gsub("^%./", "")
					return { value = path, display = path, ordinal = path }
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					local entry = action_state.get_selected_entry()
					actions.close(prompt_bufnr)
					if entry then
						require("oil").open(entry.value)
					end
				end)
				return true
			end,
		})
		:find()
end

return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	keys = {
		{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader><leader>", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Buscar texto no projeto" },
		{ "<leader>fd", find_dirs, desc = "Buscar pasta (abre no Oil)" },
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")

		-- Padrões Lua ancorados em nomes de pasta inteiros, para não
		-- esconder caminhos como com/github/... ou classes com "target" no nome
		local ignore_patterns = {}
		for _, dir in ipairs(ignored_dirs) do
			local escaped = vim.pesc(dir)
			table.insert(ignore_patterns, "^" .. escaped .. "/")
			table.insert(ignore_patterns, "/" .. escaped .. "/")
		end

		telescope.setup({
			defaults = {
				file_ignore_patterns = ignore_patterns,
				-- Caminhos de Java são longos: mostra o nome do arquivo primeiro
				path_display = { "filename_first" },
			},
		})
	end,
}
