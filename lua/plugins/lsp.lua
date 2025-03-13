return {
	{
		"williamboman/mason.nvim",
		opts = {}
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { 
				"lua_ls", 
				"ts_ls", 
				"eslint", 
				"cssls", 
				"tailwindcss@0.0.16",
				"rust_analyzer"
			}
		}
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"jose-elias-alvarez/nvim-lsp-ts-utils"
	},
	{
		"ray-x/lsp_signature.nvim",
		opts = {
			hint_enable = false
		}
	}
}
