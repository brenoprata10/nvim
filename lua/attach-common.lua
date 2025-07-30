local M = {}

function M.buf_map(bufnr, mode, lhs, rhs, opts)
	vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
		silent = true,
	})
end

function M.setup(client, bufnr)
	vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
	vim.cmd("command! LspDefTab tab split | lua vim.lsp.buf.definition()")
	vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
	vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
	vim.cmd("command! OpenFloatDiag lua vim.diagnostic.open_float()")
	M.buf_map(bufnr, "n", "gd", ":LspDef<CR>")
	M.buf_map(bufnr, "n", "gD", ":LspDefTab<CR>")
	M.buf_map(bufnr, "n", "gi", ":LspRename<CR>")
	M.buf_map(bufnr, "n", "<C-k>", ":LspHover<CR>")
	M.buf_map(bufnr, "n", "tf", ":OpenFloatDiag<CR>")
	client.server_capabilities.document_formatting = false
	client.server_capabilities.document_range_formatting = false
end

return M
