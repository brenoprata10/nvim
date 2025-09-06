local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local attach_common = require("attach-common")

lsp.rust_analyzer.setup({
	capabilities = capabilities,
	settings = {
		['rust-analyzer'] = {
			checkOnSave = {
				command = 'clippy', -- Optional: run clippy on save
			},
		},
	},
	on_attach = function(client, bufnr)
		-- Format on save using LSP
		vim.api.nvim_create_autocmd('BufWritePre', {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
		attach_common.setup(client, bufnr)
	end
})
