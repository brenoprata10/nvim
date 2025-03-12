return {
	{
		"dense-analysis/ale", 
		lazy = false,
		config = function()
			-- Configuration goes here.
			local g = vim.g

			g.ale_fixers = {
				typescript = {'prettier'},
				typescriptreact = {'prettier'},
				css = {'prettier'}
			}
			g.ale_set_highlights = 0
			g.ale_disable_lsp = 1
			g.ale_use_neovim_diagnostics_api = 1
			g.ale_fix_on_save = 1
		end
	}
}
