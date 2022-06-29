local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.eslint.with({
			only_local = "node_modules/.bin",
		}),
		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.formatting.prettier
	},
});
