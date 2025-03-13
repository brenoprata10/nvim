return {
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {
			enable_tailwind = true,
			render = 'virtual',
			exclude_buffer = function(bufnr)
				return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 1000000 
			end,
			custom_colors = {
				{label = '%-%-theme%-background%-color', color = '#23222f'},
			}
		}
	}
}
