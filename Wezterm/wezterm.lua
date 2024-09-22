-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
config.color_scheme = 'Nightfly (Gogh)'

-- my coolnight colorscheme:
config.colors = {
--	foreground = "#CBE0F0",
	background = "#011423",
--	cursor_bg = "#47FF9C",
--	cursor_border = "#47FF9C",
--	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
    ansi = {'#1b1b1b','#a40000','#228b22','#9fa91f','#0077C4','#8601af','#2f847c','#a9a9a9',},
    brights = {'#d3d3d3','#ed1c24','#00ff00','#fff600','#0FC5ED','fuchsia','aqua','#ffffff',},
}

config.font = wezterm.font("FiraMono Nerd Font Mono Medium", {weight = 'Bold', italic = flase})
config.font_size = 13
config.line_height = 1.05
config.adjust_window_size_when_changing_font_size = true
config.hide_mouse_cursor_when_typing= true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations="RESIZE"
config.window_background_opacity = 0.85
config.window_close_confirmation = 'NeverPrompt'
config.prefer_to_spawn_tabs = true
config.show_tab_index_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.scrollback_lines = 3000

inactive_pane_hsb = {
    saturation = 0.1,
    brightness = 0.3,
}

config.keys = {
    {
        key = 'RightArrow',
        mods = 'CTRL',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'UpArrow',
        mods = 'CTRL',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    { 
        key = 'DownArrow',
        mods = 'SHIFT',
        action = act.ActivatePaneDirection 'Down',
    },
    { 
        key = 'UpArrow',
        mods = 'SHIFT',
        action = act.ActivatePaneDirection 'Up', 
    },
    {
        key = 'Enter',
        mods = 'CTRL',
        action = act.ActivateCopyMode,
    },
    {
        key = '+',
        mods = 'CTRL',
        action = act.IncreaseFontSize,
    },
    {
        key = '-',
        mods = 'CTRL',
        action = act.DecreaseFontSize,
    },
    {
        key = '0',
        mods = 'CTRL',
        action = act.ResetFontSize,
    },
    { 
        key = 'C',
        mods = 'SHIFT|CTRL',
        action = act.CopyTo 'Clipboard',
    },
    { 
        key = 'v',
        mods = 'CMD',
        action = act.PasteFrom 'Clipboard',
    },
    { 
        key = 't',
        mods = 'CTRL',
        action = act.SpawnTab 'CurrentPaneDomain',
    }
}

-- and finally, return the configuration to wezterm
return config