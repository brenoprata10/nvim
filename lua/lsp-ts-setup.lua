local lsp = require "lspconfig"
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

-- Setup nvim-cmp.
local cmp = require'cmp'

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

  cmp.setup({
    snippet = {
-- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {},
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }
    }, {
      { name = 'buffer' },
    })
  })

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.tsserver.setup({
	capabilities = capabilities,
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
})

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
