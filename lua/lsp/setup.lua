require('nvim-cmp-setup')
require('mason').setup {}
require('mason-lspconfig').setup {
	ensure_installed = { "lua_ls", "tsserver", "eslint", "cssls", "tailwindcss", "rust_analyzer"}
}

-- Setup LSPs
require('lsp.tsserver')
require('lsp.eslint')
require('lsp.cssls')
require('lsp.lua')
require('lsp.tailwindcss')
require('lsp.rust')
