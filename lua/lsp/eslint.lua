local lsp = require "lspconfig"
local client_capabilities = vim.lsp.protocol.make_client_capabilities()

lsp.eslint.setup({
	capabilities = client_capabilities,
	flags = { debounce_text_changes = 500 },
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = true
		if client.server_capabilities.documentFormattingProvider then
      			local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
      			vim.api.nvim_create_autocmd("BufWritePre", {
        			pattern = "*",
        			group = au_lsp,
				callback = function ()
				end
      			})
    		end
  	end,
})
