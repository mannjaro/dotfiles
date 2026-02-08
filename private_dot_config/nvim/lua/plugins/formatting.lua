return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
      lua = { "stylua" },
    },
    -- 保存時に自動フォーマット（VSCodeのFormat on Save相当）
    format_on_save = {
      timeout_ms = 3000,
      lsp_format = "fallback", -- フォーマッターがなければLSPで整形
    },
  },
}
