local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local attach_common = require("lua.attach-common")

-- This will be the path towards your sumneko folder. This is subjective
local sumneko_root_path = os.getenv("HOME") ..
                              "/Documents/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local luadev = require("lua-dev").setup({
	lspconfig = {
	    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
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
}
})

lspconfig.sumneko_lua.setup(luadev)
