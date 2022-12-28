local wezterm = require 'wezterm'
local act = wezterm.action

require("config/right-status").setup()
require('config/tab-title').setup()

return {
  colors = {
    tab_bar = {
      background = "#14141D"
    },
  },
  -- fonts
  font_size = 13,
  font = wezterm.font_with_fallback {
    "UDEV Gothic 35NF",
    "Cica",
    "Consolas",
  },
  -- window
  window_padding = {
    left = '2cell',
    right = '2cell',
    top = '1cell',
    bottom = '1cell',
  },
  initial_cols = 180,
  initial_rows = 55,

  inactive_pane_hsb = {
		saturation = 0.5,
		brightness = 0.5,
	},

  window_decorations = "RESIZE",
  -- appearance
  tab_max_width = 60,
  color_scheme = 'tokyonight',
  native_macos_fullscreen_mode = true,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  -- scrollback
  scrollback_lines = 3500,
  -- Fucntions
  --- Split pane like tmux
  leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    {
      key = "e",
      mods = "LEADER",
      action = act.SendString "code . \x0D",
    },
    {
      key = '|',
      mods = 'LEADER|SHIFT',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '-',
      mods = 'LEADER',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'w',
      mods = 'CMD',
      action = act.CloseCurrentPane { confirm = true },
    },
    {
      key = 'LeftArrow',
      mods = 'ALT',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'RightArrow',
      mods = 'ALT',
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = 'UpArrow',
      mods = 'ALT',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = "DownArrow",
      mods = 'ALT',
      action = act.ActivatePaneDirection 'Down',
    },
    -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    {
      key = 'a',
      mods = 'LEADER|CTRL',
      action = act.SendString '\x01',
    },
    -- Open wezterm.lua with code
    {
      key = ",",
      mods = "CMD",
      action = act.SendString "nvim $HOME/.config/wezterm/wezterm.lua \x0D",
    },
    {
      key = "w",
      mods = "CMD",
      action = act.CloseCurrentPane{confirm=true},
    },
    {
      key = 'f',
      mods = 'CMD|CTRL',
      action = act.ToggleFullScreen,
    },
    {
      key = 'v',
      mods = 'CMD',
      action = act.Paste,
    }
  },
}
