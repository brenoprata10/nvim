-- Setup LSPs

local cwd = vim.fn.getcwd()
if string.match(cwd,'road%-62') then
	require('lsp.deno')
else
	require('lsp.tsserver')
	require('lsp.eslint')
end

require('lsp.cssls')
require('lsp.lua')
require('lsp.tailwindcss')
require('lsp.rust')
require('lsp.go')
