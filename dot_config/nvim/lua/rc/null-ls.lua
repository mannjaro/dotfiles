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
}

local on_attach = function()
  -- format on save any file
  vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = "*",
    callback = function() vim.lsp.buf.format { async = true } end
  })
end

null_ls.setup({ sources = sources, on_attach = on_attach })
