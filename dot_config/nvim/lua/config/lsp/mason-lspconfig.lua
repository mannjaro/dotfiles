require("mason-lspconfig").setup({
    ensure_installed = { "rust_analyzer" }
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
  -- -- Function executed when the LSP server startup
  -- on_attach = function(client, bufnr)
  --   local opts = { noremap=true, silent=true }
  --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
  -- end,
  capabilities = capabilities,
}
  require('lspconfig')[server].setup(opt)
end})

-- pyright conf
-- https://github.com/neovim/nvim-lspconfig/issues/500
local util = require('lspconfig/util')
local path = util.path
local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv from pipenv in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
    return path.join(venv, 'bin', 'python')
  end

  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end
require'lspconfig'.pyright.setup {
--    on_attach = function()
--        require'lsp_signature'.on_attach {
--            hint_enable = false,
--        }
--    end,
  on_init = function(client)
    client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
  end
}

