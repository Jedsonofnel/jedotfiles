-- My own minimalist colourscheme spec

L = {}

L.from_palette = function(palette)
	-- ie if this code doesn't create a colourscheme
	if vim.g.colors_name then vim.cmd("highlight clear") end
	vim.g.colors_name = nil

	local p = palette
	local hi = L.highlight_gui

	L.core_ui_highlights(p, hi)
	L.core_syntax_highlights(p, hi)
	L.diagnostics_highlights(p, hi)
end

-- use :help highlight-groups
L.core_ui_highlights = function(p, hi)
	hi("Normal", { fg = p.base05, bg = p.base00 })
	hi("NormalFloat", { fg = p.base05, bg = p.base00 })
	hi("Cursor", { fg = p.base00, bg = p.base05 })
	hi("CursorLine", { fg = nil, bg = nil, attr = "underline", sp = p.base03 })
	hi("Visual", { fg = nil, bg = p.base02 })

	hi("Title", { fg = p.base06, attr = "bold" })

	hi("MatchParen", { fg = nil, bg = p.base02 })
	hi("ModeMsg", { fg = p.base05 })
	hi("MoreMsg", { fg = p.base05 })
	hi("Question", { fg = p.base06 })

	hi("LineNr", { fg = p.base04, bg = p.base00 })
	-- hi("CursorLineNr")
	hi("SignColumn", { fg = p.base02, bg = p.base00 })
	hi("WinSeparator", { fg = p.base04 })

	hi("CurSearch", { fg = p.base01, bg = p.base06 })
	hi("Search", { fg = p.base01, bg = p.base04 })
	hi("IncSearch", { fg = p.base01, bg = p.base04 })

	hi("StatusLine", { fg = p.base04, bg = p.base02 })
	hi("StatusLineNC", { fg = p.base03, bg = p.base01 })

	hi("NonText", { fg = p.base02 })

	hi("Pmenu", { fg = p.base05, bg = p.base01 })
	hi("PmenuThumb", { bg = p.base03 })
end

-- taken from :help syntax
L.core_syntax_highlights = function(p, hi)
	hi("Comment", { fg = p.base03, attr = "italic" })
	hi("TODO", { fg = p.base06, attr = "bold" })

	hi("Constant", { fg = p.base05 })
	hi("String", { fg = p.base05 })
	hi("Character", { fg = p.base05 })
	hi("Number", { fg = p.base05 })
	hi("Boolean", { fg = p.base05 })
	hi("Float", { fg = p.base05 })

	hi("Identifier", { fg = p.base05 })
	hi("Function", { fg = p.base05 })

	hi("Statement", { fg = p.base05 })
	hi("Conditional", { fg = p.base05 })
	hi("Repeat", { fg = p.base05 })
	hi("Label", { fg = p.base05 })
	hi("Operator", { fg = p.base04 })
	hi("Keyword", { fg = p.base05, attr = nil })
	hi("Exception", { fg = p.base05 })

	-- Preprocessor stuff omitted for now

	hi("Type", { fg = p.base04 })
	hi("StorageClass", { fg = p.base04 })
	hi("Structure", { fg = p.base04 })
	hi("Typedef", { fg = p.base04 })

	hi("Special", { fg = p.base04 })
	hi("SpeciaChar", { fg = p.base04 })
	hi("Tag", { fg = p.base04 })
	hi("Delimiter", { fg = p.base03 })
	hi("SpecialComment", { fg = p.base03 })
	hi("Debug", { fg = p.base03 })

	-- treesitter
	hi("@variable", { fg = p.base05 })
end

L.diagnostics_highlights = function(p, hi)
	hi("DiagnosticsSignInfo", { fg = p.base04 })
	hi("DiagnosticUnnecessary", { link = "Normal" })
end

L.highlight_gui = function(group, args)
	local command
	if args.link ~= nil then
		command = string.format("highlight! link %s %s", group, args.link)
	else
		command = string.format(
			"highlight %s guifg=%s guibg=%s gui=%s guisp=%s blend=%s",
			group,
			args.fg or "NONE",
			args.bg or "NONE",
			args.attr or "NONE",
			args.sp or "NONE",
			args.blend or "NONE"
		)
	end

	vim.cmd(command)
end

-- validation
L.base16_names = {
	"base00", "base01", "base02", "base03",
	"base04", "base05", "base06", "base07",
	"base08", "base09", "base0A", "base0B",
	"base0C", "base0D", "base0E", "base0F",
}

L.validate_base16_palette = function(palette)
	if type(palette) ~= 'table' then error(string.format("(base16) palette is not a table.")) end

	for _, color_name in pairs(H.base16_names) do
		local c = palette[color_name]
		if c == nil then
			local msg = string.format("(base16) palette does not have value %s.", color_name)
			error(msg)
		end
		H.validate_hex(c, string.format("palette.%s", color_name))
	end

	return true
end

L.validate_hex = function(x, x_name)
	local is_hex = type(x) == 'string' and x:len() == 7 and x:sub(1, 1) == '#' and (tonumber(x:sub(2), 16) ~= nil)

	if not is_hex then
		local msg = string.format('(base16) `%s` is not a HEX color (string "#RRGGBB").', x_name)
		error(msg)
	end

	return true
end

return L
