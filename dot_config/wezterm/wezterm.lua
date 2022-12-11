local wezterm = require 'wezterm'
local act = wezterm.action

wezterm.on('update-right-status', function(window, pane)
  -- Each element holds the text for a cell in a "powerline" style << fade
  local cells = {}

  -- I like my date/time in this style: "Mar 3 08:14"
  local date = wezterm.nerdfonts.oct_clock .. '  ' .. wezterm.strftime '%b %-d %H:%M'
  table.insert(cells, date)
  
  -- An entry for each battery (typically 0 or 1 battery)
  for _, b in ipairs(wezterm.battery_info()) do
    table.insert(cells, string.format( wezterm.nerdfonts.mdi_battery .. ' ' .. '%.0f%%', b.state_of_charge * 100))
  end

  -- Color palette for the backgrounds of each cell
  local colors = {
    '#3c1361',
    '#52307c',
    '#663a82',
    '#7c5295',
    '#b491c8',
  }

  -- Foreground color for the text across the fade
  local text_fg = '#fff'

  -- The elements to be formatted
  local elements = {}
  -- How many cells have been formatted
  local num_cells = 0

  -- Translate a cell into elements
  function push(text, is_last)
    local cell_no = num_cells + 1
    table.insert(elements, { Foreground = { Color = text_fg } })
    table.insert(elements, { Background = { Color = colors[cell_no] } })
    table.insert(elements, { Text = ' ' .. text .. ' ' })
    if not is_last then
      table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
    end
    num_cells = num_cells + 1
  end

  while #cells > 0 do
    local cell = table.remove(cells, 1)
    push(cell, #cells == 0)
  end

  window:set_right_status(wezterm.format(elements))
end)


return {
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = false,
  switch_to_last_active_tab_when_closing_tab = true,
	enable_tab_bar = true,
	tab_max_width = 32,
  show_tab_index_in_tab_bar = false,

  -- window_background_image = '/Users/t-zukawa/Pictures/vim_cheat.png',
  -- window_background_image_hsb = {
  --   -- Darken the background image by reducing it to 1/3rd
  --   brightness = 0.1,

  --   -- -- You can adjust the hue by scaling its value.
  --   -- -- a multiplier of 1.0 leaves the value unchanged.
  --   -- hue = 1.0,

  --   -- -- You can adjust the saturation also.
  --   -- saturation = 1.0,
  -- },
  -- -- fonts
  font_size = 13,
  font = wezterm.font_with_fallback {
    "UDEV Gothic 35NF",
    "Cica",
    "Consolas",
  },
  -- appearance
  color_scheme = "duskfox",
  initial_cols = 190,
  initial_rows = 55,
  inactive_pane_hsb = {
		saturation = 0.5,
		brightness = 0.5,
	},
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  native_macos_fullscreen_mode = true,
  -- scrollback
  scrollback_lines = 3500,
  -- multiplexing
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
      action = act.SendString "code $HOME/.config/wezterm/wezterm.lua \x0D",
    },
    {
      key = "w",
      mods = "CMD",
      action = act.CloseCurrentPane{confirm=true},
    },
    {
      key = 'f',
      mods = 'CTRL|CMD',
      action = wezterm.action.ToggleFullScreen,
    },
  },
}
