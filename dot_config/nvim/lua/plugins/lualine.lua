return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = {
      "kyazdani42/nvim-web-devicons"
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = ''},
        always_divide_middle = true,
        colored = false,
        sections = {
          lualine_c = {
            "filename",
            path = 1,
            file_status = true,
            symbols = {
              modified = "[+]",
              readonly = "RO",
              unnamed = "untitled",
            },
          },
        }
      },
    }
  },
}
