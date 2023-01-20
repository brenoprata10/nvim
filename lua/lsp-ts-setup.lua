local lsp = require "lspconfig"
local lsp_ts_utils = require("nvim-lsp-ts-utils")
local attach_common = require("attach-common")
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local tsserver_capabilities = require('cmp_nvim_lsp').default_capabilities(client_capabilities)

lsp.tsserver.setup({
	capabilities = tsserver_capabilities,
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

		attach_common.buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
		attach_common.buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
		attach_common.setup(client, bufnr)
	end
})

lsp.eslint.setup({
	capabilities = client_capabilities,
	flags = { debounce_text_changes = 500 },
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = true
		if client.server_capabilities.documentFormattingProvider then
      			local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
      			vim.api.nvim_create_autocmd("BufWritePre", {
        			pattern = "*",
        			callback = function()
          				vim.lsp.buf.format(nil)
					--local fileType = vim.bo.filetype
					--if fileType == 'typescript' or fileType == 'typescriptreact' then
					--	vim.api.nvim_command("Prettier")
					--end
        			end,
        			group = au_lsp,
      			})
    		end
  	end,
})
