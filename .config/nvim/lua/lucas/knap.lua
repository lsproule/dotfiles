--[[
-- Knap Settings
--]]
local gknapsettings = {
	htmloutputext = "html",
	htmltohtml = "none",
	htmltohtmlviewerlaunch = "chromium %outputfile%",
	htmltohtmlviewerrefresh = "none",
	mdoutputext = "html",
	mdtohtml = "pandoc --standalone %docroot% -o %outputfile%",
	mdtohtmlviewerlaunch = "chromium %outputfile%",
	mdtohtmlviewerrefresh = "none",
	mdtopdf = "pandoc %docroot% -o %outputfile%",
	mdtopdfviewerlaunch = "sioyek %outputfile%",
	mdtopdfviewerrefresh = "none",
	markdownoutputext = "html",
	markdowntohtml = "pandoc --standalone %docroot% -o %outputfile%",
	markdowntohtmlviewerlaunch = "chromium %outputfile%",
	markdowntohtmlviewerrefresh = "none",
	markdowntopdf = "pandoc %docroot% -o %outputfile%",
	markdowntopdfviewerlaunch = "sioyek %outputfile%",
	markdowntopdfviewerrefresh = "none",
	texoutputext = "pdf",
	textopdf = "pdflatex -interaction=batchmode -halt-on-error -synctex=1 %docroot%",
	--[[
  -- Zathura
  --]]
	textopdfviewerlaunch = "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
	textopdfviewerrefresh = "none",
	textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
	-- [[
	-- Sioyek
	-- ]]
	-- textopdfviewerlaunch = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,0)\"' --new-window %outputfile%",
	-- textopdfviewerrefresh = "none",
	-- textopdfforwardjump = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,0)\"' --reuse-window --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",
	textopdfshorterror = 'A=%outputfile% ; LOGFILE="${A%.pdf}.log" ; rubber-info "$LOGFILE" 2>&1 | head -n 1',
	delay = 150,
}

vim.g.knap_settings = gknapsettings
