local wezterm = require "wezterm"
local config = wezterm.config_builder()

local config = {}
local act = wezterm.action

local home_dir = wezterm.home_dir or os.getenv("HOME")

local colors_path = home_dir .. "/.config/config/colors/colors.lua"

local colors = dofile(colors_path)  

config.colors = {
	foreground = colors.fg,
	background = colors.bg_10,
	cursor_bg = colors.green,
	cursor_border = colors.yellow,
	cursor_fg = colors.bg_20,
	selection_bg = colors.red,
	selection_fg = colors.bg_20,

	tab_bar = {
		background = 'none',

	active_tab = {
		bg_color = '#1FFF76',
		fg_color = '#010103',
		intensity = 'Normal',
		underline = 'None',
		italic = true,
		strikethrough = false,
	},

	inactive_tab = {
		bg_color = 'none',
		fg_color = '#A4A5AA',
	},

	inactive_tab_hover = {
		bg_color = 'none',
		fg_color = 'F9EEDF',
	},

	new_tab = {
		bg_color = 'none',
		fg_color = '#A4A5AA',
	},

	new_tab_hover = {
		bg_color = 'none',
		fg_color = '#FFD205',
	},

	},

	ansi = {
		"#4B505C",
		"#F60010",
		"#FFD205",
		"#1FFF76",
		"#A4A5AA",
		"#FF3CBF",
		"#5FFFFF",
		"#4B505C",
	},
	brights = {
		"#4B505C",
		"#F60010",
		"#FFD205",
		"#1FFF76",
		"#A4A5AA",
		"#FF3CBF",
		"#5FFFFF",
		"#F9EEDF",
	},		
}

--бинды

config.keys = {
	{
		key = 'h',
		mods = 'SUPER|SHIFT',
		action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
	},
	{
		key = 'v',
		mods = 'SUPER|SHIFT',
		action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
	},
	{
		key = 'f',
		mods = 'ALT',
		action = wezterm.action.ToggleFullScreen,
	},
	{
                key = 't',
                mods = 'CTRL|SHIFT',
                action = act.SpawnTab 'CurrentPaneDomain',
        },
	{
		key = 'w',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.CloseCurrentPane { confirm = true },
	},
}

-- Font configuration
config.font = wezterm.font_with_fallback({
  		{family='JetBrainsMono NF', weight='Regular'},
	})  
config.font_size = 12
config.line_height = 1.3
config.window_frame = {
	font = wezterm.font
	{family='JetBrainsMono NF', weight='Regular', style='Italic'},
	font_size = 12.0
}

-- Performance settings
config.window_background_opacity = 0.96
-- config.window_background_opacity = 1.00
config.kde_window_background_blur = true
config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.max_fps = 120
config.animation_fps = 60
config.tab_bar_at_bottom = true
config.tab_max_width = 16
config.term = "xterm-256color"
config.warn_about_missing_glyphs = false
config.disable_default_key_bindings = false

return config
