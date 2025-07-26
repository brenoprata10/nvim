local attach_common = require("attach-common")

return {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
    opts = {
	    lsp = {
		    on_attach = function(client, bufnr)
			    attach_common.setup(client, bufnr)
		    end

	    }
    }
}
