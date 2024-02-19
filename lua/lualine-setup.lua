local colors = {
	blue   = '#80a0ff',
	cyan   = '#79dac8',
	black  = '#000000',
	white  = '#c6c6c6',
	red    = '#ff5189',
	green  = '#5CFF5C',
	grey   = '#303030',
	transparent = '#fff',
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.white, bg = colors.black},
    		b = { fg = colors.white, bg = colors.black},
    		c = { fg = colors.white, bg = colors.transparent},
  	},

  	insert = {
		a = {fg = colors.white, bg = colors.black}
	},
  	visual = {
		a = {fg = colors.cyan, bg = colors.black}
	},
  	replace = {
		a = {fg = colors.white, bg = colors.black}
	},

  	inactive = {
    		a = {fg = colors.white, bg = colors.black},
    		b = {fg = colors.white, bg = colors.black},
    		c = {fg = colors.black, bg = colors.black},
  },
}


require('lualine').setup {
	options = {
    		theme = bubbles_theme,
    		component_separators = '|',
    		section_separators = { left = '', right = '' },
  	},
  	sections = {
    		lualine_a = {
      			{ 'mode', separator = { left = '' }, right_padding = 2 },
    		},
    		lualine_b = { 'filename' },
    		lualine_c = {},
    		lualine_x = {},
    		lualine_y = { 'progress' },
    		lualine_z = {
      			{ 'location', separator = { right = '' }, left_padding = 2 },
    		},
  	},
  	inactive_sections = {
    		lualine_a = { 'filename' },
    		lualine_b = {},
    		lualine_c = {},
    		lualine_x = {},
    		lualine_y = {},
    		lualine_z = { 'location' },
  	},
  	tabline = {},
  	extensions = {},
}

