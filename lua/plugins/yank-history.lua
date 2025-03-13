return {
	{
		"svermeulen/vim-yoink",
		config = function()
			vim.api.nvim_set_keymap("n", "<C-a>", "<plug>(YoinkPostPasteSwapBack)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<C-s>", "<plug>(YoinkPostPasteSwapForward)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "p", "<plug>(YoinkPaste_p)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "P", "<plug>(YoinkPaste_P)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "gp", "<plug>(YoinkPaste_gp)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "gP", "<plug>(YoinkPaste_gP)", { noremap = true, silent = true })
		end
	}
}
