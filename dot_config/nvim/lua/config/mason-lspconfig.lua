require("mason-lspconfig").setup({
  ensure_installed = {
    'cssls',
    'clangd',
    'dockerls',
    'html',
    'jsonls',
    'ltex',
    'rust_analyzer',
    'yamlls',
  }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('mason-lspconfig').setup_handlers {
  function (server_name)
    require('lspconfig')[server_name].setup{
      capabilities = capabilities
    }
  end,
   
--  ['rust_analyzer'] = function()
--    require('rust-tools').setup{}
--  end,
}
