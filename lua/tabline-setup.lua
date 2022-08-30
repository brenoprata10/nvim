local render = function(f)

	f.make_tabs(function(info)
		local icon_color = f.icon_color(info.filename)

		f.add (' ')

		if info.current then
			f.set_fg(icon_color)
		else
			f.add(info.index .. ' ')
		end


		if info.filename then
			f.add(f.icon(info.filename) .. ' ')
			f.add{info.filename}
			f.add(info.modified and ' ●')
		else
			f.add(info.modified and '[+]' or '[-]')
		end
    		f.add ' '
	end)

  f.add_spacer()

  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

  f.add { '  ' .. errors, fg = "#e86671" }
  f.add { '  ' .. warnings, fg = "#e5c07b"}
  f.add ' '
end

require('tabline_framework').setup { 
	render = render,
	-- Default color of tabline items: tabs/bufs
	-- if not set TF uses TabLine highlight group colors
  	hl = { fg = "white" ,bg = "#323952" },
  	-- Default color of everything except items
  	-- if not set TF uses TabLineFill highlight group colors
  	hl_fill = { fg = "#4b7384" ,bg ="#161421" },
}
