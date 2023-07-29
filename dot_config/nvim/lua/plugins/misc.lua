return {
  { "rhysd/committia.vim" },
  { "EdenEast/nightfox.nvim" },
  {
    "unblevable/quick-scope",
    event = "BufReadPre",
  },
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
  },
  {
    "voldikss/vim-floaterm",
    keys = {
      { "<C-t>", "<cmd>FloatermToggle<cr>" }
    },
    config = function()
      vim.keymap.set("t", "<C-t>", "<cmd>FloatermToggle<cr>")
    end,
  }
}
