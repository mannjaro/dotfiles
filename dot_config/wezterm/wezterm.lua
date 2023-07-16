local wezterm = require 'wezterm'

local keybind = require 'keybind'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'nightfox'
config.tab_bar_at_bottom = true
config.window_decorations = 'RESIZE'
config.use_ime = false 
config.use_fancy_tab_bar = false
config.tab_max_width = 50

config.font = wezterm.font 'UDEV Gothic 35NF'
config.font_size = 14.0

config.initial_cols = 140
config.initial_rows = 48
config.audible_bell = 'Disabled'


keybind.apply_to_config(config)

return config
