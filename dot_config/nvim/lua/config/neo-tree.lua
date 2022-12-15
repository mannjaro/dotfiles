vim.g.neo_tree_remove_legacy_commands = 1
require('neo-tree').setup({
  close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1,
      with_marker = '│',
      last_indent_marker = '└',
      highlight = "NeoTreeIndentMarker",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
    },
    git_status = {
      highlight = "NeoTreeDimText",
    }
  }, 
  event_handlers = {
    {
      -- auto close when open file
      event = "file_opened",
      handler = function(filepath)
        require('neo-tree').close_all()
      end,
    },
  },
  filesystem = {
    filterd_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      --hide_hidden = false, -- only works Windows
      hide_by_name = {
        '.DS_Store',
        'thumbs.db',
      },
    },
    window = {
      position = 'left',
      width = 40,
      mappings = {
        ["<2-LeftMouse>"] = "open",
        ["<esc>"] = "close_window"
      },
    },
  },
  buffers = {
    show_unloaded = true,
    window = {
      position = 'left',
      mappings = {
        ["<2-LeftMouse>"] = "open",
      },
    },
  },
})

