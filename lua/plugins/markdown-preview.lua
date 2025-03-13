return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		dependencies = {"echasnovski/mini.nvim"},
		opts = {
			preview = {
				filetypes = { "markdown", "codecompanion", "Avante" },
				ignore_buftypes = {},
			},
			display = {
				diff = {
					enabled = true,
					layout = "vertical", -- vertical|horizontal split for default provider
					opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
					provider = "mini_diff", -- default|mini_diff
				},
			}
		}
	}
}
