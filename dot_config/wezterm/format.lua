local wezterm = require("wezterm")

local function BaseName(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on("format-window-title", function(tab)
  return BaseName(tab.active_pane.foreground_process_name)
end)

local HEADER = '' -- 文字化けしちゃってるかもしれませんが、アイコンフォント入ってます。

local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

local SYMBOL_COLOR = { '#ffb2cc', '#a4a4a4' }
local FONT_COLOR = { '#dddddd', '#888888' }
-- local ARROW_COLOR = {"#1a7", "#246"}
local BACK_COLOR = '#2d2d2d'
local HOVER_COLOR = '#434343'

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local index = tab.is_active and 1 or 2

  local bg = hover and HOVER_COLOR or BACK_COLOR
  local zoomed = tab.active_pane.is_zoomed and '🔎 ' or ' '

  return {
    -- { Foreground = { Color = ARROW_COLOR[2]} },
    -- { Background = { Color = ARROW_COLOR[index]} },
    -- { Text = SOLID_RIGHT_ARROW .. " " },

    { Foreground = { Color = SYMBOL_COLOR[index] } },
    { Background = { Color = BACK_COLOR } },
    { Text = HEADER .. zoomed .. "  " },

    { Foreground = { Color = FONT_COLOR[index] } },
    { Background = { Color = BACK_COLOR } },
    { Text = BaseName(tab.active_pane.title) .. " " },
    
    -- { Foreground = { Color = ARROW_COLOR[index]} },
    -- { Background = { Color = ARROW_COLOR[2]} },
    -- { Text = SOLID_RIGHT_ARROW },
  }
end)

return {}
