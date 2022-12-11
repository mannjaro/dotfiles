local action_layout = require('telescope.actions.layout')
local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    sorting_strategy = 'ascending',
    file_ignore_patterns = { "node_modules/*" },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
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
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
