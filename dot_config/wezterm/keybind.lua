local wez = require 'wezterm'
local act = wez.action

local module = {}

function module.apply_to_config(config)
    config.disable_default_key_bindings = true
    config.leader = {
        key = 'a',
        mods = 'CTRL',
		timeout_milliseconds = 1000
    }
    config.keys = {
        {
            key = '|',
			mods = 'LEADER|SHIFT',
			action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
		},
		{
            key = '-',
			mods = 'LEADER',
			action = act.SplitVertical { domain = 'CurrentPaneDomain' }
        },
		{
            key = 'f',
			mods = 'CMD|CTRL',
			action = act.ToggleFullScreen,
		},
        {
            key = 't',
            mods = 'CMD',
            action = act.SpawnTab 'DefaultDomain'
        },
        {
            key = 'w',
            mods = 'CMD',
            action = act.CloseCurrentTab { confirm = true }
        },
		{
            key = 'n',
			mods = 'CTRL',
			action = act.ActivateTabRelative(1)
		},
		{
            key = 'b',
			mods = 'CTRL',
			action = act.ActivateTabRelative(-1)
		},
		{
            key = 'v',
			mods = 'CMD',
			action = act.PasteFrom 'Clipboard'
		},
        {
            key = 'a',
            mods = 'LEADER|CTRL',
            action = act.SendKey { key = 'a', mods = 'CTRL' },
        },
	}
    for i = 1, 8 do
      -- CTRL+ALT + number to activate that tab
      table.insert(config.keys, {
        key = tostring(i),
        mods = 'CMD',
        action = act.ActivateTab(i - 1),
      })
      -- F1 through F8 to activate that tab
      table.insert(config.keys, {
        key = 'F' .. tostring(i),
        action = act.ActivateTab(i - 1),
      })
    end
end

return module
