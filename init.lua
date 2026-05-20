local home = os.getenv("HOME")
local nvm_node_dir = home .. "/.nvm/versions/node"

-- Executa apenas se 'node' não estiver no PATH e se o diretório do NVM existir
if vim.fn.executable("node") == 0 and vim.fn.isdirectory(nvm_node_dir) == 1 then
	-- Lê o conteúdo do diretório de forma segura
	local success, versions = pcall(vim.fn.readdir, nvm_node_dir)
	local teste

	if success and versions and #versions > 0 then
		-- Ordena as versões para pegar a mais recente disponível
		table.sort(versions)
		local active_version = versions[#versions]
		local node_bin_path = nvm_node_dir .. "/" .. active_version .. "/bin"

		-- Garante que a pasta /bin realmente existe antes de adicionar ao PATH
		if vim.fn.isdirectory(node_bin_path) == 1 then
			vim.env.PATH = node_bin_path .. ":" .. vim.env.PATH
		end
	end
end

require("set")
require("remap")
require("functions")
require("lazy_init")
