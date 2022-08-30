local cmp = require("cmp")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feed_key = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
	snippet = {
      		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
      		end,
    	},
    	window = {},
    	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping(function(fallback)
      			if cmp.visible() then
        			cmp.select_next_item()
      			elseif vim.fn["vsnip#available"](1) == 1 then
        			feed_key("<Plug>(vsnip-expand-or-jump)", "")
      			elseif has_words_before() then
        			cmp.complete()
      			else
        			fallback()
      			end
    		end, { "i", "s" }),

    		["<S-Tab>"] = cmp.mapping(function()
      			if cmp.visible() then
        			cmp.select_prev_item()
      			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        			feed_key("<Plug>(vsnip-jump-prev)", "")
      			end
    		end, { "i", "s" }),
      		['<C-Space>'] = cmp.mapping.complete(),
      		['<C-e>'] = cmp.mapping.abort(),
      		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
    	sources = cmp.config.sources({
      		{ name = 'nvim_lsp' },
      		{ name = 'vsnip' }
    	}, {
      		{ name = 'buffer' },
    	})
})
