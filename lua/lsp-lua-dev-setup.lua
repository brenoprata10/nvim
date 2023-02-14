local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local attach_common = require("attach-common")

require("neodev").setup()

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
			completion = {enable = true, callSnippet = "Both"},
			diagnostics = {
				enable = true,
				globals = {'vim', 'describe'},
				disable = {"lowercase-global"}
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
					[vim.fn.expand('/usr/share/awesome/lib')] = true
				},
				-- adjust these two values if your performance is not optimal
				maxPreload = 2000,
				preloadFileSize = 1000
			}
		}
	},
    	on_attach = function(client, bufnr)
		attach_common.setup(client, bufnr)
    	end
})
