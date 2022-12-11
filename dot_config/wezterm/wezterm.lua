local wezterm = require 'wezterm'
local act = wezterm.action

wezterm.on('update-right-status', function(window, pane)
  local date = wezterm.strftime '%a %H:%M'
  local bat = ''
  for _, b in ipairs(wezterm.battery_info()) do
    bat = string.format('%.0f%%', b.state_of_charge * 100)
  end

  window:set_right_status(wezterm.format {
    { Text = " " .. date .. ' - ' .. bat .. " " },
  })
end)


-- wezterm.on(
--   'format-tab-title',
--   function(tab, tabs, panes, config, hover, max_width)
--     local edge_background = '#0b0022'
--     local background = '#1b1032'
--     local foreground = '#808080'

--     if tab.is_active then
--       background = '#5b5052'
--       foreground = '#c0c0c0'
--     elseif hover then
--       background = '#3b3052'
--       foreground = '#909090'
--     end

--     local edge_foreground = background

--     -- ensure that the titles fit in the available space,
--     -- and that we have room for the edges.
--     local title = tab.active_pane.title

--     return {
--       { Background = { Color = edge_background } },
--       { Foreground = { Color = edge_foreground } },
--       { Background = { Color = background } },
--       { Foreground = { Color = foreground } },
--       { Text = title },
--       { Background = { Color = edge_background } },
--       { Foreground = { Color = edge_foreground } },
--     }
--   end
-- )

return {
  -- fonts
  font_size = 13,
  font = wezterm.font_with_fallback {
    "UDEV Gothic 35NF",
    "Cica",
    "Consolas",
  },
  window_padding = {
    left = '2cell',
    right = '2cell',
    top = '1cell',
    bottom = '1cell',
  },
  -- appearance
  color_scheme = "duskfox",
  initial_cols = 180,
  initial_rows = 55,
  inactive_pane_hsb = {
		saturation = 0.5,
		brightness = 0.5,
	},
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
      action = act.SendString "code $HOME/.config/wezterm/wezterm.lua \x0D",
    },
    {
      key = "w",
      mods = "CMD",
      action = act.CloseCurrentPane{confirm=true},
    },
    {
      key = 'f',
      mods = 'CMD|CTRL',
      action = wezterm.action.ToggleFullScreen,
    },
  },
}
