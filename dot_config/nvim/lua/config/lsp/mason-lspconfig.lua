require("mason-lspconfig").setup({
    ensure_installed = { "rust_analyzer" }
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
  -- -- Function executed when the LSP server startup
  -- on_attach = function(client, bufnr)
  --   local opts = { noremap=true, silent=true }
  --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
  -- end,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, bufopts)
  end,
}
  require('lspconfig')[server].setup(opt)
end})

-- pyright conf
-- https://github.com/neovim/nvim-lspconfig/issues/500

local function get_python_path(workspace)
  -- Use activated virtualenv.
  local util = require('lspconfig/util')
  local path = util.path
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv from poetry in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
    return path.join(venv, 'bin', 'python')
  end

  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end
require'lspconfig'.pyright.setup {
 capabilities = capabilities,
 on_attach = function(client, bufnr)
   local bufopts = { noremap=true, silent=true, buffer=bufnr }
   vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
   vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, bufopts)
   vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, bufopts)
 end,
 on_init = function(client)
   client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
 end
}

