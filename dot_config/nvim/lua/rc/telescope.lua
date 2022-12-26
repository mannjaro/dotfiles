local action_layout = require('telescope.actions.layout')
local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    sorting_strategy = 'ascending',
    file_ignore_patterns = { 
      "node_modules/*",
      ".venv/*",
      ".mypy_cache/*",
      "__pycache__/*",
      "debug/*",
      "*.dll",
      "*.rs.bk",
      "*.png",
      "*.jpg",
    },
    -- file_sorter = require("telescope.sorters").get_fuzzy_file,
    -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    set_env = { ["COLORTERM"] = "truecolor" },
    dynamic_preview_title = true,
    border = {},
		borderchars = {
			{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			-- prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
			-- results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
			-- preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
			-- fzf-preview style
			prompt = { "─", "│", " ", "│", "┌", "┬", "│", "│" },
			results = { "─", "│", "─", "│", "├", "┤", "┴", "└" },
			preview = { "─", "│", "─", " ", "─", "┐", "┘", "─" },
		},
    path_display = { "truncate" },
    layout_strategy = 'flex',
    layout_config = {
      width = 0.8,
      horizontal = {
        mirror = false,
        prompt_position = 'top',
        preview_cutoff = 120,
        preview_width = 0.5,
      },
      vertical = {
        mirror = false,
        prompt_position = 'top',
        preview_cutoff = 120,
        preview_width = 0.5,
      },
    },
    mappings = {
      n = {
        ['<esc>'] = actions.close,
        ["<C-t>"] = action_layout.toggle_preview,
      },
      i = {
        ["<esc>"] = actions.close,
        ["<C-t>"] = action_layout.toggle_preview,
--        ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
      },
    },
  },
  -- extensions = {
  --   frecency = {
  --     ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
  --     db_safe_mode = false,
  --     auto_validate = true,
  --   }
  -- },
})



