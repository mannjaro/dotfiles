return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files() end },
    { "<leader>fg", function() Snacks.picker.grep() end },
    { "<leader>fb", function() Snacks.picker.buffers() end },
    { "gd", function() Snacks.picker.lsp_definitions() end },
    { "gr", function() Snacks.picker.lsp_references() end },
    -- explorer
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    -- buffer ctrl
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
  },
}
