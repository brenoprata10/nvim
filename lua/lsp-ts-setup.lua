local lsp = require "lspconfig"
local coq = require "coq"
local lsp_ts_utils = require("nvim-lsp-ts-utils")

local buf_map = function(bufnr, mode, lhs, rhs, opts)
	vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
		silent = true,
	})
end

local on_attach = function(client, bufnr)
	vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
	vim.cmd("command! LspDefTab tab split | lua vim.lsp.buf.definition()")
	vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
	vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
	vim.cmd("command! GoToPreview lua require('goto-preview').goto_preview_definition()")
	vim.cmd("command! GoToPreviewImpl lua require('goto-preview').goto_preview_implementation()")
	vim.cmd("command! CloseGoToPreview lua require('goto-preview').close_all_win()")
	buf_map(bufnr, "n", "gd", ":LspDef<CR>")
	buf_map(bufnr, "n", "gD", ":LspDefTab<CR>")
	buf_map(bufnr, "n", "gi", ":LspRename<CR>")
	buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
	buf_map(bufnr, "n", "<C-k>", ":LspHover<CR>")
	buf_map(bufnr, "n", "gpd", ":GoToPreview<CR>")
	buf_map(bufnr, "n", "gpi", ":GoToPreviewImpl<CR>")
	buf_map(bufnr, "n", "gpc", ":CloseGoToPreview<CR>")
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
end


lsp.tsserver.setup(coq.lsp_ensure_capabilities({
	init_options = lsp_ts_utils.init_options,
	on_attach = function(client, bufnr)
		lsp_ts_utils.setup({
			debug = false,
			disable_commands = false,
			enable_import_on_completion = true,
			-- import all
			import_all_timeout = 5000, -- ms
			-- lower numbers = higher priority
			import_all_priorities = {
				same_file = 1, -- add to existing import statement
				local_files = 2, -- git files or files with relative path markers
				buffer_content = 3, -- loaded buffer content
				buffers = 4, -- loaded buffer names
			},
			import_all_scan_buffers = 100,
			import_all_select_source = false,
			always_organize_imports = false,
			-- filter diagnostics
			filter_out_diagnostics_by_severity = {},
			filter_out_diagnostics_by_code = {},
			-- inlay hints
			auto_inlay_hints = true,
			inlay_hints_highlight = "Comment",
			inlay_hints_priority = 200, -- priority of the hint extmarks
			inlay_hints_throttle = 300, -- throttle the inlay hint request
			inlay_hints_format = { -- format options for individual hint kind
				Type = { highlight = nil, text = nil },
				Parameter = { highlight = nil, text = nil },
				Enum = { highlight = nil, text = nil },
			},
			update_imports_on_move = false,
			require_confirmation_on_move = false,
			watch_dir = nil,
		})
		-- required to fix code action ranges and filter diagnostics
		lsp_ts_utils.setup_client(client)
		-- no default maps, so you may want to define some here
		local opts = { silent = true }
	
		buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
		buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
		on_attach(client, bufnr)
	end
}))

local capabilities = vim.lsp.protocol.make_client_capabilities()

lsp.eslint.setup({
  capabilities = capabilities,
  flags = { debounce_text_changes = 500 },
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = true
    if client.resolved_capabilities.document_formatting then
      local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.formatting_sync()
        end,
        group = au_lsp,
      })
    end
  end,
})
