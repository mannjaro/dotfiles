local wezterm = require("wezterm")
local act = wezterm.action
return {
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
      key = "v",
      mods = "CMD",
      action = act.PasteFrom 'Clipboard',
    },
  },
}
