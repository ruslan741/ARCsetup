local colors_path = vim.fn.expand("~/config/colors")
package.path = package.path .. ";" .. colors_path .. "/?.lua"

-- Загружаем цвета
local colors = require("colors")

local c = colors

return {
	normal = {
		a = {bg = c.blue, fg = c.bg_20, gui = 'bold'},
		b = {bg = c.blue, fg = c.bg_20},
		c = {bg = c.blue, fg = c.bg_20}
	},
	insert = {
		a = {bg = c.green, fg = c.bg_20, gui = 'bold'},
		b = {bg = c.green, fg = c.bg_20},
		c = {bg = c.green, fg = c.bg_20},
	},
	visual = {
		a = {bg = c.yellow, fg = c.bg_20, gui = 'bold'},
		b = {bg = c.yellow, fg = c.bg_20},
		c = {bg = c.yellow, fg = c.bg_20},
	},
	replace = {
		a = {bg = colors.red, fg = colors.black, gui = 'bold'},
		b = {bg = colors.lightgray, fg = colors.white},
		c = {bg = colors.black, fg = colors.white}
	},
	command = {
		a = {bg = c.purple, fg = c.bg_20, gui = 'bold'},
		b = {bg = c.purple, fg = c.bg_20},
		c = {bg = c.purple, fg = c.bg_20},
	},
	inactive = {
		a = {bg = c.gray_30, fg = colors.gray_20, gui = 'bold'},
		b = {bg = c.gray_30, fg = colors.gray_20},
		c = {bg = c.gray_30, fg = colors.gray_20}
	}
}
