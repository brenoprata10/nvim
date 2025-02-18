require('nvim-cmp-setup')
require('mason').setup {}
require('mason-lspconfig').setup {
	ensure_installed = { "lua_ls", "ts_ls", "eslint", "cssls", "tailwindcss@0.0.16", "rust_analyzer"}
}

-- Setup LSPs
require('lsp.tsserver')
require('lsp.eslint')
require('lsp.cssls')
require('lsp.lua')
require('lsp.tailwindcss')
require('lsp.rust')
require('lsp.go')
