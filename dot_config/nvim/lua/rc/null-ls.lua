local null_ls_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_ok then
  return
end

local sources = {
  -- python
  null_ls.builtins.formatting.black.with({
    extra_args = {'--line-length=120'}
  }),
  null_ls.builtins.formatting.isort,
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.formatting.gofmt,
}

-- local on_attach = function()
--   -- format on save any file
--   vim.api.nvim_create_autocmd({"BufWritePre"}, {
--     pattern = "*",
--     callback = function() vim.lsp.buf.format { async = true } end
--   })
-- end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        -- vim.lsp.buf.formatting_sync()
        vim.lsp.buf.format({bufnr = bufnr})
      end,
    })
  end
end

null_ls.setup({ sources = sources, on_attach = on_attach })
