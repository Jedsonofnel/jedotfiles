-- shamelessly ripped the bits I wanted from echanoski's mini.base16
-- github.com/mini-nvim/mini.base16
-- see source code of that for documentation

H = {}

H.from_palette = function(palette)
	H.validate_base16_palette(palette)

	-- this code doesn't create a colourscheme
	if vim.g.colors_name then vim.cmd("highlight clear") end
	vim.g.colors_name = nil

	local p = palette
	local hi = H.highlight_gui

	--stylelua: ignore start
	hi('CurSearch',      {fg=p.base01, bg=p.base09, attr=nil,            sp=nil})
	hi('Cursor',         {fg=p.base00, bg=p.base05, attr=nil,            sp=nil})
	hi('CursorLine',     {fg=nil,      bg=p.base01, attr=nil,            sp=nil})
	hi('CursorLineNr',   {fg=p.base04, bg=p.base01, attr=nil,            sp=nil})
	hi('IncSearch',      {fg=p.base01, bg=p.base09, attr=nil,            sp=nil})
	hi('LineNr',         {fg=p.base04, bg=p.base00, attr=nil,            sp=nil})
	hi('LineNrAbove',    {fg=p.base02, bg=p.base00, attr=nil,            sp=nil})
	hi('LineNrBelow',    {fg=p.base02, bg=p.base00, attr=nil,            sp=nil})
	hi('MatchParen',     {fg=nil,      bg=p.base02, attr=nil,            sp=nil})
	hi('Normal',         {fg=p.base05, bg=p.base00, attr=nil,            sp=nil})
	hi('NormalFloat',    {fg=p.base05, bg=p.base01, attr=nil,            sp=nil})
	hi('NormalNC',       {fg=p.base05, bg=p.base00, attr=nil,            sp=nil})
	hi('OkMsg',          {fg=p.base0B, bg=nil,      attr=nil,            sp=nil})
	hi('Pmenu',          {fg=p.base05, bg=p.base01, attr=nil,            sp=nil})
	hi('PmenuExtra',     {fg=p.base05, bg=p.base01, attr=nil,            sp=nil})
	hi('PmenuExtraSel',  {fg=p.base05, bg=p.base01, attr='reverse',      sp=nil})
	hi('PmenuKind',      {fg=p.base05, bg=p.base01, attr=nil,            sp=nil})
	hi('PmenuKindSel',   {fg=p.base05, bg=p.base01, attr='reverse',      sp=nil})
	hi('PmenuMatch',     {fg=p.base05, bg=p.base01, attr='bold',         sp=nil})
	hi('PmenuMatchSel',  {fg=p.base05, bg=p.base01, attr='bold,reverse', sp=nil})
	hi('PmenuSbar',      {fg=nil,      bg=p.base02, attr=nil,            sp=nil})
	hi('PmenuSel',       {fg=p.base05, bg=p.base01, attr='reverse',      sp=nil})
	hi('PmenuThumb',     {fg=nil,      bg=p.base07, attr=nil,            sp=nil})
	hi('Question',       {fg=p.base0D, bg=nil,      attr=nil,            sp=nil})
	hi('QuickFixLine',   {fg=nil,      bg=p.base01, attr=nil,            sp=nil})
	hi('Search',         {fg=p.base01, bg=p.base0A, attr=nil,            sp=nil})
	hi('SignColumn',     {fg=p.base02, bg=p.base00, attr=nil,            sp=nil})
	hi('SpellBad',       {fg=nil,      bg=nil,      attr='undercurl',    sp=p.base08})
	hi('SpellCap',       {fg=nil,      bg=nil,      attr='undercurl',    sp=p.base0D})
	hi('SpellLocal',     {fg=nil,      bg=nil,      attr='undercurl',    sp=p.base0C})
	hi('SpellRare',      {fg=nil,      bg=nil,      attr='undercurl',    sp=p.base0E})
	hi('StatusLine',     {fg=p.base04, bg=p.base02, attr=nil,            sp=nil})
	hi('StatusLineNC',   {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
	hi('StderrMsg',      {link='ErrorMsg'})
	hi('StdoutMsg',      {link='MsgArea'})
	hi('Substitute',     {fg=p.base01, bg=p.base0A, attr=nil,            sp=nil})
	hi('TabLine',        {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
	hi('TabLineFill',    {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
	hi('TabLineSel',     {fg=p.base0B, bg=p.base01, attr=nil,            sp=nil})
	hi('TermCursor',     {fg=nil,      bg=nil,      attr='reverse',      sp=nil})
	hi('TermCursorNC',   {fg=nil,      bg=nil,      attr='reverse',      sp=nil})
	hi('Title',          {fg=p.base0D, bg=nil,      attr=nil,            sp=nil})
	hi('VertSplit',      {fg=p.base02, bg=p.base02, attr=nil,            sp=nil})
	hi('Visual',         {fg=nil,      bg=p.base02, attr=nil,            sp=nil})
	hi('VisualNOS',      {fg=p.base08, bg=nil,      attr=nil,            sp=nil})
	hi('WarningMsg',     {fg=p.base08, bg=nil,      attr=nil,            sp=nil})
	hi('WildMenu',       {fg=p.base08, bg=p.base0A, attr=nil,            sp=nil})
	hi('WinBar',         {fg=p.base04, bg=p.base02, attr=nil,            sp=nil})
	hi('WinBarNC',       {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
	hi('WinSeparator',   {fg=p.base02, bg=p.base00, attr=nil,            sp=nil})

	-- Standard syntax (affects treesitter)
	hi('Boolean',        {fg=p.base09, bg=nil,      attr=nil, sp=nil})
	hi('Character',      {fg=p.base08, bg=nil,      attr=nil, sp=nil})
	hi('Comment',        {fg=p.base03, bg=nil,      attr="italic", sp=nil})
	hi('Conditional',    {fg=p.base0E, bg=nil,      attr=nil, sp=nil})
	hi('Constant',       {fg=p.base09, bg=nil,      attr=nil, sp=nil})
	hi('Define',         {fg=p.base0E, bg=nil,      attr=nil, sp=nil})
	hi('Delimiter',      {fg=p.base03, bg=nil,      attr=nil, sp=nil})
	hi("Error",          {fg=p.base02, bg=nil,      attr=nil, sp=nil})
	hi('Float',          {fg=p.base09, bg=nil,      attr=nil, sp=nil})
	hi('Function',       {fg=p.base0D, bg=nil,      attr=nil, sp=nil})
	hi('Identifier',     {fg=p.base08, bg=nil,      attr=nil, sp=nil})
	hi('Include',        {fg=p.base0D, bg=nil,      attr=nil, sp=nil})
	hi('Keyword',        {fg=p.base0E, bg=nil,      attr=nil, sp=nil})
	hi('Label',          {fg=p.base0A, bg=nil,      attr=nil, sp=nil})
	hi('Macro',          {fg=p.base08, bg=nil,      attr=nil, sp=nil})
	hi('Number',         {fg=p.base09, bg=nil,      attr=nil, sp=nil})
	hi('Operator',       {fg=p.base05, bg=nil,      attr=nil, sp=nil})
	hi('PreProc',        {fg=p.base0A, bg=nil,      attr=nil, sp=nil})
	hi('Repeat',         {fg=p.base0A, bg=nil,      attr=nil, sp=nil})
	hi('Special',        {fg=p.base0C, bg=nil,      attr=nil, sp=nil})
	hi('SpecialChar',    {fg=p.base0F, bg=nil,      attr=nil, sp=nil})
	hi('SpecialComment', {fg=p.base0C, bg=nil,      attr=nil, sp=nil})
	hi('Statement',      {fg=p.base08, bg=nil,      attr=nil, sp=nil})
	hi('StorageClass',   {fg=p.base0A, bg=nil,      attr=nil, sp=nil})
	hi('String',         {fg=p.base0B, bg=nil,      attr=nil, sp=nil})
	hi('Structure',      {fg=p.base0E, bg=nil,      attr=nil, sp=nil})
	hi('Tag',            {fg=p.base0A, bg=nil,      attr=nil, sp=nil})
	hi('Todo',           {fg=p.base0A, bg=p.base01, attr=nil, sp=nil})
	hi('Type',           {fg=p.base0A, bg=nil,      attr=nil, sp=nil})
	hi('Typedef',        {fg=p.base0A, bg=nil,      attr=nil, sp=nil})

	-- Other from 'base16-vim'
	hi('Bold',       {fg=nil,      bg=nil, attr='bold',      sp=nil})
	hi('Italic',     {fg=nil,      bg=nil, attr='italic',    sp=nil})
	hi('TooLong',    {fg=p.base08, bg=nil, attr=nil,         sp=nil})
	hi('Underlined', {fg=nil,      bg=nil, attr='underline', sp=nil})

	-- Patch diff
	-- disable lsp highlighting
	for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
		vim.api.nvim_set_hl(0, group, {})
	end
end

H.highlight_gui = function(group, args)
	local command
	if args.link ~= nil then
		command = string.format('highlight! link %s %s', group, args.link)
	else
		command = string.format(
			'highlight %s guifg=%s guibg=%s gui=%s guisp=%s blend=%s',
			group,
			args.fg or 'NONE',
			args.bg or 'NONE',
			args.attr or 'NONE',
			args.sp or 'NONE',
			args.blend or 'NONE'
		)
	end
	vim.cmd(command)
end

-- validation
H.base16_names = {
	'base00', 'base01', 'base02', 'base03',
	'base04', 'base05','base06', 'base07',
	'base08', 'base09', 'base0A', 'base0B',
	'base0C', 'base0D', 'base0E', 'base0F',
}

H.validate_base16_palette = function(palette)
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

H.validate_hex = function(x, x_name)
	local is_hex = type(x) == 'string' and x:len() == 7 and x:sub(1, 1) == '#' and (tonumber(x:sub(2), 16) ~= nil)

	if not is_hex then
		local msg = string.format('(base16) `%s` is not a HEX color (string "#RRGGBB").', x_name)
		error(msg)
	end

	return true
end

H.add_extended_ui_highlighting = function(p, hi)
	hi('EndOfBuffer',    {fg=p.base03, bg=nil,      attr=nil,            sp=nil})
	hi('NonText',        {fg=p.base03, bg=nil,      attr=nil,            sp=nil})
	hi('SpecialKey',     {fg=p.base03, bg=nil,      attr=nil,            sp=nil})
	hi('Whitespace',     {fg=p.base03, bg=nil,      attr=nil,            sp=nil})
end

H.add_niche_ui_highlighting = function(p, hi)
	hi('ColorColumn',    {fg=nil,      bg=p.base01, attr=nil,            sp=nil})
	hi('ComplMatchIns',  {fg=nil,      bg=nil,      attr=nil,            sp=nil})
	hi('Conceal',        {fg=p.base0D, bg=nil,      attr=nil,            sp=nil})
	hi('CursorColumn',   {fg=nil,      bg=p.base01, attr=nil,            sp=nil})
	hi('CursorIM',       {fg=p.base00, bg=p.base05, attr=nil,            sp=nil})
	hi('CursorLineFold', {fg=p.base0C, bg=p.base01, attr=nil,            sp=nil})
	hi('CursorLineSign', {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
	hi('Directory',      {fg=p.base0D, bg=nil,      attr=nil,            sp=nil})
	hi('ErrorMsg',       {fg=p.base08, bg=p.base00, attr=nil,            sp=nil})
	hi('FoldColumn',     {fg=p.base0C, bg=p.base01, attr=nil,            sp=nil})
	hi('Folded',         {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
	hi('lCursor',        {fg=p.base00, bg=p.base05, attr=nil,            sp=nil})
	hi('ModeMsg',        {fg=p.base0B, bg=nil,      attr=nil,            sp=nil})
	hi('MoreMsg',        {fg=p.base0B, bg=nil,      attr=nil,            sp=nil})
	hi('MsgArea',        {fg=p.base05, bg=p.base00, attr=nil,            sp=nil})
	hi('MsgSeparator',   {fg=p.base04, bg=p.base02, attr=nil,            sp=nil})
end

H.add_diff_highlighting = function(p, hi)
	hi('DiffAdd',    {fg=nil, bg=p.base01, attr=nil, sp=p.base0B})
	hi('DiffChange', {fg=nil, bg=p.base01, attr=nil, sp=p.base0E})
	hi('DiffDelete', {fg=p.base08, bg=nil, attr=nil, sp=nil})
	hi('DiffText',   {fg=nil, bg=p.base02, attr=nil, sp=nil})

	hi('diffAdded',   {fg=p.base0B, bg=nil, attr=nil, sp=nil})
	hi('diffChanged', {fg=p.base0E, bg=nil, attr=nil, sp=nil})
	hi('diffFile',    {fg=p.base09, bg=nil, attr=nil, sp=nil})
	hi('diffLine',    {fg=p.base0C, bg=nil, attr=nil, sp=nil})
	hi('diffRemoved', {fg=p.base08, bg=nil, attr=nil, sp=nil})
	hi('Added',       {fg=p.base0B, bg=nil, attr=nil, sp=nil})
	hi('Changed',     {fg=p.base0E, bg=nil, attr=nil, sp=nil})
	hi('Removed',     {fg=p.base08, bg=nil, attr=nil, sp=nil})
end

H.add_git_highlighting = function(p, hi)
	hi('gitcommitBranch',        {fg=p.base09, bg=nil, attr='bold', sp=nil})
	hi('gitcommitComment',       {link='Comment'})
	hi('gitcommitDiscarded',     {link='Comment'})
	hi('gitcommitDiscardedFile', {fg=p.base08, bg=nil, attr='bold', sp=nil})
	hi('gitcommitDiscardedType', {fg=p.base0D, bg=nil, attr=nil,    sp=nil})
	hi('gitcommitHeader',        {fg=p.base0E, bg=nil, attr=nil,    sp=nil})
	hi('gitcommitOverflow',      {fg=p.base08, bg=nil, attr=nil,    sp=nil})
	hi('gitcommitSelected',      {link='Comment'})
	hi('gitcommitSelectedFile',  {fg=p.base0B, bg=nil, attr='bold', sp=nil})
	hi('gitcommitSelectedType',  {link='gitcommitDiscardedType'})
	hi('gitcommitSummary',       {fg=p.base0B, bg=nil, attr=nil,    sp=nil})
	hi('gitcommitUnmergedFile',  {link='gitcommitDiscardedFile'})
	hi('gitcommitUnmergedType',  {link='gitcommitDiscardedType'})
	hi('gitcommitUntracked',     {link='Comment'})
	hi('gitcommitUntrackedFile', {fg=p.base0A, bg=nil, attr=nil,    sp=nil})
end

H.add_diagnostics_highlighting = function(p, hi)
	hi('DiagnosticError', {fg=p.base08, bg=nil, attr=nil, sp=nil})
	hi('DiagnosticHint',  {fg=p.base0D, bg=nil, attr=nil, sp=nil})
	hi('DiagnosticInfo',  {fg=p.base0C, bg=nil, attr=nil, sp=nil})
	hi('DiagnosticOk',    {fg=p.base0B, bg=nil, attr=nil, sp=nil})
	hi('DiagnosticWarn',  {fg=p.base0E, bg=nil, attr=nil, sp=nil})

	hi('DiagnosticFloatingError', {fg=p.base08, bg=p.base01, attr=nil, sp=nil})
	hi('DiagnosticFloatingHint',  {fg=p.base0D, bg=p.base01, attr=nil, sp=nil})
	hi('DiagnosticFloatingInfo',  {fg=p.base0C, bg=p.base01, attr=nil, sp=nil})
	hi('DiagnosticFloatingOk',    {fg=p.base0B, bg=p.base01, attr=nil, sp=nil})
	hi('DiagnosticFloatingWarn',  {fg=p.base0E, bg=p.base01, attr=nil, sp=nil})

	hi('DiagnosticSignError', {link='DiagnosticFloatingError'})
	hi('DiagnosticSignHint',  {link='DiagnosticFloatingHint'})
	hi('DiagnosticSignInfo',  {link='DiagnosticFloatingInfo'})
	hi('DiagnosticSignOk',    {link='DiagnosticFloatingOk'})
	hi('DiagnosticSignWarn',  {link='DiagnosticFloatingWarn'})

	hi('DiagnosticUnderlineError', {fg=nil, bg=nil, attr='underline', sp=p.base08})
	hi('DiagnosticUnderlineHint',  {fg=nil, bg=nil, attr='underline', sp=p.base0D})
	hi('DiagnosticUnderlineInfo',  {fg=nil, bg=nil, attr='underline', sp=p.base0C})
	hi('DiagnosticUnderlineOk',    {fg=nil, bg=nil, attr='underline', sp=p.base0B})
	hi('DiagnosticUnderlineWarn',  {fg=nil, bg=nil, attr='underline', sp=p.base0E})
end

H.add_lsp_highlighting = function(p, hi)
	hi('LspReferenceText',  {fg=nil, bg=p.base02, attr=nil, sp=nil})
	hi('LspReferenceRead',  {link='LspReferenceText'})
	hi('LspReferenceWrite', {link='LspReferenceText'})

	hi('LspSignatureActiveParameter', {link='LspReferenceText'})

	hi('LspCodeLens',          {link='Comment'})
	hi('LspCodeLensSeparator', {link='Comment'})
end

H.add_minipick_highlighting = function(p, hi)
	hi('MiniPickBorder',        {fg=p.base04, bg=nil,      attr=nil,         sp=nil})
	hi('MiniPickBorderBusy',    {fg=p.base0E, bg=nil,      attr=nil,         sp=nil})
	hi('MiniPickBorderText',    {fg=p.base0D, bg=nil,      attr='bold',      sp=nil})
	hi('MiniPickCursor',        {fg=nil,      bg=nil,      attr='nocombine', sp=nil, blend=100})
	hi('MiniPickIconDirectory', {link='Directory'})
	hi('MiniPickIconFile',      {fg=p.base05, bg=nil,      attr=nil,         sp=nil})
	hi('MiniPickHeader',        {link='Normal'})
	hi('MiniPickMatchCurrent',  {fg=nil,      bg=p.base02, attr=nil,         sp=nil})
	hi('MiniPickMatchMarked',   {fg=nil,      bg=p.base01, attr=nil,         sp=nil})
	hi('MiniPickMatchRanges',   {link='Normal'})
	hi('MiniPickNormal',        {link='Normal'})
	hi('MiniPickPreviewLine',   {fg=nil,      bg=nil,      attr=nil,         sp=nil})
	hi('MiniPickPreviewRegion', {link='Normal'})
	hi('MiniPickPrompt',        {link='MiniPickMatchRanges'})
	hi('MiniPickPromptCaret' ,  {fg=p.base0B, bg=nil,      attr=nil,         sp=nil})
	hi('MiniPickPromptPrefix',  {fg=p.base0B, bg=nil,      attr=nil,         sp=nil})
end

return H
