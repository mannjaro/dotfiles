return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "InsertEnter",
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local nls = require("null-ls")
    nls.setup({
      debounce = 150,
      save_after_format = false,
      sources = {
        nls.builtins.formatting.black.with({
          extra_args = {'--line-length=120'}
        }),
        nls.builtins.formatting.isort,
        nls.builtins.code_actions.gitsigns,
        nls.builtins.formatting.gofmt,
      },
    })
  end,
}
