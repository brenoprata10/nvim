return {
	{
		"brenoprata10/sniprun",
		branch = "master",
		build = "sh install.sh",
		config = function()
			require("sniprun").setup({
				interpreter_options = {
					TypeScript_original = {
						compiler = 'node'
					}
				}
			})
		end,
	}
}
