return {
	{
		"brenoprata10/sniprun",
		branch = "master",
		build = "sh install.sh",
		config = function()
			vim.api.nvim_set_keymap('v', '<leader>r', '<Plug>SnipRun', {silent = true})
			require("sniprun").setup({
				interpreter_options = {
					TypeScript_original = {
						compiler = 'node'
					}
				},
			})
		end,
	}
}
