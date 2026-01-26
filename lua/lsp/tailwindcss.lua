vim.lsp.config('tailwindcss', {
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					"tailwind\\('([^)]*)\\')", "'([^']*)'"
				},
			},
		},
	},
})

vim.lsp.enable('tailwindcss')
