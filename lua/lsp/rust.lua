local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local attach_common = require("attach-common")

lsp.rust_analyzer.setup({
	capabilities = capabilities,
    	on_attach = function(client, bufnr)
		attach_common.setup(client, bufnr)
    	end
})
