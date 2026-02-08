return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      diagnostics = "nvim_lsp", -- バッファタブにエラー数を表示
      offsets = {
        { filetype = "snacks_layout_box", text = "Explorer", highlight = "Directory" },
      },
    },
  },
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "前のタブへ" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "次のタブへ" },
    { "<leader>bd", "<cmd>bdelete<cr>", desc = "タブを閉じる" },
  },
}
