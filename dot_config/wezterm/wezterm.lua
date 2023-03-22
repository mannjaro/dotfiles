local wezterm = require("wezterm")

local keybind = require("keybind")
require("format")
require("status")

return {
  color_scheme = "Catppuccin Mocha",
  use_fancy_tab_bar = true,
  -- disable_default_key_bindings = true,
  font_size = 13.0,
  window_decorations = 'RESIZE',
  font = wezterm.font("UDEV Gothic 35NF"),
  initial_cols = 180,
  initial_rows = 55,
  tab_max_width = 60,
  native_macos_fullscreen_mode = true,
  leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = keybind.keys,
  status_update_interval = 1000,
}
