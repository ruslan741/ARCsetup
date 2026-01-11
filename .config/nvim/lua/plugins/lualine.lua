local mycustomlualine = require'mycolors.mylualine'

require('lualine').setup ({
	options = { 
		theme  = mycustomlualine,
		ection_separators = '',
		component_separators = ''
	},
})

