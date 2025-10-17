return {
	{
		"williamboman/mason.nvim",
		opts = {}
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			automatic_enable = false,
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"eslint",
				"cssls",
				"tailwindcss@0.0.16",
				"rust_analyzer",
				"denols"
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
			floating_window = false,
			hint_prefix = {
				above = "↙ ",  -- when the hint is on the line above the current line
				current = "← ",  -- when the hint is on the same line
				below = "↖ "  -- when the hint is on the line below the current line
			}
		}
	}
}
