return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    {
      "williamboman/mason.nvim",
      config = true,
    },
   "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local keymap = vim.keymap
    local opts = { noremap=true, silent=true }
    keymap.set( "n", "<space>e", vim.diagnostic.open_float, opts)
    keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    local on_attach = function(client, bufnr)
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require('lspconfig')
    require('mason-lspconfig').setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end,
    }
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
    lspconfig['pyright'].setup{
      on_attach = on_attach,
      on_init = function(client)
        client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
      end,
      capabilities = capabilities,
    }
  end,
}
