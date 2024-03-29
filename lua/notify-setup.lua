local notify = require("notify")

notify.setup {
	background_colour = '#161421'
}

local banned_messages = { "No information available" }
vim.notify = function(msg, ...)
  for _, banned in ipairs(banned_messages) do
    if msg == banned then
      return
    end
  end
  require("notify")(msg, ...)
end

vim.lsp.handlers['window/showMessage'] = function(_, result, ctx)
	local client = vim.lsp.get_client_by_id(ctx.client_id)
  	local lvl = ({
		'ERROR',
		'WARN',
   		'INFO',
    		'DEBUG',
  	})[result.type]

 	notify({ result.message }, lvl, {
    		title = 'LSP | ' .. client.name,
    		timeout = 10000,
    		keep = function()
      			return lvl == 'ERROR' or lvl == 'WARN'
    		end,
  	})
end
