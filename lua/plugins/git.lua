return {
	{
		"lewis6991/gitsigns.nvim", 
		lazy = false,
		keys = {
			{ "gpg", "<cmd>Gitsigns preview_hunk<cr>", desc = "Show modified hunk" },
		},
		config = function()
			require('gitsigns').setup()
		end,
	}
}
