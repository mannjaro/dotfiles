-- lua/plugins/blink-cmp.lua
return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "super-tab" },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = {
        auto_show = true,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    signature = {
      enabled = true,
    },
  },
}
