return {
  "nvimtools/none-ls.nvim",
  dependencies = { "jay-babu/mason-null-ls.nvim" },
  config = function()
    local null_ls = require("null-ls")

    local format_augroup = vim.api.nvim_create_augroup("LspFormat", { clear = true })

    null_ls.setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = format_augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
            end,
          })
        end
      end,
    })
  end,
}
