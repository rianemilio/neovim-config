local nvm_dir = os.getenv("NVM_DIR") or os.getenv("HOME") .. "/.nvm"
local nvm_script = nvm_dir .. "/nvm.sh"

-- Verifica se 'node' não está no PATH e se o nvm.sh existe
if vim.fn.executable("node") == 0 and vim.fn.filereadable(nvm_script) then
  -- Executa nvm use default para colocar o node no PATH APENAS para esta sessão do Neovim
  -- O 'default' é a versão de Node definida por 'nvm alias default'
  local load_cmd = string.format("source %s && nvm use default >/dev/null 2>&1 && echo $PATH", vim.fn.shellescape(nvm_script))
  local new_path = vim.fn.system(load_cmd):gsub('\n', '', 1)

  if new_path ~= '' then
    vim.env.PATH = new_path
  end
end

require("set")
require("remap")
require("functions")
require("lazy_init")
