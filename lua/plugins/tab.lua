return {
	{
		{
			'romgrk/barbar.nvim',
			dependencies = {
				'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
				'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
			},
			lazy = false,
			init = function() vim.g.barbar_auto_setup = false end,
			keys = {
				{"gt", "<cmd>BufferNext<cr>", desc = "Next Buffer"},
				{"gT", "<cmd>BufferPrevious<cr>", desc = "Previous Buffer"},
				{"gc", "<cmd>BufferDelete<cr>", desc = "Delete Buffer"},
				{'<C-1>', '<Cmd>BufferGoto 1<CR>'},
				{'<C-2>', '<Cmd>BufferGoto 2<CR>'},
				{'<C-3>', '<Cmd>BufferGoto 3<CR>'},
				{'<C-4>', '<Cmd>BufferGoto 4<CR>'},
				{'<C-5>', '<Cmd>BufferGoto 5<CR>'},
				{'<C-6>', '<Cmd>BufferGoto 6<CR>'},
				{'<C-7>', '<Cmd>BufferGoto 7<CR>'},
				{'<C-8>', '<Cmd>BufferGoto 8<CR>'},
				{'<C-9>', '<Cmd>BufferGoto 9<CR>'},
			},
			opts = {
				icons = {
					-- Configure the base icons on the bufferline.
					-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
					buffer_index = true
				}
			},
		},
	}
}
