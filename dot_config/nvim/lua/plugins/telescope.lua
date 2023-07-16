return {
  {
    'nvim-telescope/telescope.nvim', 
    -- tag = '0.1.0',
    -- cmd = "Telescope",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
      },
    },
    config = function()
      require("telescope").setup{
        defaults = {
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          layout_strategy = "horizontal",
          sorting_strategy = 'ascending',
          layout_config = { prompt_position = "top" },
          set_env = { ["COLORTERM"] = "truecolor" },
          file_ignore_patterns = {
            "node_modules/*",
            ".venv/*",
          },
          mappings = {
            i = {
              ['<esc>'] = require("telescope.actions").close
            }
          }
        }
      }
    end,
  }
}
