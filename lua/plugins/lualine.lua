return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup({
				sections = {
					lualine_a = {
						{ 'mode', right_padding = 2 },
					},
					lualine_b = { 'filename', 'branch' },
					lualine_c = { 'fileformat' },
					lualine_x = {},
					lualine_y = { 'filetype', 'progress' },
					lualine_z = {
						{ 'location', left_padding = 2 },
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

			})
		end
	}
}
